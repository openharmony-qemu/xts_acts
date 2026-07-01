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

export default function DoubleValueOfTest(): void {
  describe('DoubleValueOfTest', () => {
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
     * @tc.number DBL_VALUE_OF_CHK_0100
     * @tc.name testDoubleValueOf00001
     * @tc.desc Verify valueOf method with no arguments returns normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(1.5);
      const result = value.valueOf();
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_0200
     * @tc.name testDoubleValueOf00002
     * @tc.desc Verify valueOf ignores extra parameters and executes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(2.5);
      const result = value.valueOf();
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_0300
     * @tc.name testDoubleValueOf00003
     * @tc.desc Verify valueOf returns 0.0 for default constructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(0);
      const result = value.valueOf();
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_0400
     * @tc.name testDoubleValueOf00004
     * @tc.desc Verify valueOf returns positive double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(123.456);
      const result = value.valueOf();
      expect(result).assertEqual(123.456);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_0500
     * @tc.name testDoubleValueOf00005
     * @tc.desc Verify valueOf returns negative double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(-88.88);
      const result = value.valueOf();
      expect(result).assertEqual(-88.88);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_0600
     * @tc.name testDoubleValueOf00006
     * @tc.desc Verify valueOf returns 0.0 for zero input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(0.0);
      const result = value.valueOf();
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_0700
     * @tc.name testDoubleValueOf00007
     * @tc.desc Verify valueOf returns converted double value from BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bigIntValue: bigint = 42n;
      const value = new Double(new BigInt(42));
      const result = value.valueOf();
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_0800
     * @tc.name testDoubleValueOf00008
     * @tc.desc Verify valueOf returns parsed double value from parsable string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double("3.5");
      const result = value.valueOf();
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_0900
     * @tc.name testDoubleValueOf00009
     * @tc.desc Verify valueOf returns NaN for unparsable string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double("abc");
      const result = value.valueOf();
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_1000
     * @tc.name testDoubleValueOf00010
     * @tc.desc Verify valueOf returns NaN for NaN instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.NaN);
      const result = value.valueOf();
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_1100
     * @tc.name testDoubleValueOf00011
     * @tc.desc Verify valueOf returns positive infinity for POSITIVE_INFINITY instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Infinity);
      const result = value.valueOf();
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_1200
     * @tc.name testDoubleValueOf00012
     * @tc.desc Verify valueOf returns negative infinity for NEGATIVE_INFINITY instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(-Infinity);
      const result = value.valueOf();
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_1300
     * @tc.name testDoubleValueOf00013
     * @tc.desc Verify valueOf returns 0.0 and -0.0 for positive and negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const posZero = new Double(0.0);
      const negZero = new Double(-0.0);
      expect(posZero.valueOf()).assertEqual(0.0);
      expect(negZero.valueOf()).assertEqual(-0.0);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_1400
     * @tc.name testDoubleValueOf00014
     * @tc.desc Verify valueOf returns MAX_VALUE for MAX_VALUE instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Number.MAX_VALUE);
      const result = value.valueOf();
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_1500
     * @tc.name testDoubleValueOf00015
     * @tc.desc Verify valueOf returns MIN_VALUE for MIN_VALUE instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Number.MIN_VALUE);
      const result = value.valueOf();
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_1600
     * @tc.name testDoubleValueOf00016
     * @tc.desc Verify valueOf returns MAX_SAFE_INTEGER for MAX_SAFE_INTEGER instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Number.MAX_SAFE_INTEGER);
      const result = value.valueOf();
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_1700
     * @tc.name testDoubleValueOf00017
     * @tc.desc Verify valueOf returns MIN_SAFE_INTEGER for MIN_SAFE_INTEGER instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Number.MIN_SAFE_INTEGER);
      const result = value.valueOf();
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_1800
     * @tc.name testDoubleValueOf00018
     * @tc.desc Verify valueOf returns correct value for scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(1.0e6);
      const result = value.valueOf();
      expect(result).assertEqual(1000000.0);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_1900
     * @tc.name testDoubleValueOf00019
     * @tc.desc Verify valueOf returns correct value for hexadecimal float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(8.5);
      const result = value.valueOf();
      expect(result).assertEqual(8.5);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_2000
     * @tc.name testDoubleValueOf00020
     * @tc.desc Verify valueOf return type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(1.5);
      const result = value.valueOf();
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_2100
     * @tc.name testDoubleValueOf00021
     * @tc.desc Verify valueOf returns primitive number not Double object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(1.5);
      const result = value.valueOf();
      expect(typeof result === "number").assertTrue();
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_2200
     * @tc.name testDoubleValueOf00022
     * @tc.desc Verify valueOf returns value can be used in arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(3.0);
      const result = value.valueOf() + 2.0;
      expect(result).assertEqual(5.0);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_2300
     * @tc.name testDoubleValueOf00023
     * @tc.desc Verify valueOf precision for MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Number.MIN_VALUE);
      const result = value.valueOf();
      expect(result > 0.0).assertTrue();
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_2400
     * @tc.name testDoubleValueOf00024
     * @tc.desc Verify valueOf precision for near MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nearMax: number = Number.MAX_VALUE;
      const value = new Double(nearMax);
      const result = value.valueOf();
      expect(result).assertEqual(nearMax);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_2500
     * @tc.name testDoubleValueOf00025
     * @tc.desc Verify valueOf returns same value on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(42.5);
      const first = value.valueOf();
      const second = value.valueOf();
      expect(first).assertEqual(second);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_2600
     * @tc.name testDoubleValueOf00026
     * @tc.desc Verify valueOf on new instances from arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = new Double(6.0);
      const b = new Double(2.0);
      expect(a.valueOf() + b.valueOf()).assertEqual(8.0);
      expect(a.valueOf() - b.valueOf()).assertEqual(4.0);
      expect(a.valueOf() * b.valueOf()).assertEqual(12.0);
      expect(a.valueOf() / b.valueOf()).assertEqual(3.0);
    });

    /**
     * @tc.number DBL_VALUE_OF_CHK_2800
     * @tc.name testDoubleValueOf00028
     * @tc.desc Verify valueOf does not throw Error for NaN and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleValueOf00028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nanValue = new Double(Double.NaN);
      expect(Double.isNaN(nanValue.valueOf())).assertTrue();
      const infValue = new Double(Double.POSITIVE_INFINITY);
      expect(infValue.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
    });
  });
}
