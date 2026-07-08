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

export default function DoubleToString1Test(): void {
  describe('DoubleToString1Test', () => {
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
     * @tc.number DBL_TO_STRNG_CHK_0100
     * @tc.name testDoubleToStringONE0001
     * @tc.desc Verify calling toString with all 2 required parameters d and r works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (15.0).toString();
      expect(result).assertEqual("15");
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_0200
     * @tc.name testDoubleToStringONE0002
     * @tc.desc Verify calling toString without first parameter d causes expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (0).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_0300
     * @tc.name testDoubleToStringONE0003
     * @tc.desc Verify calling toString without second parameter r causes expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (15.0).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_0700
     * @tc.name testDoubleToStringONE0007
     * @tc.desc Verify negative double value as parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (-15.5).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_0800
     * @tc.name testDoubleToStringONE0008
     * @tc.desc Verify zero double value as parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (0.0).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_0900
     * @tc.name testDoubleToStringONE0009
     * @tc.desc Verify decimal double value as parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (3.14159).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_1000
     * @tc.name testDoubleToStringONE0010
     * @tc.desc Verify large double value as parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (999999.99).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_1100
     * @tc.name testDoubleToStringONE0011
     * @tc.desc Verify Double.MAX_VALUE as parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Number.MAX_VALUE.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_1200
     * @tc.name testDoubleToStringONE0012
     * @tc.desc Verify Double.MIN_VALUE as parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Number.MIN_VALUE.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_1300
     * @tc.name testDoubleToStringONE0013
     * @tc.desc Verify Double.NaN as parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = NaN.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_1400
     * @tc.name testDoubleToStringONE0014
     * @tc.desc Verify Double.POSITIVE_INFINITY as parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Infinity.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_1500
     * @tc.name testDoubleToStringONE0015
     * @tc.desc Verify Double.NEGATIVE_INFINITY as parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (-Infinity).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_1600
     * @tc.name testDoubleToStringONE0016
     * @tc.desc Verify negative zero -0.0 as parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (-0.0).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_1700
     * @tc.name testDoubleToStringONE0017
     * @tc.desc Verify scientific notation double value as parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (1.0e6).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_2000
     * @tc.name testDoubleToStringONE0020
     * @tc.desc Verify passing string as parameter d causes expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Number("15.0").toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_2100
     * @tc.name testDoubleToStringONE0021
     * @tc.desc Verify passing boolean as parameter d causes expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (1).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_2300
     * @tc.name testDoubleToStringONE0023
     * @tc.desc Verify binary radix 2 as parameter r
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (8).toString(2);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_2400
     * @tc.name testDoubleToStringONE0024
     * @tc.desc Verify octal radix 8 as parameter r
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (15).toString(8);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_2500
     * @tc.name testDoubleToStringONE0025
     * @tc.desc Verify hexadecimal radix 16 as parameter r
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (15).toString(16);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_2600
     * @tc.name testDoubleToStringONE0026
     * @tc.desc Verify radix 36 as parameter r
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (35).toString(36);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_2700
     * @tc.name testDoubleToStringONE0027
     * @tc.desc Verify radix 0 boundary value as parameter r
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (15).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_3700
     * @tc.name testDoubleToStringONE0037
     * @tc.desc Verify positive d with binary radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (10).toString(2);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_3800
     * @tc.name testDoubleToStringONE0038
     * @tc.desc Verify negative d with hexadecimal radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (-15).toString(16);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_3900
     * @tc.name testDoubleToStringONE0039
     * @tc.desc Verify zero d with octal radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (0).toString(8);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_4500
     * @tc.name testDoubleToStringONE0045
     * @tc.desc Verify scientific notation d with binary radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (1000).toString(2);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_4600
     * @tc.name testDoubleToStringONE0046
     * @tc.desc Verify decimal d with binary radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Math.trunc(3.14).toString(2);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_4800
     * @tc.name testDoubleToStringONE0048
     * @tc.desc Verify negative double returns correct decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (-15.0).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_5900
     * @tc.name testDoubleToStringONE0059
     * @tc.desc Verify return value type is String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (15.0).toString();
      expect(typeof result).assertEqual("string");
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_6100
     * @tc.name testDoubleToStringONE0061
     * @tc.desc Verify return value is not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (15.0).toString();
      expect(result !== null).assertTrue();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_6200
     * @tc.name testDoubleToStringONE0062
     * @tc.desc Verify return value length is greater than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (15.0).toString();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_6300
     * @tc.name testDoubleToStringONE0063
     * @tc.desc Verify different radix produces different length strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result2: string = (15).toString(2);
      const result10: string = (15).toString();
      expect(result2.length >= result10.length).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_6400
     * @tc.name testDoubleToStringONE0064
     * @tc.desc Verify large value returns non-empty string in different radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Math.trunc(999999.99).toString(16);
      expect(result !== null).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_6500
     * @tc.name testDoubleToStringONE0065
     * @tc.desc Verify Double.MIN_VALUE returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Number.MIN_VALUE.toString();
      expect(result !== null).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_6900
     * @tc.name testDoubleToStringONE0069
     * @tc.desc Verify passing null parameter in try enters catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Number(null).toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_7100
     * @tc.name testDoubleToStringONE0071
     * @tc.desc Verify invalid radix may cause runtime exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const result: string = (15).toString();
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_7500
     * @tc.name testDoubleToStringONE0075
     * @tc.desc Verify instance cannot call static method causes expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      const result: string = value.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_7700
     * @tc.name testDoubleToStringONE0077
     * @tc.desc Verify native method returns consistent result across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result1: string = (15.0).toString();
      const result2: string = (15.0).toString();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_7800
     * @tc.name testDoubleToStringONE0078
     * @tc.desc Verify native method concurrent call safety
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result1: string = (15.0).toString();
      const result2: string = (16.0).toString();
      expect(result1 !== null).assertTrue();
      expect(result2 !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_CHK_7900
     * @tc.name testDoubleToStringONE0079
     * @tc.desc Verify documentation example Double.toString(15.0, 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringONE0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((15.0).toString()).assertEqual("15");
    });
  });
}
