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

class TestError083 extends Error {
  constructor(message: string) {
    super(message);
    this.name = "TestError";
  }
}

export default function DoubleToFixedImplTest(): void {
  describe('DoubleToFixedImplTest', (): void => {
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
     * @tc.number DBL_TO_FIXED_IMPL_0100
     * @tc.name testDoubleToFixedImpl0001
     * @tc.desc Verify calling with one required parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(2.0);
      expect(result).assertEqual("12.35");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_0200
     * @tc.name testDoubleToFixedImpl0002
     * @tc.desc Verify expected behavior or runtime exception when parameter d is missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_0400
     * @tc.name testDoubleToFixedImpl0004
     * @tc.desc Verify Double.toFixedImpl keeps 0 fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(0.0);
      expect(result).assertEqual("12");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_0500
     * @tc.name testDoubleToFixedImpl0005
     * @tc.desc Verify d=1.0 keeps 1 decimal place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(1.0);
      expect(result).assertEqual("12.3");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_0700
     * @tc.name testDoubleToFixedImpl0007
     * @tc.desc Verify Double.toFixedImpl keeps 10 fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(10.0);
      expect(result !== null).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_0800
     * @tc.name testDoubleToFixedImpl0008
     * @tc.desc Verify Double.toFixedImpl keeps 50 fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(50.0);
      expect(result !== null).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_0900
     * @tc.name testDoubleToFixedImpl0009
     * @tc.desc Verify Double.toFixedImpl keeps 99 fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(99.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_1000
     * @tc.name testDoubleToFixedImpl0010
     * @tc.desc Verify Double.toFixedImpl keeps 100 fraction digits as upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(100.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_1200
     * @tc.name testDoubleToFixedImpl0012
     * @tc.desc Verify Double.toFixedImpl(100) as upper bound with maximum fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0);
      const result = value.toFixedImpl(100.0);
      expect(result !== null).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_1300
     * @tc.name testDoubleToFixedImpl0013
     * @tc.desc Verify d=-1.0 is below valid range lower bound 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(-1.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_1400
     * @tc.name testDoubleToFixedImpl0014
     * @tc.desc Verify d=-0.1 as small negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(-0.1);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_1500
     * @tc.name testDoubleToFixedImpl0015
     * @tc.desc Verify d=-100.0 as large negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(-100.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_1600
     * @tc.name testDoubleToFixedImpl0016
     * @tc.desc Verify d=101.0 exceeds valid range upper bound 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(12.345);
        const result = value.toFixedImpl(101.0);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_1700
     * @tc.name testDoubleToFixedImpl0017
     * @tc.desc Verify d=100.1 slightly exceeds upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(100.1);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_1800
     * @tc.name testDoubleToFixedImpl0018
     * @tc.desc Verify d=1000.0 far exceeds valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(12.345);
        const result = value.toFixedImpl(1000.0);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_1900
     * @tc.name testDoubleToFixedImpl0019
     * @tc.desc Verify d=1e6 as scientific notation large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(12.345);
        const result = value.toFixedImpl(1e6);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_2000
     * @tc.name testDoubleToFixedImpl0020
     * @tc.desc Verify Double.toFixedImpl handles non-integer fraction digits within valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(0.5);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_2300
     * @tc.name testDoubleToFixedImpl0023
     * @tc.desc Verify d=100.5 as non-integer exceeding upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(100.5);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_2400
     * @tc.name testDoubleToFixedImpl0024
     * @tc.desc Verify d=NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(Double.NaN);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_2500
     * @tc.name testDoubleToFixedImpl0025
     * @tc.desc Verify d=POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(12.345);
        const result = value.toFixedImpl(Double.POSITIVE_INFINITY);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_2600
     * @tc.name testDoubleToFixedImpl0026
     * @tc.desc Verify d=NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(12.345);
        const result = value.toFixedImpl(Double.NEGATIVE_INFINITY);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_2700
     * @tc.name testDoubleToFixedImpl0027
     * @tc.desc Verify d=-0.0 equals 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(0.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_2800
     * @tc.name testDoubleToFixedImpl0028
     * @tc.desc Verify d=MIN_VALUE as smallest positive double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(Double.MIN_VALUE);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_2900
     * @tc.name testDoubleToFixedImpl0029
     * @tc.desc Verify d=MAX_VALUE exceeds valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(12.345);
        const result = value.toFixedImpl(Double.MAX_VALUE);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_3000
     * @tc.name testDoubleToFixedImpl0030
     * @tc.desc Verify d=DELTA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(Double.DELTA);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_3100
     * @tc.name testDoubleToFixedImpl0031
     * @tc.desc Verify d=EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(Double.EPSILON);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_3200
     * @tc.name testDoubleToFixedImpl0032
     * @tc.desc Verify d=1e1 as scientific notation 10.0 within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(10.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_3400
     * @tc.name testDoubleToFixedImpl0034
     * @tc.desc Verify d=1e3 as scientific notation 1000.0 exceeds range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(12.345);
        const result = value.toFixedImpl(1e3);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_3700
     * @tc.name testDoubleToFixedImpl0037
     * @tc.desc Verify truncation when last digit does not need carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.344);
      const result = value.toFixedImpl(2.0);
      expect(result).assertEqual("12.34");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_3800
     * @tc.name testDoubleToFixedImpl0038
     * @tc.desc Verify banker's rounding with middle digit 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.005);
      const result = value.toFixedImpl(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_4000
     * @tc.name testDoubleToFixedImpl0040
     * @tc.desc Verify d=0.0 with negative number rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-12.6);
      const result = value.toFixedImpl(0.0);
      expect(result).assertEqual("-13");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_4100
     * @tc.name testDoubleToFixedImpl0041
     * @tc.desc Verify Double.toFixedImpl returns exactly 3 fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.34567);
      const result = value.toFixedImpl(3.0);
      expect(result).assertEqual("12.346");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_4200
     * @tc.name testDoubleToFixedImpl0042
     * @tc.desc Verify Double.toFixedImpl returns correct result with five fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.3);
      const result = value.toFixedImpl(5.0);
      expect(result).assertEqual("12.30000");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_4300
     * @tc.name testDoubleToFixedImpl0043
     * @tc.desc Verify instance value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result = value.toFixedImpl(2.0);
      expect(result).assertEqual("0.00");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_4400
     * @tc.name testDoubleToFixedImpl0044
     * @tc.desc Verify negative instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-12.345);
      const result = value.toFixedImpl(2.0);
      expect(result).assertEqual("-12.35");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_4500
     * @tc.name testDoubleToFixedImpl0045
     * @tc.desc Verify positive integer instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(100.0);
      const result = value.toFixedImpl(2.0);
      expect(result).assertEqual("100.00");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_4600
     * @tc.name testDoubleToFixedImpl0046
     * @tc.desc Verify negative integer instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-100.0);
      const result = value.toFixedImpl(2.0);
      expect(result).assertEqual("-100.00");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_4700
     * @tc.name testDoubleToFixedImpl0047
     * @tc.desc Verify very large instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1e20);
      const result = value.toFixedImpl(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_4800
     * @tc.name testDoubleToFixedImpl0048
     * @tc.desc Verify very small positive instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.001);
      const result = value.toFixedImpl(2.0);
      expect(result).assertEqual("0.00");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_4900
     * @tc.name testDoubleToFixedImpl0049
     * @tc.desc Verify very small positive instance value with large d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.001);
      const result = value.toFixedImpl(5.0);
      expect(result).assertEqual("0.00100");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_5000
     * @tc.name testDoubleToFixedImpl0050
     * @tc.desc Verify NaN instance returns "NaN" string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result = value.toFixedImpl(2.0);
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_5100
     * @tc.name testDoubleToFixedImpl0051
     * @tc.desc Verify NaN instance with d=0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result = value.toFixedImpl(0.0);
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_5200
     * @tc.name testDoubleToFixedImpl0052
     * @tc.desc Verify POSITIVE_INFINITY instance returns "Infinity" string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result = value.toFixedImpl(2.0);
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_5300
     * @tc.name testDoubleToFixedImpl0053
     * @tc.desc Verify NEGATIVE_INFINITY instance returns "-Infinity" string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      const result = value.toFixedImpl(2.0);
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_5400
     * @tc.name testDoubleToFixedImpl0054
     * @tc.desc Verify Infinity instance with d=0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result = value.toFixedImpl(0.0);
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_5500
     * @tc.name testDoubleToFixedImpl0055
     * @tc.desc Verify instance value -0.0 return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      const result = value.toFixedImpl(2.0);
      expect(result).assertEqual("-0.00");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_5600
     * @tc.name testDoubleToFixedImpl0056
     * @tc.desc Verify instance value -0.0 with d=0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      const result = value.toFixedImpl(0.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_5700
     * @tc.name testDoubleToFixedImpl0057
     * @tc.desc Verify return type is String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(2.0);
      expect(result !== null).assertTrue();
      expect(typeof result === "string" || result instanceof String).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_5800
     * @tc.name testDoubleToFixedImpl0058
     * @tc.desc Verify return value is not null and not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(2.0);
      expect(result !== null).assertTrue();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_5900
     * @tc.name testDoubleToFixedImpl0059
     * @tc.desc Verify return value is valid numeric string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(2.0);
      expect(result).assertEqual("12.35");
      expect(result.indexOf(".")).assertEqual(result.length - 3);
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_6000
     * @tc.name testDoubleToFixedImpl0060
     * @tc.desc Verify MAX_VALUE instance with d=0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      const result = value.toFixedImpl(0.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_6100
     * @tc.name testDoubleToFixedImpl0061
     * @tc.desc Verify MAX_VALUE instance with d=2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      const result = value.toFixedImpl(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_6200
     * @tc.name testDoubleToFixedImpl0062
     * @tc.desc Verify MIN_VALUE instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result = value.toFixedImpl(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_6300
     * @tc.name testDoubleToFixedImpl0063
     * @tc.desc Verify MIN_VALUE instance with d=100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result = value.toFixedImpl(100.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_6400
     * @tc.name testDoubleToFixedImpl0064
     * @tc.desc Verify MAX_SAFE_INTEGER instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_SAFE_INTEGER);
      const result = value.toFixedImpl(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_6500
     * @tc.name testDoubleToFixedImpl0065
     * @tc.desc Verify MIN_SAFE_INTEGER instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_SAFE_INTEGER);
      const result = value.toFixedImpl(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_6600
     * @tc.name testDoubleToFixedImpl0066
     * @tc.desc Verify same instance returns same result on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result1 = value.toFixedImpl(2.0);
      const result2 = value.toFixedImpl(2.0);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_6700
     * @tc.name testDoubleToFixedImpl0067
     * @tc.desc Verify two Double instances with same value return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Double(12.345);
      const value2 = new Double(12.345);
      const result1 = value1.toFixedImpl(2.0);
      const result2 = value2.toFixedImpl(2.0);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_7100
     * @tc.name testDoubleToFixedImpl0071
     * @tc.desc Verify error thrown when d=101.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(12.345);
        value.toFixedImpl(101.0);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_7300
     * @tc.name testDoubleToFixedImpl0073
     * @tc.desc Verify error thrown when d=1000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(12.345);
        value.toFixedImpl(1000.0);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_7700
     * @tc.name testDoubleToFixedImpl0077
     * @tc.desc Verify error handling when d=MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(12.345);
        value.toFixedImpl(Double.MAX_VALUE);
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_7900
     * @tc.name testDoubleToFixedImpl0079
     * @tc.desc Verify catch captures exception when passing invalid parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(1.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_8000
     * @tc.name testDoubleToFixedImpl0080
     * @tc.desc Verify toFixedImpl returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixedImpl(2.0);
      expect(result).assertEqual("12.35");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_8200
     * @tc.name testDoubleToFixedImpl0082
     * @tc.desc Verify caught error object has correct properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result = value.toFixedImpl(1.0);
      expect(result !== null).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_8300
     * @tc.name testDoubleToFixedImpl0083
     * @tc.desc Verify Error constructor creates error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new TestError083("test error");
      } catch (error) {
        expect(error.name).assertEqual("TestError");
        expect(error.message).assertEqual("test error");
      }
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_8500
     * @tc.name testDoubleToFixedImpl0085
     * @tc.desc Verify toFixedImpl method exists on Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      expect(value.toFixedImpl !== null).assertTrue();
      expect(typeof value.toFixedImpl).assertEqual("function");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_8600
     * @tc.name testDoubleToFixedImpl0086
     * @tc.desc Verify native method returns consistent results on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      for (let i = 0; i < 100; i++) {
        const result = value.toFixedImpl(2.0);
        expect(result).assertEqual("12.35");
      }
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_8800
     * @tc.name testDoubleToFixedImpl0088
     * @tc.desc Verify integer value with d=0.0 returns integer part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(100.0);
      const result = value.toFixedImpl(0.0);
      expect(result).assertEqual("100");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_8900
     * @tc.name testDoubleToFixedImpl0089
     * @tc.desc Verify decimal value with d=0.0 rounds to integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.6);
      const result = value.toFixedImpl(0.0);
      expect(result).assertEqual("13");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_9200
     * @tc.name testDoubleToFixedImpl0092
     * @tc.desc Verify NaN value with d=100.0 still returns "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result = value.toFixedImpl(100.0);
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_9300
     * @tc.name testDoubleToFixedImpl0093
     * @tc.desc Verify Infinity value with d=100.0 still returns "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result = value.toFixedImpl(100.0);
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_9400
     * @tc.name testDoubleToFixedImpl0094
     * @tc.desc Verify instance value 0.0 with d=0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result = value.toFixedImpl(0.0);
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_9500
     * @tc.name testDoubleToFixedImpl0095
     * @tc.desc Verify instance MIN_VALUE with d=50.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result = value.toFixedImpl(50.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_IMPL_9700
     * @tc.name testDoubleToFixedImpl0097
     * @tc.desc Verify negative instance value rounding boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixedImpl0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.5);
      const result = value.toFixedImpl(0.0);
      expect(result !== null).assertTrue();
    });
  });
}
