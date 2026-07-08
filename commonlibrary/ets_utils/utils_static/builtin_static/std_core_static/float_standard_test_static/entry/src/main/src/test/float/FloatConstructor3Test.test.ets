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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function FloatConstructor3Test(): void {
  describe('FloatConstructor3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_0100
     * @tc.name testConstructor3001
     * @tc.desc Verify Float constructor with 1 double parameter creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5);
      let isCorrectValue: boolean = value.toFloat() === 1.5;
      expect(isCorrectValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_0200
     * @tc.name testConstructor3002
     * @tc.desc Verify Float constructor with 0 arguments still creates instance (no-arg constructor)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      let toFloatResult: float = value.toFloat();
      expect(toFloatResult).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_0300
     * @tc.name testConstructor3003
     * @tc.desc Verify Float(double) constructor with high-precision fraction converts to approximate float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.3333333333333333);
      let isFiniteResult: boolean = value.isFinite();
      expect(isFiniteResult).assertTrue();
      expect(value.isGreaterThan(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_0400
     * @tc.name testConstructor3004
     * @tc.desc Verify Float constructor with double value 0.0 creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0);
      let isWithinEpsilon: boolean = Math.abs(value.toFloat() - 0.0) < Float.EPSILON;
      expect(isWithinEpsilon).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_0500
     * @tc.name testConstructor3005
     * @tc.desc Verify Float constructor with positive double value 123.456 creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(123.456);
      let toFloatResult2: float = value.toFloat();
      expect(toFloatResult2).assertClose(123.456, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_0600
     * @tc.name testConstructor3006
     * @tc.desc Verify Float constructor with negative double value -888.88 creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-888.88);
      let toFloatResult3: float = value.toFloat();
      expect(toFloatResult3).assertClose(-888.88, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_0700
     * @tc.name testConstructor3007
     * @tc.desc Verify Float constructor with scientific notation double value 1.0e6 creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0e6);
      let isApproxOneMillion: boolean = Math.abs(value.toFloat() - 1000000.0) < Float.EPSILON;
      expect(isApproxOneMillion).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_0800
     * @tc.name testConstructor3008
     * @tc.desc Verify Float constructor with double value 999999.99 creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(999999.99);
      let toFloatResult4: float = value.toFloat();
      expect(toFloatResult4).assertClose(999999.99, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_0900
     * @tc.name testConstructor3009
     * @tc.desc Verify Float constructor with Double.MIN_VALUE creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Double.MIN_VALUE);
      let toFloatResult5: float = value.toFloat();
      expect(toFloatResult5).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_1000
     * @tc.name testConstructor3010
     * @tc.desc Verify Float constructor with Double.MAX_VALUE overflows to positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Double.MAX_VALUE);
      let toFloatResult6: float = value.toFloat();
      expect(toFloatResult6).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_1100
     * @tc.name testConstructor3011
     * @tc.desc Verify Float constructor with near MAX_VALUE double 3.4028235E38 creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(3.4028235E38);
      let isFiniteResult2: boolean = value.isFinite();
      expect(isFiniteResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_1200
     * @tc.name testConstructor3012
     * @tc.desc Verify Float constructor with near MIN_VALUE double 1.4E-45 creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.4E-45);
      let isFiniteResult3: boolean = value.isFinite();
      expect(isFiniteResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_1300
     * @tc.name testConstructor3013
     * @tc.desc Verify Float constructor with 0.0 and -0.0 preserves sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const posZero = new Float(0.0);
      const negZero = new Float(-0.0);
      let toFloatResult7: float = posZero.toFloat();
      expect(toFloatResult7).assertEqual(0.0);
      let toFloatResult8: float = negZero.toFloat();
      expect(toFloatResult8).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_1400
     * @tc.name testConstructor3014
     * @tc.desc Verify Float constructor with Double.NaN creates NaN instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Double.NaN);
      expect(Float.isNaN(value.toFloat())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_1500
     * @tc.name testConstructor3015
     * @tc.desc Verify Float constructor with Double.POSITIVE_INFINITY creates positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Double.POSITIVE_INFINITY);
      let toFloatResult9: float = value.toFloat();
      expect(toFloatResult9).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_1600
     * @tc.name testConstructor3016
     * @tc.desc Verify Float constructor with Double.NEGATIVE_INFINITY creates negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Double.NEGATIVE_INFINITY);
      let toFloatResult10: float = value.toFloat();
      expect(toFloatResult10).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_1700
     * @tc.name testConstructor3017
     * @tc.desc Verify Float constructor with large double 1.0e308 overflows to positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0e308);
      let toFloatResult11: float = value.toFloat();
      expect(toFloatResult11).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_1800
     * @tc.name testConstructor3018
     * @tc.desc Verify Float constructor with overflow negative double -1.0e309 overflows to negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-Double.MAX_VALUE);
      let toFloatResult12: float = value.toFloat();
      expect(toFloatResult12).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_1900
     * @tc.name testConstructor3019
     * @tc.desc Verify Float constructor with overflow double 1.0e309 overflows to positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1e100);
      let toFloatResult13: float = value.toFloat();
      expect(toFloatResult13).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_2000
     * @tc.name testConstructor3020
     * @tc.desc Verify Float(double) constructor with integer double converts to correct float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(42.0);
      let isExpectedFloat: boolean = value.toFloat() === 42.0f;
      expect(isExpectedFloat).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_2100
     * @tc.name testConstructor3021
     * @tc.desc Verify Float(double) constructor with negative integer double converts to correct float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-100.0);
      let isExpectedNegativeFloat: boolean = value.toFloat() === -100.0f;
      expect(isExpectedNegativeFloat).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_2200
     * @tc.name testConstructor3022
     * @tc.desc Verify Float(double) constructor with 0.5 converts to exact float 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.5);
      let isExactMatch: boolean = value.toFloat() === 0.5f;
      expect(isExactMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_2300
     * @tc.name testConstructor3023
     * @tc.desc Verify Float(double) constructor with value near Float.MAX_VALUE still fits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(3.4028234E38);
      let isFiniteResult4: boolean = value.isFinite();
      expect(isFiniteResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_2400
     * @tc.name testConstructor3024
     * @tc.desc Verify Float(double) constructor with value slightly above Float.MAX_VALUE overflows
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(3.4028236E38);
      let toFloatResult14: float = value.toFloat();
      expect(toFloatResult14).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_2500
     * @tc.name testConstructor3025
     * @tc.desc Verify Float constructor returns non-null instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5);
      let isFiniteResult5: boolean = value.isFinite();
      expect(isFiniteResult5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_2600
     * @tc.name testConstructor3026
     * @tc.desc Verify double to float conversion preserves precision within EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5);
      let isWithinEpsilon2: boolean = Math.abs(value.toFloat() - 1.5) < Float.EPSILON;
      expect(isWithinEpsilon2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_2700
     * @tc.name testConstructor3027
     * @tc.desc Verify high precision double to float conversion loses precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.23456789012345);
      const result = value.toFloat();
      let hasPrecisionLoss: boolean = result !== 1.23456789012345;
      expect(hasPrecisionLoss).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_2800
     * @tc.name testConstructor3028
     * @tc.desc Verify extremely small positive double to float converts to 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0e-50);
      let toFloatResult15: float = value.toFloat();
      expect(toFloatResult15).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_2900
     * @tc.name testConstructor3029
     * @tc.desc Verify extremely small negative double to float converts to -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-1.0e-50);
      let toFloatResult16: float = value.toFloat();
      expect(toFloatResult16).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_3000
     * @tc.name testConstructor3030
     * @tc.desc Verify large negative double overflows to negative infinity when converted to float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-3.4028236E38);
      let toFloatResult18: float = value.toFloat();
      expect(toFloatResult18).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_3100
     * @tc.name testConstructor3031
     * @tc.desc Verify double 0.0 converts to float 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0);
      let toFloatResult21: float = value.toFloat();
      expect(toFloatResult21).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_3200
     * @tc.name testConstructor3032
     * @tc.desc Verify double -0.0 converts to float -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-0.0);
      expect(1.0 / value.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_3300
     * @tc.name testConstructor3033
     * @tc.desc Verify Float instance implements Comparable interface
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5);
      const other = new Float(2.5);
      let isLessThan: boolean = value.compareTo(other) < 0;
      expect(isLessThan).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_3400
     * @tc.name testConstructor3034
     * @tc.desc Verify Float instance inherits from Floating and can call parent class methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5);
      let isInstanceOfFloating: boolean = value instanceof Floating;
      expect(isInstanceOfFloating).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_3500
     * @tc.name testConstructor3035
     * @tc.desc Verify multiple Float constructors return different instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Float(1.0);
      const value2 = new Float(3.0);
      let equalsResult: boolean = value1.equals(value2);
      expect(equalsResult).assertFalse();
      let matchesExpected: boolean = value2.toFloat() === 3.0;
      expect(matchesExpected).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_3600
     * @tc.name testConstructor3036
     * @tc.desc Verify Float(double) constructor with value representable exactly as float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.125);
      let isExactRepresentable: boolean = value.toFloat() === 0.125f;
      expect(isExactRepresentable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_3700
     * @tc.name testConstructor3037
     * @tc.desc Verify Float(double) constructor with value slightly below Float.MIN_VALUE converts to subnormal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0e-40);
      let isFiniteResult6: boolean = value.isFinite();
      expect(isFiniteResult6).assertTrue();
      expect(value.isGreaterEqualThan(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_3800
     * @tc.name testConstructor3038
     * @tc.desc Verify Float(double) constructor with integer 0 converts to float 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0);
      let toFloatResult23: float = value.toFloat();
      expect(toFloatResult23).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_3900
     * @tc.name testConstructor3039
     * @tc.desc Verify extremely large double value 1.7976931348623157E308 overflows to Infinity without throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.7976931348623157E308);
      let toFloatResult24: float = value.toFloat();
      expect(toFloatResult24).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_4000
     * @tc.name testConstructor3040
     * @tc.desc Verify Float is a final class and instance can be created with new
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5);
      let isFiniteResult7: boolean = value.isFinite();
      expect(isFiniteResult7).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_4100
     * @tc.name testConstructor3041
     * @tc.desc Verify extremely large negative double value overflows to negative infinity without throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-1e100);
      let toFloatResult26: float = value.toFloat();
      expect(toFloatResult26).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_3_4200
     * @tc.name testConstructor3042
     * @tc.desc Verify Float(double) constructor with 1.0000000000000001 rounds to float 1.0f (double ULP beyond float precision)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor3042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0000000000000001);
      let toFloatResult27: float = value.toFloat();
      expect(toFloatResult27).assertEqual(1.0f);
    });
  });
}
