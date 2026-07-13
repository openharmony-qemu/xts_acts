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

export default function DoubleToString3Test(): void {
  describe('DoubleToString3Test', () => {
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
     * @tc.number DBL_TO_STRNG_3_CHK_0100
     * @tc.name testDoubleToStringTHREE0001
     * @tc.desc Verify toString with required parameter r normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      const result: string = value.toString(10);
      expect(result).assertEqual("15");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_0200
     * @tc.name testDoubleToStringTHREE0002
     * 
            param($m) $m.Value -replace $p.Old, $p.New
        
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      const result: string = value.toString();
      expect(result).assertEqual("15");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_0500
     * @tc.name testDoubleToStringTHREE0005
     * @tc.desc Verify toString with binary radix 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      const result: string = Math.trunc(value).toString(2);
      expect(result).assertEqual("1111");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_0600
     * @tc.name testDoubleToStringTHREE0006
     * @tc.desc Verify toString with octal radix 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      const result: string = Math.trunc(value).toString(8);
      expect(result).assertEqual("17");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_0700
     * @tc.name testDoubleToStringTHREE0007
     * @tc.desc Verify toString with hexadecimal radix 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 255.0;
      const result: string = Math.trunc(value).toString(16);
      expect(result).assertEqual("ff");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_0800
     * @tc.name testDoubleToStringTHREE0008
     * @tc.desc Verify toString with base 36 radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 35.0;
      const result: string = Math.trunc(value).toString(36);
      expect(result).assertEqual("z");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_0900
     * @tc.name testDoubleToStringTHREE0009
     * @tc.desc Verify toString with intermediate radix 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 25.0;
      const result: string = Math.trunc(value).toString(5);
      expect(result).assertEqual("100");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_1000
     * @tc.name testDoubleToStringTHREE0010
     * @tc.desc Verify toString with minimum valid radix 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.0;
      const result: string = Math.trunc(value).toString(2);
      expect(result).assertEqual("1");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_1900
     * @tc.name testDoubleToStringTHREE0019
     * @tc.desc Verify toString conversion for positive integer Double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 100.0;
      const result: string = Math.trunc(value).toString(16);
      expect(result).assertEqual("64");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_2000
     * @tc.name testDoubleToStringTHREE0020
     * @tc.desc Verify toString conversion for negative integer Double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -15.0;
      const result: string = value.toString(10);
      expect(result).assertEqual("-15");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_2100
     * @tc.name testDoubleToStringTHREE0021
     * @tc.desc Verify toString conversion for zero Double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.0;
      const result: string = value.toString(10);
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_2200
     * @tc.name testDoubleToStringTHREE0022
     * @tc.desc Verify toString conversion for large integer Double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1024.0;
      const result: string = Math.trunc(value).toString(2);
      expect(result).assertEqual("10000000000");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_2300
     * @tc.name testDoubleToStringTHREE0023
     * @tc.desc Verify toString conversion for small positive Double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.0;
      const result: string = value.toString(10);
      expect(result).assertEqual("1");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_2400
     * @tc.name testDoubleToStringTHREE0024
     * @tc.desc Verify toString conversion for NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = NaN;
      const result: string = value.toString(10);
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_2500
     * @tc.name testDoubleToStringTHREE0025
     * @tc.desc Verify toString conversion for positive infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Infinity;
      const result: string = value.toString(10);
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_2600
     * @tc.name testDoubleToStringTHREE0026
     * @tc.desc Verify toString conversion for negative infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -Infinity;
      const result: string = value.toString(10);
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_2700
     * @tc.name testDoubleToStringTHREE0027
     * @tc.desc Verify toString conversion for MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MAX_VALUE;
      const result: string = value.toString(10);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_2800
     * @tc.name testDoubleToStringTHREE0028
     * @tc.desc Verify toString conversion for MIN_VALUE (smallest positive double)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MIN_VALUE;
      const result: string = value.toString(10);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_2900
     * @tc.name testDoubleToStringTHREE0029
     * @tc.desc Verify toString conversion for floating point fractional value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.5;
      const result: string = value.toString(10);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_3300
     * @tc.name testDoubleToStringTHREE0033
     * @tc.desc Verify toString returns correct string for octal conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 8.0;
      const result: string = Math.trunc(value).toString(8);
      expect(result).assertEqual("10");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_3400
     * @tc.name testDoubleToStringTHREE0034
     * @tc.desc Verify toString returns correct string for base 32 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 31.0;
      const result: string = Math.trunc(value).toString(32);
      expect(result).assertEqual("v");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_3500
     * @tc.name testDoubleToStringTHREE0035
     * @tc.desc Verify toString returns "NaN" string for NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = NaN;
      const result: string = value.toString(16);
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_3600
     * @tc.name testDoubleToStringTHREE0036
     * @tc.desc Verify toString returns "Infinity" string for positive infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Infinity;
      const result: string = value.toString(16);
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_3700
     * @tc.name testDoubleToStringTHREE0037
     * @tc.desc Verify toString returns "-Infinity" string for negative infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -Infinity;
      const result: string = value.toString(16);
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_3800
     * @tc.name testDoubleToStringTHREE0038
     * @tc.desc Verify toString returns "0" string for zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.0;
      const result: string = value.toString(16);
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_3900
     * @tc.name testDoubleToStringTHREE0039
     * @tc.desc Verify toString conversion for negative zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -0.0;
      const result: string = value.toString(10);
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_4000
     * @tc.name testDoubleToStringTHREE0040
     * @tc.desc Verify toString return type is String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      const result: string = value.toString(10);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_4100
     * @tc.name testDoubleToStringTHREE0041
     * @tc.desc Verify toString return value is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      const result: string = value.toString(10);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_4200
     * @tc.name testDoubleToStringTHREE0042
     * @tc.desc Verify toString return value is not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      const result: string = value.toString(10);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_4300
     * @tc.name testDoubleToStringTHREE0043
     * @tc.desc Verify toString return value length is greater than 0 for non-zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      const result: string = value.toString(10);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_4400
     * @tc.name testDoubleToStringTHREE0044
     * @tc.desc Verify toString returns correct value for large integer in different bases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 2147483647.0;
      const result: string = Math.trunc(value).toString(10);
      expect(result).assertEqual("2147483647");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_4500
     * @tc.name testDoubleToStringTHREE0045
     * @tc.desc Verify toString returns non-empty string for MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MAX_VALUE;
      const result: string = value.toString(10);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_4600
     * @tc.name testDoubleToStringTHREE0046
     * @tc.desc Verify toString returns non-empty string for MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MIN_VALUE;
      const result: string = value.toString(10);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_4700
     * @tc.name testDoubleToStringTHREE0047
     * @tc.desc Verify toString returns correct format for negative value in different bases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -255.0;
      const result: string = Math.trunc(value).toString(16);
      expect(result).assertEqual("-ff");
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_4800
     * @tc.name testDoubleToStringTHREE0048
     * @tc.desc Verify exception is caught when passing radix 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      try {
        value.toString(1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_4900
     * @tc.name testDoubleToStringTHREE0049
     * @tc.desc Verify exception is caught when passing radix 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      try {
        value.toString(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_5000
     * @tc.name testDoubleToStringTHREE0050
     * @tc.desc Verify exception is caught when passing radix 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      try {
        value.toString(37);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_5100
     * @tc.name testDoubleToStringTHREE0051
     * @tc.desc Verify exception is caught when passing negative radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      try {
        value.toString(-1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_5200
     * @tc.name testDoubleToStringTHREE0052
     * @tc.desc Verify exception is caught when passing int minimum value as radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      try {
        value.toString(-2147483648);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_5300
     * @tc.name testDoubleToStringTHREE0053
     * @tc.desc Verify exception object contains message property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      try {
        value.toString(37);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
        const err = error as Error;
        expect(err.message !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_5400
     * @tc.name testDoubleToStringTHREE0054
     * @tc.desc Verify exception object contains name property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      try {
        value.toString(37);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
        const err = error as Error;
        expect(err.name !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_STRNG_3_CHK_5600
     * @tc.name testDoubleToStringTHREE0056
     * @tc.desc Verify exception is thrown when toString is called with invalid radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTHREE0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      let caught = false;
      try {
        value.toString(-1);
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
    });
  });
}
