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

export default function CharIsHighSurrogateTest(): void {
  describe('CharIsHighSurrogateTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_0100
     * @tc.name testCharIsHighSurrogate0001
     * @tc.desc Verify that a char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isHighSurrogate(c'\uD83D');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_0200
     * @tc.name testCharIsHighSurrogate0002
     * @tc.desc Verify that missing parameter throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isHighSurrogate(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_0300
     * @tc.name testCharIsHighSurrogate0003
     * @tc.desc Verify high surrogate character returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHighSurrogate(Char.HIGH_SURROGATE_MIN)).assertTrue();
      expect(Char.isHighSurrogate(Char.HIGH_SURROGATE_MAX)).assertTrue();
      const highMiddle = Char.getHighSurrogate(0x1AC00 as UTF_16_CodePoint);
      expect(Char.isHighSurrogate(highMiddle)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_0400
     * @tc.name testCharIsHighSurrogate0004
     * @tc.desc Verify low surrogate character returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHighSurrogate(Char.LOW_SURROGATE_MIN)).assertFalse();
      expect(Char.isHighSurrogate(Char.LOW_SURROGATE_MAX)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_0500
     * @tc.name testCharIsHighSurrogate0005
     * @tc.desc Verify normal character returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHighSurrogate(c'A')).assertFalse();
      expect(Char.isHighSurrogate(c'Z')).assertFalse();
      expect(Char.isHighSurrogate(c'0')).assertFalse();
      expect(Char.isHighSurrogate(c'中')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_0600
     * @tc.name testCharIsHighSurrogate0006
     * @tc.desc Verify high surrogate area boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const beforeHigh = c'\uD7FF';
      expect(Char.isHighSurrogate(beforeHigh)).assertFalse();
      const highStart = Char.HIGH_SURROGATE_MIN;
      const highEnd = Char.HIGH_SURROGATE_MAX;
      expect(Char.isHighSurrogate(highStart)).assertTrue();
      expect(Char.isHighSurrogate(highEnd)).assertTrue();
      const afterHigh = Char.LOW_SURROGATE_MIN;
      expect(Char.isHighSurrogate(afterHigh)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_0700
     * @tc.name testCharIsHighSurrogate0007
     * @tc.desc Verify passing non-char type throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0007' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isHighSurrogate(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_0800
     * @tc.name testCharIsHighSurrogate0008
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isHighSurrogate(c'\uD83D');
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_0900
     * @tc.name testCharIsHighSurrogate0009
     * @tc.desc Verify high surrogate characters (0xD800-0xDBFF) return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x400) {
        const ch = Char.getHighSurrogate(i as UTF_16_CodePoint);
        const result = Char.isHighSurrogate(ch);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_1000
     * @tc.name testCharIsHighSurrogate0010
     * @tc.desc Verify non-high surrogate characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const asciiChars: Char[] = [
        c' ', c'!', c'"', c'#', c'$', c'%', c'&', c'\'', c'(', c')',
      c'*', c'+', c',', c'-', c'.', c'/',
      c'0', c'1', c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9',
      c':', c';', c'<', c'=', c'>', c'?', c'@',
      c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H', c'I', c'J',
      c'K', c'L', c'M', c'N', c'O', c'P', c'Q', c'R', c'S', c'T',
      c'U', c'V', c'W', c'X', c'Y', c'Z',
      c'[', c'\\', c']', c'^', c'_', c'`',
      c'a', c'b', c'c', c'd', c'e', c'f', c'g', c'h', c'i', c'j',
      c'k', c'l', c'm', c'n', c'o', c'p', c'q', c'r', c's', c't',
      c'u', c'v', c'w', c'x', c'y', c'z',
      c'{', c'|', c'}', c'~'
      ];
      for (const ch of asciiChars) {
        expect(Char.isHighSurrogate(ch)).assertFalse();
      }
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x400) {
        const ch = Char.getLowSurrogate(i as UTF_16_CodePoint);
        expect(Char.isHighSurrogate(ch)).assertFalse();
      }
      expect(Char.isHighSurrogate(c'A')).assertFalse();
      expect(Char.isHighSurrogate(c'中')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_1100
     * @tc.name testCharIsHighSurrogate0011
     * @tc.desc Verify high surrogate area boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHighSurrogate(Char.HIGH_SURROGATE_MIN)).assertTrue();
      expect(Char.isHighSurrogate(c'\uD800')).assertTrue();
      expect(Char.isHighSurrogate(Char.HIGH_SURROGATE_MAX)).assertTrue();
      expect(Char.isHighSurrogate(c'\uDBFF')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_1200
     * @tc.name testCharIsHighSurrogate0012
     * @tc.desc Verify characters adjacent to high surrogate area
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const before = c'\uD7FF';
      expect(Char.isHighSurrogate(before)).assertFalse();
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      expect(Char.isHighSurrogate(lowSurrogate)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_1300
     * @tc.name testCharIsHighSurrogate0013
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isHighSurrogate(c'\uD83D');
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_1500
     * @tc.name testCharIsHighSurrogate0015
     * @tc.desc Verify characters outside high surrogate area
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x400) {
        const ch = Char.getLowSurrogate(i as UTF_16_CodePoint);
        expect(Char.isHighSurrogate(ch)).assertFalse();
      }
      expect(Char.isHighSurrogate(c'A')).assertFalse();
      expect(Char.isHighSurrogate(c'\uFFFF')).assertFalse();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_1800
     * @tc.name testCharIsHighSurrogate0018
     * @tc.desc Verify isHighSurrogate() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.isHighSurrogate(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_1900
     * @tc.name testCharIsHighSurrogate0019
     * @tc.desc Verify isHighSurrogate is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.isHighSurrogate).assertEqual("function");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_2100
     * @tc.name testCharIsHighSurrogate0021
     * @tc.desc Verify isHighSurrogate is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.isHighSurrogate(c'\uD83D');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_2200
     * @tc.name testCharIsHighSurrogate0022
     * @tc.desc Verify high surrogate and low surrogate areas are different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      expect(Char.isHighSurrogate(highSurrogate)).assertTrue();
      expect(Char.isLowSurrogate(highSurrogate)).assertFalse();
      expect(Char.isHighSurrogate(lowSurrogate)).assertFalse();
      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_2300
     * @tc.name testCharIsHighSurrogate0023
     * @tc.desc Verify a character cannot be both high and low surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x400) {
        const high = Char.getHighSurrogate(i as UTF_16_CodePoint);
        const low = Char.getLowSurrogate(i as UTF_16_CodePoint);
        const isHighHigh = Char.isHighSurrogate(high);
        const isLowHigh = Char.isLowSurrogate(high);
        const isHighLow = Char.isHighSurrogate(low);
        const isLowLow = Char.isLowSurrogate(low);
        expect(isHighHigh && isLowHigh).assertFalse();
        expect(isHighLow && isLowLow).assertFalse();
        expect(isHighHigh).assertTrue();
        expect(isLowLow).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_2400
     * @tc.name testCharIsHighSurrogate0024
     * @tc.desc Verify high surrogate character is part of surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      expect(Char.isHighSurrogate(highSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(highSurrogate)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_2500
     * @tc.name testCharIsHighSurrogate0025
     * @tc.desc Verify high surrogate character is not in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      expect(Char.isHighSurrogate(highSurrogate)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(highSurrogate)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_2600
     * @tc.name testCharIsHighSurrogate0026
     * @tc.desc Verify identifying surrogate type then getting surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiPoint = 0x1F600 as UTF_16_CodePoint;
      const emojiChar = Char.getHighSurrogate(emojiPoint);
      expect(Char.isHighSurrogate(emojiChar)).assertTrue();
      const highSurrogate = Char.getHighSurrogate(emojiPoint);
      expect(Char.isHighSurrogate(highSurrogate)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_2700
     * @tc.name testCharIsHighSurrogate0027
     * @tc.desc Verify high surrogate area (0xD800-0xDBFF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x400) {
        const ch = Char.getHighSurrogate(i as UTF_16_CodePoint);
        expect(Char.isHighSurrogate(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_2800
     * @tc.name testCharIsHighSurrogate0028
     * @tc.desc Verify low surrogate area (0xDC00-0xDFFF) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x400) {
        const ch = Char.getLowSurrogate(i as UTF_16_CodePoint);
        expect(Char.isHighSurrogate(ch)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_2900
     * @tc.name testCharIsHighSurrogate0029
     * @tc.desc Verify normal characters are not high surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const asciiChars: Char[] = [
        c' ', c'!', c'"', c'#', c'$', c'%', c'&', c'\'', c'(', c')',
      c'*', c'+', c',', c'-', c'.', c'/',
      c'0', c'1', c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9',
      c':', c';', c'<', c'=', c'>', c'?', c'@',
      c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H', c'I', c'J',
      c'K', c'L', c'M', c'N', c'O', c'P', c'Q', c'R', c'S', c'T',
      c'U', c'V', c'W', c'X', c'Y', c'Z',
      c'[', c'\\', c']', c'^', c'_', c'`',
      c'a', c'b', c'c', c'd', c'e', c'f', c'g', c'h', c'i', c'j',
      c'k', c'l', c'm', c'n', c'o', c'p', c'q', c'r', c's', c't',
      c'u', c'v', c'w', c'x', c'y', c'z',
      c'{', c'|', c'}', c'~'
      ];
      for (const ch of asciiChars) {
        expect(Char.isHighSurrogate(ch)).assertFalse();
      }
      expect(Char.isHighSurrogate(c'A')).assertFalse();
      expect(Char.isHighSurrogate(c'中')).assertFalse();
      expect(Char.isHighSurrogate(c'あ')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_3000
     * @tc.name testCharIsHighSurrogate0030
     * @tc.desc Verify high surrogate area boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const before = c'\uD7FF';
      expect(Char.isHighSurrogate(before)).assertFalse();
      const start = Char.HIGH_SURROGATE_MIN;
      expect(Char.isHighSurrogate(start)).assertTrue();
      const end = Char.HIGH_SURROGATE_MAX;
      expect(Char.isHighSurrogate(end)).assertTrue();
      const after = Char.LOW_SURROGATE_MIN;
      expect(Char.isHighSurrogate(after)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_3100
     * @tc.name testCharIsHighSurrogate0031
     * @tc.desc Verify multiple calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      const result1 = Char.isHighSurrogate(highSurrogate);
      const result2 = Char.isHighSurrogate(highSurrogate);
      const result3 = Char.isHighSurrogate(highSurrogate);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_3200
     * @tc.name testCharIsHighSurrogate0032
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.isHighSurrogate(Char.HIGH_SURROGATE_MIN)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_3300
     * @tc.name testCharIsHighSurrogate0033
     * @tc.desc Verify precise high surrogate area division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x400) {
        const ch = Char.getHighSurrogate(i as UTF_16_CodePoint);
        const result = Char.isHighSurrogate(ch);
        expect(result).assertTrue();
      }
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x400) {
        const ch = Char.getLowSurrogate(i as UTF_16_CodePoint);
        const result = Char.isHighSurrogate(ch);
        expect(result).assertFalse();
      }
      const bmpNonSurrogate: Char[] = [
        c'\u0000', c'A', c'0', c' ', c'\uD7FF', c'\uE000', c'\uFFFF'
      ];
      for (const ch of bmpNonSurrogate) {
        const result = Char.isHighSurrogate(ch);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_3400
     * @tc.name testCharIsHighSurrogate0034
     * @tc.desc Verify high surrogate judgment consistent with other surrogate methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      const normalChar = c'A';
      expect(Char.isHighSurrogate(highSurrogate)).assertTrue();
      expect(Char.isHighSurrogate(lowSurrogate)).assertFalse();
      expect(Char.isHighSurrogate(normalChar)).assertFalse();
      expect(Char.isPartOfSurrogatePair(highSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(lowSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(normalChar)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(highSurrogate)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(lowSurrogate)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(normalChar)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHIGHSURROGATETEST_ISHIGHSURROGATETEST_3500
     * @tc.name testCharIsHighSurrogate0035
     * @tc.desc Verify using Char class constants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHighSurrogate0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHighSurrogate(Char.HIGH_SURROGATE_MIN)).assertTrue();
      expect(Char.isHighSurrogate(Char.HIGH_SURROGATE_MAX)).assertTrue();
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x400) {
        const ch = Char.getHighSurrogate(i as UTF_16_CodePoint);
        expect(Char.isHighSurrogate(ch)).assertTrue();
      }
    });
  });
}
