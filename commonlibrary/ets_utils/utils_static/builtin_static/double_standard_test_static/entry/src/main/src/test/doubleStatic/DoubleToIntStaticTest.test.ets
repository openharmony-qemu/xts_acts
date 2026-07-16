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

export default function DoubleToIntStaticTest(): void {
    describe('DoubleToIntStaticTest', (): void => {
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
     * @tc.number DBL_TO_INT_S_CHK_0100
     * @tc.name testDoubleToInt0001
     * @tc.desc Verify calling toInt with required parameter value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(12.5);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_0400
     * @tc.name testDoubleToInt0004
     * @tc.desc Verify toInt with positive integer double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(100.0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_0500
     * @tc.name testDoubleToInt0005
     * @tc.desc Verify toInt with negative integer double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(-50.0);
      expect(result).assertEqual(-50);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_0600
     * @tc.name testDoubleToInt0006
     * @tc.desc Verify toInt with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_0700
     * @tc.name testDoubleToInt0007
     * @tc.desc Verify toInt with positive decimal truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(12.9);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_0800
     * @tc.name testDoubleToInt0008
     * @tc.desc Verify toInt with negative decimal truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(-12.9);
      expect(result).assertEqual(-12);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_0900
     * @tc.name testDoubleToInt0009
     * @tc.desc Verify toInt with decimal part zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(12.0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_1000
     * @tc.name testDoubleToInt0010
     * @tc.desc Verify toInt with large positive decimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(123456.789);
      expect(result).assertEqual(123456);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_1100
     * @tc.name testDoubleToInt0011
     * @tc.desc Verify toInt with large negative decimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(-123456.789);
      expect(result).assertEqual(-123456);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_1200
     * @tc.name testDoubleToInt0012
     * @tc.desc Verify toInt with small decimal close to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(0.5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_1300
     * @tc.name testDoubleToInt0013
     * @tc.desc Verify toInt with small negative decimal close to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(-0.5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_1400
     * @tc.name testDoubleToInt0014
     * @tc.desc Verify toInt with int max value as double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(2147483647.0);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_1500
     * @tc.name testDoubleToInt0015
     * @tc.desc Verify toInt with int min value as double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(-2147483648.0);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_1600
     * @tc.name testDoubleToInt0016
     * @tc.desc Verify toInt with value just above int max overflow behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(2147483648.0);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_1700
     * @tc.name testDoubleToInt0017
     * @tc.desc Verify toInt with value just below int min overflow behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(-2147483649.0);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_1800
     * @tc.name testDoubleToInt0018
     * @tc.desc Verify toInt with int max plus decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(2147483647.5);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_1900
     * @tc.name testDoubleToInt0019
     * @tc.desc Verify toInt with int min minus decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(-2147483648.5);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_2000
     * @tc.name testDoubleToInt0020
     * @tc.desc Verify toInt with Double.MAX_VALUE extreme large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(Double.MAX_VALUE);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_2100
     * @tc.name testDoubleToInt0021
     * @tc.desc Verify toInt with Double.MIN_VALUE smallest positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(Double.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_2200
     * @tc.name testDoubleToInt0022
     * @tc.desc Verify toInt with Double.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(Double.MAX_SAFE_INTEGER);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_2300
     * @tc.name testDoubleToInt0023
     * @tc.desc Verify toInt with Double.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(Double.MIN_SAFE_INTEGER);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_2400
     * @tc.name testDoubleToInt0024
     * @tc.desc Verify toInt with NaN conversion behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(Double.NaN);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_2500
     * @tc.name testDoubleToInt0025
     * @tc.desc Verify toInt with positive infinity conversion behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_2600
     * @tc.name testDoubleToInt0026
     * @tc.desc Verify toInt with negative infinity conversion behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(Double.NEGATIVE_INFINITY);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_2700
     * @tc.name testDoubleToInt0027
     * @tc.desc Verify toInt with negative zero conversion result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(-0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_2800
     * @tc.name testDoubleToInt0028
     * @tc.desc Verify toInt with scientific notation value 1.0e6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(1.0e6);
      expect(result).assertEqual(1000000);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_2900
     * @tc.name testDoubleToInt0029
     * @tc.desc Verify toInt with scientific notation value 1.5e2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(1.5e2);
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_3000
     * @tc.name testDoubleToInt0030
     * @tc.desc Verify toInt with scientific notation extreme large overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(1.0e20);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_3100
     * @tc.name testDoubleToInt0031
     * @tc.desc Verify toInt with scientific notation extreme small truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(1.0e-10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_3200
     * @tc.name testDoubleToInt0032
     * @tc.desc Verify toInt with null parameter returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: int = Double.toInt(null as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_3300
     * @tc.name testDoubleToInt0033
     * @tc.desc Verify toInt with undefined parameter returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: int = Double.toInt(undefined as double);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_3700
     * @tc.name testDoubleToInt0037
     * @tc.desc Verify positive integer double to int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(42.0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_3800
     * @tc.name testDoubleToInt0038
     * @tc.desc Verify negative integer double to int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(-42.0);
      expect(result).assertEqual(-42);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_4200
     * @tc.name testDoubleToInt0042
     * @tc.desc Verify small positive decimal truncation return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(0.1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_4300
     * @tc.name testDoubleToInt0043
     * @tc.desc Verify small negative decimal truncation return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(-0.1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_4900
     * @tc.name testDoubleToInt0049
     * @tc.desc Verify return value type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(12.5);
      expect(typeof result).assertEqual('int');
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_5000
     * @tc.name testDoubleToInt0050
     * @tc.desc Verify return value has no decimal part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(12.99);
      expect(result === Math.floor(result)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_5600
     * @tc.name testDoubleToInt0056
     * @tc.desc Verify extreme negative overflow return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(-Double.MAX_VALUE);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_5900
     * @tc.name testDoubleToInt0059
     * @tc.desc Verify positive overflow does not throw uncaught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(2147483648.0);
      expect(typeof result).assertEqual('int');
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_6000
     * @tc.name testDoubleToInt0060
     * @tc.desc Verify negative overflow does not throw uncaught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(-2147483649.0);
      expect(typeof result).assertEqual('int');
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_6100
     * @tc.name testDoubleToInt0061
     * @tc.desc Verify NaN does not throw uncaught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(Double.NaN);
      expect(typeof result).assertEqual('int');
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_6200
     * @tc.name testDoubleToInt0062
     * @tc.desc Verify positive infinity does not throw uncaught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(Double.POSITIVE_INFINITY);
      expect(typeof result).assertEqual('int');
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_6300
     * @tc.name testDoubleToInt0063
     * @tc.desc Verify negative infinity does not throw uncaught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Double.toInt(Double.NEGATIVE_INFINITY);
      expect(typeof result).assertEqual('int');
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_6400
     * @tc.name testDoubleToInt0064
     * @tc.desc Verify Double.toInt converts value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Double.toInt(12.5);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_6500
     * @tc.name testDoubleToInt0065
     * @tc.desc Verify finally block executes after catch on error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted: boolean = false;
      try {
        let result: int = Double.toInt(null as double);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_6900
     * @tc.name testDoubleToInt0069
     * @tc.desc Verify native method returns consistent results on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: int = Double.toInt(12.5);
      let result2: int = Double.toInt(12.5);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_7000
     * @tc.name testDoubleToInt0070
     * @tc.desc Verify static and instance method consistent result for same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticResult: int = Double.toInt(123.5);
      let instance = new Double(123.5);
      let instanceResult: int = instance.toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_7100
     * @tc.name testDoubleToInt0071
     * @tc.desc Verify static and instance method consistent result for zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticResult: int = Double.toInt(0.0);
      let instance = new Double(0.0);
      let instanceResult: int = instance.toInt();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number DBL_TO_INT_S_CHK_7200
     * @tc.name testDoubleToInt0072
     * @tc.desc Verify static and instance method consistent result for negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToInt0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticResult: int = Double.toInt(-99.9);
      let instance = new Double(-99.9);
      let instanceResult: int = instance.toInt();
      expect(staticResult).assertEqual(instanceResult);
    });
  });
}
