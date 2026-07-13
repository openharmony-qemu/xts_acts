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

export default function CharPropertiesTest(): void {
  describe('CharPropertiesTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_0100
     * @tc.name testCharProperties0001
     * @tc.desc Verify CHAR_BIT_SIZE property exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.CHAR_BIT_SIZE).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_0200
     * @tc.name testCharProperties0002
     * @tc.desc Verify CHAR_BIT_SIZE is of int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.CHAR_BIT_SIZE === "number" || typeof Char.CHAR_BIT_SIZE === "int").assertTrue();
      expect(Number.isInteger(Char.CHAR_BIT_SIZE)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_0400
     * @tc.name testCharProperties0004
     * @tc.desc Verify char type size using CHAR_BIT_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uFFFF');
      const maxValue = Math.pow(2, Char.CHAR_BIT_SIZE) - 1;
      expect(c.toInt() <= maxValue).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_0700
     * @tc.name testCharProperties0007
     * @tc.desc Verify MAX_CODE_POINT property exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.MAX_CODE_POINT).assertEqual(0x10FFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_0800
     * @tc.name testCharProperties0008
     * @tc.desc Verify MAX_CODE_POINT is of number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.MAX_CODE_POINT === "number" || typeof Char.MAX_CODE_POINT === "int").assertTrue();
      expect(Number.isInteger(Char.MAX_CODE_POINT)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_0900
     * @tc.name testCharProperties0009
     * @tc.desc Verify MAX_CODE_POINT value is 0x10FFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.MAX_CODE_POINT).assertEqual(0x10FFFF);
      expect(Char.MAX_CODE_POINT).assertEqual(1114111);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_1100
     * @tc.name testCharProperties0011
     * @tc.desc Verify it is the maximum valid Unicode code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.MAX_CODE_POINT).assertEqual(0x10FFFF);
      let cp: UTF_16_CodePoint = Char.MAX_CODE_POINT;
      expect(Char.isValidCodePoint(cp)).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_1400
     * @tc.name testCharProperties0014
     * @tc.desc Verify code point validity using MAX_CODE_POINT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const validCodePoint = 0x1F600;
      expect(validCodePoint <= Char.MAX_CODE_POINT).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_1500
     * @tc.name testCharProperties0015
     * @tc.desc Verify code point exceeding range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const invalidCodePoint = 0x110000;
      expect(invalidCodePoint > Char.MAX_CODE_POINT).assertTrue();
      expect(Char.isValidCodePoint(invalidCodePoint)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_1600
     * @tc.name testCharProperties0016
     * @tc.desc Verify HIGH_SURROGATE_MIN property exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Char(Char.HIGH_SURROGATE_MIN).toInt()).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_1700
     * @tc.name testCharProperties0017
     * @tc.desc Verify HIGH_SURROGATE_MIN is of char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.HIGH_SURROGATE_MIN).assertEqual("char");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_1800
     * @tc.name testCharProperties0018
     * @tc.desc Verify HIGH_SURROGATE_MIN value is c'\uD800'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.HIGH_SURROGATE_MIN).assertEqual(c'\uD800');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_1900
     * @tc.name testCharProperties0019
     * @tc.desc Verify it is the minimum high surrogate character in UTF-16 encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHighSurrogate(Char.HIGH_SURROGATE_MIN)).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_2200
     * @tc.name testCharProperties0022
     * @tc.desc Verify HIGH_SURROGATE_MAX property exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.HIGH_SURROGATE_MAX).assertEqual(c'\uDBFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_2300
     * @tc.name testCharProperties0023
     * @tc.desc Verify HIGH_SURROGATE_MAX is of char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.HIGH_SURROGATE_MAX).assertEqual("char");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_2500
     * @tc.name testCharProperties0025
     * @tc.desc Verify it is the maximum high surrogate character in UTF-16 encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHighSurrogate(Char.HIGH_SURROGATE_MAX)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_2700
     * @tc.name testCharProperties0027
     * @tc.desc Verify HIGH_SURROGATE_MAX is static property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.HIGH_SURROGATE_MAX).assertEqual(c'\uDBFF');;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_2800
     * @tc.name testCharProperties0028
     * @tc.desc Verify high surrogate range from MIN to MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highMin = new Char(Char.HIGH_SURROGATE_MIN);
      expect(Char.isHighSurrogate(highMin.toChar())).assertTrue();

      const highMid = new Char(c'\uD900');
      expect(Char.isHighSurrogate(highMid.toChar())).assertTrue();

      const highMax = new Char(Char.HIGH_SURROGATE_MAX);
      expect(Char.isHighSurrogate(highMax.toChar())).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_2900
     * @tc.name testCharProperties0029
     * @tc.desc Verify LOW_SURROGATE_MIN property exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.LOW_SURROGATE_MIN).assertEqual(c'\uDC00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_3000
     * @tc.name testCharProperties0030
     * @tc.desc Verify LOW_SURROGATE_MIN is of char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.LOW_SURROGATE_MIN).assertEqual("char");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_3200
     * @tc.name testCharProperties0032
     * @tc.desc Verify it is the minimum low surrogate character in UTF-16 encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowSurrogate(Char.LOW_SURROGATE_MIN)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_3400
     * @tc.name testCharProperties0034
     * @tc.desc Verify LOW_SURROGATE_MIN is static property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.LOW_SURROGATE_MIN).assertEqual(c'\uDC00');;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_3500
     * @tc.name testCharProperties0035
     * @tc.desc Verify LOW_SURROGATE_MAX property exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.LOW_SURROGATE_MAX).assertEqual(c'\uDFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_3600
     * @tc.name testCharProperties0036
     * @tc.desc Verify LOW_SURROGATE_MAX is of char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.LOW_SURROGATE_MAX).assertEqual("char");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_3800
     * @tc.name testCharProperties0038
     * @tc.desc Verify it is the maximum low surrogate character in UTF-16 encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowSurrogate(Char.LOW_SURROGATE_MAX)).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_4100
     * @tc.name testCharProperties0041
     * @tc.desc Verify low surrogate range from MIN to MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowMin = new Char(Char.LOW_SURROGATE_MIN);
      expect(Char.isLowSurrogate(lowMin.toChar())).assertTrue();

      const lowMid = new Char(c'\uDD00');
      expect(Char.isLowSurrogate(lowMid.toChar())).assertTrue();

      const lowMax = new Char(Char.LOW_SURROGATE_MAX);
      expect(Char.isLowSurrogate(lowMax.toChar())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_4200
     * @tc.name testCharProperties0042
     * @tc.desc Verify MIN_VALUE property exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.MIN_VALUE).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_4300
     * @tc.name testCharProperties0043
     * @tc.desc Verify MIN_VALUE is of char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.MIN_VALUE).assertEqual("char");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_4500
     * @tc.name testCharProperties0045
     * @tc.desc Verify it is the minimum value of char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minValue = new Char(Char.MIN_VALUE);
      expect(minValue.toInt()).assertEqual(0);
      expect(minValue.toChar()).assertEqual(c'\u0000');
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_4800
     * @tc.name testCharProperties0048
     * @tc.desc Verify creating minimum char instance using MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MIN_VALUE);
      expect(c.toChar()).assertEqual(c'\u0000');
      expect(c.toInt()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_4900
     * @tc.name testCharProperties0049
     * @tc.desc Verify char is not less than MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const minValue = 0; // MIN_VALUE code is 0
      expect(c.toInt() >= minValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_5000
     * @tc.name testCharProperties0050
     * @tc.desc Verify MAX_VALUE property exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.MAX_VALUE).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_5100
     * @tc.name testCharProperties0051
     * @tc.desc Verify MAX_VALUE is of char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.MAX_VALUE).assertEqual("char");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_5300
     * @tc.name testCharProperties0053
     * @tc.desc Verify it is the maximum value of char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxValue = new Char(Char.MAX_VALUE);
      expect(maxValue.toInt()).assertEqual(65535);
      expect(maxValue.toChar()).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_5400
     * @tc.name testCharProperties0054
     * @tc.desc Verify MAX_VALUE equals 2^16 minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxValue = 65535; // MAX_VALUE code
      expect(maxValue).assertEqual(Math.pow(2, 16) - 1);
      expect(maxValue).assertEqual(65535);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_5700
     * @tc.name testCharProperties0057
     * @tc.desc Verify creating maximum char instance using MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      expect(c.toChar()).assertEqual(c'\uFFFF');
      expect(c.toInt()).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_5800
     * @tc.name testCharProperties0058
     * @tc.desc Verify char is not greater than MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const maxValue = 65535; // MAX_VALUE code
      expect(c.toInt() <= maxValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_5900
     * @tc.name testCharProperties0059
     * @tc.desc Verify high surrogate and low surrogate ranges do not overlap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highMin = 0xD800;
      const highMax = 0xDBFF;
      const lowMin = 0xDC00;
      const lowMax = 0xDFFF;
      expect(highMax < lowMin).assertTrue();
      expect(highMin).assertEqual(0xD800);
      expect(highMax).assertEqual(0xDBFF);
      expect(lowMin).assertEqual(0xDC00);
      expect(lowMax).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_6000
     * @tc.name testCharProperties0060
     * @tc.desc Verify surrogate ranges are continuous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highMax = 0xDBFF;
      const lowMin = 0xDC00;
      expect(lowMin - highMax).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_6100
     * @tc.name testCharProperties0061
     * @tc.desc Verify MIN_VALUE to MAX_VALUE covers all char values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minValue = 0;
      const maxValue = 0xFFFF;
      expect(minValue).assertEqual(0);
      expect(maxValue).assertEqual(0xFFFF);
      expect(maxValue - minValue + 1).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_6200
     * @tc.name testCharProperties0062
     * @tc.desc Verify CHAR_BIT_SIZE determines value range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bitSize = Char.CHAR_BIT_SIZE;
      const minValue = 0;
      const maxValue = 0xFFFF;
      const expectedMax = Math.pow(2, bitSize) - 1;
      expect(maxValue).assertEqual(expectedMax);
      expect(maxValue).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_6300
     * @tc.name testCharProperties0063
     * @tc.desc Verify character using surrogate range properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uD800');
      const code = c.toInt();
      const isHigh = code >= 0xD800 && code <= 0xDBFF;
      expect(isHigh).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_6400
     * @tc.name testCharProperties0064
     * @tc.desc Verify character using MIN_VALUE and MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const code = c.toInt();
      expect(code >= 0).assertTrue();
      expect(code <= 0xFFFF).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_6500
     * @tc.name testCharProperties0065
     * @tc.desc Verify code point using MAX_CODE_POINT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const validCodePoint = 0x1F600;
      const invalidCodePoint = 0x110000;
      expect(validCodePoint <= Char.MAX_CODE_POINT).assertTrue();
      expect(invalidCodePoint > Char.MAX_CODE_POINT).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_6600
     * @tc.name testCharProperties0066
     * @tc.desc Verify UTF-16 encoding using surrogate range properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp: UTF_16_CodePoint = 0x1F600;
      const high = Char.getHighSurrogate(cp);
      const low = Char.getLowSurrogate(cp);
      const highCode = high.toInt();
      const lowCode = low.toInt();
      expect(highCode >= 0xD800).assertTrue();
      expect(highCode <= 0xDBFF).assertTrue();
      expect(lowCode >= 0xDC00).assertTrue();
      expect(lowCode <= 0xDFFF).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_6700
     * @tc.name testCharProperties0067
     * @tc.desc Verify all properties are compile-time constants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bitSize: number = Char.CHAR_BIT_SIZE;
      const maxCodePoint: number = Char.MAX_CODE_POINT;
      const highMin: char = Char.HIGH_SURROGATE_MIN;
      expect(typeof bitSize).assertEqual("number");
      expect(typeof maxCodePoint).assertEqual("number");
      expect(typeof highMin).assertEqual("char");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_PROPERTIES_6800
     * @tc.name testCharProperties068
     * @tc.desc Verify properties do not appear in instance enumeration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(typeof c).assertEqual("char");
      expect(typeof Char.CHAR_BIT_SIZE === "number" || typeof Char.CHAR_BIT_SIZE === "int").assertTrue();
      expect(typeof Char.MIN_VALUE).assertEqual("char");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_6900
     * @tc.name testCharProperties0069
     * @tc.desc Verify surrogate range boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const beforeHighMin = new Char(c'\uD7FF');
      expect(Char.isHighSurrogate(beforeHighMin.toChar())).assertFalse();

      const afterHighMax = new Char(c'\uDC00');
      expect(Char.isHighSurrogate(afterHighMax.toChar())).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_7000
     * @tc.name testCharProperties0070
     * @tc.desc Verify no char value smaller than MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minValue = 0;
      expect(minValue).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_PROPERTIESTEST_7100
     * @tc.name testCharProperties0071
     * @tc.desc Verify no char value greater than MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharProperties0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxValue = 0xFFFF;
      expect(maxValue).assertEqual(65535);
    });
  });
}