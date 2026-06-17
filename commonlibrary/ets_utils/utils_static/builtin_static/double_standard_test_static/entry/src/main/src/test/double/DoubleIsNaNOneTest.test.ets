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

export default function DoubleIsNaNOneTest(): void {
  describe('DoubleIsNaNOneTest', (): void => {
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
     * @tc.number DBL_IS_NA_N_0100
     * @tc.name testDoubleIsNaNOne0001
     * @tc.desc Verify calling with 1 required parameter returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(1.0);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_0400
     * @tc.name testDoubleIsNaNOne0004
     * @tc.desc Verify passing positive number 1.5 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(1.5);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_0500
     * @tc.name testDoubleIsNaNOne0005
     * @tc.desc Verify passing negative number -1.5 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(-1.5);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_0600
     * @tc.name testDoubleIsNaNOne0006
     * @tc.desc Verify passing integer 2.0 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(2.0);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_0700
     * @tc.name testDoubleIsNaNOne0007
     * @tc.desc Verify passing 0.0 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(0.0);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_0800
     * @tc.name testDoubleIsNaNOne0008
     * @tc.desc Verify passing -0.0 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(-0.0);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_0900
     * @tc.name testDoubleIsNaNOne0009
     * @tc.desc Verify passing scientific notation 1.0e6 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(1.0e6);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_1000
     * @tc.name testDoubleIsNaNOne0010
     * @tc.desc Verify passing Double.MAX_VALUE returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(Double.MAX_VALUE);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_1100
     * @tc.name testDoubleIsNaNOne0011
     * @tc.desc Verify passing Double.MIN_VALUE returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(Double.MIN_VALUE);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_1200
     * @tc.name testDoubleIsNaNOne0012
     * @tc.desc Verify passing Double.MAX_SAFE_INTEGER returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(Double.MAX_SAFE_INTEGER);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_1300
     * @tc.name testDoubleIsNaNOne0013
     * @tc.desc Verify passing Double.MIN_SAFE_INTEGER returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(Double.MIN_SAFE_INTEGER);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_1400
     * @tc.name testDoubleIsNaNOne0014
     * @tc.desc Verify passing large value 1.7976931348623157e+308 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(1.7976931348623157e+308);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_1500
     * @tc.name testDoubleIsNaNOne0015
     * @tc.desc Verify passing small positive value 5e-324 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(5e-324);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_1600
     * @tc.name testDoubleIsNaNOne0016
     * @tc.desc Verify passing Double.NaN returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(Double.NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_NA_N_1700
     * @tc.name testDoubleIsNaNOne0017
     * @tc.desc Verify passing Double.POSITIVE_INFINITY returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_1800
     * @tc.name testDoubleIsNaNOne0018
     * @tc.desc Verify passing Double.NEGATIVE_INFINITY returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(Double.NEGATIVE_INFINITY);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_1900
     * @tc.name testDoubleIsNaNOne0019
     * @tc.desc Verify passing NaN from 0.0 / 0.0 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nanVal: double = 0.0 / 0.0;
      let result: boolean = Double.isNaN(nanVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_NA_N_2000
     * @tc.name testDoubleIsNaNOne0020
     * @tc.desc Verify passing NaN from Infinity minus Infinity returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nanVal: double = Double.POSITIVE_INFINITY - Double.POSITIVE_INFINITY;
      let result: boolean = Double.isNaN(nanVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_NA_N_2600
     * @tc.name testDoubleIsNaNOne0026
     * @tc.desc Verify passing normal double values returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Double.isNaN(1.0)).assertEqual(false);
      expect(Double.isNaN(-1.0)).assertEqual(false);
      expect(Double.isNaN(0.0)).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_2700
     * @tc.name testDoubleIsNaNOne0027
     * @tc.desc Verify Double.NaN constant returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Double.isNaN(Double.NaN)).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_NA_N_2800
     * @tc.name testDoubleIsNaNOne0028
     * @tc.desc Verify positive infinity is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Double.isNaN(Double.POSITIVE_INFINITY)).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_2900
     * @tc.name testDoubleIsNaNOne0029
     * @tc.desc Verify negative infinity is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Double.isNaN(Double.NEGATIVE_INFINITY)).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_3000
     * @tc.name testDoubleIsNaNOne0030
     * @tc.desc Verify 0.0 and -0.0 are not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Double.isNaN(0.0)).assertEqual(false);
      expect(Double.isNaN(-0.0)).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_3100
     * @tc.name testDoubleIsNaNOne0031
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(1.0);
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number DBL_IS_NA_N_3200
     * @tc.name testDoubleIsNaNOne0032
     * @tc.desc Verify passing NaN returns true with boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = Double.isNaN(Double.NaN);
      expect(result).assertTrue();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number DBL_IS_NA_N_3300
     * @tc.name testDoubleIsNaNOne0033
     * @tc.desc Verify max double value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Double.isNaN(Double.MAX_VALUE)).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_3400
     * @tc.name testDoubleIsNaNOne0034
     * @tc.desc Verify min positive double value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Double.isNaN(Double.MIN_VALUE)).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_NA_N_3500
     * @tc.name testDoubleIsNaNOne0035
     * @tc.desc Verify safe integer boundary values are not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNOne0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Double.isNaN(Double.MAX_SAFE_INTEGER)).assertEqual(false);
      expect(Double.isNaN(Double.MIN_SAFE_INTEGER)).assertEqual(false);
    });

      });
}
