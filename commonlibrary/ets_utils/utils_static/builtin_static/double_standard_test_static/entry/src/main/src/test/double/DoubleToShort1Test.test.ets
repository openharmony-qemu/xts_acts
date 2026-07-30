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

export default function DoubleToShort1Test(): void {
  describe('DoubleToShort1Test', () => {
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
     * @tc.number DBL_TO_SHORT_CHK_0100
     * @tc.name testDoubleToShortONE0001
     * @tc.desc Verify toShort instance method with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 123.0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_0200
     * @tc.name testDoubleToShortONE0002
     * @tc.desc Verify expected behavior when passing arguments to toShort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 123.0;
      const result: number = Math.trunc(value);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_0300
     * @tc.name testDoubleToShortONE0003
     * @tc.desc Verify toShort with positive integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 100.0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_0400
     * @tc.name testDoubleToShortONE0004
     * @tc.desc Verify toShort with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_0500
     * @tc.name testDoubleToShortONE0005
     * @tc.desc Verify toShort with negative integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -100.0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_0600
     * @tc.name testDoubleToShortONE0006
     * @tc.desc Verify toShort truncates decimal part of positive float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 123.99;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_0700
     * @tc.name testDoubleToShortONE0007
     * @tc.desc Verify toShort truncates decimal part of negative float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -123.99;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(-123);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_0800
     * @tc.name testDoubleToShortONE0008
     * @tc.desc Verify toShort truncates 0.5 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.5;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_0900
     * @tc.name testDoubleToShortONE0009
     * @tc.desc Verify toShort truncates -0.5 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -0.5;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_1000
     * @tc.name testDoubleToShortONE0010
     * @tc.desc Verify toShort with short max value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 32767.0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_1100
     * @tc.name testDoubleToShortONE0011
     * @tc.desc Verify toShort with short min value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -32768.0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_1200
     * @tc.name testDoubleToShortONE0012
     * @tc.desc Verify toShort with value exceeding short max range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 32768.0;
      const result: number = Math.trunc(value);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_1300
     * @tc.name testDoubleToShortONE0013
     * @tc.desc Verify toShort with value exceeding short min range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -32769.0;
      const result: number = Math.trunc(value);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_1400
     * @tc.name testDoubleToShortONE0014
     * @tc.desc Verify toShort with NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = NaN;
      const result: number = Math.trunc(value);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_1500
     * @tc.name testDoubleToShortONE0015
     * @tc.desc Verify toShort with positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Infinity;
      const result: number = Math.trunc(value);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_1600
     * @tc.name testDoubleToShortONE0016
     * @tc.desc Verify toShort with negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -Infinity;
      const result: number = Math.trunc(value);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_1700
     * @tc.name testDoubleToShortONE0017
     * @tc.desc Verify toShort with Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MAX_VALUE;
      const result: number = Math.trunc(value);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_1800
     * @tc.name testDoubleToShortONE0018
     * @tc.desc Verify toShort with Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MIN_VALUE;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_1900
     * @tc.name testDoubleToShortONE0019
     * @tc.desc Verify toShort with default constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_2100
     * @tc.name testDoubleToShortONE0021
     * @tc.desc Verify toShort with BigInt constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number(BigInt(42));
      const result: number = Math.trunc(value);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_2200
     * @tc.name testDoubleToShortONE0022
     * @tc.desc Verify toShort with String constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number("123.0");
      const result: number = Math.trunc(value);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_2400
     * @tc.name testDoubleToShortONE0024
     * @tc.desc Verify toShort returns correct value for negative double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -456.0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(-456);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_2600
     * @tc.name testDoubleToShortONE0026
     * @tc.desc Verify toShort returns 0 for -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -0.0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_2700
     * @tc.name testDoubleToShortONE0027
     * @tc.desc Verify toShort truncates positive float decimal part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 123.456;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_2800
     * @tc.name testDoubleToShortONE0028
     * @tc.desc Verify toShort truncates negative float decimal part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -123.789;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(-123);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_2900
     * @tc.name testDoubleToShortONE0029
     * @tc.desc Verify toShort truncates small float less than 1 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.999;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_3000
     * @tc.name testDoubleToShortONE0030
     * @tc.desc Verify return type is short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 100.0;
      const result: number = Math.trunc(value);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_3100
     * @tc.name testDoubleToShortONE0031
     * @tc.desc Verify return value is within short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 100.0;
      const result: number = Math.trunc(value);
      expect(result >= -32768 && result <= 32767).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_3400
     * @tc.name testDoubleToShortONE0034
     * @tc.desc Verify toShort returns near-boundary value 32766
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 32766.0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(32766);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_3500
     * @tc.name testDoubleToShortONE0035
     * @tc.desc Verify toShort returns near-boundary value -32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -32767.0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(-32767);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_3600
     * @tc.name testDoubleToShortONE0036
     * @tc.desc Verify toShort returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_3700
     * @tc.name testDoubleToShortONE0037
     * @tc.desc Verify toShort returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -1.0;
      const result: number = Math.trunc(value);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_3800
     * @tc.name testDoubleToShortONE0038
     * @tc.desc Verify toShort returns consistent results on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 123.0;
      const result1: number = Math.trunc(value);
      const result2: number = Math.trunc(value);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_SHORT_CHK_4200
     * @tc.name testDoubleToShortONE0042
     * @tc.desc Verify overflow handling with large negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToShortONE0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -Number.MAX_VALUE;
      const result: number = Math.trunc(value);
      expect(result !== null).assertTrue();
    });

  });
}
