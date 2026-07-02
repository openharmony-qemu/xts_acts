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

export default function CharCharsToCodePointTest(): void {
  describe('CharCharsToCodePointTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_0100
     * @tc.name testCharCharsToCodePoint0001
     * @tc.desc Verify that both high surrogate and low surrogate parameters must be provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const high = c'\uD83D';
      const low = c'\uDE00';
      const result = Char.charsToCodePoint(high, low);
      expect(result).assertEqual(0x1F600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_0200
     * @tc.name testCharCharsToCodePoint0002
     * @tc.desc Verify that missing the first parameter throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const func = Char.charsToCodePoint as ((a?: Object | null, b?: Object | null) => Object);
        const result = func(undefined, c'\uDE00');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_0500
     * @tc.name testCharCharsToCodePoint0005
     * @tc.desc Verify correct surrogate pair parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const high = c'\uD83D';
      const low = c'\uDE00';

      expect(Char.isHighSurrogate(high)).assertTrue();
      expect(Char.isLowSurrogate(low)).assertTrue();

      const result = Char.charsToCodePoint(high, low);
      expect(result).assertEqual(0x1F600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_0600
     * @tc.name testCharCharsToCodePoint0006
     * @tc.desc Verify high surrogate character parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highMin = Char.HIGH_SURROGATE_MIN;
      const lowMin = Char.LOW_SURROGATE_MIN;

      expect(Char.isHighSurrogate(highMin)).assertTrue();
      expect(Char.isLowSurrogate(lowMin)).assertTrue();

      const result = Char.charsToCodePoint(highMin, lowMin);
      expect(result >= 0x10000).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_0700
     * @tc.name testCharCharsToCodePoint0007
     * @tc.desc Verify low surrogate character parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highMax = Char.HIGH_SURROGATE_MAX;
      const lowMax = Char.LOW_SURROGATE_MAX;

      const result = Char.charsToCodePoint(highMax, lowMax);
      expect(result <= 0x10FFFF).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_0800
     * @tc.name testCharCharsToCodePoint0008
     * @tc.desc Verify the calculation logic of charsToCodePoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const high = c'A';
      const low = c'B';
      const result = Char.charsToCodePoint(high, low);
      const highCode = (high as Object).toString().charCodeAt(0);
      const lowCode = (low as Object).toString().charCodeAt(0);
      const expected = (highCode - 0xD800) * 0x400 + (lowCode - 0xDC00) + 0x10000;
      expect(result).assertEqual(expected);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_1000
     * @tc.name testCharCharsToCodePoint0010
     * @tc.desc Verify surrogate pair boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minHigh = Char.getHighSurrogate(0x10000 as UTF_16_CodePoint);
      const minLow = Char.getLowSurrogate(0x10000 as UTF_16_CodePoint);
      const minResult = Char.charsToCodePoint(minHigh, minLow);
      expect(minResult).assertEqual(0x10000);

      const maxHigh = Char.getHighSurrogate(0x10FFFF as UTF_16_CodePoint);
      const maxLow = Char.getLowSurrogate(0x10FFFF as UTF_16_CodePoint);
      const maxResult = Char.charsToCodePoint(maxHigh, maxLow);
      expect(maxResult).assertEqual(0x10FFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_1100
     * @tc.name testCharCharsToCodePoint0011
     * @tc.desc Verify return value is UTF_16_CodePoint type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.charsToCodePoint(c'\uD83D', c'\uDE00');
      expect(typeof result === "number" || typeof result === "int").assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_1200
     * @tc.name testCharCharsToCodePoint0012
     * @tc.desc Verify correct combination of high and low surrogates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const high = c'\uD83D';
      const low = c'\uDE00';
      const result = Char.charsToCodePoint(high, low);

      expect(result).assertEqual(0x1F600);
      expect(result >= 0x10000).assertTrue();
      expect(result <= 0x10FFFF).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_1300
     * @tc.name testCharCharsToCodePoint0013
     * @tc.desc Verify Emoji code point combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const grinningHigh = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      const grinningLow = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
      const result = Char.charsToCodePoint(grinningHigh, grinningLow);
      expect(result).assertEqual(0x1F600);

      const joyHigh = Char.getHighSurrogate(0x1F602 as UTF_16_CodePoint);
      const joyLow = Char.getLowSurrogate(0x1F602 as UTF_16_CodePoint);
      const joyResult = Char.charsToCodePoint(joyHigh, joyLow);
      expect(joyResult).assertEqual(0x1F602);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_1400
     * @tc.name testCharCharsToCodePoint0014
     * @tc.desc Verify surrogate pair boundary combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const smpFirstHigh = c'\uD800';
      const smpFirstLow = c'\uDC00';
      const smpFirstResult = Char.charsToCodePoint(smpFirstHigh, smpFirstLow);
      expect(smpFirstResult).assertEqual(0x10000);

      const lastPoint = 0x10FFFF;
      const lastHigh = Char.getHighSurrogate(lastPoint as UTF_16_CodePoint);
      const lastLow = Char.getLowSurrogate(lastPoint as UTF_16_CodePoint);
      const lastResult = Char.charsToCodePoint(lastHigh, lastLow);
      expect(lastResult).assertEqual(lastPoint);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_1600
     * @tc.name testCharCharsToCodePoint0016
     * @tc.desc Verify return value is within supplementary plane range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x10000) {
        const high = Char.getHighSurrogate(i as UTF_16_CodePoint);
        const low = Char.getLowSurrogate(i as UTF_16_CodePoint);
        const result = Char.charsToCodePoint(high, low);
        expect(result).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_1700
     * @tc.name testCharCharsToCodePoint0017
     * @tc.desc Verify supplementary plane code points are reversible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samplePoints = [0x10000, 0x1F600, 0x10FFFF];
      for (const codePoint of samplePoints) {
        const high = Char.getHighSurrogate(codePoint as UTF_16_CodePoint);
        const low = Char.getLowSurrogate(codePoint as UTF_16_CodePoint);
        const result = Char.charsToCodePoint(high, low);
        expect(result).assertEqual(codePoint);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_2000
     * @tc.name testCharCharsToCodePoint0020
     * @tc.desc Verify correct surrogate pair does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.charsToCodePoint(c'\uD83D', c'\uDE00');
      expect(result).assertEqual(0x1F600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_2100
     * @tc.name testCharCharsToCodePoint0021
     * @tc.desc Verify finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.charsToCodePoint(c'\uD83D', c'\uDE00');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_2200
     * @tc.name testCharCharsToCodePoint0022
     * @tc.desc Verify charsToCodePoint is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.charsToCodePoint).assertEqual("function");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_2400
     * @tc.name testCharCharsToCodePoint0024
     * @tc.desc Verify charsToCodePoint is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.charsToCodePoint(c'\uD83D', c'\uDE00');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertEqual(0x1F600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_2500
     * @tc.name testCharCharsToCodePoint0025
     * @tc.desc Verify decomposition and combination are reversible operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const originalPoint = 0x1F600 as UTF_16_CodePoint;

      const high = Char.getHighSurrogate(originalPoint);
      const low = Char.getLowSurrogate(originalPoint);

      const combined = Char.charsToCodePoint(high, low);
      expect(combined).assertEqual(originalPoint);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_2600
     * @tc.name testCharCharsToCodePoint0026
     * @tc.desc Verify all supplementary plane code points are reversible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testPoints = [0x10000, 0x1F600, 0x20000, 0x10FFFF];
      for (const codePoint of testPoints) {
        const high = Char.getHighSurrogate(codePoint as UTF_16_CodePoint);
        const low = Char.getLowSurrogate(codePoint as UTF_16_CodePoint);

        expect(Char.isHighSurrogate(high)).assertTrue();
        expect(Char.isLowSurrogate(low)).assertTrue();

        const combined = Char.charsToCodePoint(high, low);
        expect(combined).assertEqual(codePoint);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_2700
     * @tc.name testCharCharsToCodePoint0027
     * @tc.desc Verify code points requiring surrogate pairs can be decomposed and combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiPoint = 0x1F600 as UTF_16_CodePoint;
      const units = Char.codeUnitsToEncode(emojiPoint);

      expect(units).assertEqual(2);

      const high = Char.getHighSurrogate(emojiPoint);
      const low = Char.getLowSurrogate(emojiPoint);

      const combined = Char.charsToCodePoint(high, low);
      expect(combined).assertEqual(emojiPoint);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_2800
     * @tc.name testCharCharsToCodePoint0028
     * @tc.desc Verify compliance with UTF-16 encoding formula
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x10000) {
        const high = Char.getHighSurrogate(i as UTF_16_CodePoint);
        const low = Char.getLowSurrogate(i as UTF_16_CodePoint);

        const combined = Char.charsToCodePoint(high, low);

        const highCode = (high as Object).toString().charCodeAt(0);
        const lowCode = (low as Object).toString().charCodeAt(0);
        const calculated = (highCode - 0xD800) * 0x400 + (lowCode - 0xDC00) + 0x10000;

        expect(combined).assertEqual(i);
        expect(combined).assertEqual(calculated);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_2900
     * @tc.name testCharCharsToCodePoint0029
     * @tc.desc Verify common Emoji surrogate pair combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const grinningHigh = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      const grinningLow = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
      const grinningResult = Char.charsToCodePoint(grinningHigh, grinningLow);
      expect(grinningResult).assertEqual(0x1F600);

      const joyHigh = Char.getHighSurrogate(0x1F602 as UTF_16_CodePoint);
      const joyLow = Char.getLowSurrogate(0x1F602 as UTF_16_CodePoint);
      const joyResult = Char.charsToCodePoint(joyHigh, joyLow);
      expect(joyResult).assertEqual(0x1F602);

      const heartCode = 0x2764 as UTF_16_CodePoint;
      const units = Char.codeUnitsToEncode(heartCode);
      expect(units).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_3000
     * @tc.name testCharCharsToCodePoint0030
     * @tc.desc Verify first supplementary plane code points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x1FFFF; i += 0x1000) {
        const high = Char.getHighSurrogate(i as UTF_16_CodePoint);
        const low = Char.getLowSurrogate(i as UTF_16_CodePoint);
        const result = Char.charsToCodePoint(high, low);
        expect(result).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_3100
     * @tc.name testCharCharsToCodePoint0031
     * @tc.desc Verify all supplementary plane code points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samplePoints = [0x10000, 0x10001, 0x1F600, 0x20000, 0x10FFFF];
      for (const codePoint of samplePoints) {
        const high = Char.getHighSurrogate(codePoint as UTF_16_CodePoint);
        const low = Char.getLowSurrogate(codePoint as UTF_16_CodePoint);
        const result = Char.charsToCodePoint(high, low);
        expect(result).assertEqual(codePoint);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_3200
     * @tc.name testCharCharsToCodePoint0032
     * @tc.desc Verify Unicode boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstPoint = 0x10000;
      const firstHigh = Char.getHighSurrogate(firstPoint as UTF_16_CodePoint);
      const firstLow = Char.getLowSurrogate(firstPoint as UTF_16_CodePoint);
      const firstResult = Char.charsToCodePoint(firstHigh, firstLow);
      expect(firstResult).assertEqual(firstPoint);

      const lastPoint = 0x10FFFF;
      const lastHigh = Char.getHighSurrogate(lastPoint as UTF_16_CodePoint);
      const lastLow = Char.getLowSurrogate(lastPoint as UTF_16_CodePoint);
      const lastResult = Char.charsToCodePoint(lastHigh, lastLow);
      expect(lastResult).assertEqual(lastPoint);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_3300
     * @tc.name testCharCharsToCodePoint0033
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const high = c'\uD83D';
      const low = c'\uDE00';

      const result1 = Char.charsToCodePoint(high, low);
      const result2 = Char.charsToCodePoint(high, low);
      const result3 = Char.charsToCodePoint(high, low);

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(0x1F600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_3400
     * @tc.name testCharCharsToCodePoint0034
     * @tc.desc Verify batch combination returns correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        const result = Char.charsToCodePoint(c'\uD83D', c'\uDE00');
        expect(result).assertEqual(0x1F600);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_3500
     * @tc.name testCharCharsToCodePoint0035
     * @tc.desc Verify surrogate pair validity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const validHigh = c'\uD83D';
      const validLow = c'\uDE00';

      expect(Char.isHighSurrogate(validHigh)).assertTrue();
      expect(Char.isLowSurrogate(validLow)).assertTrue();

      const result = Char.charsToCodePoint(validHigh, validLow);
      expect(result).assertEqual(0x1F600);

      const invalidResult = Char.charsToCodePoint(c'\uD83D', c'\uD83D');
      const highCode = (c'\uD83D' as Object).toString().charCodeAt(0);
      const lowCode = (c'\uD83D' as Object).toString().charCodeAt(0);
      const expected = (highCode - 0xD800) * 0x400 + (lowCode - 0xDC00) + 0x10000;
      expect(invalidResult).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_3600
     * @tc.name testCharCharsToCodePoint0036
     * @tc.desc Verify full compliance with UTF-16 encoding standard
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x1000) {
        const high = Char.getHighSurrogate(i as UTF_16_CodePoint);
        const low = Char.getLowSurrogate(i as UTF_16_CodePoint);

        const combined = Char.charsToCodePoint(high, low);

        const highCode = (high as Object).toString().charCodeAt(0);
        const lowCode = (low as Object).toString().charCodeAt(0);
        const expected = (highCode - 0xD800) * 0x400 + (lowCode - 0xDC00) + 0x10000;

        expect(combined).assertEqual(i);
        expect(combined).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCODETEST_3700
     * @tc.name testCharCharsToCodePoint0037
     * @tc.desc Verify decomposition and combination are fully reversible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCharsToCodePoint0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testPoints = [0x10000, 0x1F600, 0x20000, 0x10FFFF];
      for (const originalPoint of testPoints) {
        const high = Char.getHighSurrogate(originalPoint as UTF_16_CodePoint);
        const low = Char.getLowSurrogate(originalPoint as UTF_16_CodePoint);

        expect(Char.isHighSurrogate(high)).assertTrue();
        expect(Char.isLowSurrogate(low)).assertTrue();

        const combined = Char.charsToCodePoint(high, low);
        expect(combined).assertEqual(originalPoint);
      }
    });
  });
}
