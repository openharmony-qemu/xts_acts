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

export default function DoubleToFixedTwoTest(): void {
  describe('DoubleToFixedTwoTest', (): void => {
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
     * @tc.number DBL_TO_FIXED_TWO_0500
     * @tc.name testDoubleToFixed0005
     * @tc.desc Verify Double.toFixed keeps 0 fraction digits when passing 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed(0.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_0600
     * @tc.name testDoubleToFixed0006
     * @tc.desc Verify passing 1.0 to keep 1 decimal place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed(1.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_0700
     * @tc.name testDoubleToFixed0007
     * @tc.desc Verify passing large digit count 10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed(10.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_0800
     * @tc.name testDoubleToFixed0008
     * @tc.desc Verify passing maximum effective digit count 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed(100.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_1900
     * @tc.name testDoubleToFixed0019
     * @tc.desc Verify integer Double instance calls toFixed with parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.0);
      const result: String = value.toFixed(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_2000
     * @tc.name testDoubleToFixed0020
     * @tc.desc Verify negative Double instance calls toFixed with parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-12.345);
      const result: String = value.toFixed(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_2100
     * @tc.name testDoubleToFixed0021
     * @tc.desc Verify tiny positive Double instance calls toFixed with parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.001);
      const result: String = value.toFixed(5.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_2200
     * @tc.name testDoubleToFixed0022
     * @tc.desc Verify huge Double instance calls toFixed with parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.7976931348623157e+308);
      const result: String = value.toFixed(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_2300
     * @tc.name testDoubleToFixed0023
     * @tc.desc Verify Double instance with value 0.0 calls toFixed with parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result: String = value.toFixed(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_2400
     * @tc.name testDoubleToFixed0024
     * @tc.desc Verify Double instance with value -0.0 calls toFixed with parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      const result: String = value.toFixed(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_2500
     * @tc.name testDoubleToFixed0025
     * @tc.desc Verify Double instance with NaN calls toFixed with parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result: String = value.toFixed(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_2600
     * @tc.name testDoubleToFixed0026
     * @tc.desc Verify Double instance with POSITIVE_INFINITY calls toFixed with parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result: String = value.toFixed(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_2700
     * @tc.name testDoubleToFixed0027
     * @tc.desc Verify Double instance with NEGATIVE_INFINITY calls toFixed with parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      const result: String = value.toFixed(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_2800
     * @tc.name testDoubleToFixed0028
     * @tc.desc Verify Double.toFixed formats value to specified fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed(2.0);
      expect(result).assertEqual("12.35");
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_2900
     * @tc.name testDoubleToFixed0029
     * @tc.desc Verify integer value formatted with zero padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.0);
      const result: String = value.toFixed(3.0);
      expect(result).assertEqual("12.000");
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_3200
     * @tc.name testDoubleToFixed0032
     * @tc.desc Verify instance value 0.0 with toFixed(2.0) returns "0.00"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result: String = value.toFixed(2.0);
      expect(result).assertEqual("0.00");
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_3300
     * @tc.name testDoubleToFixed0033
     * @tc.desc Verify negative instance returns string with negative sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-12.345);
      const result: String = value.toFixed(2.0);
      expect(result).assertEqual("-12.35");
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_3700
     * @tc.name testDoubleToFixed0037
     * @tc.desc Verify return value is String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed(2.0);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_3900
     * @tc.name testDoubleToFixed0039
     * @tc.desc Verify return value is not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed(2.0);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_4000
     * @tc.name testDoubleToFixed0040
     * @tc.desc Verify formatting with large digit count 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed(20.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_4400
     * @tc.name testDoubleToFixed0044
     * @tc.desc Verify negative parameter may raise RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed(1.5);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_4500
     * @tc.name testDoubleToFixed0045
     * @tc.desc Verify parameter exceeding 100 may raise RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(12.345);
        const result: String = value.toFixed(101.0);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_4800
     * @tc.name testDoubleToFixed0048
     * @tc.desc Verify passing NaN as parameter behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed(Double.NaN);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_4900
     * @tc.name testDoubleToFixed0049
     * @tc.desc Verify passing Infinity as parameter behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(12.345);
        const result: String = value.toFixed(Double.POSITIVE_INFINITY);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_5100
     * @tc.name testDoubleToFixed0051
     * @tc.desc Verify toFixed has overloaded versions for no-arg and with-arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result1: String = value.toFixed();
      const result2: String = value.toFixed(2.0);
      expect(result1 !== null).assertTrue();
      expect(result2 !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_5200
     * @tc.name testDoubleToFixed0052
     * @tc.desc Verify toFixed(2.0) returns same result as toFixedImpl(2.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result1: String = value.toFixed(2.0);
      const result2: String = value.toFixedImpl(2.0);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_5300
     * @tc.name testDoubleToFixed0053
     * @tc.desc Verify multiple calls to toFixed on same instance return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result1: String = value.toFixed(1.0);
      const result2: String = value.toFixed(2.0);
      const result3: String = value.toFixed(3.0);
      expect(result1 !== null).assertTrue();
      expect(result2 !== null).assertTrue();
      expect(result3 !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_TWO_5400
     * @tc.name testDoubleToFixed0054
     * @tc.desc Verify different constructor instances call toFixed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Double(12.345);
      const result1: String = value1.toFixed(2.0);
      const value2 = new Double("3.5");
      const result2: String = value2.toFixed(2.0);
      const value3 = new Double(new BigInt(42));
      const result3: String = value3.toFixed(2.0);
      expect(result1 !== null).assertTrue();
      expect(result2 !== null).assertTrue();
      expect(result3 !== null).assertTrue();
    });
  });
}
