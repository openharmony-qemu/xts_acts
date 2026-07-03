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


function charFromCode(code: number): char {
  return Int.toChar(Double.toInt(code));
}

export default function CharIsPartOfSurrogatePairStaticCharTest(): void {
  describe('CharIsPartOfSurrogatePairStaticCharTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_0100
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0001
     * @tc.desc Verify that one char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0001' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isPartOfSurrogatePair(c'\uD83D');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_0200
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0002
     * @tc.desc Verify that missing parameter throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isPartOfSurrogatePair(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_0300
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0003
     * @tc.desc Verify high surrogate characters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0003' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isPartOfSurrogatePair(Char.HIGH_SURROGATE_MIN)).assertTrue();
      expect(Char.isPartOfSurrogatePair(Char.HIGH_SURROGATE_MAX)).assertTrue();
      const highMiddle = c'\uDB00';
      expect(Char.isPartOfSurrogatePair(highMiddle)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_0400
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0004
     * @tc.desc Verify low surrogate characters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0004' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isPartOfSurrogatePair(Char.LOW_SURROGATE_MIN)).assertTrue();
      expect(Char.isPartOfSurrogatePair(Char.LOW_SURROGATE_MAX)).assertTrue();
      const lowMiddle = c'\uDE00';
      expect(Char.isPartOfSurrogatePair(lowMiddle)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_0500
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0005
     * @tc.desc Verify normal characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0005' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isPartOfSurrogatePair(c'A')).assertFalse();
      expect(Char.isPartOfSurrogatePair(c'Z')).assertFalse();
      expect(Char.isPartOfSurrogatePair(c'0')).assertFalse();
      expect(Char.isPartOfSurrogatePair(c'中')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_0600
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0006
     * @tc.desc Verify surrogate region boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0006' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const before = c'\uD7FF';
      expect(Char.isPartOfSurrogatePair(before)).assertFalse();
      const highStart = c'\uD800';
      const highEnd = c'\uDBFF';
      expect(Char.isPartOfSurrogatePair(highStart)).assertTrue();
      expect(Char.isPartOfSurrogatePair(highEnd)).assertTrue();
      const lowStart = c'\uDC00';
      const lowEnd = c'\uDFFF';
      expect(Char.isPartOfSurrogatePair(lowStart)).assertTrue();
      expect(Char.isPartOfSurrogatePair(lowEnd)).assertTrue();
      const after = c'\uE000';
      expect(Char.isPartOfSurrogatePair(after)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_0700
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0007
     * @tc.desc Verify that passing non-char type throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0007' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isPartOfSurrogatePair(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_0800
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0008
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0008' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isPartOfSurrogatePair(c'\uD83D');
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_0900
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0009
     * @tc.desc Verify surrogate region characters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0009' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0xD800; i <= 0xDBFF; i++) {
        expect(Char.isPartOfSurrogatePair(charFromCode(i))).assertTrue();
      }
      for (let i = 0xDC00; i <= 0xDFFF; i++) {
        expect(Char.isPartOfSurrogatePair(charFromCode(i))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_1000
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0010
     * @tc.desc Verify non-surrogate region characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const asciiChars: char[] = [
        c'\x00', c'\x01', c'\x02', c'\x03', c'\x04', c'\x05', c'\x06', c'\x07', c'\x08', c'\t',
      c'\n',   c'\x0B', c'\x0C', c'\r',   c'\x0E', c'\x0F',
      c'\x10', c'\x11', c'\x12', c'\x13', c'\x14', c'\x15', c'\x16', c'\x17', c'\x18', c'\x19',
      c'\x1A', c'\x1B', c'\x1C', c'\x1D', c'\x1E', c'\x1F',
      c' ',    c'!',    c'"',    c'#',    c'$',    c'%',    c'&',    c'\'',   c'(',    c')',
      c'*',    c'+',    c',',    c'-',    c'.',    c'/',
      c'0',    c'1',    c'2',    c'3',    c'4',    c'5',    c'6',    c'7',    c'8',    c'9',
      c':',    c';',    c'<',    c'=',    c'>',    c'?',
      c'@',    c'A',    c'B',    c'C',    c'D',    c'E',    c'F',    c'G',    c'H',    c'I',
      c'J',    c'K',    c'L',    c'M',    c'N',    c'O',    c'P',    c'Q',    c'R',    c'S',
      c'T',    c'U',    c'V',    c'W',    c'X',    c'Y',    c'Z',
      c'[',    c'\\',   c']',    c'^',    c'_',
      c'`',    c'a',    c'b',    c'c',    c'd',    c'e',    c'f',    c'g',    c'h',    c'i',
      c'j',    c'k',    c'l',    c'm',    c'n',    c'o',    c'p',    c'q',    c'r',    c's',
      c't',    c'u',    c'v',    c'w',    c'x',    c'y',    c'z',
      c'{',    c'|',    c'}',    c'~',    c'\x7F'
      ];
      for (const ch of asciiChars) {
        expect(Char.isPartOfSurrogatePair(ch)).assertFalse();
      }
      expect(Char.isPartOfSurrogatePair(c'\uD7FF')).assertFalse();
      expect(Char.isPartOfSurrogatePair(c'\uE000')).assertFalse();
      expect(Char.isPartOfSurrogatePair(c'中')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_1100
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0011
     * @tc.desc Verify surrogate region boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0011' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const before = c'\uD7FF';
      expect(Char.isPartOfSurrogatePair(before)).assertFalse();
      const highStart = c'\uD800';
      expect(Char.isPartOfSurrogatePair(highStart)).assertTrue();
      const lowEnd = c'\uDFFF';
      expect(Char.isPartOfSurrogatePair(lowEnd)).assertTrue();
      const after = c'\uE000';
      expect(Char.isPartOfSurrogatePair(after)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_1200
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0012
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0012' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isPartOfSurrogatePair(c'\uD83D');
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_1400
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0014
     * @tc.desc Verify non-surrogate region characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0014' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isPartOfSurrogatePair(c'\uD7FF')).assertFalse();
      expect(Char.isPartOfSurrogatePair(c'\uE000')).assertFalse();
      expect(Char.isPartOfSurrogatePair(c'A')).assertFalse();
      expect(Char.isPartOfSurrogatePair(c'\uFFFF')).assertFalse();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_1700
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0017
     * @tc.desc Verify finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0017' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.isPartOfSurrogatePair(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_2000
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0020
     * @tc.desc Verify isPartOfSurrogatePair is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0020' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.isPartOfSurrogatePair(c'\uD83D');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_2100
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0021
     * @tc.desc Verify surrogate pair characters include both high and low surrogates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0021' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      const normalChar = c'A';
      expect(Char.isPartOfSurrogatePair(highSurrogate)).assertTrue();
      expect(Char.isHighSurrogate(highSurrogate)).assertTrue();
      expect(Char.isLowSurrogate(highSurrogate)).assertFalse();
      expect(Char.isPartOfSurrogatePair(lowSurrogate)).assertTrue();
      expect(Char.isHighSurrogate(lowSurrogate)).assertFalse();
      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(normalChar)).assertFalse();
      expect(Char.isHighSurrogate(normalChar)).assertFalse();
      expect(Char.isLowSurrogate(normalChar)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_2200
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0022
     * @tc.desc Verify surrogate characters are not in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0022' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      expect(Char.isPartOfSurrogatePair(highSurrogate)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(highSurrogate)).assertFalse();
      expect(Char.isPartOfSurrogatePair(lowSurrogate)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(lowSurrogate)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_2300
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0023
     * @tc.desc Verify static and instance methods return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0023' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = c'\uD83D';
      const staticResult = Char.isPartOfSurrogatePair(highSurrogate);
      const c = new Char(highSurrogate);
      const instanceResult = c.isPartOfSurrogatePair();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_2400
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0024
     * @tc.desc Verify high surrogate region (0xD800-0xDBFF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0024' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0xD800; i <= 0xDBFF; i++) {
        const ch = charFromCode(i);
        expect(Char.isPartOfSurrogatePair(ch)).assertTrue();
        expect(Char.isHighSurrogate(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_2500
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0025
     * @tc.desc Verify low surrogate region (0xDC00-0xDFFF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0025' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0xDC00; i <= 0xDFFF; i++) {
        const ch = charFromCode(i);
        expect(Char.isPartOfSurrogatePair(ch)).assertTrue();
        expect(Char.isLowSurrogate(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_2600
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0026
     * @tc.desc Verify normal characters are not part of surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0026' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const normalSamples = [c'A', c'z', c'0', c'中', c'あ'];
      for (const ch of normalSamples) {
        expect(Char.isPartOfSurrogatePair(ch)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_2700
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0027
     * @tc.desc Verify surrogate region boundaries with detailed checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0027' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const before = c'\uD7FF';
      expect(Char.isPartOfSurrogatePair(before)).assertFalse();
      expect(Char.isHighSurrogate(before)).assertFalse();
      expect(Char.isLowSurrogate(before)).assertFalse();
      const highStart = c'\uD800';
      expect(Char.isPartOfSurrogatePair(highStart)).assertTrue();
      expect(Char.isHighSurrogate(highStart)).assertTrue();
      expect(Char.isLowSurrogate(highStart)).assertFalse();
      const middle = c'\uD900';
      expect(Char.isPartOfSurrogatePair(middle)).assertTrue();
      expect(Char.isHighSurrogate(middle)).assertTrue();
      expect(Char.isLowSurrogate(middle)).assertFalse();
      const lowEnd = c'\uDFFF';
      expect(Char.isPartOfSurrogatePair(lowEnd)).assertTrue();
      expect(Char.isHighSurrogate(lowEnd)).assertFalse();
      expect(Char.isLowSurrogate(lowEnd)).assertTrue();
      const after = c'\uE000';
      expect(Char.isPartOfSurrogatePair(after)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_2800
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0028
     * @tc.desc Verify multiple invocations return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0028' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      const result1 = Char.isPartOfSurrogatePair(highSurrogate);
      const result2 = Char.isPartOfSurrogatePair(highSurrogate);
      const result3 = Char.isPartOfSurrogatePair(highSurrogate);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_2900
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0029
     * @tc.desc Verify multiple invocations return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0029' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.isPartOfSurrogatePair(Char.HIGH_SURROGATE_MIN)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_3000
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0030
     * @tc.desc Verify precise surrogate region division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0030' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mismatchCount = 0;
      for (let i = 0; i <= 65535; i++) {
        const ch = charFromCode(i);
        const expected = (i >= 0xD800 && i <= 0xDFFF);
        const result = Char.isPartOfSurrogatePair(ch);
        if (result !== expected) {
          mismatchCount++;
        }
      }
      expect(mismatchCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_3100
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0031
     * @tc.desc Verify surrogate pair judgment is consistent with other surrogate methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0031' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      const normalChar = c'A';
      expect(Char.isPartOfSurrogatePair(highSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(lowSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(normalChar)).assertFalse();
      expect(Char.isHighSurrogate(highSurrogate)).assertTrue();
      expect(Char.isHighSurrogate(lowSurrogate)).assertFalse();
      expect(Char.isHighSurrogate(normalChar)).assertFalse();
      expect(Char.isLowSurrogate(highSurrogate)).assertFalse();
      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
      expect(Char.isLowSurrogate(normalChar)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(highSurrogate)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(lowSurrogate)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(normalChar)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PAIRSTATICCHARTEST_3200
     * @tc.name testCharIsPartOfSurrogatePairStaticChar0032
     * @tc.desc Verify using constants defined in Char class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairStaticChar0032' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isPartOfSurrogatePair(Char.HIGH_SURROGATE_MIN)).assertTrue();
      expect(Char.isPartOfSurrogatePair(Char.HIGH_SURROGATE_MAX)).assertTrue();
      expect(Char.isPartOfSurrogatePair(Char.LOW_SURROGATE_MIN)).assertTrue();
      expect(Char.isPartOfSurrogatePair(Char.LOW_SURROGATE_MAX)).assertTrue();
      for (let i = 0xD800; i <= 0xDFFF; i++) {
        expect(Char.isPartOfSurrogatePair(charFromCode(i))).assertTrue();
      }
    });
  });
}
