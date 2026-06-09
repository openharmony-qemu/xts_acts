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

function invokeIsValidCodePointNoArg(): boolean {
  return (Char.isValidCodePoint as Object as (() => boolean))();
}

function invokeIsValidCodePointWithParam(ch: Object | null): boolean {
  return (Char.isValidCodePoint as Object as ((param: Object | null) => boolean))(ch);
}

export default function CharIsValidCodePointTest(): void {
  describe('CharIsValidCodePointTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_0100
     * @tc.name testCharIsValidCodePoint0001
     * @tc.desc Verify that a UTF_16_CodePoint parameter must be provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp: UTF_16_CodePoint = 65;
      const result = Char.isValidCodePoint(cp);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_2300
     * @tc.name testCharIsValidCodePoint0023
     * @tc.desc Verify isValidCodePoint is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.isValidCodePoint).assertEqual("function");
      let cp: UTF_16_CodePoint = 65;
      const result = Char.isValidCodePoint(cp);
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_2500
     * @tc.name testCharIsValidCodePoint0025
     * @tc.desc Verify isValidCodePoint is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      let cp: UTF_16_CodePoint = 65;
      const result = Char.isValidCodePoint(cp);
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_2600
     * @tc.name testCharIsValidCodePoint0026
     * @tc.desc Verify BMP code points are all valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i <= 65535; i += 1000) {
        if (i < 0xD800 || i > 0xDFFF) {
          let cp: UTF_16_CodePoint = i;
          const inBMP = Char.isInBasicMultilingualPlane(cp);
          const valid = Char.isValidCodePoint(cp);
          expect(inBMP).assertTrue();
          expect(valid).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_2700
     * @tc.name testCharIsValidCodePoint0027
     * @tc.desc Verify surrogate code points are not in BMP and invalid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0xD800; i <= 0xDFFF; i += 1000) {
        let cp: UTF_16_CodePoint = i;
        const inBMP = Char.isInBasicMultilingualPlane(cp);
        const valid = Char.isValidCodePoint(cp);
        expect(inBMP).assertFalse();
        expect(valid).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_2800
     * @tc.name testCharIsValidCodePoint0028
     * @tc.desc Verify valid code points can calculate code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bmpPoint: UTF_16_CodePoint = 65;
      expect(Char.isValidCodePoint(bmpPoint)).assertTrue();
      expect(Char.codeUnitsToEncode(bmpPoint)).assertEqual(1);
      let smpPoint: UTF_16_CodePoint = 0x1F600;
      expect(Char.isValidCodePoint(smpPoint)).assertTrue();
      expect(Char.codeUnitsToEncode(smpPoint)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_2900
     * @tc.name testCharIsValidCodePoint0029
     * @tc.desc Verify surrogate code points are invalid but identifiable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let highSurrogate: UTF_16_CodePoint = 0xD800;
      expect(Char.isValidCodePoint(highSurrogate)).assertFalse();
      expect(Char.isHighSurrogate(c'\uD800')).assertTrue();
      let lowSurrogate: UTF_16_CodePoint = 0xDC00;
      expect(Char.isValidCodePoint(lowSurrogate)).assertFalse();
      expect(Char.isLowSurrogate(c'\uDC00')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_3000
     * @tc.name testCharIsValidCodePoint0030
     * @tc.desc Verify complete valid range 0 to 0x10FFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp1: UTF_16_CodePoint = 0;
      let cp2: UTF_16_CodePoint = 0xD7FF;
      let cp3: UTF_16_CodePoint = 0xE000;
      let cp4: UTF_16_CodePoint = 0xFFFF;
      let cp5: UTF_16_CodePoint = 0x10000;
      let cp6: UTF_16_CodePoint = 0x1F600;
      let cp7: UTF_16_CodePoint = 0x10FFFF;
      expect(Char.isValidCodePoint(cp1)).assertTrue();
      expect(Char.isValidCodePoint(cp2)).assertTrue();
      expect(Char.isValidCodePoint(cp3)).assertTrue();
      expect(Char.isValidCodePoint(cp4)).assertTrue();
      expect(Char.isValidCodePoint(cp5)).assertTrue();
      expect(Char.isValidCodePoint(cp6)).assertTrue();
      expect(Char.isValidCodePoint(cp7)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_3200
     * @tc.name testCharIsValidCodePoint0032
     * @tc.desc Verify code points beyond 0x10FFFF are invalid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp1: UTF_16_CodePoint = 0x110000;
      let cp2: UTF_16_CodePoint = 0x120000;
      let cp3: UTF_16_CodePoint = 0x200000;
      expect(Char.isValidCodePoint(cp1)).assertFalse();
      expect(Char.isValidCodePoint(cp2)).assertFalse();
      expect(Char.isValidCodePoint(cp3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_3300
     * @tc.name testCharIsValidCodePoint0033
     * @tc.desc Verify Unicode standard boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp1: UTF_16_CodePoint = 0;
      let cp2: UTF_16_CodePoint = 0xD7FF;
      let cp3: UTF_16_CodePoint = 0xD800;
      let cp4: UTF_16_CodePoint = 0xDFFF;
      let cp5: UTF_16_CodePoint = 0xE000;
      let cp6: UTF_16_CodePoint = 0x10FFFF;
      let cp7: UTF_16_CodePoint = 0x110000;
      expect(Char.isValidCodePoint(cp1)).assertTrue();
      expect(Char.isValidCodePoint(cp2)).assertTrue();
      expect(Char.isValidCodePoint(cp3)).assertFalse();
      expect(Char.isValidCodePoint(cp4)).assertFalse();
      expect(Char.isValidCodePoint(cp5)).assertTrue();
      expect(Char.isValidCodePoint(cp6)).assertTrue();
      expect(Char.isValidCodePoint(cp7)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_3400
     * @tc.name testCharIsValidCodePoint0034
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp: UTF_16_CodePoint = 65;
      const result1 = Char.isValidCodePoint(cp);
      const result2 = Char.isValidCodePoint(cp);
      const result3 = Char.isValidCodePoint(cp);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_3500
     * @tc.name testCharIsValidCodePoint0035
     * @tc.desc Verify batch calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        let cp: UTF_16_CodePoint = 65;
        expect(Char.isValidCodePoint(cp)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_3600
     * @tc.name testCharIsValidCodePoint0036
     * @tc.desc Verify precise Unicode code point definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i <= 0x110000; i += 10000) {
        let cp: UTF_16_CodePoint = i;
        const expected = (i >= 0 && i <= 0x10FFFF) && (i < 0xD800 || i > 0xDFFF);
        const result = Char.isValidCodePoint(cp);
        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_3700
     * @tc.name testCharIsValidCodePoint0037
     * @tc.desc Verify conformance to Unicode standard
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0xD800; i <= 0xDFFF; i++) {
        let cp: UTF_16_CodePoint = i;
        const result = Char.isValidCodePoint(cp);
        expect(result).assertFalse();
      }
      for (let i = 0; i <= 0xD7FF; i += 10000) {
        let cp: UTF_16_CodePoint = i;
        const result = Char.isValidCodePoint(cp);
        expect(result).assertTrue();
      }
      for (let i = 0xE000; i <= 0x10FFFF; i += 10000) {
        let cp: UTF_16_CodePoint = i;
        const result = Char.isValidCodePoint(cp);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISVALIDCODEPOINTTEST_3800
     * @tc.name testCharIsValidCodePoint0038
     * @tc.desc Verify valid code points can be correctly encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsValidCodePoint0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bmp1: UTF_16_CodePoint = 65;
      let bmp2: UTF_16_CodePoint = 0x4E2D;
      let bmp3: UTF_16_CodePoint = 0xFFFF;
      expect(Char.isValidCodePoint(bmp1)).assertTrue();
      expect(Char.codeUnitsToEncode(bmp1)).assertEqual(1);
      expect(Char.isValidCodePoint(bmp2)).assertTrue();
      expect(Char.codeUnitsToEncode(bmp2)).assertEqual(1);
      expect(Char.isValidCodePoint(bmp3)).assertTrue();
      expect(Char.codeUnitsToEncode(bmp3)).assertEqual(1);

      let smp1: UTF_16_CodePoint = 0x10000;
      let smp2: UTF_16_CodePoint = 0x1F600;
      let smp3: UTF_16_CodePoint = 0x10FFFF;
      expect(Char.isValidCodePoint(smp1)).assertTrue();
      expect(Char.codeUnitsToEncode(smp1)).assertEqual(2);
      expect(Char.isValidCodePoint(smp2)).assertTrue();
      expect(Char.codeUnitsToEncode(smp2)).assertEqual(2);
      expect(Char.isValidCodePoint(smp3)).assertTrue();
      expect(Char.codeUnitsToEncode(smp3)).assertEqual(2);
    });
  });
}
