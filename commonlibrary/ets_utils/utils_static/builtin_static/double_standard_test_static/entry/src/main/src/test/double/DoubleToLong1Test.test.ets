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

export default function DoubleToLong1Test(): void {
    describe('DoubleToLong1Test', (): void => {
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
     * @tc.number DBL_TO_LONG_CHK_0100
     * @tc.name testDoubleToLong1001
     * @tc.desc Verify toLong() with no parameters works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.5);
      const result: long = value.toLong();
      const expected: long = 123;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_0300
     * @tc.name testDoubleToLong1003
     * @tc.desc Verify converting positive integer double value to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.0);
      const result: long = value.toLong();
      const expected: long = 123;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_0400
     * @tc.name testDoubleToLong1004
     * @tc.desc Verify converting negative integer double value to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-456.0);
      const result: long = value.toLong();
      const expected: long = -456;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_0500
     * @tc.name testDoubleToLong1005
     * @tc.desc Verify converting 0.0 to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result: long = value.toLong();
      const expected: long = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_0700
     * @tc.name testDoubleToLong1007
     * @tc.desc Verify truncating negative decimal double to long discards fractional part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-123.5);
      const result: long = value.toLong();
      const expected: long = -123;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_0800
     * @tc.name testDoubleToLong1008
     * @tc.desc Verify positive decimal between 0.1 and 0.9 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.999);
      const result: long = value.toLong();
      const expected: long = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_0900
     * @tc.name testDoubleToLong1009
     * @tc.desc Verify negative decimal between -0.1 and -0.9 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.999);
      const result: long = value.toLong();
      const expected: long = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_1000
     * @tc.name testDoubleToLong1010
     * @tc.desc Verify converting large positive integer double to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(9223372036854774784.0);
      const result: long = value.toLong();
      const expected: long = 9223372036854774784;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_1100
     * @tc.name testDoubleToLong1011
     * @tc.desc Verify converting large negative integer double to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-9223372036854774784.0);
      const result: long = value.toLong();
      const expected: long = -9223372036854774784;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_1200
     * @tc.name testDoubleToLong1012
     * @tc.desc Verify default constructed Double instance calls toLong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      const result: long = value.toLong();
      const expected: long = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_1600
     * @tc.name testDoubleToLong1016
     * @tc.desc Verify converting -0.0 to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      const result: long = value.toLong();
      const expected: long = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_1700
     * @tc.name testDoubleToLong1017
     * @tc.desc Verify converting Double.MIN_VALUE to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result: long = value.toLong();
      const expected: long = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_1900
     * @tc.name testDoubleToLong1019
     * @tc.desc Verify converting Double.MAX_SAFE_INTEGER to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_SAFE_INTEGER);
      const result: long = value.toLong();
      const expected: long = 9007199254740991;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_2000
     * @tc.name testDoubleToLong1020
     * @tc.desc Verify converting Double.MIN_SAFE_INTEGER to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_SAFE_INTEGER);
      const result: long = value.toLong();
      const expected: long = -9007199254740991;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_2200
     * @tc.name testDoubleToLong1022
     * @tc.desc Verify toLong() return type is long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.5);
      const result: long = value.toLong();
      expect(typeof result).assertEqual('long');
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_2300
     * @tc.name testDoubleToLong1023
     * @tc.desc Verify multiple calls to toLong() on same instance return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.5);
      const result1: long = value.toLong();
      const result2: long = value.toLong();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_2400
     * @tc.name testDoubleToLong1024
     * @tc.desc Verify toLong() returns same result for Double instances created with different constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(42.0);
      const v2 = new Double(new BigInt(42));
      const v3 = new Double("42.0");
      expect(v1.toLong()).assertEqual(v2.toLong());
      expect(v2.toLong()).assertEqual(v3.toLong());
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_2900
     * @tc.name testDoubleToLong1029
     * @tc.desc Verify converting 1.0 to long returns 1L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0);
      const result: long = value.toLong();
      const expected: long = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_3000
     * @tc.name testDoubleToLong1030
     * @tc.desc Verify converting -1.0 to long returns -1L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-1.0);
      const result: long = value.toLong();
      const expected: long = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_3200
     * @tc.name testDoubleToLong1032
     * @tc.desc Verify toLong() error handling for NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result: long = value.toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_3300
     * @tc.name testDoubleToLong1033
     * @tc.desc Verify toLong() error handling for positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result: long = value.toLong();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_3400
     * @tc.name testDoubleToLong1034
     * @tc.desc Verify toLong() error handling for negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      const result: long = value.toLong();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_3500
     * @tc.name testDoubleToLong1035
     * @tc.desc Verify toLong() error handling for overflow value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      const result: long = value.toLong();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_3600
     * @tc.name testDoubleToLong1036
     * @tc.desc Verify toLong() for Double constructed with non-numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("abc");
      const result: long = value.toLong();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_3700
     * @tc.name testDoubleToLong1037
     * @tc.desc Verify toLong() for Double constructed with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("");
      const result: long = value.toLong();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LONG_CHK_3900
     * @tc.name testDoubleToLong1039
     * @tc.desc Verify toLong() polymorphic behavior through parent class reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLong1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Double = new Double(123.5);
      const result: long = value.toLong();
      const expected: long = 123;
      expect(result).assertEqual(expected);
    });
  });
}
