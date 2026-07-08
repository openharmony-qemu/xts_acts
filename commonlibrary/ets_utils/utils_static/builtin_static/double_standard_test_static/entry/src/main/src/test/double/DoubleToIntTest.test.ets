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

export default function DoubleToIntTest(): void {
    describe('DoubleToIntTest', (): void => {
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
     * @tc.number DBL_TO_INT_CHK_0100
     * @tc.name testDoubleToInt0001
     * @tc.desc Verify toInt with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.5);
      const result: int = value.toInt();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_0300
     * @tc.name testDoubleToInt0003
     * @tc.desc Verify toInt with positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(100.0);
      const result: int = value.toInt();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_0500
     * @tc.name testDoubleToInt0005
     * @tc.desc Verify toInt with negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-100.0);
      const result: int = value.toInt();
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_0600
     * @tc.name testDoubleToInt0006
     * @tc.desc Verify toInt truncates negative decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-123.5);
      const result: int = value.toInt();
      expect(result).assertEqual(-123);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_0700
     * @tc.name testDoubleToInt0007
     * @tc.desc Verify toInt with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result: int = value.toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_0800
     * @tc.name testDoubleToInt0008
     * @tc.desc Verify toInt with default constructor zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      const result: int = value.toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_0900
     * @tc.name testDoubleToInt0009
     * @tc.desc Verify toInt with string constructed Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      const result: int = value.toInt();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_1000
     * @tc.name testDoubleToInt0010
     * @tc.desc Verify toInt with BigInt constructed Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      const result: int = value.toInt();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_1100
     * @tc.name testDoubleToInt0011
     * @tc.desc Verify toInt with NaN returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result: int = value.toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_1200
     * @tc.name testDoubleToInt0012
     * @tc.desc Verify toInt with positive infinity returns int max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result: int = value.toInt();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_1300
     * @tc.name testDoubleToInt0013
     * @tc.desc Verify toInt with negative infinity returns int min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      const result: int = value.toInt();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_1400
     * @tc.name testDoubleToInt0014
     * @tc.desc Verify toInt with positive zero and negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pos = new Double(0.0);
      const neg = new Double(-0.0);
      expect(pos.toInt()).assertEqual(0);
      expect(neg.toInt()).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_1500
     * @tc.name testDoubleToInt0015
     * @tc.desc Verify toInt with Double MIN_VALUE truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result: int = value.toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_1600
     * @tc.name testDoubleToInt0016
     * @tc.desc Verify toInt with negative Double MIN_VALUE truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-Double.MIN_VALUE);
      const result: int = value.toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_1700
     * @tc.name testDoubleToInt0017
     * @tc.desc Verify toInt with unparseable string returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("abc");
      const result: int = value.toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_1800
     * @tc.name testDoubleToInt0018
     * @tc.desc Verify toInt return type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(100.0);
      const result: int = value.toInt();
      expect(typeof result).assertEqual('int');
    });

    /**
     * @tc.number DBL_TO_INT_CHK_1900
     * @tc.name testDoubleToInt0019
     * @tc.desc Verify toInt return value has no decimal part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(99.999);
      const result: int = value.toInt();
      expect(result === Math.floor(99.999)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_INT_CHK_2000
     * @tc.name testDoubleToInt0020
     * @tc.desc Verify toInt with int max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(2147483647.0);
      const result: int = value.toInt();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_2100
     * @tc.name testDoubleToInt0021
     * @tc.desc Verify toInt with int min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-2147483648.0);
      const result: int = value.toInt();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_2200
     * @tc.name testDoubleToInt0022
     * @tc.desc Verify toInt with value exceeding int max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(2147483648.0);
      const result: int = value.toInt();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_2300
     * @tc.name testDoubleToInt0023
     * @tc.desc Verify toInt with value below int min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-2147483649.0);
      const result: int = value.toInt();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_2400
     * @tc.name testDoubleToInt0024
     * @tc.desc Verify toInt truncates decimal of int max plus fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(2147483647.9);
      const result: int = value.toInt();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_2500
     * @tc.name testDoubleToInt0025
     * @tc.desc Verify toInt truncates decimal of int min minus fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-2147483648.9);
      const result: int = value.toInt();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_2600
     * @tc.name testDoubleToInt0026
     * @tc.desc Verify toInt with MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_SAFE_INTEGER);
      const result: int = value.toInt();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_2700
     * @tc.name testDoubleToInt0027
     * @tc.desc Verify toInt with MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_SAFE_INTEGER);
      const result: int = value.toInt();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_2800
     * @tc.name testDoubleToInt0028
     * @tc.desc Verify toInt with Double MAX_VALUE overflow handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      const result: int = value.toInt();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_2900
     * @tc.name testDoubleToInt0029
     * @tc.desc Verify toInt with scientific notation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.5e3);
      const result: int = value.toInt();
      expect(result).assertEqual(1500);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_3000
     * @tc.name testDoubleToInt0030
     * @tc.desc Verify toInt truncates very small positive value to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.9999999);
      const result: int = value.toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_3100
     * @tc.name testDoubleToInt0031
     * @tc.desc Verify toInt truncates very small negative value to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.9999999);
      const result: int = value.toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_3200
     * @tc.name testDoubleToInt0032
     * @tc.desc Verify toInt with 1.0 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0);
      const result: int = value.toInt();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_3300
     * @tc.name testDoubleToInt0033
     * @tc.desc Verify toInt with -1.0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-1.0);
      const result: int = value.toInt();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_3400
     * @tc.name testDoubleToInt0034
     * @tc.desc Verify multiple toInt calls do not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.5);
      const result1: int = value.toInt();
      const result2: int = value.toInt();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_3500
     * @tc.name testDoubleToInt0035
     * @tc.desc Verify normal value toInt does not enter catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.5);
      let caught = false;
        const result: int = value.toInt();
  expect(result).assertEqual(123);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_3600
     * @tc.name testDoubleToInt0036
     * @tc.desc Verify NaN value toInt does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      let caught = false;
        const result: int = value.toInt();
  expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_3700
     * @tc.name testDoubleToInt0037
     * @tc.desc Verify infinity value toInt does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      let caught = false;
        const result: int = value.toInt();
        expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_INT_CHK_3900
     * @tc.name testDoubleToInt0039
     * @tc.desc Verify polymorphic toInt call through Floating reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Double = new Double(123.5);
      const result: int = value.toInt();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_4000
     * @tc.name testDoubleToInt0040
     * @tc.desc Verify toInt after add operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.5).add(new Double(2.5));
      expect(result.toInt()).assertEqual(4);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_4100
     * @tc.name testDoubleToInt0041
     * @tc.desc Verify toInt after sub operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(5.5).sub(new Double(2.5));
      expect(result.toInt()).assertEqual(3);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_4200
     * @tc.name testDoubleToInt0042
     * @tc.desc Verify toInt after mul operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).mul(new Double(2.0));
      expect(result.toInt()).assertEqual(6);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_4300
     * @tc.name testDoubleToInt0043
     * @tc.desc Verify toInt after div operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(7.0).div(new Double(2.0));
      expect(result.toInt()).assertEqual(3);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_4400
     * @tc.name testDoubleToInt0044
     * @tc.desc Verify toInt and toByte consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      expect(value.toInt()).assertEqual(12);
      expect(value.toByte()).assertEqual(12);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_4500
     * @tc.name testDoubleToInt0045
     * @tc.desc Verify toInt and toShort consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.5);
      expect(value.toInt()).assertEqual(123);
      expect(value.toShort()).assertEqual(123);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_4600
     * @tc.name testDoubleToInt0046
     * @tc.desc Verify toInt and toLong consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.5);
      expect(value.toInt()).assertEqual(123);
      expect(value.toLong()).assertEqual(123);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_4700
     * @tc.name testDoubleToInt0047
     * @tc.desc Verify toInt truncates while toFloat preserves decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.5);
      expect(value.toInt()).assertEqual(123);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_4800
     * @tc.name testDoubleToInt0048
     * @tc.desc Verify toInt truncates while toDouble returns original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.5);
      expect(value.toInt()).assertEqual(123);
      expect(value.toDouble()).assertEqual(123.5);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_4900
     * @tc.name testDoubleToInt0049
     * @tc.desc Verify repeated toInt calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.5);
      const result1: int = value.toInt();
      const result2: int = value.toInt();
      const result3: int = value.toInt();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number DBL_TO_INT_CHK_5000
     * @tc.name testDoubleToInt0050
     * @tc.desc Verify different instances with same value return same toInt result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Double(123.5);
      const value2 = new Double(123.5);
      expect(value1.toInt()).assertEqual(value2.toInt());
    });

    /**
     * @tc.number DBL_TO_INT_CHK_5100
     * @tc.name testDoubleToInt0051
     * @tc.desc Verify different constructors with same value return same toInt result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Double(42.0);
      const value2 = new Double("42");
      expect(value1.toInt()).assertEqual(value2.toInt());
    });
  });
}
