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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function CharCodeUnitsToEncodeTest(): void {
  describe('CharCodeUnitsToEncodeTest', () => {
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
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_0100
     * @tc.name testCharCodeUnitsToEncode0001
     * @tc.desc Verify that a UTF_16_CodePoint parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.codeUnitsToEncode(97 as UTF_16_CodePoint);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_0200
     * @tc.name testCharCodeUnitsToEncode0002
     * @tc.desc Verify that no parameter passed should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.codeUnitsToEncode(undefined as UTF_16_CodePoint);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_0300
     * @tc.name testCharCodeUnitsToEncode0003
     * @tc.desc Verify BMP code points require 1 code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.codeUnitsToEncode(97 as UTF_16_CodePoint)).assertEqual(1);
      expect(Char.codeUnitsToEncode(65 as UTF_16_CodePoint)).assertEqual(1);
      expect(Char.codeUnitsToEncode(0x4E2D as UTF_16_CodePoint)).assertEqual(1);
      expect(Char.codeUnitsToEncode(0xFFFF as UTF_16_CodePoint)).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_0400
     * @tc.name testCharCodeUnitsToEncode0004
     * @tc.desc Verify non-BMP code points require 2 code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.codeUnitsToEncode(0x10000 as UTF_16_CodePoint)).assertEqual(2);
      expect(Char.codeUnitsToEncode(0x1F600 as UTF_16_CodePoint)).assertEqual(2);
      expect(Char.codeUnitsToEncode(0x10FFFF as UTF_16_CodePoint)).assertEqual(2);
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_0500
     * @tc.name testCharCodeUnitsToEncode0005
     * @tc.desc Verify boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.codeUnitsToEncode(0 as UTF_16_CodePoint)).assertEqual(1);
      expect(Char.codeUnitsToEncode(0xFFFF as UTF_16_CodePoint)).assertEqual(1);
      expect(Char.codeUnitsToEncode(0x10000 as UTF_16_CodePoint)).assertEqual(2);
      expect(Char.codeUnitsToEncode(0x10FFFF as UTF_16_CodePoint)).assertEqual(2);
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_0600
     * @tc.name testCharCodeUnitsToEncode0006
     * @tc.desc Verify passing illegal values returns a number (1 or 2) without throwing error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.codeUnitsToEncode(-1 as UTF_16_CodePoint);
      expect(result1 === 1 || result1 === 2).assertTrue();
      const result2 = Char.codeUnitsToEncode(0x110000 as UTF_16_CodePoint);
      expect(result2 === 1 || result2 === 2).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_0700
     * @tc.name testCharCodeUnitsToEncode0007
     * @tc.desc Verify return value is int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.codeUnitsToEncode(97 as UTF_16_CodePoint);
      expect(typeof result === "number" || typeof result === "int").assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_0800
     * @tc.name testCharCodeUnitsToEncode0008
     * @tc.desc Verify BMP code points return 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i <= 65535; i += 10000) {
        if (i < 0xD800 || i > 0xDFFF) {
          const result = Char.codeUnitsToEncode(i as UTF_16_CodePoint);
          expect(result).assertEqual(1);
        }
      }
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_0900
     * @tc.name testCharCodeUnitsToEncode0009
     * @tc.desc Verify non-BMP code points return 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 10000) {
        const result = Char.codeUnitsToEncode(i as UTF_16_CodePoint);
        expect(result).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_1000
     * @tc.name testCharCodeUnitsToEncode0010
     * @tc.desc Verify code point 0 requires 1 code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.codeUnitsToEncode(0 as UTF_16_CodePoint);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_1100
     * @tc.name testCharCodeUnitsToEncode0011
     * @tc.desc Verify code point 0x10FFFF requires 2 code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.codeUnitsToEncode(0x10FFFF as UTF_16_CodePoint);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_1200
     * @tc.name testCharCodeUnitsToEncode0012
     * @tc.desc Verify emoji code points require 2 code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.codeUnitsToEncode(0x1F600 as UTF_16_CodePoint);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_1300
     * @tc.name testCharCodeUnitsToEncode0013
     * @tc.desc Verify return value can only be 1 or 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.codeUnitsToEncode(65 as UTF_16_CodePoint);
      const result2 = Char.codeUnitsToEncode(0x1F600 as UTF_16_CodePoint);
      expect(result1 === 1 || result1 === 2).assertTrue();
      expect(result2 === 1 || result2 === 2).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_1400
     * @tc.name testCharCodeUnitsToEncode0014
     * @tc.desc Verify last BMP code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.codeUnitsToEncode(0xFFFF as UTF_16_CodePoint);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_1500
     * @tc.name testCharCodeUnitsToEncode0015
     * @tc.desc Verify first supplementary plane code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.codeUnitsToEncode(0x10000 as UTF_16_CodePoint);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_1600
     * @tc.name testCharCodeUnitsToEncode0016
     * @tc.desc Verify passing wrong type parameter throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.codeUnitsToEncode(null as UTF_16_CodePoint);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_1800
     * @tc.name testCharCodeUnitsToEncode0018
     * @tc.desc Verify codeUnitsToEncode() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.codeUnitsToEncode(97 as UTF_16_CodePoint);
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_1900
     * @tc.name testCharCodeUnitsToEncode0019
     * @tc.desc Verify codeUnitsToEncode is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.codeUnitsToEncode).assertEqual("function");
    });


    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_2100
     * @tc.name testCharCodeUnitsToEncode0021
     * @tc.desc Verify codeUnitsToEncode is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.codeUnitsToEncode(97 as UTF_16_CodePoint);
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_2200
     * @tc.name testCharCodeUnitsToEncode0022
     * @tc.desc Verify BMP code points consistent with BMP check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i <= 65535; i += 10000) {
        if (i < 0xD800 || i > 0xDFFF) {
          const inBMP = Char.isInBasicMultilingualPlane(i as UTF_16_CodePoint);
          const units = Char.codeUnitsToEncode(i as UTF_16_CodePoint);
          expect(inBMP).assertTrue();
          expect(units).assertEqual(1);
        }
      }
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_2300
     * @tc.name testCharCodeUnitsToEncode0023
     * @tc.desc Verify non-BMP code points require 2 code units with isInBasicMultilingualPlane
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 10000) {
        const inBMP = Char.isInBasicMultilingualPlane(i as UTF_16_CodePoint);
        const units = Char.codeUnitsToEncode(i as UTF_16_CodePoint);
        expect(inBMP).assertFalse();
        expect(units).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_2400
     * @tc.name testCharCodeUnitsToEncode0024
     * @tc.desc Verify valid code points calculate code unit count; surrogate code point returns a number (1 or 2) without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const validBMP = 65 as UTF_16_CodePoint;
      expect(Char.isValidCodePoint(validBMP)).assertTrue();
      expect(Char.codeUnitsToEncode(validBMP)).assertEqual(1);
      const validSMP = 0x1F600 as UTF_16_CodePoint;
      expect(Char.isValidCodePoint(validSMP)).assertTrue();
      expect(Char.codeUnitsToEncode(validSMP)).assertEqual(2);
      const surrogate = 0xD800 as UTF_16_CodePoint;
      const result = Char.codeUnitsToEncode(surrogate);
      expect(result === 1 || result === 2).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_2500
     * @tc.name testCharCodeUnitsToEncode0025
     * @tc.desc Verify code points requiring surrogate pairs can be decomposed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiPoint = 0x1F600 as UTF_16_CodePoint;
      const units = Char.codeUnitsToEncode(emojiPoint);
      expect(units).assertEqual(2);
      const high = Char.getHighSurrogate(emojiPoint);
      const low = Char.getLowSurrogate(emojiPoint);
      expect(Char.isHighSurrogate(high)).assertTrue();
      expect(Char.isLowSurrogate(low)).assertTrue();
    });



    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_2800
     * @tc.name testCharCodeUnitsToEncode0028
     * @tc.desc Verify surrogate code points return a number (1 or 2) without throwing error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.codeUnitsToEncode(0xD800 as UTF_16_CodePoint);
      expect(result === 1 || result === 2).assertTrue();
    });


    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_3000
     * @tc.name testCharCodeUnitsToEncode0030
     * @tc.desc Verify multiple invocations return the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const codePoint = 97 as UTF_16_CodePoint;
      const result1 = Char.codeUnitsToEncode(codePoint);
      const result2 = Char.codeUnitsToEncode(codePoint);
      const result3 = Char.codeUnitsToEncode(codePoint);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_3100
     * @tc.name testCharCodeUnitsToEncode0031
     * @tc.desc Verify multiple invocations return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.codeUnitsToEncode(97 as UTF_16_CodePoint)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_3200
     * @tc.name testCharCodeUnitsToEncode0032
     * @tc.desc Verify UTF-16 encoding rules compliance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i <= 0xFFFF; i += 0x1000) {
        if (i < 0xD800 || i > 0xDFFF) {
          const result = Char.codeUnitsToEncode(i as UTF_16_CodePoint);
          expect(result).assertEqual(1);
        }
      }
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x10000) {
        const result = Char.codeUnitsToEncode(i as UTF_16_CodePoint);
        expect(result).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_3300
     * @tc.name testCharCodeUnitsToEncode0033
     * @tc.desc Verify code points requiring surrogate pairs can be decomposed with charsToCodePoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiPoint = 0x1F600 as UTF_16_CodePoint;
      const units = Char.codeUnitsToEncode(emojiPoint);
      expect(units).assertEqual(2);
      const high = Char.getHighSurrogate(emojiPoint);
      const low = Char.getLowSurrogate(emojiPoint);
      expect(Char.isHighSurrogate(high)).assertTrue();
      expect(Char.isLowSurrogate(low)).assertTrue();
      const combined = Char.charsToCodePoint(high, low);
      expect(combined).assertEqual(emojiPoint);
    });

    /**
     * @tc.number SUB_CHAR_CODE_UNITSTOENCODETEST_3400
     * @tc.name testCharCodeUnitsToEncode0034
     * @tc.desc Verify BMP code points always require 1 code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeUnitsToEncode0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i <= 0xFFFF; i += 1000) {
        if (i < 0xD800 || i > 0xDFFF) {
          const inBMP = Char.isInBasicMultilingualPlane(i as UTF_16_CodePoint);
          const units = Char.codeUnitsToEncode(i as UTF_16_CodePoint);
          expect(inBMP).assertTrue();
          expect(units).assertEqual(1);
        }
      }
    });
  });
}
