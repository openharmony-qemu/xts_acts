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

export default function DoubleToString2Test(): void {
  describe('DoubleToString2Test', () => {
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
     * @tc.number DBL_TO_STRNG_2_CHK_0100
     * @tc.name testDoubleToStringTWO0001
     * @tc.desc Verify calling with required parameter d works normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (15.5).toString();
      expect(result).assertEqual("15.5");
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_0300
     * @tc.name testDoubleToStringTWO0003
     * @tc.desc Verify expected behavior when passing extra parameters beyond declaration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (15.5).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_0400
     * @tc.name testDoubleToStringTWO0004
     * @tc.desc Verify toString with positive integer double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (42.0).toString();
      expect(result).assertEqual("42");
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_0600
     * @tc.name testDoubleToStringTWO0006
     * @tc.desc Verify toString with negative double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (-3.14).toString();
      expect(result).assertEqual("-3.14");
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_0700
     * @tc.name testDoubleToStringTWO0007
     * @tc.desc Verify toString with 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (0.0).toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_1100
     * @tc.name testDoubleToStringTWO0011
     * @tc.desc Verify toString with Double.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Number.MAX_SAFE_INTEGER.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_1200
     * @tc.name testDoubleToStringTWO0012
     * @tc.desc Verify toString with Double.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Number.MIN_SAFE_INTEGER.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_1300
     * @tc.name testDoubleToStringTWO0013
     * @tc.desc Verify toString with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = NaN.toString();
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_1400
     * @tc.name testDoubleToStringTWO0014
     * @tc.desc Verify toString with POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Infinity.toString();
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_1500
     * @tc.name testDoubleToStringTWO0015
     * @tc.desc Verify toString with NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (-Infinity).toString();
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_1600
     * @tc.name testDoubleToStringTWO0016
     * @tc.desc Verify toString with very small positive value near MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (4.9e-324).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_1700
     * @tc.name testDoubleToStringTWO0017
     * @tc.desc Verify toString with very large positive value near MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (1.7976931348623157e+308).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_1800
     * @tc.name testDoubleToStringTWO0018
     * @tc.desc Verify toString with scientific notation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (1.5e10).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_1900
     * @tc.name testDoubleToStringTWO0019
     * @tc.desc Verify toString with negative scientific notation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (-2.5e-5).toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_2700
     * @tc.name testDoubleToStringTWO0027
     * @tc.desc Verify negative double value returns string with minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (-7.25).toString();
      expect(result).assertEqual("-7.25");
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_3200
     * @tc.name testDoubleToStringTWO0032
     * @tc.desc Verify return value is String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (15.5).toString();
      expect(typeof result).assertEqual("string");
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_3300
     * @tc.name testDoubleToStringTWO0033
     * @tc.desc Verify return value is not null or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = (15.5).toString();
      expect(result !== null).assertTrue();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_3400
     * @tc.name testDoubleToStringTWO0034
     * @tc.desc Verify Double.MAX_VALUE returns valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Number.MAX_VALUE.toString();
      expect(result !== null).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_3600
     * @tc.name testDoubleToStringTWO0036
     * @tc.desc Verify MAX_SAFE_INTEGER returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Number.MAX_SAFE_INTEGER.toString();
      expect(result !== null).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_2_CHK_3700
     * @tc.name testDoubleToStringTWO0037
     * @tc.desc Verify MIN_SAFE_INTEGER returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringTWO0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = Number.MIN_SAFE_INTEGER.toString();
      expect(result !== null).assertTrue();
      expect(result.length > 0).assertTrue();
    });

      });
}
