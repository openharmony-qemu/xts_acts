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

export default function DoubleIsSafeIntegerTwoTest(): void {
  describe('DoubleIsSafeIntegerTwoTest', (): void => {
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
     * @tc.number DBL_IS_SAFE_INTGR_2_0100
     * @tc.name testDoubleIsSafeIntegerTwo0001
     * @tc.desc Verify calling isSafeInteger without parameters on instance normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.0);
      let result: boolean = value.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_0300
     * @tc.name testDoubleIsSafeIntegerTwo0003
     * @tc.desc Verify isSafeInteger returns true when stored value is 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(0.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_0400
     * @tc.name testDoubleIsSafeIntegerTwo0004
     * @tc.desc Verify isSafeInteger returns true when stored value is positive integer 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_0500
     * @tc.name testDoubleIsSafeIntegerTwo0005
     * @tc.desc Verify isSafeInteger returns true when stored value is negative integer -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(-1.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_0600
     * @tc.name testDoubleIsSafeIntegerTwo0006
     * @tc.desc Verify isSafeInteger returns true when stored value is MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(9007199254740991.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_0700
     * @tc.name testDoubleIsSafeIntegerTwo0007
     * @tc.desc Verify isSafeInteger returns true when stored value is MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(-9007199254740991.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_0800
     * @tc.name testDoubleIsSafeIntegerTwo0008
     * @tc.desc Verify isSafeInteger returns true when stored value is large positive integer 100000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(100000.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_0900
     * @tc.name testDoubleIsSafeIntegerTwo0009
     * @tc.desc Verify isSafeInteger returns true when stored value is large negative integer -100000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(-100000.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_1000
     * @tc.name testDoubleIsSafeIntegerTwo0010
     * @tc.desc Verify isSafeInteger returns true when stored value is float form integer 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_1100
     * @tc.name testDoubleIsSafeIntegerTwo0011
     * @tc.desc Verify isSafeInteger returns true when stored value is MAX_SAFE_INTEGER minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(9007199254740990.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_1200
     * @tc.name testDoubleIsSafeIntegerTwo0012
     * @tc.desc Verify isSafeInteger returns true when stored value is MIN_SAFE_INTEGER plus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(-9007199254740990.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_1300
     * @tc.name testDoubleIsSafeIntegerTwo0013
     * @tc.desc Verify isSafeInteger returns false when stored value is decimal 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.5);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_1400
     * @tc.name testDoubleIsSafeIntegerTwo0014
     * @tc.desc Verify isSafeInteger returns false when stored value is decimal 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(0.1);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_1500
     * @tc.name testDoubleIsSafeIntegerTwo0015
     * @tc.desc Verify isSafeInteger returns false when stored value is decimal -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(-0.5);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_1600
     * @tc.name testDoubleIsSafeIntegerTwo0016
     * @tc.desc Verify isSafeInteger returns false when stored value is decimal 3.14159
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(3.14159);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_1700
     * @tc.name testDoubleIsSafeIntegerTwo0017
     * @tc.desc Verify isSafeInteger returns true when stored value is MAX_SAFE_INTEGER boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.MAX_SAFE_INTEGER);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_1800
     * @tc.name testDoubleIsSafeIntegerTwo0018
     * @tc.desc Verify isSafeInteger returns false when stored value is MAX_SAFE_INTEGER + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(9007199254740992.0);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_1900
     * @tc.name testDoubleIsSafeIntegerTwo0019
     * @tc.desc Verify isSafeInteger returns false when stored value is MAX_SAFE_INTEGER + 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(9007199254740993.0);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_2000
     * @tc.name testDoubleIsSafeIntegerTwo0020
     * @tc.desc Verify isSafeInteger returns false when stored value is very large integer 1e20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1e20);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_2100
     * @tc.name testDoubleIsSafeIntegerTwo0021
     * @tc.desc Verify isSafeInteger returns true when stored value is MIN_SAFE_INTEGER boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.MIN_SAFE_INTEGER);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_2200
     * @tc.name testDoubleIsSafeIntegerTwo0022
     * @tc.desc Verify isSafeInteger returns false when stored value is MIN_SAFE_INTEGER - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(-9007199254740992.0);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_2300
     * @tc.name testDoubleIsSafeIntegerTwo0023
     * @tc.desc Verify isSafeInteger returns false when stored value is very small negative integer -1e20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(-1e20);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_2400
     * @tc.name testDoubleIsSafeIntegerTwo0024
     * @tc.desc Verify isSafeInteger returns false when stored value is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.NaN);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_2500
     * @tc.name testDoubleIsSafeIntegerTwo0025
     * @tc.desc Verify isSafeInteger returns false when stored value is NaN generated by 0/0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(0.0 / 0.0);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_2600
     * @tc.name testDoubleIsSafeIntegerTwo0026
     * @tc.desc Verify isSafeInteger returns false when stored value is POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.POSITIVE_INFINITY);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_2700
     * @tc.name testDoubleIsSafeIntegerTwo0027
     * @tc.desc Verify isSafeInteger returns false when stored value is NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.NEGATIVE_INFINITY);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_2800
     * @tc.name testDoubleIsSafeIntegerTwo0028
     * @tc.desc Verify isSafeInteger returns false when stored value is positive infinity generated by 1/0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.0 / 0.0);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_3000
     * @tc.name testDoubleIsSafeIntegerTwo0030
     * @tc.desc Verify isSafeInteger returns true when stored value is negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(-0.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_3100
     * @tc.name testDoubleIsSafeIntegerTwo0031
     * @tc.desc Verify isSafeInteger returns false when stored value is MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.MIN_VALUE);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_3200
     * @tc.name testDoubleIsSafeIntegerTwo0032
     * @tc.desc Verify isSafeInteger returns false when stored value is MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.MAX_VALUE);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_3300
     * @tc.name testDoubleIsSafeIntegerTwo0033
     * @tc.desc Verify isSafeInteger returns true when stored value is scientific notation integer 1.0e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.0e3);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_3400
     * @tc.name testDoubleIsSafeIntegerTwo0034
     * @tc.desc Verify isSafeInteger returns true when stored value is scientific notation 1.5e2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5e2);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_3500
     * @tc.name testDoubleIsSafeIntegerTwo0035
     * @tc.desc Verify isSafeInteger returns true when stored value is scientific notation 1.23e2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.23e2);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_3600
     * @tc.name testDoubleIsSafeIntegerTwo0036
     * @tc.desc Verify isSafeInteger returns false when stored value is scientific notation 1.234e2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.234e2);
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_3700
     * @tc.name testDoubleIsSafeIntegerTwo0037
     * @tc.desc Verify isSafeInteger returns true when constructed with default constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double();
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_3800
     * @tc.name testDoubleIsSafeIntegerTwo0038
     * @tc.desc Verify isSafeInteger returns true when constructed with double parameter 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(42.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_3900
     * @tc.name testDoubleIsSafeIntegerTwo0039
     * @tc.desc Verify isSafeInteger returns true when constructed with BigInt parameter 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(new BigInt(42));
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_4000
     * @tc.name testDoubleIsSafeIntegerTwo0040
     * @tc.desc Verify isSafeInteger returns false when constructed with String parameter "3.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double("3.5");
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_4100
     * @tc.name testDoubleIsSafeIntegerTwo0041
     * @tc.desc Verify isSafeInteger returns true when constructed with String parameter "100"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double("100");
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_4200
     * @tc.name testDoubleIsSafeIntegerTwo0042
     * @tc.desc Verify isSafeInteger returns false when constructed with unparseable String "abc"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double("abc");
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_4300
     * @tc.name testDoubleIsSafeIntegerTwo0043
     * @tc.desc Verify isSafeInteger returns true when created via $_invoke static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = Double.$_invoke();
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_4400
     * @tc.name testDoubleIsSafeIntegerTwo0044
     * @tc.desc Verify isSafeInteger returns true and return type is boolean for safe integer 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.0);
      let result: boolean = value.isSafeInteger();
      expect(typeof result).assertEqual("boolean");
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_4500
     * @tc.name testDoubleIsSafeIntegerTwo0045
     * @tc.desc Verify isSafeInteger returns true and return type is boolean for value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(0.0);
      let result: boolean = value.isSafeInteger();
      expect(typeof result).assertEqual("boolean");
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_4600
     * @tc.name testDoubleIsSafeIntegerTwo0046
     * @tc.desc Verify isSafeInteger returns true for MAX_SAFE_INTEGER with return type boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.MAX_SAFE_INTEGER);
      let result: boolean = value.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_4700
     * @tc.name testDoubleIsSafeIntegerTwo0047
     * @tc.desc Verify isSafeInteger returns true for MIN_SAFE_INTEGER with return type boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.MIN_SAFE_INTEGER);
      let result: boolean = value.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_4800
     * @tc.name testDoubleIsSafeIntegerTwo0048
     * @tc.desc Verify isSafeInteger returns false and return type is boolean for decimal 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.5);
      let result: boolean = value.isSafeInteger();
      expect(typeof result).assertEqual("boolean");
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_4900
     * @tc.name testDoubleIsSafeIntegerTwo0049
     * @tc.desc Verify isSafeInteger returns false for NaN with return type boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.NaN);
      let result: boolean = value.isSafeInteger();
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_5000
     * @tc.name testDoubleIsSafeIntegerTwo0050
     * @tc.desc Verify isSafeInteger returns false for POSITIVE_INFINITY with return type boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.POSITIVE_INFINITY);
      let result: boolean = value.isSafeInteger();
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_5100
     * @tc.name testDoubleIsSafeIntegerTwo0051
     * @tc.desc Verify isSafeInteger returns false for NEGATIVE_INFINITY with return type boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.NEGATIVE_INFINITY);
      let result: boolean = value.isSafeInteger();
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_5200
     * @tc.name testDoubleIsSafeIntegerTwo0052
     * @tc.desc Verify isSafeInteger returns false for value beyond safe integer upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(9007199254740992.0);
      let result: boolean = value.isSafeInteger();
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_5300
     * @tc.name testDoubleIsSafeIntegerTwo0053
     * @tc.desc Verify isSafeInteger returns false for value below safe integer lower bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(-9007199254740992.0);
      let result: boolean = value.isSafeInteger();
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_5400
     * @tc.name testDoubleIsSafeIntegerTwo0054
     * @tc.desc Verify isSafeInteger return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.0);
      let result: boolean = value.isSafeInteger();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_5600
     * @tc.name testDoubleIsSafeIntegerTwo0056
     * @tc.desc Verify isSafeInteger return value can be used in logical operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.0);
      let result: boolean = value.isSafeInteger() && true;
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_5700
     * @tc.name testDoubleIsSafeIntegerTwo0057
     * @tc.desc Verify isSafeInteger return value can be negated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.5);
      let result: boolean = !value.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_6200
     * @tc.name testDoubleIsSafeIntegerTwo0062
     * @tc.desc Verify isSafeInteger returns consistent results for multiple calls on same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.0);
      let result1: boolean = value.isSafeInteger();
      let result2: boolean = value.isSafeInteger();
      expect(result1).assertEqual(result2);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_6300
     * @tc.name testDoubleIsSafeIntegerTwo0063
     * @tc.desc Verify isSafeInteger returns consistent results across different instances with same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: Double = new Double(42.0);
      let value2: Double = new Double(42.0);
      expect(value1.isSafeInteger()).assertEqual(value2.isSafeInteger());
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_6700
     * @tc.name testDoubleIsSafeIntegerTwo0067
     * @tc.desc Verify isSafeInteger does not throw exception when stored value is MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.MAX_VALUE);
      let result: boolean = value.isSafeInteger();
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_6800
     * @tc.name testDoubleIsSafeIntegerTwo0068
     * @tc.desc Verify isSafeInteger does not throw exception when stored value is MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.MIN_VALUE);
      let result: boolean = value.isSafeInteger();
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_6900
     * @tc.name testDoubleIsSafeIntegerTwo0069
     * @tc.desc Verify Double.isSafeInteger returns true for safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(2.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_7100
     * @tc.name testDoubleIsSafeIntegerTwo0071
     * @tc.desc Verify isSafeInteger returns true after arithmetic operation resulting in safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(1.5);
      let b: Double = new Double(0.5);
      let result: Double = a.add(b);
      expect(result.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_7200
     * @tc.name testDoubleIsSafeIntegerTwo0072
     * @tc.desc Verify isSafeInteger returns false after arithmetic operation resulting in non-safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(1.5);
      let b: Double = new Double(0.3);
      let result: Double = a.add(b);
      expect(result.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_7300
     * @tc.name testDoubleIsSafeIntegerTwo0073
     * @tc.desc Verify isSafeInteger returns true after division operation resulting in integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(6.0);
      let b: Double = new Double(3.0);
      let result: Double = a.div(b);
      expect(result.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_7500
     * @tc.name testDoubleIsSafeIntegerTwo0075
     * @tc.desc Verify isSafeInteger instance method works correctly for inherited behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.0);
      expect(value.isSafeInteger()).assertTrue();
      let value2: Double = new Double(2.5);
      expect(value2.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_7600
     * @tc.name testDoubleIsSafeIntegerTwo0076
     * @tc.desc Verify instance method and static method isSafeInteger return same result for safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.0);
      let instanceResult: boolean = value.isSafeInteger();
      let staticResult: boolean = Double.isSafeInteger(2.0);
      expect(instanceResult).assertEqual(staticResult);
      expect(instanceResult).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_7700
     * @tc.name testDoubleIsSafeIntegerTwo0077
     * @tc.desc Verify instance method and static method isSafeInteger return same result for non-safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.5);
      let instanceResult: boolean = value.isSafeInteger();
      let staticResult: boolean = Double.isSafeInteger(2.5);
      expect(instanceResult).assertEqual(staticResult);
      expect(instanceResult).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_7800
     * @tc.name testDoubleIsSafeIntegerTwo0078
     * @tc.desc Verify instance method and static method isSafeInteger return same result for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.NaN);
      let instanceResult: boolean = value.isSafeInteger();
      let staticResult: boolean = Double.isSafeInteger(Double.NaN);
      expect(instanceResult).assertEqual(staticResult);
      expect(instanceResult).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_7900
     * @tc.name testDoubleIsSafeIntegerTwo0079
     * @tc.desc Verify instance method and static method isSafeInteger return same result for MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.MAX_SAFE_INTEGER);
      let instanceResult: boolean = value.isSafeInteger();
      let staticResult: boolean = Double.isSafeInteger(Double.MAX_SAFE_INTEGER);
      expect(instanceResult).assertEqual(staticResult);
      expect(instanceResult).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_8000
     * @tc.name testDoubleIsSafeIntegerTwo0080
     * @tc.desc Verify instance method and static method isSafeInteger return same result for MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(Double.MIN_SAFE_INTEGER);
      let instanceResult: boolean = value.isSafeInteger();
      let staticResult: boolean = Double.isSafeInteger(Double.MIN_SAFE_INTEGER);
      expect(instanceResult).assertEqual(staticResult);
      expect(instanceResult).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_8100
     * @tc.name testDoubleIsSafeIntegerTwo0081
     * @tc.desc Verify isSafeInteger returns true implies isInteger also returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(42.0);
      expect(value.isSafeInteger()).assertTrue();
      expect(value.isInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_8200
     * @tc.name testDoubleIsSafeIntegerTwo0082
     * @tc.desc Verify isInteger returns false implies isSafeInteger also returns false for decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(2.5);
      expect(value.isInteger()).assertFalse();
      expect(value.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_8400
     * @tc.name testDoubleIsSafeIntegerTwo0084
     * @tc.desc Verify isSafeInteger returns true after adding two safe integers within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(100.0);
      let b: Double = new Double(200.0);
      let result: Double = a.add(b);
      expect(result.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_8500
     * @tc.name testDoubleIsSafeIntegerTwo0085
     * @tc.desc Verify isSafeInteger returns false after adding two safe integers exceeding range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(9007199254740991.0);
      let b: Double = new Double(1.0);
      let result: Double = a.add(b);
      expect(result.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_8600
     * @tc.name testDoubleIsSafeIntegerTwo0086
     * @tc.desc Verify isSafeInteger returns true after subtracting two safe integers within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(300.0);
      let b: Double = new Double(100.0);
      let result: Double = a.sub(b);
      expect(result.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_8700
     * @tc.name testDoubleIsSafeIntegerTwo0087
     * @tc.desc Verify isSafeInteger returns true after multiplying two safe integers within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(100.0);
      let b: Double = new Double(200.0);
      let result: Double = a.mul(b);
      expect(result.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_8800
     * @tc.name testDoubleIsSafeIntegerTwo0088
     * @tc.desc Verify isSafeInteger returns false after multiplying two safe integers exceeding range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(1e10);
      let b: Double = new Double(1e10);
      let result: Double = a.mul(b);
      expect(result.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_8900
     * @tc.name testDoubleIsSafeIntegerTwo0089
     * @tc.desc Verify isSafeInteger returns true after dividing two safe integers resulting in integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(100.0);
      let b: Double = new Double(25.0);
      let result: Double = a.div(b);
      expect(result.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_9000
     * @tc.name testDoubleIsSafeIntegerTwo0090
     * @tc.desc Verify isSafeInteger returns false after dividing two safe integers resulting in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(10.0);
      let b: Double = new Double(3.0);
      let result: Double = a.div(b);
      expect(result.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_9100
     * @tc.name testDoubleIsSafeIntegerTwo0091
     * @tc.desc Verify isSafeInteger after chained arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(10.0);
      let result: Double = value.add(new Double(5.0)).sub(new Double(3.0));
      expect(result.isSafeInteger()).assertTrue();
      expect(result.toDouble()).assertEqual(12.0);
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_9200
     * @tc.name testDoubleIsSafeIntegerTwo0092
     * @tc.desc Verify isSafeInteger combined with isNaN validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeValue: Double = new Double(42.0);
      expect(safeValue.isSafeInteger()).assertTrue();
      expect(safeValue.isNaN()).assertFalse();

      let nanValue: Double = new Double(Double.NaN);
      expect(nanValue.isSafeInteger()).assertFalse();
      expect(nanValue.isNaN()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2_9300
     * @tc.name testDoubleIsSafeIntegerTwo0093
     * @tc.desc Verify isSafeInteger combined with isFinite validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerTwo0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeValue: Double = new Double(42.0);
      expect(safeValue.isSafeInteger()).assertTrue();
      expect(safeValue.isFinite()).assertTrue();

      let infValue: Double = new Double(Double.POSITIVE_INFINITY);
      expect(infValue.isSafeInteger()).assertFalse();
      expect(infValue.isFinite()).assertFalse();
    });
  });
}
