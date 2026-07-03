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

export default function CharIsPartOfSurrogatePairInstanceTest(): void {
  describe('CharIsPartOfSurrogatePairInstanceTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_0100
     * @tc.name testCharIsPartOfSurrogatePairInstance0001
     * @tc.desc Verify instance method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = new Char(c'\uD83D');
      const result = highSurrogate.isPartOfSurrogatePair();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_0200
     * @tc.name testCharIsPartOfSurrogatePairInstance0002
     * @tc.desc Verify isPartOfSurrogatePair() can be called with no arguments and returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = new Char(c'\uD83D');
      const result = ch.isPartOfSurrogatePair();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_0500
     * @tc.name testCharIsPartOfSurrogatePairInstance0005
     * @tc.desc Verify high surrogate character returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = new Char(Char.HIGH_SURROGATE_MIN);
      const result = highSurrogate.isPartOfSurrogatePair();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_0600
     * @tc.name testCharIsPartOfSurrogatePairInstance0006
     * @tc.desc Verify low surrogate character returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowSurrogate = new Char(Char.LOW_SURROGATE_MIN);
      const result = lowSurrogate.isPartOfSurrogatePair();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_0700
     * @tc.name testCharIsPartOfSurrogatePairInstance0007
     * @tc.desc Verify normal character returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const normalChar = new Char(c'A');
      const result = normalChar.isPartOfSurrogatePair();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_0800
     * @tc.name testCharIsPartOfSurrogatePairInstance0008
     * @tc.desc Verify surrogate range characters return true (full high & low surrogate traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0xD800; i <= 0xDBFF; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.isPartOfSurrogatePair()).assertTrue();
      }
      for (let i = 0xDC00; i <= 0xDFFF; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.isPartOfSurrogatePair()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_1000
     * @tc.name testCharIsPartOfSurrogatePairInstance0010
     * @tc.desc Verify boundary return values for different char instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = new Char(c'\uD83D');
      const lowSurrogate = new Char(c'\uDC00');
      const normalChar = new Char(c'A');

      expect(highSurrogate.isPartOfSurrogatePair()).assertTrue();
      expect(lowSurrogate.isPartOfSurrogatePair()).assertTrue();
      expect(normalChar.isPartOfSurrogatePair()).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_1300
     * @tc.name testCharIsPartOfSurrogatePairInstance0013
     * @tc.desc Verify isPartOfSurrogatePair() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const ch = new Char(c'A');
        const result = ch.isPartOfSurrogatePair();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_1400
     * @tc.name testCharIsPartOfSurrogatePairInstance0014
     * @tc.desc Verify isPartOfSurrogatePair is an instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = new Char(c'\uD83D');
      let result: boolean;
      result = ch.isPartOfSurrogatePair();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_1500
     * @tc.name testCharIsPartOfSurrogatePairInstance0015
     * @tc.desc Verify static call produces same result as instance call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = new Char(c'\uD83D');
      const instanceResult = ch.isPartOfSurrogatePair();

      const staticResult = Char.isPartOfSurrogatePair(c'\uD83D');

      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_1600
     * @tc.name testCharIsPartOfSurrogatePairInstance0016
     * @tc.desc Verify isPartOfSurrogatePair is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = new Char(c'\uD83D');
      const startTime = Date.now();
      const result = ch.isPartOfSurrogatePair();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_1800
     * @tc.name testCharIsPartOfSurrogatePairInstance0018
     * @tc.desc Verify different calling methods between static and instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uD83D');
      const instanceResult = c.isPartOfSurrogatePair();
      const staticResult = Char.isPartOfSurrogatePair(c'\uD83D');
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_1900
     * @tc.name testCharIsPartOfSurrogatePairInstance0019
     * @tc.desc Verify surrogate type identification with isHighSurrogate and isLowSurrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = new Char(c'\uD83D');
      const lowSurrogate = new Char(c'\uDC00');
      const normalChar = new Char(c'A');

      expect(highSurrogate.isPartOfSurrogatePair()).assertTrue();
      expect(Char.isHighSurrogate(c'\uD83D')).assertTrue();
      expect(Char.isLowSurrogate(c'\uD83D')).assertFalse();

      expect(lowSurrogate.isPartOfSurrogatePair()).assertTrue();
      expect(Char.isHighSurrogate(c'\uDC00')).assertFalse();
      expect(Char.isLowSurrogate(c'\uDC00')).assertTrue();

      expect(normalChar.isPartOfSurrogatePair()).assertFalse();
      expect(Char.isHighSurrogate(c'A')).assertFalse();
      expect(Char.isLowSurrogate(c'A')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_2000
     * @tc.name testCharIsPartOfSurrogatePairInstance0020
     * @tc.desc Verify surrogate characters not in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = new Char(c'\uD83D');
      const lowSurrogate = new Char(c'\uDC00');
      const normalChar = new Char(c'A');

      expect(highSurrogate.isPartOfSurrogatePair()).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'\uD83D')).assertFalse();

      expect(lowSurrogate.isPartOfSurrogatePair()).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'\uDC00')).assertFalse();

      expect(normalChar.isPartOfSurrogatePair()).assertFalse();
      expect(Char.isInBasicMultilingualPlane(c'A')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_2100
     * @tc.name testCharIsPartOfSurrogatePairInstance0021
     * @tc.desc Verify complete high surrogate range (0xD800-0xDBFF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0xD800; i <= 0xDBFF; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.isPartOfSurrogatePair()).assertTrue();
        expect(Char.isHighSurrogate(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_2200
     * @tc.name testCharIsPartOfSurrogatePairInstance0022
     * @tc.desc Verify complete low surrogate range (0xDC00-0xDFFF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0xDC00; i <= 0xDFFF; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.isPartOfSurrogatePair()).assertTrue();
        expect(Char.isLowSurrogate(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_2300
     * @tc.name testCharIsPartOfSurrogatePairInstance0023
     * @tc.desc Verify normal BMP characters are not surrogate pair parts (full ASCII)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const asciiChars: char[] = [
        c'\x00', c'\x01', c'\x02', c'\x03', c'\x04', c'\x05', c'\x06', c'\x07', c'\x08', c'\t',
      c'\n', c'\x0B', c'\x0C', c'\r', c'\x0E', c'\x0F',
      c'\x10', c'\x11', c'\x12', c'\x13', c'\x14', c'\x15', c'\x16', c'\x17', c'\x18', c'\x19',
      c'\x1A', c'\x1B', c'\x1C', c'\x1D', c'\x1E', c'\x1F',
      c' ', c'!', c'"', c'#', c'$', c'%', c'&', c'\'', c'(', c')', c'*', c'+', c',', c'-', c'.', c'/',
      c'0', c'1', c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9', c':', c';', c'<', c'=', c'>', c'?',
      c'@', c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H', c'I', c'J', c'K', c'L', c'M', c'N', c'O',
      c'P', c'Q', c'R', c'S', c'T', c'U', c'V', c'W', c'X', c'Y', c'Z', c'[', c'\\', c']', c'^', c'_',
      c'`', c'a', c'b', c'c', c'd', c'e', c'f', c'g', c'h', c'i', c'j', c'k', c'l', c'm', c'n', c'o',
      c'p', c'q', c'r', c's', c't', c'u', c'v', c'w', c'x', c'y', c'z', c'{', c'|', c'}', c'~', c'\x7F'
      ];
      for (const ch of asciiChars) {
        const c = new Char(ch);
        expect(c.isPartOfSurrogatePair()).assertFalse();
      }
      const unicodeSamples = [c'\u4E2D', c'\u3042'];
      for (const ch of unicodeSamples) {
        const c = new Char(ch);
        expect(c.isPartOfSurrogatePair()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_2400
     * @tc.name testCharIsPartOfSurrogatePairInstance0024
     * @tc.desc Verify surrogate area boundary characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const before = new Char(c'\uD7FF');
      expect(before.isPartOfSurrogatePair()).assertFalse();

      const highStart = new Char(c'\uD800');
      expect(highStart.isPartOfSurrogatePair()).assertTrue();

      const highEnd = new Char(c'\uDBFF');
      expect(highEnd.isPartOfSurrogatePair()).assertTrue();

      const lowStart = new Char(c'\uDC00');
      expect(lowStart.isPartOfSurrogatePair()).assertTrue();

      const lowEnd = new Char(c'\uDFFF');
      expect(lowEnd.isPartOfSurrogatePair()).assertTrue();

      const after = new Char(c'\uE000');
      expect(after.isPartOfSurrogatePair()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_2500
     * @tc.name testCharIsPartOfSurrogatePairInstance0025
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = new Char(c'\uD83D');
      const result1 = highSurrogate.isPartOfSurrogatePair();
      const result2 = highSurrogate.isPartOfSurrogatePair();
      const result3 = highSurrogate.isPartOfSurrogatePair();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_2600
     * @tc.name testCharIsPartOfSurrogatePairInstance0026
     * @tc.desc Verify batch calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = new Char(c'\uD83D');
      for (let i = 0; i < 1000; i++) {
        expect(highSurrogate.isPartOfSurrogatePair()).assertTrue();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISPARTOFSURROGATEPAIRINSTANCETEST_2800
     * @tc.name testCharIsPartOfSurrogatePairInstance0028
     * @tc.desc Verify instance and static methods are consistent for same characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsPartOfSurrogatePairInstance0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'\uD83D', c'\uDC00', c'A'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const instanceResult = c.isPartOfSurrogatePair();
        const staticResult = Char.isPartOfSurrogatePair(ch);
        expect(instanceResult).assertEqual(staticResult);
      }
    });

  });
}
