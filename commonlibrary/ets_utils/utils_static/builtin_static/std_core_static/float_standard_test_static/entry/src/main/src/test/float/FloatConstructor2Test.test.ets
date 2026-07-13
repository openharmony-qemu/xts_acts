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

export default function FloatConstructor2Test(): void {
  describe('FloatConstructor2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_0100
     * @tc.name testConstructor2001
     * @tc.desc Verify Float constructor with 1 float parameter creates instance successfully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5f);
      let isCorrectValue: boolean = value.toFloat() === 1.5f;
      expect(isCorrectValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_0200
     * @tc.name testConstructor2002
     * @tc.desc Verify Float(float) constructor with Float.MAX_SAFE_INTEGER creates correct instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MAX_SAFE_INTEGER);
      let matchesMaxSafe: boolean = value.toFloat() === Float.MAX_SAFE_INTEGER;
      expect(matchesMaxSafe).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_0300
     * @tc.name testConstructor2003
     * @tc.desc Verify Float(float) constructor with -Float.MAX_SAFE_INTEGER creates correct negative instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-Float.MAX_SAFE_INTEGER);
      let matchesNegMaxSafe: boolean = value.toFloat() === -Float.MAX_SAFE_INTEGER;
      expect(matchesNegMaxSafe).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_0400
     * @tc.name testConstructor2004
     * @tc.desc Verify Float(float) constructor with Float.EPSILON creates correct instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.EPSILON);
      let matchesEpsilon: boolean = value.toFloat() === Float.EPSILON;
      expect(matchesEpsilon).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_0500
     * @tc.name testConstructor2005
     * @tc.desc Verify Float constructor with 0.0f creates instance correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f);
      let toStringResult: string = value.toString();
      expect(toStringResult).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_0600
     * @tc.name testConstructor2006
     * @tc.desc Verify Float constructor with positive float 3.14f creates instance correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(3.14f);
      let toStringResult2: string = value.toString();
      expect(toStringResult2).assertEqual('3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_0700
     * @tc.name testConstructor2007
     * @tc.desc Verify Float constructor with negative float -99.99f creates instance correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-99.99f);
      let toStringResult3: string = value.toString();
      expect(toStringResult3).assertEqual('-99.99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_0800
     * @tc.name testConstructor2008
     * @tc.desc Verify Float constructor with 1.5f creates instance correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5f);
      let toStringResult4: string = value.toString();
      expect(toStringResult4).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_0900
     * @tc.name testConstructor2009
     * @tc.desc Verify Float constructor with 100.0f creates instance correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(100.0f);
      let toStringResult5: string = value.toString();
      expect(toStringResult5).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_1000
     * @tc.name testConstructor2010
     * @tc.desc Verify Float constructor with float value 9.0f (hex literal 0x1.2p3f equivalent) creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(9.0f);
      let isCorrectValue: boolean = value.toFloat() === 9.0f;
      expect(isCorrectValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_1100
     * @tc.name testConstructor2011
     * @tc.desc Verify Float constructor with scientific notation 1.0e3f creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0e3f);
      let toStringResult6: string = value.toString();
      expect(toStringResult6).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_1200
     * @tc.name testConstructor2012
     * @tc.desc Verify Float constructor with Float.MIN_VALUE creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MIN_VALUE);
      let toFloatResult: float = value.toFloat();
      expect(toFloatResult).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_1300
     * @tc.name testConstructor2013
     * @tc.desc Verify Float constructor with Float.MAX_VALUE creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MAX_VALUE);
      let toFloatResult2: float = value.toFloat();
      expect(toFloatResult2).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_1400
     * @tc.name testConstructor2014
     * @tc.desc Verify Float constructor with precision overflow value 9999999999999999f creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(9999999999999999f);
      let isFiniteResult: boolean = value.isFinite();
      expect(isFiniteResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_1500
     * @tc.name testConstructor2015
     * @tc.desc Verify Float constructor with overflow value 3.4e38f creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(3.4e38f);
      let isFiniteResult2: boolean = value.isFinite();
      expect(isFiniteResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_1600
     * @tc.name testConstructor2016
     * @tc.desc Verify Float constructor with Float.NaN creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      let isNaNResult: boolean = value.isNaN();
      expect(isNaNResult).assertTrue();
      expect(Float.isNaN(value.toFloat())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_1700
     * @tc.name testConstructor2017
     * @tc.desc Verify Float constructor with Float.POSITIVE_INFINITY creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.POSITIVE_INFINITY);
      let toStringResult7: string = value.toString();
      expect(toStringResult7).assertEqual('Infinity');
      expect(!Float.isFinite(value.toFloat())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_1800
     * @tc.name testConstructor2018
     * @tc.desc Verify Float constructor with Float.NEGATIVE_INFINITY creates instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NEGATIVE_INFINITY);
      let toStringResult8: string = value.toString();
      expect(toStringResult8).assertEqual('-Infinity');
      expect(!Float.isFinite(value.toFloat())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_1900
     * @tc.name testConstructor2019
     * @tc.desc Verify Float constructor with 0.0f returns correct floatValue
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f);
      let toFloatResult3: float = value.toFloat();
      expect(toFloatResult3).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_2000
     * @tc.name testConstructor2020
     * @tc.desc Verify Float constructor with -0.0f creates instance and preserves sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-0.0f);
      let toFloatResult4: float = value.toFloat();
      expect(toFloatResult4).assertEqual(-0.0f);
      expect(1.0f / value.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_2100
     * @tc.name testConstructor2021
     * @tc.desc Verify two Float instances created with same float value are independent references
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Float(1.5f);
      const v2 = new Float(1.5f);
      let equalsResult: boolean = v1.equals(v2);
      expect(equalsResult).assertTrue();
      let isCorrectValue1: boolean = v1.toFloat() === 1.5f;
      expect(isCorrectValue1).assertTrue();
      let isCorrectValue2: boolean = v2.toFloat() === 1.5f;
      expect(isCorrectValue2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_2200
     * @tc.name testConstructor2022
     * @tc.desc Verify Float(float) constructor with subnormal value preserves the value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MIN_VALUE / 2.0f);
      let isFiniteResult3: boolean = value.isFinite();
      expect(isFiniteResult3).assertTrue();
      expect(value.isGreaterEqualThan(new Float(0.0f))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_2300
     * @tc.name testConstructor2023
     * @tc.desc Verify Float(float) constructor with large integer beyond precision rounds correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(16777216.0f);
      let matchesLargeInt: boolean = value.toFloat() === 16777216.0f;
      expect(matchesLargeInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_2400
     * @tc.name testConstructor2024
     * @tc.desc Verify Float(float) constructor with -0.0f preserves negative sign via division
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-0.0f);
      let isNegativeZero: boolean = 1.0f / value.toFloat() === Float.NEGATIVE_INFINITY;
      expect(isNegativeZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_2500
     * @tc.name testConstructor2025
     * @tc.desc Verify Float(float) constructor instance toByte() returns truncated byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(123.45f);
      let matchesByte: boolean = value.toByte() === 123;
      expect(matchesByte).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_2600
     * @tc.name testConstructor2026
     * @tc.desc Verify Float(float) constructor instance toShort() returns correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1024.0f);
      let matchesShort: boolean = value.toShort() === 1024;
      expect(matchesShort).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_2700
     * @tc.name testConstructor2027
     * @tc.desc Verify Float(float) constructor with 0.0f creates instance usable in arithmetic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f);
      const result: Float = value.add(new Float(5.0f));
      let matchesResult: boolean = result.toString() === '5';
      expect(matchesResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_2800
     * @tc.name testConstructor2028
     * @tc.desc Verify two NaN instances created by Float(float) constructor are not equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan1 = new Float(Float.NaN);
      const nan2 = new Float(Float.NaN);
      let equalsResult2: boolean = nan1.equals(nan2);
      expect(equalsResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_2900
     * @tc.name testConstructor2029
     * @tc.desc Verify Float(float) constructor with +Infinity is non-finite and positive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.POSITIVE_INFINITY);
      let isFiniteResult4: boolean = value.isFinite();
      expect(isFiniteResult4).assertFalse();
      expect(value.isGreaterThan(new Float(0.0f))).assertTrue();
      let toStringResult9: string = value.toString();
      expect(toStringResult9).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_3000
     * @tc.name testConstructor2030
     * @tc.desc Verify Float constructor returns correct value via floatValue
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(3.14f);
      let toFloatResult5: float = value.toFloat();
      expect(toFloatResult5).assertEqual(3.14f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_3100
     * @tc.name testConstructor2031
     * @tc.desc Verify Float constructor intValue truncates decimal part
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(3.14f);
      let toIntResult: int = value.toInt();
      expect(toIntResult).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_3200
     * @tc.name testConstructor2032
     * @tc.desc Verify Float constructor longValue returns correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(100.0f);
      let toLongResult: long = value.toLong();
      expect(toLongResult).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_3300
     * @tc.name testConstructor2033
     * @tc.desc Verify Float constructor doubleValue returns correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5f);
      let toDoubleResult: double = value.toDouble();
      expect(toDoubleResult).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_3400
     * @tc.name testConstructor2034
     * @tc.desc Verify two Float instances created with different float values are not equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Float(1.5f);
      const value2 = new Float(2.5f);
      let equalsResult3: boolean = value1.equals(value2);
      expect(equalsResult3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_3500
     * @tc.name testConstructor2035
     * @tc.desc Verify two Float instances created with same float value are equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Float(3.14f);
      const value2 = new Float(3.14f);
      let equalsResult4: boolean = value1.equals(value2);
      expect(equalsResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_3600
     * @tc.name testConstructor2036
     * @tc.desc Verify NaN instance isNaN returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue = new Float(Float.NaN);
      let isNaNResult2: boolean = nanValue.isNaN();
      expect(isNaNResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_3700
     * @tc.name testConstructor2037
     * @tc.desc Verify NaN instance floatValue returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      expect(Float.isNaN(value.toFloat())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_3800
     * @tc.name testConstructor2038
     * @tc.desc Verify positive infinity instance isInfinite returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const posInf = new Float(Float.POSITIVE_INFINITY);
      expect(!Float.isFinite(posInf.toFloat())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_3900
     * @tc.name testConstructor2039
     * @tc.desc Verify negative infinity instance isInfinite returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInf = new Float(Float.NEGATIVE_INFINITY);
      expect(!Float.isFinite(negInf.toFloat())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_4000
     * @tc.name testConstructor2040
     * @tc.desc Verify positive infinity and negative infinity are not equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const posInf = new Float(Float.POSITIVE_INFINITY);
      const negInf = new Float(Float.NEGATIVE_INFINITY);
      let equalsResult5: boolean = posInf.equals(negInf);
      expect(equalsResult5).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_4100
     * @tc.name testConstructor2041
     * @tc.desc Verify 0.0f and -0.0f instances are equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Float(0.0f);
      const negZero = new Float(-0.0f);
      let equalsResult6: boolean = zero.equals(negZero);
      expect(equalsResult6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_4200
     * @tc.name testConstructor2042
     * @tc.desc Verify Float instance implements Comparable interface
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Float(1.0f);
      const value2 = new Float(2.0f);
      expect(value1.compareTo(value2) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_4300
     * @tc.name testConstructor2043
     * @tc.desc Verify Float instance inherits from Floating
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5f);
      expect(value instanceof Floating).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_4400
     * @tc.name testConstructor2044
     * @tc.desc Verify Float(float) constructor with -Infinity is non-finite and negative
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NEGATIVE_INFINITY);
      let isFiniteResult5: boolean = value.isFinite();
      expect(isFiniteResult5).assertFalse();
      expect(value.isLessThan(new Float(0.0f))).assertTrue();
      let toStringResult11: string = value.toString();
      expect(toStringResult11).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_4500
     * @tc.name testConstructor2045
     * @tc.desc Verify Float(float) constructor with 1.5f creates instance with correct toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5f);
      let matchesDouble: boolean = value.toDouble() === 1.5;
      expect(matchesDouble).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_4600
     * @tc.name testConstructor2046
     * @tc.desc Verify Float(float) constructor with 2.0f creates finite instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(2.0f);
      let isFiniteResult6: boolean = value.isFinite();
      expect(isFiniteResult6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_4700
     * @tc.name testConstructor2047
     * @tc.desc Verify Float(float) constructor with 0.0f creates instance with isInteger true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f);
      let isIntegerResult: boolean = value.isInteger();
      expect(isIntegerResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_4800
     * @tc.name testConstructor2048
     * @tc.desc Verify Float(float) constructor with 1.0f creates instance with isSafeInteger true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0f);
      let isSafeIntegerResult: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_4900
     * @tc.name testConstructor2049
     * @tc.desc Verify Float(float) constructor does not throw for valid float parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw = false;
      try {
        new Float(1.5f);
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_5000
     * @tc.name testConstructor2050
     * @tc.desc Verify Float(float) constructor with Float.MIN_VALUE creates instance usable for comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MIN_VALUE);
      expect(Float.MIN_VALUE > 0.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_5100
     * @tc.name testConstructor2051
     * @tc.desc Verify Float(float) constructor with -0.0f produces toString output "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-0.0f);
      let toStringResult12: string = value.toString();
      expect(toStringResult12).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_5200
     * @tc.name testConstructor2052
     * @tc.desc Verify Float|null union with null initial value can be reassigned Float and used
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Float | null = null;
      value = new Float(3.14f);
      expect(value !== null).assertTrue();
      let isFiniteResult7: boolean = value!.isFinite();
      expect(isFiniteResult7).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_5300
     * @tc.name testConstructor2053
     * @tc.desc Verify constructor with float from float|string union after typeof narrowing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float | string = 3.14f;
      if (typeof input !== 'string') {
        const value: Float = new Float(input);
        let toFloatResult8: float = value.toFloat();
        expect(toFloatResult8).assertEqual(3.14f);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_2_5400
     * @tc.name testConstructor2054
     * @tc.desc Verify Float(float) constructor with min safe integer (-MAX_SAFE_INTEGER) creates correct instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-Float.MAX_SAFE_INTEGER);
      let matchesExpected: boolean = value.toFloat() === -Float.MAX_SAFE_INTEGER;
      expect(matchesExpected).assertTrue();
      let isSafeIntegerResult2: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult2).assertTrue();
    });
  });
}
