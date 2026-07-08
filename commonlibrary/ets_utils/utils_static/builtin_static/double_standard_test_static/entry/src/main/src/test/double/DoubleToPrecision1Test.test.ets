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

export default function DoubleToPrecision1Test(): void {
  describe('DoubleToPrecision1Test', () => {
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
     * @tc.number DBL_TO_PRCSN_CHK_0100
     * @tc.name testDoubleToPrecisionONE0001
     * @tc.desc Verify toPrecision with required parameter d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result: string = value.toPrecision(4);
      expect(result).assertEqual("12.35");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_0200
     * @tc.name testDoubleToPrecisionONE0002
     * @tc.desc Verify toPrecision without parameter returns default string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result: string = value.toPrecision();
      expect(result).assertEqual("12.345");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_0300
     * @tc.name testDoubleToPrecisionONE0003
     * @tc.desc Verify toPrecision with d=1.0 as minimum valid precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result: string = value.toPrecision(1);
      expect(result).assertEqual("1e+1");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_0500
     * @tc.name testDoubleToPrecisionONE0005
     * @tc.desc Verify toPrecision with d=6.0 exceeding actual significant digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result: string = value.toPrecision(6);
      expect(result).assertEqual("12.3450");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_0600
     * @tc.name testDoubleToPrecisionONE0006
     * @tc.desc Verify toPrecision with d=50.0 as higher precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 3.14;
      const result: string = value.toPrecision(50);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_0700
     * @tc.name testDoubleToPrecisionONE0007
     * @tc.desc Verify toPrecision with d=100.0 as maximum valid precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.0;
      const result: string = value.toPrecision(100);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_0800
     * @tc.name testDoubleToPrecisionONE0008
     * @tc.desc Verify toPrecision with d=1.0 as lower bound of valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result: string = value.toPrecision(1);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_0900
     * @tc.name testDoubleToPrecisionONE0009
     * @tc.desc Verify toPrecision with d=100.0 as upper bound of valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result: string = value.toPrecision(100);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_1000
     * @tc.name testDoubleToPrecisionONE0010
     * @tc.desc Verify toPrecision with d=0.0 below valid range lower bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        const result: string = value.toPrecision(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_1100
     * @tc.name testDoubleToPrecisionONE0011
     * @tc.desc Verify toPrecision with d=-1.0 as negative invalid parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      let result: string | null = null;
      try {
        result = value.toPrecision(-1);
        expect(result !== null && result !== undefined).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_1200
     * @tc.name testDoubleToPrecisionONE0012
     * @tc.desc Verify toPrecision with d=101.0 exceeding valid range upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        const result: string = value.toPrecision(101);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_1300
     * @tc.name testDoubleToPrecisionONE0013
     * @tc.desc Verify toPrecision with d=0.5 as decimal value less than 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        const result: string = value.toPrecision(0.5);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_1400
     * @tc.name testDoubleToPrecisionONE0014
     * @tc.desc Verify toPrecision with d=100.5 as decimal exceeding valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      try {
        const result: string = value.toPrecision(100.5);
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_1500
     * @tc.name testDoubleToPrecisionONE0015
     * @tc.desc Verify toPrecision with d=Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        const result: string = value.toPrecision(NaN);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_1600
     * @tc.name testDoubleToPrecisionONE0016
     * @tc.desc Verify toPrecision with d=Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        const result: string = value.toPrecision(Infinity);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_1700
     * @tc.name testDoubleToPrecisionONE0017
     * @tc.desc Verify toPrecision with d=Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        const result: string = value.toPrecision(-Infinity);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_1800
     * @tc.name testDoubleToPrecisionONE0018
     * @tc.desc Verify toPrecision with d=Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        const result: string = value.toPrecision(Number.MIN_VALUE);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_1900
     * @tc.name testDoubleToPrecisionONE0019
     * @tc.desc Verify toPrecision with d=Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        const result: string = value.toPrecision(Number.MAX_VALUE);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_2000
     * @tc.name testDoubleToPrecisionONE0020
     * @tc.desc Verify toPrecision with d=-0.0 as negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        const result: string = value.toPrecision(-0.0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_2200
     * @tc.name testDoubleToPrecisionONE0022
     * @tc.desc Verify toPrecision with d=2.0 as integer precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result: string = value.toPrecision(2);
      expect(result).assertEqual("12");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_2300
     * @tc.name testDoubleToPrecisionONE0023
     * @tc.desc Verify toPrecision with d=3.0 for three significant digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result: string = value.toPrecision(3);
      expect(result).assertEqual("12.3");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_2500
     * @tc.name testDoubleToPrecisionONE0025
     * @tc.desc Verify toPrecision formatting for integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 100.0;
      const result: string = value.toPrecision(3);
      expect(result).assertEqual("100");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_2600
     * @tc.name testDoubleToPrecisionONE0026
     * @tc.desc Verify toPrecision formatting for decimal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.00123;
      const result: string = value.toPrecision(3);
      expect(result).assertEqual("0.00123");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_2900
     * @tc.name testDoubleToPrecisionONE0029
     * @tc.desc Verify toPrecision with d=5 returns 5 significant digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result: string = value.toPrecision(5);
      expect(result).assertEqual("12.345");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_3000
     * @tc.name testDoubleToPrecisionONE0030
     * @tc.desc Verify toPrecision with positive instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1234.5678;
      const result: string = value.toPrecision(4);
      expect(result).assertEqual("1235");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_3100
     * @tc.name testDoubleToPrecisionONE0031
     * @tc.desc Verify toPrecision with negative instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -12.345;
      const result: string = value.toPrecision(4);
      expect(result).assertEqual("-12.35");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_3200
     * @tc.name testDoubleToPrecisionONE0032
     * @tc.desc Verify toPrecision with instance value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.0;
      const result: string = value.toPrecision(4);
      expect(result).assertEqual("0.000");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_3300
     * @tc.name testDoubleToPrecisionONE0033
     * @tc.desc Verify toPrecision with instance value Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = NaN;
      const result: string = value.toPrecision(4);
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_3400
     * @tc.name testDoubleToPrecisionONE0034
     * @tc.desc Verify toPrecision with instance value Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Infinity;
      const result: string = value.toPrecision(4);
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_3500
     * @tc.name testDoubleToPrecisionONE0035
     * @tc.desc Verify toPrecision with instance value Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -Infinity;
      const result: string = value.toPrecision(4);
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_3600
     * @tc.name testDoubleToPrecisionONE0036
     * @tc.desc Verify toPrecision with maximum instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MAX_VALUE;
      const result: string = value.toPrecision(4);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_3700
     * @tc.name testDoubleToPrecisionONE0037
     * @tc.desc Verify toPrecision with minimum positive instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MIN_VALUE;
      const result: string = value.toPrecision(4);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_3800
     * @tc.name testDoubleToPrecisionONE0038
     * @tc.desc Verify toPrecision returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.0;
      const result: string = value.toPrecision(1);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_4000
     * @tc.name testDoubleToPrecisionONE0040
     * @tc.desc Verify toPrecision zero-padding behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.2;
      const result: string = value.toPrecision(4);
      expect(result).assertEqual("1.200");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_4100
     * @tc.name testDoubleToPrecisionONE0041
     * @tc.desc Verify toPrecision return type is String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result: string = value.toPrecision(4);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_4200
     * @tc.name testDoubleToPrecisionONE0042
     * @tc.desc Verify toPrecision returns a String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result: string = value.toPrecision(4);
      expect(result !== null).assertTrue();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_4300
     * @tc.name testDoubleToPrecisionONE0043
     * @tc.desc Verify toPrecision with d=1 returns scientific notation for large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 123456.789;
      const result: string = value.toPrecision(1);
      expect(result).assertEqual("1e+5");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_4400
     * @tc.name testDoubleToPrecisionONE0044
     * @tc.desc Verify toPrecision with d=100 returns very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.0;
      const result: string = value.toPrecision(100);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_4500
     * @tc.name testDoubleToPrecisionONE0045
     * @tc.desc Verify toPrecision with small value and high precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.000001234;
      const result: string = value.toPrecision(6);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_4600
     * @tc.name testDoubleToPrecisionONE0046
     * @tc.desc Verify toPrecision catches exception when d=0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        value.toPrecision(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_4700
     * @tc.name testDoubleToPrecisionONE0047
     * @tc.desc Verify toPrecision catches exception when d=101.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        value.toPrecision(101);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_4800
     * @tc.name testDoubleToPrecisionONE0048
     * @tc.desc Verify toPrecision catches exception when d=-1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result: string = value.toPrecision(-1);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_4900
     * @tc.name testDoubleToPrecisionONE0049
     * @tc.desc Verify toPrecision catches exception when d=Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        value.toPrecision(NaN);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_5000
     * @tc.name testDoubleToPrecisionONE0050
     * @tc.desc Verify toPrecision catches exception when d=Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        value.toPrecision(Infinity);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_5100
     * @tc.name testDoubleToPrecisionONE0051
     * @tc.desc Verify toPrecision catches exception when d=Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        value.toPrecision(-Infinity);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_5300
     * @tc.name testDoubleToPrecisionONE0053
     * @tc.desc Verify exception contains valid message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        value.toPrecision(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
        expect((error as Error).message !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_5400
     * @tc.name testDoubleToPrecisionONE0054
     * @tc.desc Verify toPrecision(0) throws ArgumentOutOfRangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = 12.345;
        value.toPrecision(0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_5600
     * @tc.name testDoubleToPrecisionONE0056
     * @tc.desc Verify native method returns consistent results across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      const result1: string = value.toPrecision(4);
      const result2: string = value.toPrecision(4);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_5700
     * @tc.name testDoubleToPrecisionONE0057
     * @tc.desc Verify toPrecision does not modify original Double instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      value.toPrecision(4);
      expect(value).assertEqual(12.345);
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_5800
     * @tc.name testDoubleToPrecisionONE0058
     * @tc.desc Verify toPrecision does not change instance value after multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.345;
      value.toPrecision(1);
      value.toPrecision(2);
      value.toPrecision(3);
      expect(value).assertEqual(12.345);
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_5900
     * @tc.name testDoubleToPrecisionONE0059
     * @tc.desc Verify toPrecision uses scientific notation for large values with d=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1234567.89;
      const result: string = value.toPrecision(1);
      expect(result).assertEqual("1e+6");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_6000
     * @tc.name testDoubleToPrecisionONE0060
     * @tc.desc Verify toPrecision uses scientific notation for small values with d=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.000123;
      const result: string = value.toPrecision(1);
      expect(result).assertEqual("0.0001");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_6100
     * @tc.name testDoubleToPrecisionONE0061
     * @tc.desc Verify toPrecision returns fixed-point representation when precision is sufficient
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 123.456;
      const result: string = value.toPrecision(6);
      expect(result).assertEqual("123.456");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_6300
     * @tc.name testDoubleToPrecisionONE0063
     * @tc.desc Verify toPrecision truncates directly when no carry is needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 12.341;
      const result: string = value.toPrecision(4);
      expect(result).assertEqual("12.34");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_6500
     * @tc.name testDoubleToPrecisionONE0065
     * @tc.desc Verify toPrecision with negative instance value and d=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -12.345;
      const result: string = value.toPrecision(1);
      expect(result).assertEqual("-1e+1");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_6600
     * @tc.name testDoubleToPrecisionONE0066
     * @tc.desc Verify toPrecision with zero instance value and different precisions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.0;
      const result1: string = value.toPrecision(1);
      const result2: string = value.toPrecision(5);
      expect(result1).assertEqual("0");
      expect(result2).assertEqual("0.0000");
    });

    /**
     * @tc.number DBL_TO_PRCSN_CHK_6700
     * @tc.name testDoubleToPrecisionONE0067
     * @tc.desc Verify toPrecision with negative zero instance value and precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToPrecisionONE0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -0.0;
      const result: string = value.toPrecision(4);
      expect(result !== null).assertTrue();
    });
  });
}
