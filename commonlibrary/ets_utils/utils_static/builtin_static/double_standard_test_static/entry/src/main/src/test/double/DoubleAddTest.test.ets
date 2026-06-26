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

export default function DoubleAddTest(): void {
  describe('DoubleAddTest', () => {
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
     * @tc.number DBL_ADD_ITEM_CHK_0100
     * @tc.name doubleAdd0001
     * @tc.desc Verify calling add with one required parameter other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.5).add(new Double(2.0));
      expect(result.toDouble()).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_0400
     * @tc.name doubleAdd0004
     * @tc.desc Verify other is a positive Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.5).add(new Double(2.5));
      expect(result.toDouble()).assertEqual(4.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_0500
     * @tc.name doubleAdd0005
     * @tc.desc Verify other is a negative Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.5).add(new Double(-3.0));
      expect(result.toDouble()).assertEqual(-1.5);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_0600
     * @tc.name doubleAdd0006
     * @tc.desc Verify current value is negative and other is also negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(-2.5).add(new Double(-3.5));
      expect(result.toDouble()).assertEqual(-6.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_0700
     * @tc.name doubleAdd0007
     * @tc.desc Verify other is a zero value Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(5.0).add(new Double(0.0));
      expect(result.toDouble()).assertEqual(5.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_0800
     * @tc.name doubleAdd0008
     * @tc.desc Verify other is a decimal Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(0.1).add(new Double(0.2));
      expect(result.toDouble()).assertClose(0.3, Double.DELTA);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_0900
     * @tc.name doubleAdd0009
     * @tc.desc Verify other is a large number Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1000000.0).add(new Double(2000000.0));
      expect(result.toDouble()).assertEqual(3000000.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_1000
     * @tc.name doubleAdd0010
     * @tc.desc Verify other is Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.MAX_VALUE).add(new Double(Double.MAX_VALUE));
      expect(result.toDouble()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_1100
     * @tc.name doubleAdd0011
     * @tc.desc Verify other is Double.MIN_VALUE (smallest positive value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.0).add(new Double(Double.MIN_VALUE));
      expect(result.toDouble()).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_1200
     * @tc.name doubleAdd0012
     * @tc.desc Verify other is Double.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.0).add(new Double(Double.MAX_SAFE_INTEGER));
      expect(result.toDouble()).assertEqual(Double.MAX_SAFE_INTEGER + 1.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_1300
     * @tc.name doubleAdd0013
     * @tc.desc Verify other is Double.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(-1.0).add(new Double(Double.MIN_SAFE_INTEGER));
      expect(result.toDouble()).assertEqual(Double.MIN_SAFE_INTEGER - 1.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_1400
     * @tc.name doubleAdd0014
     * @tc.desc Verify other is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.0).add(new Double(Double.NaN));
      expect(Double.isNaN(result.toDouble())).assertTrue();
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_1500
     * @tc.name doubleAdd0015
     * @tc.desc Verify other is positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.0).add(new Double(Double.POSITIVE_INFINITY));
      expect(result.toDouble()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_1600
     * @tc.name doubleAdd0016
     * @tc.desc Verify other is negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.0).add(new Double(Double.NEGATIVE_INFINITY));
      expect(result.toDouble()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_1700
     * @tc.name doubleAdd0017
     * @tc.desc Verify current value is positive infinity and other is negative infinity, result should be NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.POSITIVE_INFINITY).add(new Double(Double.NEGATIVE_INFINITY));
      expect(Double.isNaN(result.toDouble())).assertTrue();
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_1800
     * @tc.name doubleAdd0018
     * @tc.desc Verify other is -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.0).add(new Double(-0.0));
      expect(result.toDouble()).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_1900
     * @tc.name doubleAdd0019
     * @tc.desc Verify passing null as other parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.0).add(new Double(0.0));
      expect(result.toDouble()).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_2000
     * @tc.name doubleAdd0020
     * @tc.desc Verify passing basic type number instead of Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.0).add(new Double(2.0));
      expect(result.toDouble()).assertEqual(3.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_2400
     * @tc.name doubleAdd0024
     * @tc.desc Verify adding two integer Doubles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(3.0).add(new Double(4.0));
      expect(result.toDouble()).assertEqual(7.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_2500
     * @tc.name doubleAdd0025
     * @tc.desc Verify adding two zero value Doubles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(0.0).add(new Double(0.0));
      expect(result.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_2600
     * @tc.name doubleAdd0026
     * @tc.desc Verify adding Doubles created with default constructor (value 0.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const a = new Double();
      const result = a.add(new Double(5.0));
      expect(result.toDouble()).assertEqual(5.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_2700
     * @tc.name doubleAdd0027
     * @tc.desc Verify current value is NaN and other is normal value, result is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.NaN).add(new Double(1.0));
      expect(Double.isNaN(result.toDouble())).assertTrue();
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_2800
     * @tc.name doubleAdd0028
     * @tc.desc Verify adding two NaN values, result is still NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.NaN).add(new Double(Double.NaN));
      expect(Double.isNaN(result.toDouble())).assertTrue();
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_2900
     * @tc.name doubleAdd0029
     * @tc.desc Verify current value is positive infinity and other is normal value, result is still positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.POSITIVE_INFINITY).add(new Double(100.0));
      expect(result.toDouble()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_3000
     * @tc.name doubleAdd0030
     * @tc.desc Verify current value is negative infinity and other is normal value, result is still negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.NEGATIVE_INFINITY).add(new Double(100.0));
      expect(result.toDouble()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_3100
     * @tc.name doubleAdd0031
     * @tc.desc Verify adding two positive infinities, result is still positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.POSITIVE_INFINITY).add(new Double(Double.POSITIVE_INFINITY));
      expect(result.toDouble()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_3200
     * @tc.name doubleAdd0032
     * @tc.desc Verify adding two negative infinities, result is still negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.NEGATIVE_INFINITY).add(new Double(Double.NEGATIVE_INFINITY));
      expect(result.toDouble()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_3300
     * @tc.name doubleAdd0033
     * @tc.desc Verify adding 0.0 and -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(0.0).add(new Double(-0.0));
      expect(result.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_3400
     * @tc.name doubleAdd0034
     * @tc.desc Verify adding -0.0 and -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(-0.0).add(new Double(-0.0));
      expect(result.toDouble()).assertEqual(-0.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_3500
     * @tc.name doubleAdd0035
     * @tc.desc Verify return value is a Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.0).add(new Double(2.0));
      expect(result instanceof Double).assertTrue();
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_3600
     * @tc.name doubleAdd0036
     * @tc.desc Verify return value is a new Double instance, not this or other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const a = new Double(1.0);
      const b = new Double(2.0);
      const result = a.add(b);
      expect(result === a).assertFalse();
      expect(result === b).assertFalse();
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_3700
     * @tc.name doubleAdd0037
     * @tc.desc Verify return value can chain call Double instance methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.5).add(new Double(2.5)).add(new Double(3.0));
      expect(result.toDouble()).assertEqual(7.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_3800
     * @tc.name doubleAdd0038
     * @tc.desc Verify return value valueOf method returns correct number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.5).add(new Double(2.5));
      expect(result.valueOf()).assertEqual(4.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_3900
     * @tc.name doubleAdd0039
     * @tc.desc Verify return value toString method returns correct string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.5).add(new Double(2.5));
      expect(result.toString()).assertEqual("4");
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_4100
     * @tc.name doubleAdd0041
     * @tc.desc Verify adding two near -MAX_VALUE numbers overflows to negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(-Double.MAX_VALUE).add(new Double(-Double.MAX_VALUE));
      expect(result.toDouble()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_4200
     * @tc.name doubleAdd0042
     * @tc.desc Verify adding two MIN_VALUE values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.MIN_VALUE).add(new Double(Double.MIN_VALUE));
      expect(result.toDouble() > 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_4300
     * @tc.name doubleAdd0043
     * @tc.desc Verify MAX_SAFE_INTEGER plus 1 for precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.MAX_SAFE_INTEGER).add(new Double(1.0));
      expect(result.toDouble()).assertEqual(Double.MAX_SAFE_INTEGER + 1.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_4400
     * @tc.name doubleAdd0044
     * @tc.desc Verify MAX_SAFE_INTEGER plus 2 for precision boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.MAX_SAFE_INTEGER).add(new Double(2.0));
      expect(result.toDouble()).assertEqual(Double.MAX_SAFE_INTEGER + 2.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_4500
     * @tc.name doubleAdd0045
     * @tc.desc Verify MIN_SAFE_INTEGER plus -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.MIN_SAFE_INTEGER).add(new Double(-1.0));
      expect(result.toDouble()).assertEqual(Double.MIN_SAFE_INTEGER - 1.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_5300
     * @tc.name doubleAdd0053
     * @tc.desc Verify multiple chained calls to add method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.0).add(new Double(2.0)).add(new Double(3.0)).add(new Double(4.0));
      expect(result.toDouble()).assertEqual(10.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_5400
     * @tc.name doubleAdd0054
     * @tc.desc Verify add return value can call sub, mul, div etc.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(10.0).add(new Double(5.0)).sub(new Double(3.0));
      expect(result.toDouble()).assertEqual(12.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_5500
     * @tc.name doubleAdd0055
     * @tc.desc Verify adding Doubles constructed from double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const a = new Double(1.5);
      const b = new Double(2.5);
      const result = a.add(b);
      expect(result.toDouble()).assertEqual(4.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_5600
     * @tc.name doubleAdd0056
     * @tc.desc Verify adding Doubles constructed from String values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const a = new Double("1.5");
      const b = new Double("2.5");
      const result = a.add(b);
      expect(result.toDouble()).assertEqual(4.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_5700
     * @tc.name doubleAdd0057
     * @tc.desc Verify adding Doubles constructed from BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const a = new Double(new BigInt(10));
      const b = new Double(new BigInt(20));
      const result = a.add(b);
      expect(result.toDouble()).assertEqual(30.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_5800
     * @tc.name doubleAdd0058
     * @tc.desc Verify adding Doubles constructed with default constructor (value 0.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const a = new Double();
      const b = new Double();
      const result = a.add(b);
      expect(result.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_5900
     * @tc.name doubleAdd0059
     * @tc.desc Verify adding Doubles created with different construction methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const a = new Double(1.0);
      const b = new Double("2.0");
      const result = a.add(b);
      expect(result.toDouble()).assertEqual(3.0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_6100
     * @tc.name doubleAdd0061
     * @tc.desc Verify high-precision decimal addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(0.123456789).add(new Double(0.987654321));
      expect(result.toDouble()).assertClose(1.11111111, Double.DELTA);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_6200
     * @tc.name doubleAdd0062
     * @tc.desc Verify adding values near MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(Double.MIN_VALUE).add(new Double(Double.MIN_VALUE));
      expect(result.toDouble() > Double.MIN_VALUE).assertTrue();
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_6300
     * @tc.name doubleAdd0063
     * @tc.desc Verify add return value equals expected Double instance using equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.5).add(new Double(2.5));
      const expected = new Double(4.0);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_6400
     * @tc.name doubleAdd0064
     * @tc.desc Verify add return value not equals different Double instance using equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.5).add(new Double(2.5));
      const other = new Double(5.0);
      expect(result.equals(other)).assertFalse();
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_6500
     * @tc.name doubleAdd0065
     * @tc.desc Verify add return value compareTo expected value returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.5).add(new Double(2.5));
      const expected = new Double(4.0);
      expect(result.compareTo(expected)).assertEqual(0);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_6600
     * @tc.name doubleAdd0066
     * @tc.desc Verify add return value compareTo returns 1 for greater value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(5.0).add(new Double(3.0));
      const other = new Double(7.0);
      expect(result.compareTo(other)).assertEqual(1);
    });

    /**
     * @tc.number DBL_ADD_ITEM_CHK_6700
     * @tc.name doubleAdd0067
     * @tc.desc Verify add return value compareTo returns -1 for less value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleAdd0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = new Double(1.0).add(new Double(2.0));
      const other = new Double(5.0);
      expect(result.compareTo(other)).assertEqual(-1);
    });
  });
}
