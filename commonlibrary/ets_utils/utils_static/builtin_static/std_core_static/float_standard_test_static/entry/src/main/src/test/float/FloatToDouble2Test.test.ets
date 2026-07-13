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

export default function FloatToDouble2Test(): void {
  describe('FloatToDouble2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_0100
     * @tc.name testToDouble2001
     * @tc.desc Verify normal parameter count(1 param) for Float.toDouble static method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(1.5f);
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_0200
     * @tc.name testToDouble2002
     * @tc.desc Verify Float.toDouble with 0.0f returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(0.0f);
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_0300
     * @tc.name testToDouble2003
     * @tc.desc Verify Float.toDouble with -0.0f preserves sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(-0.0f);
      let isNegativeInfinity: boolean = 1.0 / result === Double.NEGATIVE_INFINITY;
      expect(isNegativeInfinity).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_0400
     * @tc.name testToDouble2004
     * @tc.desc Verify Float.toDouble with Float.EPSILON preserves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.EPSILON);
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_0500
     * @tc.name testToDouble2005
     * @tc.desc Verify positive float to double conversion for Float.toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toDoubleResult: double = Float.toDouble(1.0f);
      expect(toDoubleResult).assertEqual(1.0);
      let toDoubleResult2: double = Float.toDouble(1.5f);
      expect(toDoubleResult2).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_0600
     * @tc.name testToDouble2006
     * @tc.desc Verify negative float to double conversion for Float.toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toDoubleResult3: double = Float.toDouble(-1.0f);
      expect(toDoubleResult3).assertEqual(-1.0);
      let toDoubleResult4: double = Float.toDouble(-1.5f);
      expect(toDoubleResult4).assertEqual(-1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_0700
     * @tc.name testToDouble2007
     * @tc.desc Verify zero and negative zero conversion for Float.toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toDoubleResult5: double = Float.toDouble(0.0f);
      expect(toDoubleResult5).assertEqual(0.0f);
      let toDoubleResult6: double = Float.toDouble(-0.0f);
      expect(toDoubleResult6).assertEqual(-0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_0800
     * @tc.name testToDouble2008
     * @tc.desc Verify NaN propagation for Float.toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.NaN);
      let isNaN: boolean = result !== result;
      expect(isNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_0900
     * @tc.name testToDouble2009
     * @tc.desc Verify positive infinity conversion for Float.toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.POSITIVE_INFINITY);
      expect(result > 3.4e38).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_1000
     * @tc.name testToDouble2010
     * @tc.desc Verify negative infinity conversion for Float.toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.NEGATIVE_INFINITY);
      expect(result < -3.4e38).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_1100
     * @tc.name testToDouble2011
     * @tc.desc Verify Float.MIN_VALUE conversion for Float.toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.MIN_VALUE);
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_1200
     * @tc.name testToDouble2012
     * @tc.desc Verify Float.MAX_VALUE conversion for Float.toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.MAX_VALUE);
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_1300
     * @tc.name testToDouble2013
     * @tc.desc Verify -Float.MAX_VALUE conversion for Float.toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(-Float.MAX_VALUE);
      expect(result < 0.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_1400
     * @tc.name testToDouble2014
     * @tc.desc Verify float precision preservation for Float.toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toDoubleResult7: double = Float.toDouble(3.14f);
      expect(toDoubleResult7).assertClose(3.14, 1e-6);
      let toDoubleResult8: double = Float.toDouble(-3.14f);
      expect(toDoubleResult8).assertClose(-3.14, 1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_1500
     * @tc.name testToDouble2015
     * @tc.desc Verify Float.toDouble with 1.0f returns 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(1.0f);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_1600
     * @tc.name testToDouble2016
     * @tc.desc Verify Float.toDouble with -1.0f returns -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(-1.0f);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_1700
     * @tc.name testToDouble2017
     * @tc.desc Verify Float.toDouble with 100.0f returns 100.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(100.0f);
      expect(result).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_1800
     * @tc.name testToDouble2018
     * @tc.desc Verify Float.toDouble with -100.0f returns -100.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(-100.0f);
      expect(result).assertEqual(-100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_1900
     * @tc.name testToDouble2019
     * @tc.desc Verify Float.toDouble with 0.5f returns 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(0.5f);
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_2000
     * @tc.name testToDouble2020
     * @tc.desc Verify Float.toDouble with large value preserves magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(1.0e8f);
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_2100
     * @tc.name testToDouble2021
     * @tc.desc Verify Float.toDouble with negative large value preserves magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(-1.0e8f);
      expect(result < 0.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_2200
     * @tc.name testToDouble2022
     * @tc.desc Verify Float.toDouble result used in expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: double = Float.toDouble(1.0f) + Float.toDouble(2.0f);
      expect(x).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_2300
     * @tc.name testToDouble2023
     * @tc.desc Verify multiple calls to Float.toDouble produce consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: double = Float.toDouble(1.5f);
      const r2: double = Float.toDouble(1.5f);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_2400
     * @tc.name testToDouble2024
     * @tc.desc Verify different float values conversion independence for Float.toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: double = Float.toDouble(1.1f);
      const r2: double = Float.toDouble(2.2f);
      expect(r1).assertClose(1.1, 1e-6);
      expect(r2).assertClose(2.2, 1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_2_2500
     * @tc.name testToDouble2025
     * @tc.desc Verify Float.MAX_VALUE converted to double is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.MAX_VALUE);
      expect(result < 1.0e308).assertTrue();
    });
  });
}
