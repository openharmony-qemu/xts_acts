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

export default function DoubleToString5Test(): void {
  describe('DoubleToString5Test', () => {
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
     * @tc.number DBL_TO_STRNG_5_CHK_0700
     * @tc.name testDoubleToStringFIVE0007
     * @tc.desc Verify toString with Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MAX_VALUE;
      const result: string = value.toString();
      expect(result).assertEqual("1.7976931348623157e+308");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_0800
     * @tc.name testDoubleToStringFIVE0008
     * @tc.desc Verify toString with Double.MIN_VALUE (smallest positive value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MIN_VALUE;
      const result: string = value.toString();
      expect(result).assertEqual("5e-324");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_0900
     * @tc.name testDoubleToStringFIVE0009
     * @tc.desc Verify toString with Double.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MAX_SAFE_INTEGER;
      const result: string = value.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_1000
     * @tc.name testDoubleToStringFIVE0010
     * @tc.desc Verify toString with Double.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MIN_SAFE_INTEGER;
      const result: string = value.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_1100
     * @tc.name testDoubleToStringFIVE0011
     * @tc.desc Verify toString with value very close to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 5e-324;
      const result: string = value.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_1200
     * @tc.name testDoubleToStringFIVE0012
     * @tc.desc Verify toString with very large positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.7976931348623157e+308;
      const result: string = value.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_1700
     * @tc.name testDoubleToStringFIVE0017
     * @tc.desc Verify toString with double parameter constructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.5;
      const result: string = value.toString();
      expect(result).assertEqual("1.5");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_2200
     * @tc.name testDoubleToStringFIVE0022
     * @tc.desc Verify integer value returns string without decimal point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 100.0;
      const result: string = value.toString();
      expect(result).assertEqual("100");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_2300
     * @tc.name testDoubleToStringFIVE0023
     * @tc.desc Verify negative value returns string with minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -99.9;
      const result: string = value.toString();
      expect(result).assertEqual("-99.9");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_2800
     * @tc.name testDoubleToStringFIVE0028
     * @tc.desc Verify very large value returns scientific notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1e20;
      const result: string = value.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_2900
     * @tc.name testDoubleToStringFIVE0029
     * @tc.desc Verify very small positive value returns scientific notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1e-10;
      const result: string = value.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_3000
     * @tc.name testDoubleToStringFIVE0030
     * @tc.desc Verify return value type is String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.5;
      const result: string = value.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_3100
     * @tc.name testDoubleToStringFIVE0031
     * @tc.desc Verify return value is String instance (not null or undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.0;
      const result: string = value.toString();
      expect(result !== null).assertTrue();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_3200
     * @tc.name testDoubleToStringFIVE0032
     * @tc.desc Verify return value length is greater than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.0;
      const result: string = value.toString();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_3300
     * @tc.name testDoubleToStringFIVE0033
     * @tc.desc Verify multiple calls to toString on same instance return identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 3.14;
      const result1: string = value.toString();
      const result2: string = value.toString();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_3600
     * @tc.name testDoubleToStringFIVE0036
     * @tc.desc Verify toString of DELTA value returns small difference string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.EPSILON;
      const result: string = value.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_4200
     * @tc.name testDoubleToStringFIVE0042
     * @tc.desc Verify catch block captures Error type if toString throws (theoretically never)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.0;
      try {
        const result: string = value.toString();
        expect(typeof result).assertEqual("string");
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_4600
     * @tc.name testDoubleToStringFIVE0046
     * @tc.desc Verify Double class declared as final and toString can be called directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 10.0;
      const result: string = value.toString();
      expect(result).assertEqual("10");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_4800
     * @tc.name testDoubleToStringFIVE0048
     * @tc.desc Verify Double.toString returns value with multiple fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 3.14159;
      const result: string = value.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_4900
     * @tc.name testDoubleToStringFIVE0049
     * @tc.desc Verify integer value toString does not contain decimal point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 7.0;
      const result: string = value.toString();
      expect(result).assertEqual("7");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_5000
     * @tc.name testDoubleToStringFIVE0050
     * @tc.desc Verify positive value toString does not contain plus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 5.0;
      const result: string = value.toString();
      expect(result).assertEqual("5");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_5100
     * @tc.name testDoubleToStringFIVE0051
     * @tc.desc Verify negative value toString contains minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -5.0;
      const result: string = value.toString();
      expect(result).assertEqual("-5");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_5200
     * @tc.name testDoubleToStringFIVE0052
     * @tc.desc Verify no-arg toString outputs in decimal, consistent with toString(10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.0;
      const result1: string = value.toString();
      const result2: string = Math.trunc(value).toString(10);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_5300
     * @tc.name testDoubleToStringFIVE0053
     * @tc.desc Verify no-arg toString outputs its own value, differs from toString(new Double(same value))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.5;
      const selfResult: string = value.toString();
      const paramValue: number = 15.5;
      const paramResult: string = paramValue.toString();
      expect(typeof selfResult).assertEqual("string");
      expect(typeof paramResult).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_5400
     * @tc.name testDoubleToStringFIVE0054
     * @tc.desc Verify multiple toString calls produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 99.99;
      const r1: string = value.toString();
      const r2: string = value.toString();
      const r3: string = value.toString();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_5500
     * @tc.name testDoubleToStringFIVE0055
     * @tc.desc Verify toString after addition operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: number = 1.5 + 2.0;
      const str: string = result.toString();
      expect(str).assertEqual("3.5");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_5600
     * @tc.name testDoubleToStringFIVE0056
     * @tc.desc Verify toString after subtraction operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: number = 5.0 - 2.5;
      const str: string = result.toString();
      expect(str).assertEqual("2.5");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_5700
     * @tc.name testDoubleToStringFIVE0057
     * @tc.desc Verify toString after multiplication operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: number = 3.0 * 2.0;
      const str: string = result.toString();
      expect(str).assertEqual("6");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_5800
     * @tc.name testDoubleToStringFIVE0058
     * @tc.desc Verify toString after division operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: number = 6.0 / 2.0;
      const str: string = result.toString();
      expect(str).assertEqual("3");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_5900
     * @tc.name testDoubleToStringFIVE0059
     * @tc.desc Verify toString with imprecise floating point number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.1 + 0.2;
      const result: string = value.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_6000
     * @tc.name testDoubleToStringFIVE0060
     * @tc.desc Verify toString with very small decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.000001;
      const result: string = value.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_STRNG_5_CHK_6100
     * @tc.name testDoubleToStringFIVE0061
     * @tc.desc Verify toString with large integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFIVE0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 9007199254740992.0;
      const result: string = value.toString();
      expect(typeof result).assertEqual("string");
    });
  });
}
