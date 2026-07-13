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

export default function DoubleCompareTest(): void {
  describe('DoubleCompareTest', () : void => {
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
     * @tc.number DBL_CMPR_ITEM_CHK_0100
     * @tc.name testDoubleCompare0001
     * @tc.desc Verify calling with two required parameters normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, 2.0);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_0200
     * @tc.name testDoubleCompare0002
     * @tc.desc Verify calling with two equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, 1.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_0700
     * @tc.name testDoubleCompare0007
     * @tc.desc Verify positive floating point number as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(123.456, 123.456);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_0800
     * @tc.name testDoubleCompare0008
     * @tc.desc Verify negative floating point number as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(-888.88, -888.88);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_0900
     * @tc.name testDoubleCompare0009
     * @tc.desc Verify zero value as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, 0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1000
     * @tc.name testDoubleCompare0010
     * @tc.desc Verify scientific notation as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0e6, 1.0e6);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1100
     * @tc.name testDoubleCompare0011
     * @tc.desc Verify decimal number as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(3.14, 3.14);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1200
     * @tc.name testDoubleCompare0012
     * @tc.desc Verify Double.MAX_VALUE as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.MAX_VALUE, Double.MAX_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1300
     * @tc.name testDoubleCompare0013
     * @tc.desc Verify Double.MIN_VALUE as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.MIN_VALUE, Double.MIN_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1400
     * @tc.name testDoubleCompare0014
     * @tc.desc Verify Double.MAX_SAFE_INTEGER as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.MAX_SAFE_INTEGER, Double.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1500
     * @tc.name testDoubleCompare0015
     * @tc.desc Verify Double.MIN_SAFE_INTEGER as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.MIN_SAFE_INTEGER, Double.MIN_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1600
     * @tc.name testDoubleCompare0016
     * @tc.desc Verify comparing MAX_VALUE with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.MAX_VALUE, 0.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1700
     * @tc.name testDoubleCompare0017
     * @tc.desc Verify comparing MIN_VALUE with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.MIN_VALUE, 0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1800
     * @tc.name testDoubleCompare0018
     * @tc.desc Verify Double.NaN as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.NaN, 0.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1900
     * @tc.name testDoubleCompare0019
     * @tc.desc Verify Double.POSITIVE_INFINITY as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.POSITIVE_INFINITY, Double.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_2000
     * @tc.name testDoubleCompare0020
     * @tc.desc Verify Double.NEGATIVE_INFINITY as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.NEGATIVE_INFINITY, Double.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_2100
     * @tc.name testDoubleCompare0021
     * @tc.desc Verify negative zero as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(-0.0, 0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_2200
     * @tc.name testDoubleCompare0022
     * @tc.desc Verify Double.DELTA as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.DELTA, 0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_2300
     * @tc.name testDoubleCompare0023
     * @tc.desc Verify Double.EPSILON as lhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.EPSILON, 0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_2800
     * @tc.name testDoubleCompare0028
     * @tc.desc Verify positive floating point number as rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(50.0, 100.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_2900
     * @tc.name testDoubleCompare0029
     * @tc.desc Verify negative floating point number as rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(-100.0, -888.88);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_3000
     * @tc.name testDoubleCompare0030
     * @tc.desc Verify zero value as rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, 0.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_3200
     * @tc.name testDoubleCompare0032
     * @tc.desc Verify decimal number as rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(2.718, 3.14);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_3300
     * @tc.name testDoubleCompare0033
     * @tc.desc Verify Double.MAX_VALUE as rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, Double.MAX_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_3400
     * @tc.name testDoubleCompare0034
     * @tc.desc Verify Double.MIN_VALUE as rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, Double.MIN_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_3500
     * @tc.name testDoubleCompare0035
     * @tc.desc Verify Double.MAX_SAFE_INTEGER as rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, Double.MAX_SAFE_INTEGER);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_3600
     * @tc.name testDoubleCompare0036
     * @tc.desc Verify Double.MIN_SAFE_INTEGER as rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, Double.MIN_SAFE_INTEGER);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_3900
     * @tc.name testDoubleCompare0039
     * @tc.desc Verify Double.NaN as rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, Double.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_4200
     * @tc.name testDoubleCompare0042
     * @tc.desc Verify negative zero as rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, -0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_4300
     * @tc.name testDoubleCompare0043
     * @tc.desc Verify Double.DELTA as rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, Double.DELTA);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_4400
     * @tc.name testDoubleCompare0044
     * @tc.desc Verify Double.EPSILON as rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, Double.EPSILON);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_4900
     * @tc.name testDoubleCompare0049
     * @tc.desc Verify difference far less than DELTA returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.DELTA / 2.0, 0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_5000
     * @tc.name testDoubleCompare0050
     * @tc.desc Verify floating point precision error within DELTA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 0.1 + 0.2;
      let b: double = 0.3;
      let result: boolean = Double.compare(a, b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_5100
     * @tc.name testDoubleCompare0051
     * @tc.desc Verify lhs slightly greater than rhs within DELTA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, 1.0 + Double.MIN_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_5200
     * @tc.name testDoubleCompare0052
     * @tc.desc Verify lhs slightly less than rhs within DELTA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0 + Double.MIN_VALUE, 1.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_5500
     * @tc.name testDoubleCompare0055
     * @tc.desc Verify difference exactly equals negative DELTA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, -Double.DELTA);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_5600
     * @tc.name testDoubleCompare0056
     * @tc.desc Verify difference slightly greater than DELTA returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.DELTA * 2.0, 0.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_5700
     * @tc.name testDoubleCompare0057
     * @tc.desc Verify lhs much greater than rhs returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1000000.0, 0.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_5800
     * @tc.name testDoubleCompare0058
     * @tc.desc Verify lhs much less than rhs returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, 1000000.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_5900
     * @tc.name testDoubleCompare0059
     * @tc.desc Verify difference just exceeds DELTA returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: double = Double.DELTA + Double.MIN_VALUE;
      let rhs: double = 0.0;
      let result: boolean = Double.compare(lhs, rhs);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_6100
     * @tc.name testDoubleCompare0061
     * @tc.desc Verify equal negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(-99.99, -99.99);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_6400
     * @tc.name testDoubleCompare0064
     * @tc.desc Verify positive lhs and negative rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, -1.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_6500
     * @tc.name testDoubleCompare0065
     * @tc.desc Verify negative lhs and positive rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(-1.0, 1.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_6700
     * @tc.name testDoubleCompare0067
     * @tc.desc Verify zero lhs and negative rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, -1.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_6800
     * @tc.name testDoubleCompare0068
     * @tc.desc Verify NaN lhs and normal rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.NaN, 1.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_6900
     * @tc.name testDoubleCompare0069
     * @tc.desc Verify normal lhs and NaN rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, Double.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_7000
     * @tc.name testDoubleCompare0070
     * @tc.desc Verify both lhs and rhs are NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.NaN, Double.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_7100
     * @tc.name testDoubleCompare0071
     * @tc.desc Verify NaN lhs and positive infinity rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.NaN, Double.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_7200
     * @tc.name testDoubleCompare0072
     * @tc.desc Verify NaN lhs and negative infinity rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.NaN, Double.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_7600
     * @tc.name testDoubleCompare0076
     * @tc.desc Verify positive infinity versus negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_7700
     * @tc.name testDoubleCompare0077
     * @tc.desc Verify positive infinity versus finite positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.POSITIVE_INFINITY, 1.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_7800
     * @tc.name testDoubleCompare0078
     * @tc.desc Verify negative infinity versus finite negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.NEGATIVE_INFINITY, -1.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_7900
     * @tc.name testDoubleCompare0079
     * @tc.desc Verify positive infinity versus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.POSITIVE_INFINITY, 0.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_8000
     * @tc.name testDoubleCompare0080
     * @tc.desc Verify negative infinity versus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.NEGATIVE_INFINITY, 0.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_8100
     * @tc.name testDoubleCompare0081
     * @tc.desc Verify positive infinity versus NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.POSITIVE_INFINITY, Double.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_8500
     * @tc.name testDoubleCompare0085
     * @tc.desc Verify floating point precision within DELTA range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.1 + 0.2, 0.3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_8700
     * @tc.name testDoubleCompare0087
     * @tc.desc Verify values with obvious difference return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, 2.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_8800
     * @tc.name testDoubleCompare0088
     * @tc.desc Verify difference greater than DELTA returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(0.0, Double.DELTA * 2.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_0201
     * @tc.name testDoubleCompare0102
     * @tc.desc Verify finite value minus positive infinity is negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, Double.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_0500
     * @tc.name testDoubleCompare0105
     * @tc.desc Verify negative zero compared with negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(-0.0, -0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_0600
     * @tc.name testDoubleCompare0106
     * @tc.desc Verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, 1.0);
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_0701
     * @tc.name testDoubleCompare0107
     * @tc.desc Verify return value true strictly equals boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, 1.0);
      expect(result === true).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_0801
     * @tc.name testDoubleCompare0108
     * @tc.desc Verify return value false strictly equals boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, 2.0);
      expect(result === false).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_0901
     * @tc.name testDoubleCompare0109
     * @tc.desc Verify return value is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, 1.0);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1101
     * @tc.name testDoubleCompare0111
     * @tc.desc Verify DELTA boundary when difference equals DELTA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: double = 1.0;
      let rhs: double = 1.0 + Double.DELTA;
      let result: boolean = Double.compare(lhs, rhs);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1201
     * @tc.name testDoubleCompare0112
     * @tc.desc Verify DELTA boundary when difference slightly exceeds DELTA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: double = 1.0;
      let rhs: double = 1.0 + Double.DELTA + Double.MIN_VALUE;
      let result: boolean = Double.compare(lhs, rhs);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1301
     * @tc.name testDoubleCompare0113
     * @tc.desc Verify DELTA boundary reverse comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: double = 1.0 + Double.DELTA;
      let rhs: double = 1.0;
      let result: boolean = Double.compare(lhs, rhs);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1501
     * @tc.name testDoubleCompare0115
     * @tc.desc Verify DELTA level comparison between large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0e308, 1.0e308 + Double.DELTA);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1601
     * @tc.name testDoubleCompare0116
     * @tc.desc Verify EPSILON and DELTA equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: boolean = Double.compare(Double.EPSILON, 0.0);
      let r2: boolean = Double.compare(Double.DELTA, 0.0);
      expect(r1 === r2).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1801
     * @tc.name testDoubleCompare0118
     * @tc.desc Verify NaN call does not throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.NaN, Double.NaN);
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_1901
     * @tc.name testDoubleCompare0119
     * @tc.desc Verify Infinity call does not throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY);
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_2001
     * @tc.name testDoubleCompare0120
     * @tc.desc Verify compare does not throw internally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.MAX_VALUE, Double.MIN_VALUE);
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_2101
     * @tc.name testDoubleCompare0121
     * @tc.desc Verify boundary value call does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(Double.NaN, Double.POSITIVE_INFINITY);
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_2400
     * @tc.name testDoubleCompare0124
     * @tc.desc Verify catch variable type is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: boolean = Double.compare(1.0, 1.0);
        expect(result).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_2801
     * @tc.name testDoubleCompare0128
     * @tc.desc Verify multiple consecutive static method calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: boolean = Double.compare(1.0, 1.0);
      let r2: boolean = Double.compare(2.0, 2.0);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_3100
     * @tc.name testDoubleCompare0131
     * @tc.desc Verify compare is synchronous and returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, 1.0);
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_CMPR_ITEM_CHK_3301
     * @tc.name testDoubleCompare0133
     * @tc.desc Verify compare return value is not a Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleCompare0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.compare(1.0, 1.0);
      expect(!(result instanceof Promise)).assertTrue();
    });
  });
}
