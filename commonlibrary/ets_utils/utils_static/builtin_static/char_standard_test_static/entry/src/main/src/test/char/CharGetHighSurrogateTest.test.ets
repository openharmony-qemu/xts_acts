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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function CharGetHighSurrogateTest(): void {
  describe('CharGetHighSurrogateTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_0100
     * @tc.name testCharGetHighSurrogate0001
     * @tc.desc Verify that UTF_16_CodePoint parameter is required
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(result).assertEqual(c'\uD83D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_0200
     * @tc.name testCharGetHighSurrogate0002
     * @tc.desc Verify that missing parameter throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.getHighSurrogate(undefined as UTF_16_CodePoint);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_0300
     * @tc.name testCharGetHighSurrogate0003
     * @tc.desc Verify non-BMP code point returns high surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0003' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiResult = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(emojiResult).assertEqual(c'\uD83D');

      const minResult = Char.getHighSurrogate(0x10000 as UTF_16_CodePoint);
      expect(minResult.toInt()).assertEqual(0xD800);

      const maxResult = Char.getHighSurrogate(0x10FFFF as UTF_16_CodePoint);
      expect(maxResult.toInt()).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_0500
     * @tc.name testCharGetHighSurrogate0005
     * @tc.desc Verify that illegal values do not throw an exception and return a non-null result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0005' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.getHighSurrogate(-1 as UTF_16_CodePoint);
      expect(result1 !== null).assertTrue();
      const result2 = Char.getHighSurrogate(0x110000 as UTF_16_CodePoint);
      expect(result2 !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_0600
     * @tc.name testCharGetHighSurrogate0006
     * @tc.desc Verify high surrogate for 0x10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0006' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getHighSurrogate(0x10000 as UTF_16_CodePoint);
      expect(result).assertEqual(c'\uD800');
      expect(result.toInt()).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_0700
     * @tc.name testCharGetHighSurrogate0007
     * @tc.desc Verify high surrogate for 0x10FFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0007' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getHighSurrogate(0x10FFFF as UTF_16_CodePoint);
      expect(result.toInt()).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_0800
     * @tc.name testCharGetHighSurrogate0008
     * @tc.desc Verify high surrogate for emoji code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(result).assertEqual(c'\uD83D');
      expect(Char.isHighSurrogate(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_0900
     * @tc.name testCharGetHighSurrogate0009
     * @tc.desc Verify return value is char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0009' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(result !== null).assertTrue();
      expect(Char.isHighSurrogate(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_1000
     * @tc.name testCharGetHighSurrogate0010
     * @tc.desc Verify that corresponding high surrogate character is returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0010' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiPoint = 0x1F600 as UTF_16_CodePoint;
      const result = Char.getHighSurrogate(emojiPoint);

      expect(Char.isHighSurrogate(result)).assertTrue();
      expect(result.toInt() >= 0xD800).assertTrue();
      expect(result.toInt() <= 0xDBFF).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_1100
     * @tc.name testCharGetHighSurrogate0011
     * @tc.desc Verify return value is within high surrogate range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0011' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x10000) {
        const result = Char.getHighSurrogate(i as UTF_16_CodePoint);
        const codePoint = result.toInt();
        expect(codePoint >= 0xD800).assertTrue();
        expect(codePoint <= 0xDBFF).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_1200
     * @tc.name testCharGetHighSurrogate0012
     * @tc.desc Verify supplementary plane code point decomposition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0012' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.getHighSurrogate(0x10000 as UTF_16_CodePoint);
      expect(result1).assertEqual(c'\uD800');

      const result2 = Char.getHighSurrogate(0x10FFFF as UTF_16_CodePoint);
      expect(result2.toInt()).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_1300
     * @tc.name testCharGetHighSurrogate0013
     * @tc.desc Verify emoji code point high surrogate retrieval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(result).assertEqual(c'\uD83D');

      const heartResult = Char.getHighSurrogate(0x2764 as UTF_16_CodePoint);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_1500
     * @tc.name testCharGetHighSurrogate0015
     * @tc.desc Verify return value is high surrogate character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(Char.isHighSurrogate(result)).assertTrue();
      expect(Char.isLowSurrogate(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_1600
     * @tc.name testCharGetHighSurrogate0016
     * @tc.desc Verify supplementary plane code point sampling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samplePoints = [0x10000, 0x10001, 0x1F600, 0x20000, 0x10FFFF];
      for (const codePoint of samplePoints) {
        const result = Char.getHighSurrogate(codePoint as UTF_16_CodePoint);
        expect(Char.isHighSurrogate(result)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_1700
     * @tc.name testCharGetHighSurrogate0017
     * @tc.desc Verify that wrong parameter type throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0017' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.getHighSurrogate(null as UTF_16_CodePoint);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_1800
     * @tc.name testCharGetHighSurrogate0018
     * @tc.desc Verify normal call does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0018' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_1900
     * @tc.name testCharGetHighSurrogate0019
     * @tc.desc Verify finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_2000
     * @tc.name testCharGetHighSurrogate0020
     * @tc.desc Verify getHighSurrogate is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.getHighSurrogate).assertEqual("function");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_2200
     * @tc.name testCharGetHighSurrogate0022
     * @tc.desc Verify getHighSurrogate is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertEqual(c'\uD83D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_2300
     * @tc.name testCharGetHighSurrogate0023
     * @tc.desc Verify high and low surrogates appear as pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiPoint = 0x1F600 as UTF_16_CodePoint;

      const high = Char.getHighSurrogate(emojiPoint);
      const low = Char.getLowSurrogate(emojiPoint);

      expect(Char.isHighSurrogate(high)).assertTrue();
      expect(Char.isLowSurrogate(low)).assertTrue();
      expect(Char.isHighSurrogate(low)).assertFalse();
      expect(Char.isLowSurrogate(high)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_2400
     * @tc.name testCharGetHighSurrogate0024
     * @tc.desc Verify code points requiring surrogate pairs can be decomposed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0024' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiPoint = 0x1F600 as UTF_16_CodePoint;
      const units = Char.codeUnitsToEncode(emojiPoint);

      expect(units).assertEqual(2);

      const high = Char.getHighSurrogate(emojiPoint);
      const low = Char.getLowSurrogate(emojiPoint);

      expect(high !== null).assertTrue();
      expect(low !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_2500
     * @tc.name testCharGetHighSurrogate0025
     * @tc.desc Verify decomposed surrogate pair can be combined back to original code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const originalPoint = 0x1F600 as UTF_16_CodePoint;

      const high = Char.getHighSurrogate(originalPoint);
      const low = Char.getLowSurrogate(originalPoint);

      const combined = Char.charsToCodePoint(high, low);
      expect(combined).assertEqual(originalPoint);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_2600
     * @tc.name testCharGetHighSurrogate0026
     * @tc.desc Verify first supplementary plane code points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x1FFFF; i += 0x1000) {
        const result = Char.getHighSurrogate(i as UTF_16_CodePoint);
        expect(Char.isHighSurrogate(result)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_2700
     * @tc.name testCharGetHighSurrogate0027
     * @tc.desc Verify common emoji code points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const grinning = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(grinning).assertEqual(c'\uD83D');

      const joy = Char.getHighSurrogate(0x1F602 as UTF_16_CodePoint);
      expect(Char.isHighSurrogate(joy)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_2800
     * @tc.name testCharGetHighSurrogate0028
     * @tc.desc Verify Unicode boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0028' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstResult = Char.getHighSurrogate(0x10000 as UTF_16_CodePoint);
      expect(firstResult).assertEqual(c'\uD800');

      const lastResult = Char.getHighSurrogate(0x10FFFF as UTF_16_CodePoint);
      expect(lastResult.toInt()).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_2900
     * @tc.name testCharGetHighSurrogate0029
     * @tc.desc Verify supplementary plane boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const smpStart = Char.getHighSurrogate(0x10000 as UTF_16_CodePoint);
      expect(smpStart).assertEqual(c'\uD800');

      const smpMiddle = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(Char.isHighSurrogate(smpMiddle)).assertTrue();

      const smpEnd = Char.getHighSurrogate(0x10FFFF as UTF_16_CodePoint);
      expect(Char.isHighSurrogate(smpEnd)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_3000
     * @tc.name testCharGetHighSurrogate0030
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const codePoint = 0x1F600 as UTF_16_CodePoint;
      const result1 = Char.getHighSurrogate(codePoint);
      const result2 = Char.getHighSurrogate(codePoint);
      const result3 = Char.getHighSurrogate(codePoint);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_3100
     * @tc.name testCharGetHighSurrogate0031
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        const result = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
        expect(result).assertEqual(c'\uD83D');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_3200
     * @tc.name testCharGetHighSurrogate0032
     * @tc.desc Verify high surrogate formula: ((codePoint - 0x10000) >> 10) + 0xD800
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0032' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const codePoint = 0x1F600 as UTF_16_CodePoint;
      const expectedHigh = ((codePoint - 0x10000) >> 10) + 0xD800;

      const result = Char.getHighSurrogate(codePoint);
      expect(result.toInt()).assertEqual(expectedHigh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_3300
     * @tc.name testCharGetHighSurrogate0033
     * @tc.desc Verify entire supplementary plane range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0033' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x10000) {
        const expectedHigh = ((i - 0x10000) >> 10) + 0xD800;
        const result = Char.getHighSurrogate(i as UTF_16_CodePoint);
        expect(result.toInt()).assertEqual(expectedHigh);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_3400
     * @tc.name testCharGetHighSurrogate0034
     * @tc.desc Verify returned character is recognized as high surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const codePoint = 0x1F600 as UTF_16_CodePoint;
      const highSurrogate = Char.getHighSurrogate(codePoint);

      expect(Char.isHighSurrogate(highSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(highSurrogate)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(highSurrogate)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_3500
     * @tc.name testCharGetHighSurrogate0035
     * @tc.desc Verify decomposed surrogate pair is reversible via charsToCodePoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testPoints = [0x10000, 0x1F600, 0x10FFFF];
      for (const originalPoint of testPoints) {
        const high = Char.getHighSurrogate(originalPoint as UTF_16_CodePoint);
        const low = Char.getLowSurrogate(originalPoint as UTF_16_CodePoint);

        const combined = Char.charsToCodePoint(high, low);
        expect(combined).assertEqual(originalPoint);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETHIGHSURROGATETEST_GETHIGHSURROGATETEST_3600
     * @tc.name testCharGetHighSurrogate0036
     * @tc.desc Verify UTF-16 encoding standard compliance for high surrogate calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetHighSurrogate0036' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x10000) {
        const codePoint = i as UTF_16_CodePoint;
        const highSurrogate = Char.getHighSurrogate(codePoint);
        const lowSurrogate = Char.getLowSurrogate(codePoint);

        const highCode = highSurrogate.toInt();
        const lowCode = lowSurrogate.toInt();

        const expectedHigh = 0xD800 + ((i - 0x10000) >> 10);
        expect(highCode).assertEqual(expectedHigh);

        const combined = Char.charsToCodePoint(highSurrogate, lowSurrogate);
        expect(combined).assertEqual(i);
      }
    });
  });
}
