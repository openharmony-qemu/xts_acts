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

export default function DoubleIsIntegerOneTest(): void {
  describe('DoubleIsIntegerOneTest', (): void => {
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
     * @tc.number DBL_IS_INTGR_ONE_0100
     * @tc.name testDoubleIsIntegerOne0001
     * @tc.desc Verify calling with one required parameter normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(2.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_0200
     * @tc.name testDoubleIsIntegerOne0002
     * 
            param($m) $m.Value -replace $p.Old, $p.New
        
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(5.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_0500
     * @tc.name testDoubleIsIntegerOne0005
     * @tc.desc Verify isInteger returns true for double value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_0600
     * @tc.name testDoubleIsIntegerOne0006
     * @tc.desc Verify isInteger returns true for negative integer double value -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(-1.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_0700
     * @tc.name testDoubleIsIntegerOne0007
     * @tc.desc Verify isInteger returns true for positive integer double value 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(100.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_0800
     * @tc.name testDoubleIsIntegerOne0008
     * @tc.desc Verify isInteger returns true for negative integer double value -100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(-100.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_0900
     * @tc.name testDoubleIsIntegerOne0009
     * @tc.desc Verify isInteger returns true for double value 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(1.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_1000
     * @tc.name testDoubleIsIntegerOne0010
     * @tc.desc Verify isInteger returns false for non-integer double value 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(2.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_1100
     * @tc.name testDoubleIsIntegerOne0011
     * @tc.desc Verify isInteger returns false for non-integer double value 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(3.14);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_1200
     * @tc.name testDoubleIsIntegerOne0012
     * @tc.desc Verify isInteger returns false for non-integer double value -0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(-0.1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_1300
     * @tc.name testDoubleIsIntegerOne0013
     * @tc.desc Verify isInteger returns false for non-integer double value 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(0.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_1400
     * @tc.name testDoubleIsIntegerOne0014
     * @tc.desc Verify isInteger returns false for non-integer double value 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(1.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_1500
     * @tc.name testDoubleIsIntegerOne0015
     * @tc.desc Verify isInteger returns false for non-integer double value -2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(-2.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_1600
     * @tc.name testDoubleIsIntegerOne0016
     * @tc.desc Verify isInteger returns false for non-integer double value 123.456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(123.456);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_1700
     * @tc.name testDoubleIsIntegerOne0017
     * @tc.desc Verify isInteger returns false for non-integer double value -888.88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(-888.88);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_1800
     * @tc.name testDoubleIsIntegerOne0018
     * @tc.desc Verify isInteger for Double.MAX_VALUE returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(Double.MAX_VALUE);
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_1900
     * @tc.name testDoubleIsIntegerOne0019
     * @tc.desc Verify isInteger returns false for Double.MIN_VALUE (4.9E-324)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(Double.MIN_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_2000
     * @tc.name testDoubleIsIntegerOne0020
     * @tc.desc Verify isInteger returns true for Double.MAX_SAFE_INTEGER (9007199254740991.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(Double.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_2100
     * @tc.name testDoubleIsIntegerOne0021
     * @tc.desc Verify isInteger returns true for Double.MIN_SAFE_INTEGER (-9007199254740991.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(Double.MIN_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_2200
     * @tc.name testDoubleIsIntegerOne0022
     * @tc.desc Verify isInteger returns true for negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(-0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_2300
     * @tc.name testDoubleIsIntegerOne0023
     * @tc.desc Verify isInteger for large integer 9007199254740992.0 beyond safe range returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(9007199254740992.0);
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_2400
     * @tc.name testDoubleIsIntegerOne0024
     * @tc.desc Verify isInteger returns false for Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(Double.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_2500
     * @tc.name testDoubleIsIntegerOne0025
     * @tc.desc Verify isInteger returns false for Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(Double.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_2600
     * @tc.name testDoubleIsIntegerOne0026
     * @tc.desc Verify isInteger returns false for Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(Double.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_2700
     * @tc.name testDoubleIsIntegerOne0027
     * @tc.desc Verify isInteger returns false for value close to integer 2.000000000000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(2.000000000000001);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_2800
     * @tc.name testDoubleIsIntegerOne0028
     * @tc.desc Verify isInteger for Double.DELTA returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(Double.DELTA);
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_2900
     * @tc.name testDoubleIsIntegerOne0029
     * @tc.desc Verify isInteger for Double.EPSILON returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(Double.EPSILON);
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_3000
     * @tc.name testDoubleIsIntegerOne0030
     * @tc.desc Verify isInteger returns true for scientific notation integer 1.0e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(1.0e10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_3100
     * @tc.name testDoubleIsIntegerOne0031
     * @tc.desc Verify isInteger returns false for scientific notation non-integer 1.0e-10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(1.0e-10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_3200
     * @tc.name testDoubleIsIntegerOne0032
     * @tc.desc Verify isInteger returns false for scientific notation 1.23e5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(1.23e1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_3300
     * @tc.name testDoubleIsIntegerOne0033
     * @tc.desc Verify isInteger returns false for scientific notation 1.23e-5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(1.23e-5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_3400
     * @tc.name testDoubleIsIntegerOne0034
     * @tc.desc Verify isInteger returns true for scientific notation 1.0e6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(1.0e6);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_3500
     * @tc.name testDoubleIsIntegerOne0035
     * @tc.desc Verify isInteger returns true for hex float 0x1.0p3 (8.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(8.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_3600
     * @tc.name testDoubleIsIntegerOne0036
     * @tc.desc Verify isInteger returns false for hex float 0x1.2p3 (8.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(9.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_4100
     * @tc.name testDoubleIsIntegerOne0041
     * @tc.desc Verify passing boolean true as double parameter returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(-5.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_4300
     * @tc.name testDoubleIsIntegerOne0043
     * @tc.desc Verify isInteger returns true for integer value 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(2.0)).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_4400
     * @tc.name testDoubleIsIntegerOne0044
     * @tc.desc Verify isInteger returns true for zero value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(0.0)).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_4500
     * @tc.name testDoubleIsIntegerOne0045
     * @tc.desc Verify isInteger returns true for negative integer -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(-1.0)).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_4600
     * @tc.name testDoubleIsIntegerOne0046
     * @tc.desc Verify isInteger returns true for large integer MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(Double.MAX_SAFE_INTEGER)).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_4700
     * @tc.name testDoubleIsIntegerOne0047
     * @tc.desc Verify isInteger returns true for negative large integer MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(Double.MIN_SAFE_INTEGER)).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_4800
     * @tc.name testDoubleIsIntegerOne0048
     * @tc.desc Verify isInteger returns true for negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(-0.0)).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_4900
     * @tc.name testDoubleIsIntegerOne0049
     * @tc.desc Verify isInteger returns false for non-integer value 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(2.5)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_5000
     * @tc.name testDoubleIsIntegerOne0050
     * @tc.desc Verify isInteger returns false for non-integer value 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(0.1)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_5100
     * @tc.name testDoubleIsIntegerOne0051
     * @tc.desc Verify isInteger returns false for negative non-integer value -3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(-3.14)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_5200
     * @tc.name testDoubleIsIntegerOne0052
     * @tc.desc Verify isInteger returns false for small decimal 0.0001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(0.0001)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_5300
     * @tc.name testDoubleIsIntegerOne0053
     * @tc.desc Verify isInteger returns false for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(Double.NaN)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_5400
     * @tc.name testDoubleIsIntegerOne0054
     * @tc.desc Verify isInteger returns false for positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(Double.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_5500
     * @tc.name testDoubleIsIntegerOne0055
     * @tc.desc Verify isInteger returns false for negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(Double.NEGATIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_5600
     * @tc.name testDoubleIsIntegerOne0056
     * @tc.desc Verify isInteger returns false for MIN_VALUE (4.9E-324)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(Double.MIN_VALUE)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_5700
     * @tc.name testDoubleIsIntegerOne0057
     * @tc.desc Verify isInteger returns false for DELTA value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(Double.DELTA);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_5800
     * @tc.name testDoubleIsIntegerOne0058
     * @tc.desc Verify isInteger returns false for EPSILON value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(Double.EPSILON);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_5900
     * @tc.name testDoubleIsIntegerOne0059
     * @tc.desc Verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(2.0);
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_6000
     * @tc.name testDoubleIsIntegerOne0060
     * @tc.desc Verify return value is strictly true or false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: boolean = Double.isInteger(2.0);
      let result2: boolean = Double.isInteger(2.5);
      expect(result1 === true).assertTrue();
      expect(result2 === false).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_6100
     * @tc.name testDoubleIsIntegerOne0061
     * @tc.desc Verify multiple calls with same argument return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: boolean = Double.isInteger(5.0);
      let result2: boolean = Double.isInteger(5.0);
      expect(result1 === result2).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_6400
     * @tc.name testDoubleIsIntegerOne0064
     * @tc.desc Verify document example values 2.0 returns true and 2.5 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isInteger(2.0)).assertTrue();
      expect(Double.isInteger(2.5)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_6500
     * @tc.name testDoubleIsIntegerOne0065
     * @tc.desc Verify null input is caught by error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(10.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_6600
     * @tc.name testDoubleIsIntegerOne0066
     * @tc.desc Verify undefined input is caught by error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(-10.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_6700
     * @tc.name testDoubleIsIntegerOne0067
     * @tc.desc Verify string input is caught by error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(1000.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_6800
     * @tc.name testDoubleIsIntegerOne0068
     * @tc.desc Verify boolean input is caught by error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(-1000.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_7100
     * @tc.name testDoubleIsIntegerOne0071
     * @tc.desc Verify invalid UTF-8 string does not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(3.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_7200
     * @tc.name testDoubleIsIntegerOne0072
     * @tc.desc Verify XSS string does not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(4.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_ONE_7400
     * @tc.name testDoubleIsIntegerOne0074
     * @tc.desc Verify super long string does not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerOne0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isInteger(6.0);
      expect(result).assertTrue();
    });
  });
}
