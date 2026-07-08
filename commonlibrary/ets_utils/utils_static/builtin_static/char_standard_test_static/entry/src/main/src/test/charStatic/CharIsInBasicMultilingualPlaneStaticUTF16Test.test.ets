'use static';
﻿/*
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
export default function charIsInBasicMultilingualPlaneStaticUTF16Test(): void {
  describe("CharIsInBasicMultilingualPlaneStaticUTF16Test", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_0100
     * @tc.name testCharIsInBMPStaticUTF160001
     * @tc.desc Verify that a UTF_16_CodePoint parameter is required
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(65 as UTF_16_CodePoint);
      expect(result).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_0200
     * @tc.name testCharIsInBMPStaticUTF160003
     * @tc.desc Verify BMP code points return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isInBasicMultilingualPlane(65 as UTF_16_CodePoint)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(90 as UTF_16_CodePoint)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(97 as UTF_16_CodePoint)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(128 as UTF_16_CodePoint)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(255 as UTF_16_CodePoint)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(0x4E2D as UTF_16_CodePoint)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(0xFFFF as UTF_16_CodePoint)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_0300
     * @tc.name testCharIsInBMPStaticUTF160004
     * @tc.desc Verify surrogate code points return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isInBasicMultilingualPlane(0xD800 as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0xDBFF as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0xDC00 as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0xDFFF as UTF_16_CodePoint)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_0400
     * @tc.name testCharIsInBMPStaticUTF160005
     * @tc.desc Verify non-BMP code points return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isInBasicMultilingualPlane(0x10000 as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0x1F600 as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0x10FFFF as UTF_16_CodePoint)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_0500
     * @tc.name testCharIsInBMPStaticUTF160007
     * @tc.desc Verify minimum code point 0 is in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(0 as UTF_16_CodePoint);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_0600
     * @tc.name testCharIsInBMPStaticUTF160008
     * @tc.desc Verify BMP boundary value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(65535 as UTF_16_CodePoint);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_0700
     * @tc.name testCharIsInBMPStaticUTF160009
     * @tc.desc Verify non-BMP boundary value 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(65536 as UTF_16_CodePoint);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_0800
     * @tc.name testCharIsInBMPStaticUTF160010
     * @tc.desc Verify surrogate region boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isInBasicMultilingualPlane(0xD7FF as UTF_16_CodePoint)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(0xD800 as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0xDBFF as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0xDC00 as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0xE000 as UTF_16_CodePoint)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_0900
     * @tc.name testCharIsInBMPStaticUTF160011
     * @tc.desc Verify return value is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(65 as UTF_16_CodePoint);
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_1000
     * @tc.name testCharIsInBMPStaticUTF160012
     * @tc.desc Verify BMP code points return true in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i <= 65535; i += 1000) {
        if (i < 0xD800 || i > 0xDFFF) {
          const result = Char.isInBasicMultilingualPlane(i as UTF_16_CodePoint);
          expect(result).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_1100
     * @tc.name testCharIsInBMPStaticUTF160013
     * @tc.desc Verify surrogate code points return false in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0xD800; i <= 0xDFFF; i += 100) {
        const result = Char.isInBasicMultilingualPlane(i as UTF_16_CodePoint);
        expect(result).assertFalse();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_1200
     * @tc.name testCharIsInBMPStaticUTF160016
     * @tc.desc Verify max Unicode code point is not in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(0x10FFFF as UTF_16_CodePoint);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_1300
     * @tc.name testCharIsInBMPStaticUTF160017
     * @tc.desc Verify emoji code point is not in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(0x1F600 as UTF_16_CodePoint);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_1400
     * @tc.name testCharIsInBMPStaticUTF160018
     * @tc.desc Verify return type and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(65 as UTF_16_CodePoint);
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_1500
     * @tc.name testCharIsInBMPStaticUTF160019
     * @tc.desc Verify boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueResult = Char.isInBasicMultilingualPlane(65 as UTF_16_CodePoint);
      const falseResult = Char.isInBasicMultilingualPlane(0x1F600 as UTF_16_CodePoint);
      expect(trueResult === true).assertTrue();
      expect(falseResult === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_1600
     * @tc.name testCharIsInBMPStaticUTF160020
     * @tc.desc Verify BMP upper limit 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(0xFFFF as UTF_16_CodePoint);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_1700
     * @tc.name testCharIsInBMPStaticUTF160021
     * @tc.desc Verify complete surrogate region returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0xD800; i <= 0xDBFF; i++) {
        const result = Char.isInBasicMultilingualPlane(i as UTF_16_CodePoint);
        expect(result).assertFalse();
      }
      for (let i = 0xDC00; i <= 0xDFFF; i++) {
        const result = Char.isInBasicMultilingualPlane(i as UTF_16_CodePoint);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_1800
     * @tc.name testCharIsInBMPStaticUTF160026
     * @tc.desc Verify method overloading consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.isInBasicMultilingualPlane(c'A');
      const result2 = Char.isInBasicMultilingualPlane(65 as UTF_16_CodePoint);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_1900
     * @tc.name testCharIsInBMPStaticUTF160027
     * @tc.desc Verify synchronous execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.isInBasicMultilingualPlane(65 as UTF_16_CodePoint);
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_2100
     * @tc.name testCharIsInBMPStaticUTF160031
     * @tc.desc Verify BMP code point requires 1 code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const codePoint = 65 as UTF_16_CodePoint;
      const inBMP = Char.isInBasicMultilingualPlane(codePoint);
      const units = Char.codeUnitsToEncode(codePoint);
      expect(inBMP).assertTrue();
      expect(units).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_2200
     * @tc.name testCharIsInBMPStaticUTF160034
     * @tc.desc Verify supplementary planes are not in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isInBasicMultilingualPlane(0x10000 as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0x1FFFF as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0x1F600 as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0x10FFFF as UTF_16_CodePoint)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_2300
     * @tc.name testCharIsInBMPStaticUTF160035
     * @tc.desc Verify Unicode boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isInBasicMultilingualPlane(0 as UTF_16_CodePoint)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(0xFFFF as UTF_16_CodePoint)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(0xD7FF as UTF_16_CodePoint)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(0xD800 as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0xDFFF as UTF_16_CodePoint)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(0xE000 as UTF_16_CodePoint)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(0x10FFFF as UTF_16_CodePoint)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_2400
     * @tc.name testCharIsInBMPStaticUTF160036
     * @tc.desc Verify repeat calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const codePoint = 65 as UTF_16_CodePoint;
      const result1 = Char.isInBasicMultilingualPlane(codePoint);
      const result2 = Char.isInBasicMultilingualPlane(codePoint);
      const result3 = Char.isInBasicMultilingualPlane(codePoint);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_2500
     * @tc.name testCharIsInBMPStaticUTF160037
     * @tc.desc Verify batch calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.isInBasicMultilingualPlane(65 as UTF_16_CodePoint)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_2600
     * @tc.name testCharIsInBMPStaticUTF160038
     * @tc.desc Verify BMP definition consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i <= 0xFFFF; i += 1000) {
        const expected = (i < 0xD800 || i > 0xDFFF);
        const result = Char.isInBasicMultilingualPlane(i as UTF_16_CodePoint);
        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISINBMPSTATICUTF_2700
     * @tc.name testCharIsInBMPStaticUTF160040
     * @tc.desc Verify consistency with codeUnitsToEncode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticUTF160040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i <= 65535; i += 1000) {
        if (i < 0xD800 || i > 0xDFFF) {
          const codePoint = i as UTF_16_CodePoint;
          const inBMP = Char.isInBasicMultilingualPlane(codePoint);
          const units = Char.codeUnitsToEncode(codePoint);
          expect(inBMP).assertTrue();
          expect(units).assertEqual(1);
        }
      }
    });
  });
}
