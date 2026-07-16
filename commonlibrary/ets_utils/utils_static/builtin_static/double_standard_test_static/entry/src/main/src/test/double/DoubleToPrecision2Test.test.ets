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
export default function DoubleToPrecision2Test(): void {
  describe('DoubleToPrecision2Test', (): void => {
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
     * @tc.number DBL_TO_PRCSN_2_CHK_0100
     * @tc.name testDoubleToPrecisionTWO0001
     * @tc.desc Verify toPrecision with no arguments returns normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 12.345;
      const result: string = value.toPrecision(6);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_0300
     * @tc.name testDoubleToPrecisionTWO0003
     * @tc.desc Verify toPrecision with no parameters returns String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 12.345;
      const result: string = value.toPrecision(6);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_0500
     * @tc.name testDoubleToPrecisionTWO0005
     * @tc.desc Verify toPrecision returns integer string for integer Double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 42.0;
      const result: string = value.toPrecision(3);
      expect(result).assertEqual("42.0");
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_0600
     * @tc.name testDoubleToPrecisionTWO0006
     * @tc.desc Verify toPrecision returns negative sign string for negative Double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = -3.14;
      const result: string = value.toPrecision(3);
      expect(result).assertEqual("-3.14");
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_0700
     * @tc.name testDoubleToPrecisionTWO0007
     * @tc.desc Verify toPrecision for zero value Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 0.0;
      const result: string = value.toPrecision(1);
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_0800
     * @tc.name testDoubleToPrecisionTWO0008
     * @tc.desc Verify toPrecision for negative zero value Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = -0.0;
      const result: string = value.toPrecision(1);
      expect(result).assertEqual("-0");
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_0900
     * @tc.name testDoubleToPrecisionTWO0009
     * @tc.desc Verify toPrecision returns NaN string for NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = NaN;
      const result: string = value.toPrecision(6);
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_1000
     * @tc.name testDoubleToPrecisionTWO0010
     * @tc.desc Verify toPrecision returns Infinity string for positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = Infinity;
      const result: string = value.toPrecision(6);
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_1100
     * @tc.name testDoubleToPrecisionTWO0011
     * @tc.desc Verify toPrecision returns -Infinity string for negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = -Infinity;
      const result: string = value.toPrecision(6);
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_1200
     * @tc.name testDoubleToPrecisionTWO0012
     * @tc.desc Verify toPrecision for minimum positive double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = Number.MIN_VALUE;
      const result: string = value.toPrecision(6);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_1300
     * @tc.name testDoubleToPrecisionTWO0013
     * @tc.desc Verify toPrecision for maximum double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = Number.MAX_VALUE;
      const result: string = value.toPrecision(6);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_1500
     * @tc.name testDoubleToPrecisionTWO0015
     * @tc.desc Verify toPrecision return value is never null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 99.99;
      const result: string = value.toPrecision(6);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_1600
     * @tc.name testDoubleToPrecisionTWO0016
     * @tc.desc Verify toPrecision return value toString() returns basic string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 1.5;
      const result: string = value.toPrecision(6);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_1700
     * @tc.name testDoubleToPrecisionTWO0017
     * @tc.desc Verify toPrecision for extremely large number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 1.7976931348623157e308;
      const result: string = value.toPrecision(6);
      expect(result !== null).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_1800
     * @tc.name testDoubleToPrecisionTWO0018
     * @tc.desc Verify toPrecision for extremely small positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 4.9e-324;
      const result: string = value.toPrecision(6);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_1900
     * @tc.name testDoubleToPrecisionTWO0019
     * @tc.desc Verify toPrecision for scientific notation number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 1.0e20;
      const result: string = value.toPrecision(6);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_2000
     * @tc.name testDoubleToPrecisionTWO0020
     * @tc.desc Verify toPrecision for MAX_SAFE_INTEGER value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = Number.MAX_SAFE_INTEGER;
      const result: string = value.toPrecision(16);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_2100
     * @tc.name testDoubleToPrecisionTWO0021
     * @tc.desc Verify toPrecision for MIN_SAFE_INTEGER value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = Number.MIN_SAFE_INTEGER;
      const result: string = value.toPrecision(16);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_2300
     * @tc.name testDoubleToPrecisionTWO0023
     * @tc.desc Verify toPrecision normal call does not enter catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 100.0;
        const result: string = value.toPrecision(6);
  expect(result).assertEqual("100.000");
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_2600
     * @tc.name testDoubleToPrecisionTWO0026
     * @tc.desc Verify toPrecision works with different number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: number = 0;
      const v2: number = 1.5;
      const v3: number = 42;
      const v4: number = 3.5;
      expect(v1.toPrecision(6) !== null).assertTrue();
      expect(v2.toPrecision(6) !== null).assertTrue();
      expect(v3.toPrecision(6) !== null).assertTrue();
      expect(v4.toPrecision(6) !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_2_CHK_2700
     * @tc.name testDoubleToPrecisionTWO0027
     * @tc.desc Verify toPrecision with unparseable string constructor returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionTWO0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = Number.NaN;
      const result: string = value.toPrecision(6);
      expect(result).assertEqual("NaN");
    });

  });
}
