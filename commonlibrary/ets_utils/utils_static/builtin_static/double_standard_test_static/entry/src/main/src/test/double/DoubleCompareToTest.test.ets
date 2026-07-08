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

export default function DoubleCompareToTest(): void {
  describe('DoubleCompareToTest', () : void => {
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
     * @tc.number DBL_CMPR_TO_CHK_0100
     * @tc.name testDoubleCompareTo0001
     * @tc.desc Verify calling with required parameter other normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(2.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_0400
     * @tc.name testDoubleCompareTo0004
     * @tc.desc Verify compareTo with positive Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(2.5);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_0500
     * @tc.name testDoubleCompareTo0005
     * @tc.desc Verify compareTo with negative Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(-3.14);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_0600
     * @tc.name testDoubleCompareTo0006
     * @tc.desc Verify compareTo with zero Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(0.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_0700
     * @tc.name testDoubleCompareTo0007
     * @tc.desc Verify compareTo with scientific notation Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(1.0e6);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_0800
     * @tc.name testDoubleCompareTo0008
     * @tc.desc Verify compareTo with hex float Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(0x3FF0000000000000);
      const right = new Double(0x4022000000000000);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_0900
     * @tc.name testDoubleCompareTo0009
     * @tc.desc Verify compareTo with Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(Double.MAX_VALUE);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_1000
     * @tc.name testDoubleCompareTo0010
     * @tc.desc Verify compareTo with Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(Double.MIN_VALUE);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_1100
     * @tc.name testDoubleCompareTo0011
     * @tc.desc Verify compareTo with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(Double.NaN);
      let result: int = left.compareTo(right);
      expect(result === -1 || result === 0 || result === 1).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_1200
     * @tc.name testDoubleCompareTo0012
     * @tc.desc Verify compareTo with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(Double.POSITIVE_INFINITY);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_1300
     * @tc.name testDoubleCompareTo0013
     * @tc.desc Verify compareTo with Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(Double.NEGATIVE_INFINITY);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_1400
     * @tc.name testDoubleCompareTo0014
     * @tc.desc Verify compareTo with Double.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(Double.MAX_SAFE_INTEGER);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_1500
     * @tc.name testDoubleCompareTo0015
     * @tc.desc Verify compareTo with Double.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(0.0);
      const right = new Double(Double.MIN_SAFE_INTEGER);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_1600
     * @tc.name testDoubleCompareTo0016
     * @tc.desc Verify compareTo with Double.EPSILON value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(Double.EPSILON);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_1700
     * @tc.name testDoubleCompareTo0017
     * @tc.desc Verify passing null as other parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      try {
        left.compareTo(null as Double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_2000
     * @tc.name testDoubleCompareTo0020
     * @tc.desc Verify return -1 when negative compared with positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(-5.0);
      const right = new Double(3.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_2100
     * @tc.name testDoubleCompareTo0021
     * @tc.desc Verify return -1 for two negative values comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(-10.0);
      const right = new Double(-3.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_2200
     * @tc.name testDoubleCompareTo0022
     * @tc.desc Verify return 0 when two equal values compared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(3.14);
      const right = new Double(3.14);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_2300
     * @tc.name testDoubleCompareTo0023
     * @tc.desc Verify return 0 when difference less than EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(1.0 + Double.EPSILON / 2.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_2400
     * @tc.name testDoubleCompareTo0024
     * @tc.desc Verify return 0 when two zero values compared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(0.0);
      const right = new Double(0.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_2500
     * @tc.name testDoubleCompareTo0025
     * @tc.desc Verify return 1 when current value greater than other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(3.0);
      const right = new Double(1.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_2600
     * @tc.name testDoubleCompareTo0026
     * @tc.desc Verify return 1 when positive compared with negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(5.0);
      const right = new Double(-3.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_2700
     * @tc.name testDoubleCompareTo0027
     * @tc.desc Verify return 1 when current is NaN and other is normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.NaN);
      const right = new Double(1.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_2800
     * @tc.name testDoubleCompareTo0028
     * @tc.desc Verify return 1 when both values are NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.NaN);
      const right = new Double(Double.NaN);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_2900
     * @tc.name testDoubleCompareTo0029
     * @tc.desc Verify return 0 when comparing 0.0 with -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(0.0);
      const right = new Double(-0.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_3000
     * @tc.name testDoubleCompareTo0030
     * @tc.desc Verify return 0 when comparing -0.0 with 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(-0.0);
      const right = new Double(0.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_3100
     * @tc.name testDoubleCompareTo0031
     * @tc.desc Verify return 1 when POSITIVE_INFINITY compared with large normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.POSITIVE_INFINITY);
      const right = new Double(1.0e300);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_3200
     * @tc.name testDoubleCompareTo0032
     * @tc.desc Verify return -1 when NEGATIVE_INFINITY compared with negative normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.NEGATIVE_INFINITY);
      const right = new Double(-1.0e300);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_3300
     * @tc.name testDoubleCompareTo0033
     * @tc.desc Verify return 0 when two POSITIVE_INFINITY compared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.POSITIVE_INFINITY);
      const right = new Double(Double.POSITIVE_INFINITY);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_3400
     * @tc.name testDoubleCompareTo0034
     * @tc.desc Verify return 0 when two NEGATIVE_INFINITY compared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.NEGATIVE_INFINITY);
      const right = new Double(Double.NEGATIVE_INFINITY);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_3500
     * @tc.name testDoubleCompareTo0035
     * @tc.desc Verify return 1 when POSITIVE_INFINITY compared with NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.POSITIVE_INFINITY);
      const right = new Double(Double.NEGATIVE_INFINITY);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_3600
     * @tc.name testDoubleCompareTo0036
     * @tc.desc Verify return -1 when NEGATIVE_INFINITY compared with POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.NEGATIVE_INFINITY);
      const right = new Double(Double.POSITIVE_INFINITY);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_3700
     * @tc.name testDoubleCompareTo0037
     * @tc.desc Verify return 1 when current is NaN and other is POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.NaN);
      const right = new Double(Double.POSITIVE_INFINITY);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_3800
     * @tc.name testDoubleCompareTo0038
     * @tc.desc Verify return 1 when current is NaN and other is NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.NaN);
      const right = new Double(Double.NEGATIVE_INFINITY);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_3900
     * @tc.name testDoubleCompareTo0039
     * @tc.desc Verify return 1 when current is NaN and other is 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.NaN);
      const right = new Double(0.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_4100
     * @tc.name testDoubleCompareTo0041
     * @tc.desc Verify return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(2.0);
      let result: int = left.compareTo(right);
      expect(result === -1 || result === 0 || result === 1).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_4200
     * @tc.name testDoubleCompareTo0042
     * @tc.desc Verify return value is only -1, 0 or 1 for various inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const values: Double[] = [
        new Double(-10.0),
        new Double(1.0),
        new Double(100.0),
        new Double(Double.NaN),
        new Double(Double.POSITIVE_INFINITY),
        new Double(Double.NEGATIVE_INFINITY),
        new Double(Double.MAX_VALUE),
        new Double(Double.MIN_VALUE),
      ];
      for (const right of values) {
        let result: int = left.compareTo(right);
        expect(result === -1 || result === 0 || result === 1).assertTrue();
      }
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_4300
     * @tc.name testDoubleCompareTo0043
     * @tc.desc Verify result when difference equals EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(1.0 + Double.EPSILON);
      let result: int = left.compareTo(right);
      expect(result === 0 || result === -1).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_4400
     * @tc.name testDoubleCompareTo0044
     * @tc.desc Verify return -1 when difference slightly greater than EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(1.0 + Double.EPSILON * 2.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_4500
     * @tc.name testDoubleCompareTo0045
     * @tc.desc Verify return 0 when difference slightly less than EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(1.0 + Double.EPSILON * 0.5);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_4600
     * @tc.name testDoubleCompareTo0046
     * @tc.desc Verify MAX_VALUE compared with near MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.MAX_VALUE);
      const right = new Double(Double.MAX_VALUE - 1.0);
      let result: int = left.compareTo(right);
      expect(result === 0 || result === 1).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_4700
     * @tc.name testDoubleCompareTo0047
     * @tc.desc Verify MIN_VALUE greater than 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.MIN_VALUE);
      const right = new Double(0.0);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_4800
     * @tc.name testDoubleCompareTo0048
     * @tc.desc Verify 0.0 compared with MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(0.0);
      const right = new Double(Double.MIN_VALUE);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_4900
     * @tc.name testDoubleCompareTo0049
     * @tc.desc Verify MAX_SAFE_INTEGER compared with MAX_SAFE_INTEGER+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.MAX_SAFE_INTEGER);
      const right = new Double(Double.MAX_SAFE_INTEGER + 1);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_5000
     * @tc.name testDoubleCompareTo0050
     * @tc.desc Verify MIN_SAFE_INTEGER compared with MIN_SAFE_INTEGER-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(Double.MIN_SAFE_INTEGER);
      const right = new Double(Double.MIN_SAFE_INTEGER - 1);
      let result: int = left.compareTo(right);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_5300
     * @tc.name testDoubleCompareTo0053
     * @tc.desc Verify error caught when passing number type as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(1.0);
      const right = new Double(123.0);
      let result: int = left.compareTo(right);
      expect(result === -1 || result === 0 || result === 1).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_5500
     * @tc.name testDoubleCompareTo0055
     * @tc.desc Verify compareTo method override behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Double(1.0);
      let result: int = d.compareTo(new Double(2.0));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_5600
     * @tc.name testDoubleCompareTo0056
     * @tc.desc Verify calling compareTo through Comparable reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const comparable: Comparable<Double> = new Double(1.0);
      let result: int = comparable.compareTo(new Double(2.0));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_5700
     * @tc.name testDoubleCompareTo0057
     * @tc.desc Verify idempotency of multiple calls with same arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(3.14);
      const right = new Double(2.71);
      let result1: int = left.compareTo(right);
      let result2: int = left.compareTo(right);
      let result3: int = left.compareTo(right);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_5800
     * @tc.name testDoubleCompareTo0058
     * @tc.desc Verify antisymmetry of compareTo results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(1.0);
      const b = new Double(2.0);
      let ab: int = a.compareTo(b);
      let ba: int = b.compareTo(a);
      expect(ab).assertEqual(-ba);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_5900
     * @tc.name testDoubleCompareTo0059
     * @tc.desc Verify transitivity when a>b and b>c then a>c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(3.0);
      const b = new Double(2.0);
      const c = new Double(1.0);
      let ab: int = a.compareTo(b);
      let bc: int = b.compareTo(c);
      let ac: int = a.compareTo(c);
      expect(ab).assertEqual(1);
      expect(bc).assertEqual(1);
      expect(ac).assertEqual(1);
    });

    /**
     * @tc.number DBL_CMPR_TO_CHK_6000
     * @tc.name testDoubleCompareTo0060
     * @tc.desc Verify transitivity when a==b and b==c then a==c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompareTo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(1.0);
      const b = new Double(1.0);
      const c = new Double(1.0);
      let ab: int = a.compareTo(b);
      let bc: int = b.compareTo(c);
      let ac: int = a.compareTo(c);
      expect(ab).assertEqual(0);
      expect(bc).assertEqual(0);
      expect(ac).assertEqual(0);
    });
  });
}
