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

function invokeIsLowSurrogate(): boolean {
  return (Char.isLowSurrogate as Object as (() => boolean))();
}

function invokeIsLowSurrogateWithParam(ch: Object | null): boolean {
  return (Char.isLowSurrogate as Object as ((param: Object | null) => boolean))(ch);
}

export default function CharIsLowSurrogateTest(): void {
  describe('CharIsLowSurrogateTest' as string, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_0100
     * @tc.name testCharIsLowSurrogate0001
     * @tc.desc Verify that a char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isLowSurrogate(c'\uDE00');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_0200
     * @tc.name testCharIsLowSurrogate0002
     * @tc.desc Verify that missing parameter throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        invokeIsLowSurrogate();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_0300
     * @tc.name testCharIsLowSurrogate0003
     * @tc.desc Verify low surrogate character returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowSurrogate(Char.LOW_SURROGATE_MIN)).assertTrue();
      expect(Char.isLowSurrogate(Char.LOW_SURROGATE_MAX)).assertTrue();
      const lowMiddle = charFromCode(0xDE00);
      expect(Char.isLowSurrogate(lowMiddle)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_0400
     * @tc.name testCharIsLowSurrogate0004
     * @tc.desc Verify high surrogate character returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowSurrogate(Char.HIGH_SURROGATE_MIN)).assertFalse();
      expect(Char.isLowSurrogate(Char.HIGH_SURROGATE_MAX)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_0500
     * @tc.name testCharIsLowSurrogate0005
     * @tc.desc Verify normal character returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowSurrogate(c'A')).assertFalse();
      expect(Char.isLowSurrogate(c'Z')).assertFalse();
      expect(Char.isLowSurrogate(c'0')).assertFalse();
      expect(Char.isLowSurrogate(c'中')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_0600
     * @tc.name testCharIsLowSurrogate0006
     * @tc.desc Verify low surrogate area boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const beforeLow = charFromCode(0xDBFF);
      expect(Char.isLowSurrogate(beforeLow)).assertFalse();
      const lowStart = charFromCode(0xDC00);
      const lowEnd = charFromCode(0xDFFF);
      expect(Char.isLowSurrogate(lowStart)).assertTrue();
      expect(Char.isLowSurrogate(lowEnd)).assertTrue();
      const afterLow = charFromCode(0xE000);
      expect(Char.isLowSurrogate(afterLow)).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_0700
     * @tc.name testCharIsLowSurrogate0007
     * @tc.desc Verify passing non-char type throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        invokeIsLowSurrogateWithParam(null);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_0800
     * @tc.name testCharIsLowSurrogate0008
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isLowSurrogate(c'\uDE00');
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_0900
     * @tc.name testCharIsLowSurrogate0009
     * @tc.desc Verify low surrogate characters from 0xDC00 to 0xDFFF return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0xDC00; i <= 0xDFFF; i++) {
        const ch = charFromCode(i);
        const result = Char.isLowSurrogate(ch);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_1000
     * @tc.name testCharIsLowSurrogate0010
     * @tc.desc Verify non-low-surrogate characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowSurrogate(ch)).assertFalse();
      }
      for (let i: int = 0xD800; i <= 0xDBFF; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowSurrogate(ch)).assertFalse();
      }
      expect(Char.isLowSurrogate(c'A')).assertFalse();
      expect(Char.isLowSurrogate(c'中')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_1100
     * @tc.name testCharIsLowSurrogate0011
     * @tc.desc Verify low surrogate boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowSurrogate(Char.LOW_SURROGATE_MIN)).assertTrue();
      expect(Char.isLowSurrogate(c'\uDC00')).assertTrue();
      expect(Char.isLowSurrogate(Char.LOW_SURROGATE_MAX)).assertTrue();
      expect(Char.isLowSurrogate(c'\uDFFF')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_1200
     * @tc.name testCharIsLowSurrogate0012
     * @tc.desc Verify characters adjacent to low surrogate range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = charFromCode(0xDBFF);
      expect(Char.isLowSurrogate(highSurrogate)).assertFalse();
      const after = charFromCode(0xE000);
      expect(Char.isLowSurrogate(after)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_1300
     * @tc.name testCharIsLowSurrogate0013
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isLowSurrogate(c'\uDE00');
      expect(typeof result).assertEqual('boolean');
      expect(result === true || result === false).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_1500
     * @tc.name testCharIsLowSurrogate0015
     * @tc.desc Verify characters outside low surrogate range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0xD800; i <= 0xDBFF; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowSurrogate(ch)).assertFalse();
      }
      expect(Char.isLowSurrogate(c'A')).assertFalse();
      expect(Char.isLowSurrogate(c'\uFFFF')).assertFalse();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_1800
     * @tc.name testCharIsLowSurrogate0018
     * @tc.desc Verify isLowSurrogate() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.isLowSurrogate(c'A');
        expect(result).assertFalse();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_1900
     * @tc.name testCharIsLowSurrogate0019
     * @tc.desc Verify isLowSurrogate is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.isLowSurrogate).assertEqual('function');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_2100
     * @tc.name testCharIsLowSurrogate0021
     * @tc.desc Verify isLowSurrogate is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.isLowSurrogate(c'\uDE00');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_2200
     * @tc.name testCharIsLowSurrogate0022
     * @tc.desc Verify high surrogate and low surrogate areas are different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      expect(Char.isLowSurrogate(highSurrogate)).assertFalse();
      expect(Char.isHighSurrogate(highSurrogate)).assertTrue();
      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
      expect(Char.isHighSurrogate(lowSurrogate)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_2300
     * @tc.name testCharIsLowSurrogate0023
     * @tc.desc Verify a character cannot be both high and low surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0xD800; i <= 0xDFFF; i++) {
        const ch = charFromCode(i);
        const isHigh = Char.isHighSurrogate(ch);
        const isLow = Char.isLowSurrogate(ch);
        expect(isHigh && isLow).assertFalse();
        expect(isHigh || isLow).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_2400
     * @tc.name testCharIsLowSurrogate0024
     * @tc.desc Verify low surrogate character is part of surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(lowSurrogate)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_2500
     * @tc.name testCharIsLowSurrogate0025
     * @tc.desc Verify low surrogate character is not in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(lowSurrogate)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_2600
     * @tc.name testCharIsLowSurrogate0026
     * @tc.desc Verify identifying surrogate type then getting surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiPoint = 0x1F600 as UTF_16_CodePoint;
      const lowSurrogate = Char.getLowSurrogate(emojiPoint);
      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
      expect(Char.isHighSurrogate(lowSurrogate)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_2700
     * @tc.name testCharIsLowSurrogate0027
     * @tc.desc Verify low surrogate area from 0xDC00 to 0xDFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0xDC00; i <= 0xDFFF; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowSurrogate(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_2800
     * @tc.name testCharIsLowSurrogate0028
     * @tc.desc Verify high surrogate area from 0xD800 to 0xDBFF returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0xD800; i <= 0xDBFF; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowSurrogate(ch)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_2900
     * @tc.name testCharIsLowSurrogate0029
     * @tc.desc Verify normal characters are not low surrogates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowSurrogate(ch)).assertFalse();
      }
      expect(Char.isLowSurrogate(c'A')).assertFalse();
      expect(Char.isLowSurrogate(c'中')).assertFalse();
      expect(Char.isLowSurrogate(c'あ')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_3000
     * @tc.name testCharIsLowSurrogate0030
     * @tc.desc Verify low surrogate range boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const before = charFromCode(0xDBFF);
      expect(Char.isLowSurrogate(before)).assertFalse();
      const start = charFromCode(0xDC00);
      expect(Char.isLowSurrogate(start)).assertTrue();
      const end = charFromCode(0xDFFF);
      expect(Char.isLowSurrogate(end)).assertTrue();
      const after = charFromCode(0xE000);
      expect(Char.isLowSurrogate(after)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_3100
     * @tc.name testCharIsLowSurrogate0031
     * @tc.desc Verify multiple calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      const result1 = Char.isLowSurrogate(lowSurrogate);
      const result2 = Char.isLowSurrogate(lowSurrogate);
      const result3 = Char.isLowSurrogate(lowSurrogate);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_3200
     * @tc.name testCharIsLowSurrogate0032
     * @tc.desc Verify batch calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 1000; i++) {
        expect(Char.isLowSurrogate(Char.LOW_SURROGATE_MIN)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_3300
     * @tc.name testCharIsLowSurrogate0033
     * @tc.desc Verify precise low surrogate range division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mismatchCount = 0;
      for (let i: int = 0; i <= 65535; i++) {
        const ch = charFromCode(i);
        const isLow = i >= 0xDC00 && i <= 0xDFFF;
        const result = Char.isLowSurrogate(ch);
        if (result !== isLow) {
          mismatchCount++;
        }
      }
      expect(mismatchCount).assertEqual(0 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_3400
     * @tc.name testCharIsLowSurrogate0034
     * @tc.desc Verify low surrogate judgment consistent with other surrogate methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      const normalChar = c'A';
      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
      expect(Char.isLowSurrogate(highSurrogate)).assertFalse();
      expect(Char.isLowSurrogate(normalChar)).assertFalse();
      expect(Char.isPartOfSurrogatePair(highSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(lowSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(normalChar)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(highSurrogate)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(lowSurrogate)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(normalChar)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_3500
     * @tc.name testCharIsLowSurrogate0035
     * @tc.desc Verify using Char class constant definitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowSurrogate(Char.LOW_SURROGATE_MIN)).assertTrue();
      expect(Char.isLowSurrogate(Char.LOW_SURROGATE_MAX)).assertTrue();
      for (let i: int = 0xDC00; i <= 0xDFFF; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowSurrogate(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_3600
     * @tc.name testCharIsLowSurrogate0036
     * @tc.desc Verify identifying surrogate type then getting surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiPoint = 0x1F600 as UTF_16_CodePoint;
      const units = Char.codeUnitsToEncode(emojiPoint);
      expect(units).assertEqual(2 as int);
      const lowSurrogate = Char.getLowSurrogate(emojiPoint);
      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
      expect(Char.isHighSurrogate(lowSurrogate)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWSURROGATETEST_3700
     * @tc.name testCharIsLowSurrogate0037
     * @tc.desc Verify low surrogate combines with high surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowSurrogate0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.getHighSurrogate(0x1F600 as UTF_16_CodePoint);
      const lowSurrogate = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(Char.isHighSurrogate(highSurrogate)).assertTrue();
      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
      const codePoint = Char.charsToCodePoint(highSurrogate, lowSurrogate);
      expect(codePoint).assertEqual(0x1F600 as UTF_16_CodePoint);
    });
  });
}
