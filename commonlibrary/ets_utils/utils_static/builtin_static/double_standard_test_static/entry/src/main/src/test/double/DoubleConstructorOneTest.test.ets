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

export default function DoubleConstructorOneTest(): void {
  describe('DoubleConstructorOneTest', () : void => {
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
     * @tc.number DBL_CNSTR_ONE_CHK_0100
     * @tc.name testDoubleConstructorOne0001
     * @tc.desc Verify no-argument constructor creates Double instance with value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_0400
     * @tc.name testDoubleConstructorOne0004
     * @tc.desc Verify no-argument constructor creates Double type instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      expect(value instanceof Double).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_0500
     * @tc.name testDoubleConstructorOne0005
     * @tc.desc Verify no-argument constructor instance toString returns expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      expect(value.toString()).assertEqual("0");
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_0600
     * @tc.name testDoubleConstructorOne0006
     * @tc.desc Verify no-argument constructor instance toDouble returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      expect(value.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_0700
     * @tc.name testDoubleConstructorOne0007
     * @tc.desc Verify no-argument constructor instance value is positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      const val = value.valueOf();
      expect(val === 0.0).assertTrue();
      expect(1 / val === Infinity).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_0800
     * @tc.name testDoubleConstructorOne0008
     * @tc.desc Verify no-argument constructor instance value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      expect(Double.isNaN(value.valueOf())).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_0900
     * @tc.name testDoubleConstructorOne0009
     * @tc.desc Verify no-argument constructor instance value is not Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      expect(Double.isFinite(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_1000
     * @tc.name testDoubleConstructorOne0010
     * @tc.desc Verify no-argument constructor instance implements Comparable interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      const other = new Double(0.0);
      expect(value.compareTo(other)).assertEqual(0);
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_1100
     * @tc.name testDoubleConstructorOne0011
     * @tc.desc Verify no-argument constructor instance inherits from Floating
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      expect(value.toByte()).assertEqual(0);
      expect(value.toShort()).assertEqual(0);
      expect(value.toInt()).assertEqual(0);
      expect(value.toLong()).assertEqual(0);
      expect(value.toFloat()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_1200
     * @tc.name testDoubleConstructorOne0012
     * @tc.desc Verify multiple no-argument constructor instances are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Double(1.0);
      const value2 = new Double(2.0);
      expect(value1.valueOf()).assertEqual(1.0);
      expect(value2.valueOf()).assertEqual(2.0);
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_1300
     * @tc.name testDoubleConstructorOne0013
     * @tc.desc Verify two no-argument constructor instances are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double();
      const right = new Double();
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_1600
     * @tc.name testDoubleConstructorOne0016
     * @tc.desc Verify no-argument constructor equals Double(0.0) constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double();
      const v2 = new Double(0.0);
      expect(v1.equals(v2)).assertTrue();
      expect(v1.compareTo(v2)).assertEqual(0);
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_1700
     * @tc.name testDoubleConstructorOne0017
     * @tc.desc Verify no-argument constructor valueOf can be used for calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      const result = new Double(value.valueOf() + 1.5);
      expect(result.valueOf()).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_1800
     * @tc.name testDoubleConstructorOne0018
     * @tc.desc Verify no-argument constructor instance add operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Double();
      const other = new Double(3.5);
      const result = zero.add(other);
      expect(result.valueOf()).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_1900
     * @tc.name testDoubleConstructorOne0019
     * @tc.desc Verify no-argument constructor instance sub operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Double();
      const other = new Double(2.5);
      const result = zero.sub(other);
      expect(result.valueOf()).assertEqual(-2.5);
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_2000
     * @tc.name testDoubleConstructorOne0020
     * @tc.desc Verify no-argument constructor instance mul operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Double();
      const other = new Double(5.0);
      const result = zero.mul(other);
      expect(result.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_2100
     * @tc.name testDoubleConstructorOne0021
     * @tc.desc Verify no-argument constructor instance div operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Double();
      const other = new Double(2.0);
      const result = zero.div(other);
      expect(result.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_2200
     * @tc.name testDoubleConstructorOne0022
     * @tc.desc Verify no-argument constructor instance isLessThan comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Double();
      expect(zero.isLessThan(new Double(1.0))).assertTrue();
      expect(zero.isLessThan(new Double(-1.0))).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_2300
     * @tc.name testDoubleConstructorOne0023
     * @tc.desc Verify no-argument constructor instance isGreaterThan comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Double();
      expect(zero.isGreaterThan(new Double(-1.0))).assertTrue();
      expect(zero.isGreaterThan(new Double(1.0))).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_2400
     * @tc.name testDoubleConstructorOne0024
     * @tc.desc Verify no-argument constructor instance isInteger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      expect(value.isInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_ONE_CHK_2500
     * @tc.name testDoubleConstructorOne0025
     * @tc.desc Verify no-argument constructor instance isSafeInteger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorOne0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      expect(value.isSafeInteger()).assertTrue();
    });
  });
}
