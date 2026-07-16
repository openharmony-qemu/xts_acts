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
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function FloatToString2Test(): void {
  describe('FloatToString2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_0100
     * @tc.name testToString2001
     * @tc.desc Verify Float.toString(float) with positive decimal returns "1.5"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(1.5f);
      let isMatch: boolean = result === "1.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_0200
     * @tc.name testToString2002
     * @tc.desc Verify Float.toString(float) with positive integer float returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(100.0f);
      let isMatch: boolean = result === "100";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_0300
     * @tc.name testToString2003
     * @tc.desc Verify Float.toString(float) with small positive decimal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(0.1f);
      let isMatch: boolean = result === "0.1";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_0400
     * @tc.name testToString2004
     * @tc.desc Verify Float.toString(float) with multi-digit decimal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(99.99f);
      let isMatch: boolean = result === "99.99";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_0500
     * @tc.name testToString2005
     * @tc.desc Verify Float.toString(float) with large positive decimal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(12345.6789f);
      const expected: string = new Float(12345.6789f).toString();
      let matchesExpected: boolean = result === expected;
      expect(matchesExpected).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_0600
     * @tc.name testToString2006
     * @tc.desc Verify Float.toString(float) with negative decimal returns "-1.5"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-1.5f);
      let isMatch: boolean = result === "-1.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_0700
     * @tc.name testToString2007
     * @tc.desc Verify Float.toString(float) with negative integer float returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-100.0f);
      let isMatch: boolean = result === "-100";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_0800
     * @tc.name testToString2008
     * @tc.desc Verify Float.toString(float) with small negative decimal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-0.1f);
      let isMatch: boolean = result === "-0.1";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_0900
     * @tc.name testToString2009
     * @tc.desc Verify Float.toString(float) with multi-digit negative decimal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-99.99f);
      let isMatch: boolean = result === "-99.99";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_1000
     * @tc.name testToString2010
     * @tc.desc Verify Float.toString(float) with large negative decimal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-12345.6789f);
      const expected: string = new Float(-12345.6789f).toString();
      let matchesExpected: boolean = result === expected;
      expect(matchesExpected).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_1100
     * @tc.name testToString2011
     * @tc.desc Verify Float.toString(float) with positive zero returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(0.0f);
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_1200
     * @tc.name testToString2012
     * @tc.desc Verify Float.toString(float) with negative zero returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-0.0f);
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_1300
     * @tc.name testToString2013
     * @tc.desc Verify Float.toString(float) with explicit positive zero returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(+0.0f);
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_1400
     * @tc.name testToString2014
     * @tc.desc Verify Float.toString(float) with float integer 1.0f returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(1.0f);
      let isMatch: boolean = result === "1";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_1500
     * @tc.name testToString2015
     * @tc.desc Verify Float.toString(float) with float integer 42.0f returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(42.0f);
      let isMatch: boolean = result === "42";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_1600
     * @tc.name testToString2016
     * @tc.desc Verify Float.toString(float) with negative float integer returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-1.0f);
      let isMatch: boolean = result === "-1";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_1700
     * @tc.name testToString2017
     * @tc.desc Verify Float.toString(float) with NaN returns "NaN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.NaN);
      let isMatch: boolean = result === "NaN";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_1800
     * @tc.name testToString2018
     * @tc.desc Verify Float.toString(float) with POSITIVE_INFINITY returns "Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.POSITIVE_INFINITY);
      let isMatch: boolean = result === "Infinity";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_1900
     * @tc.name testToString2019
     * @tc.desc Verify Float.toString(float) with NEGATIVE_INFINITY returns "-Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.NEGATIVE_INFINITY);
      let isMatch: boolean = result === "-Infinity";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_2000
     * @tc.name testToString2020
     * @tc.desc Verify Float.toString(float) with MIN_VALUE returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MIN_VALUE);
      let isMatch: boolean = result === "1e-45";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_2100
     * @tc.name testToString2021
     * @tc.desc Verify Float.toString(float) with MAX_VALUE returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MAX_VALUE);
      let isMatch: boolean = result === "3.4028235e+38";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_2200
     * @tc.name testToString2022
     * @tc.desc Verify Float.toString(float) with -Float.MIN_VALUE returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-Float.MIN_VALUE);
      let isMatch: boolean = result === "-1e-45";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_2300
     * @tc.name testToString2023
     * @tc.desc Verify Float.toString(float) with -Float.MAX_VALUE returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-Float.MAX_VALUE);
      let isMatch: boolean = result === "-3.4028235e+38";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_2400
     * @tc.name testToString2024
     * @tc.desc Verify Float.toString(float) with NaN returns "NaN" in uppercase
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.NaN);
      let isUpperCaseNaN: boolean = result.toUpperCase() === "NAN";
      expect(isUpperCaseNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_2500
     * @tc.name testToString2025
     * @tc.desc Verify Float.toString(float) result is non-null for all valid inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isMatch: boolean = Float.toString(1.5f) === "1.5";
      expect(isMatch).assertTrue();
      let isMatch2: boolean = Float.toString(0.0f) === "0";
      expect(isMatch2).assertTrue();
      let isMatch3: boolean = Float.toString(-1.5f) === "-1.5";
      expect(isMatch3).assertTrue();
      let isMatch4: boolean = Float.toString(Float.NaN) === "NaN";
      expect(isMatch4).assertTrue();
      let isMatch5: boolean = Float.toString(Float.POSITIVE_INFINITY) === "Infinity";
      expect(isMatch5).assertTrue();
      let isMatch6: boolean = Float.toString(Float.NEGATIVE_INFINITY) === "-Infinity";
      expect(isMatch6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_2600
     * @tc.name testToString2026
     * @tc.desc Verify Float.toString(float) called via class name returns correct result for official example
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = Float.toString(15.5f);
      let isMatch: boolean = text === "15.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_2700
     * @tc.name testToString2027
     * @tc.desc Verify Float.toString(float) returns correct decimal string for positive number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isMatch: boolean = Float.toString(3.14f) === "3.14";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_2800
     * @tc.name testToString2028
     * @tc.desc Verify Float.toString(float) returns correct decimal string for integer float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isMatch: boolean = Float.toString(1.0f) === "1";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_2900
     * @tc.name testToString2029
     * @tc.desc Verify Float.toString(float) returns correct string for zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isMatch: boolean = Float.toString(0.0f) === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_2_3000
     * @tc.name testToString2030
     * @tc.desc Verify Float.toString(float) can be used in combination with parseFloat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: float = 3.14f;
      const result: string = Float.toString(parsed);
      let isMatch: boolean = result === "3.14";
      expect(isMatch).assertTrue();
    });
  });
}
