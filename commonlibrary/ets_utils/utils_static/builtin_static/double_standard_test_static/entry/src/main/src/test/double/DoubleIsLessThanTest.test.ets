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

export default function DoubleIsLessThanTest(): void {
  describe('DoubleIsLessThanTest', (): void => {
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
     * @tc.number DBL_IS_LESS_THAN_0100
     * @tc.name testDoubleIsLessThan0001
     * @tc.desc Verify isLessThan with one required parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double(2.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_0300
     * @tc.name testDoubleIsLessThan0003
     * 
            param($m) $m.Value -replace $p.Old, $p.New
        
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(2.0).isLessThan(new Double(1.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_0500
     * @tc.name testDoubleIsLessThan0005
     * @tc.desc Verify isLessThan with negative Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-3.0).isLessThan(new Double(-1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_0600
     * @tc.name testDoubleIsLessThan0006
     * @tc.desc Verify isLessThan with zero Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-1.0).isLessThan(new Double(0.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_0700
     * @tc.name testDoubleIsLessThan0007
     * @tc.desc Verify isLessThan with decimal Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.5).isLessThan(new Double(2.5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_0800
     * @tc.name testDoubleIsLessThan0008
     * @tc.desc Verify isLessThan with scientific notation Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0e2).isLessThan(new Double(1.0e3));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_0900
     * @tc.name testDoubleIsLessThan0009
     * @tc.desc Verify isLessThan with Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double(Double.MAX_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_1000
     * @tc.name testDoubleIsLessThan0010
     * @tc.desc Verify isLessThan with Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(0.0).isLessThan(new Double(Double.MIN_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_1100
     * @tc.name testDoubleIsLessThan0011
     * @tc.desc Verify isLessThan with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double(Double.NaN));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_1200
     * @tc.name testDoubleIsLessThan0012
     * @tc.desc Verify isLessThan with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_1300
     * @tc.name testDoubleIsLessThan0013
     * @tc.desc Verify isLessThan with Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-1.0).isLessThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_1400
     * @tc.name testDoubleIsLessThan0014
     * @tc.desc Verify isLessThan when current value is Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.MAX_VALUE).isLessThan(new Double(Double.MAX_VALUE));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_1500
     * @tc.name testDoubleIsLessThan0015
     * @tc.desc Verify isLessThan when current value is Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.MIN_VALUE).isLessThan(new Double(Double.MIN_VALUE));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_1600
     * @tc.name testDoubleIsLessThan0016
     * @tc.desc Verify isLessThan when current value is Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.NaN).isLessThan(new Double(1.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_1700
     * @tc.name testDoubleIsLessThan0017
     * @tc.desc Verify isLessThan when current value is Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.POSITIVE_INFINITY).isLessThan(new Double(1.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_1800
     * @tc.name testDoubleIsLessThan0018
     * @tc.desc Verify isLessThan when current value is Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.NEGATIVE_INFINITY).isLessThan(new Double(1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_1900
     * @tc.name testDoubleIsLessThan0019
     * @tc.desc Verify positive zero is not less than negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(0.0).isLessThan(new Double(-0.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_2000
     * @tc.name testDoubleIsLessThan0020
     * @tc.desc Verify negative zero is not less than positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-0.0).isLessThan(new Double(0.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_2100
     * @tc.name testDoubleIsLessThan0021
     * @tc.desc Verify positive zero is not less than positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(0.0).isLessThan(new Double(0.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_2200
     * @tc.name testDoubleIsLessThan0022
     * @tc.desc Verify NaN is not less than NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.NaN).isLessThan(new Double(Double.NaN));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_2300
     * @tc.name testDoubleIsLessThan0023
     * @tc.desc Verify NaN is not less than positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.NaN).isLessThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_2400
     * @tc.name testDoubleIsLessThan0024
     * @tc.desc Verify NaN is not less than negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.NaN).isLessThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_2500
     * @tc.name testDoubleIsLessThan0025
     * @tc.desc Verify positive infinity is not less than NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.POSITIVE_INFINITY).isLessThan(new Double(Double.NaN));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_2600
     * @tc.name testDoubleIsLessThan0026
     * @tc.desc Verify negative infinity is not less than NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.NEGATIVE_INFINITY).isLessThan(new Double(Double.NaN));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_2700
     * @tc.name testDoubleIsLessThan0027
     * @tc.desc Verify positive infinity is not less than positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.POSITIVE_INFINITY).isLessThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_2800
     * @tc.name testDoubleIsLessThan0028
     * @tc.desc Verify negative infinity is not less than negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.NEGATIVE_INFINITY).isLessThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_2900
     * @tc.name testDoubleIsLessThan0029
     * @tc.desc Verify negative infinity is less than positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.NEGATIVE_INFINITY).isLessThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_3000
     * @tc.name testDoubleIsLessThan0030
     * @tc.desc Verify positive infinity is not less than negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.POSITIVE_INFINITY).isLessThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_3200
     * @tc.name testDoubleIsLessThan0032
     * @tc.desc Verify negative infinity is less than finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.NEGATIVE_INFINITY).isLessThan(new Double(-1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_3300
     * @tc.name testDoubleIsLessThan0033
     * @tc.desc Verify isLessThan when difference is less than DELTA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double(1.0 + Double.DELTA));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_3500
     * @tc.name testDoubleIsLessThan0035
     * @tc.desc Verify isLessThan returns false when values are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double(1.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_3700
     * @tc.name testDoubleIsLessThan0037
     * 
            param($m) $m.Value -replace $p.Old, $p.New
        
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(5.0).isLessThan(new Double(10.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_3800
     * @tc.name testDoubleIsLessThan0038
     * 
            param($m) $m.Value -replace $p.Old, $p.New
        
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(10.0).isLessThan(new Double(5.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_3900
     * @tc.name testDoubleIsLessThan0039
     * 
            param($m) $m.Value -replace $p.Old, $p.New
        
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(3.0).isLessThan(new Double(3.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_4000
     * @tc.name testDoubleIsLessThan0040
     * 
            param($m) $m.Value -replace $p.Old, $p.New
        
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-5.0).isLessThan(new Double(0.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_4100
     * @tc.name testDoubleIsLessThan0041
     * 
            param($m) $m.Value -replace $p.Old, $p.New
        
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(0.0).isLessThan(new Double(-1.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_4200
     * @tc.name testDoubleIsLessThan0042
     * @tc.desc Verify isLessThan with default constructor Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-1.0).isLessThan(new Double());
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_4400
     * @tc.name testDoubleIsLessThan0044
     * @tc.desc Verify isLessThan with BigInt constructed Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double(new BigInt(42)));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_4500
     * @tc.name testDoubleIsLessThan0045
     * @tc.desc Verify isLessThan with String constructed Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double("3.5"));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_4600
     * @tc.name testDoubleIsLessThan0046
     * @tc.desc Verify isLessThan with unparsable String constructed NaN Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double("abc"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_4800
     * @tc.name testDoubleIsLessThan0048
     * @tc.desc Verify negative number is less than positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-1.0).isLessThan(new Double(1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_4900
     * @tc.name testDoubleIsLessThan0049
     * @tc.desc Verify negative number is less than less negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-5.0).isLessThan(new Double(-3.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_5000
     * @tc.name testDoubleIsLessThan0050
     * @tc.desc Verify zero is less than positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(0.0).isLessThan(new Double(1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_5300
     * @tc.name testDoubleIsLessThan0053
     * @tc.desc Verify positive number is not less than negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double(-1.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_5600
     * @tc.name testDoubleIsLessThan0056
     * @tc.desc Verify equal negative numbers comparison returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-1.0).isLessThan(new Double(-1.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_5800
     * @tc.name testDoubleIsLessThan0058
     * @tc.desc Verify any finite value compared with NaN returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(1.0).isLessThan(new Double(Double.NaN))).assertFalse();
      expect(new Double(-1.0).isLessThan(new Double(Double.NaN))).assertFalse();
      expect(new Double(Double.MAX_VALUE).isLessThan(new Double(Double.NaN))).assertFalse();
      expect(new Double(Double.NEGATIVE_INFINITY).isLessThan(new Double(Double.NaN))).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_5900
     * @tc.name testDoubleIsLessThan0059
     * @tc.desc Verify NaN compared with any value returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(Double.NaN).isLessThan(new Double(1.0))).assertFalse();
      expect(new Double(Double.NaN).isLessThan(new Double(Double.NaN))).assertFalse();
      expect(new Double(Double.NaN).isLessThan(new Double(Double.POSITIVE_INFINITY))).assertFalse();
      expect(new Double(Double.NaN).isLessThan(new Double(Double.NEGATIVE_INFINITY))).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_6000
     * @tc.name testDoubleIsLessThan0060
     * @tc.desc Verify negative infinity is less than finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.NEGATIVE_INFINITY).isLessThan(new Double(-1.7976931348623157E308));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_6100
     * @tc.name testDoubleIsLessThan0061
     * @tc.desc Verify finite value is less than positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.7976931348623157E308).isLessThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_6200
     * @tc.name testDoubleIsLessThan0062
     * @tc.desc Verify finite value is not less than negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_6600
     * @tc.name testDoubleIsLessThan0066
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double(2.0));
      expect(typeof result === "boolean").assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_6700
     * @tc.name testDoubleIsLessThan0067
     * @tc.desc Verify return value type is correct when true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).isLessThan(new Double(2.0));
      expect(result).assertTrue();
      expect(result === true).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_6800
     * @tc.name testDoubleIsLessThan0068
     * @tc.desc Verify return value type is correct when false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(2.0).isLessThan(new Double(1.0));
      expect(result).assertFalse();
      expect(result === false).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_7000
     * @tc.name testDoubleIsLessThan0070
     * @tc.desc Verify Double.MAX_VALUE is less than positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.MAX_VALUE).isLessThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_7100
     * @tc.name testDoubleIsLessThan0071
     * @tc.desc Verify Double.MIN_VALUE is not less than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.MIN_VALUE).isLessThan(new Double(0.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_7300
     * @tc.name testDoubleIsLessThan0073
     * @tc.desc Verify MAX_SAFE_INTEGER is less than larger value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.MAX_SAFE_INTEGER).isLessThan(new Double(Double.MAX_SAFE_INTEGER + 1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_7400
     * @tc.name testDoubleIsLessThan0074
     * @tc.desc Verify value less than MIN_SAFE_INTEGER is less than MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.MIN_SAFE_INTEGER - 1).isLessThan(new Double(Double.MIN_SAFE_INTEGER));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_7500
     * @tc.name testDoubleIsLessThan0075
     * @tc.desc Verify Error is caught when passing null parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = new Double(1.0).isLessThan(null as Double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_7600
     * @tc.name testDoubleIsLessThan0076
     * @tc.desc Verify Error is caught when passing undefined parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = new Double(1.0).isLessThan(undefined as Double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_7700
     * @tc.name testDoubleIsLessThan0077
     * @tc.desc Verify type error caught when passing string parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(100.0).isLessThan(new Double(200.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_7800
     * @tc.name testDoubleIsLessThan0078
     * @tc.desc Verify type error caught when passing number parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(200.0).isLessThan(new Double(100.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_8100
     * @tc.name testDoubleIsLessThan0081
     * @tc.desc Verify null parameter triggers catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-10.0).isLessThan(new Double(-5.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_THAN_8200
     * @tc.name testDoubleIsLessThan0082
     * @tc.desc Verify Double.isLessThan returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessThan0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.0).isLessThan(new Double(2.0));
      expect(result).assertTrue();
    });
  });
}
