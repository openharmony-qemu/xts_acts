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

export default function FloatIsSafeInteger2Test(): void {
  describe('FloatIsSafeInteger2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_0100
     * @tc.name testIsSafeInteger2001
     * @tc.desc Verify instance isSafeInteger returns true for zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f);
      let isSafeIntegerResult: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_0200
     * @tc.name testIsSafeInteger2002
     * @tc.desc Verify instance isSafeInteger returns true for positive safe integer 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0f);
      let isSafeIntegerResult2: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_0300
     * @tc.name testIsSafeInteger2003
     * @tc.desc Verify instance isSafeInteger returns true for negative safe integer -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-1.0f);
      let isSafeIntegerResult3: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_0400
     * @tc.name testIsSafeInteger2004
     * @tc.desc Verify instance isSafeInteger returns true for Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MAX_SAFE_INTEGER);
      let isSafeIntegerResult4: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_0500
     * @tc.name testIsSafeInteger2005
     * @tc.desc Verify instance isSafeInteger returns true for negative Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-Float.MAX_SAFE_INTEGER);
      let isSafeIntegerResult5: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_0600
     * @tc.name testIsSafeInteger2006
     * @tc.desc Verify instance isSafeInteger returns true for positive safe integer 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(100.0f);
      let isSafeIntegerResult6: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_0700
     * @tc.name testIsSafeInteger2007
     * @tc.desc Verify instance isSafeInteger returns true for negative safe integer -100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-100.0f);
      let isSafeIntegerResult7: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult7).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_0800
     * @tc.name testIsSafeInteger2008
     * @tc.desc Verify instance isSafeInteger returns false for positive decimal 2.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(2.5f);
      let isSafeIntegerResult8: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult8).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_0900
     * @tc.name testIsSafeInteger2009
     * @tc.desc Verify instance isSafeInteger returns false for negative decimal -2.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-2.5f);
      let isSafeIntegerResult9: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult9).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_1000
     * @tc.name testIsSafeInteger2010
     * @tc.desc Verify instance isSafeInteger returns false for small decimal 0.1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.1f);
      let isSafeIntegerResult10: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult10).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_1100
     * @tc.name testIsSafeInteger2011
     * @tc.desc Verify instance isSafeInteger returns false for negative small decimal -0.1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-0.1f);
      let isSafeIntegerResult11: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult11).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_1200
     * @tc.name testIsSafeInteger2012
     * @tc.desc Verify instance isSafeInteger returns false for value exceeding MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      let isSafeIntegerResult12: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult12).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_1300
     * @tc.name testIsSafeInteger2013
     * @tc.desc Verify instance isSafeInteger returns false for value below negative MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-Float.MAX_SAFE_INTEGER - 1.0f);
      let isSafeIntegerResult13: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult13).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_1400
     * @tc.name testIsSafeInteger2014
     * @tc.desc Verify instance isSafeInteger returns false for large positive float 1e20
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1e20f);
      let isSafeIntegerResult14: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult14).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_1500
     * @tc.name testIsSafeInteger2015
     * @tc.desc Verify instance isSafeInteger returns false for large negative float -1e20
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-1e20f);
      let isSafeIntegerResult15: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult15).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_1600
     * @tc.name testIsSafeInteger2016
     * @tc.desc Verify instance isSafeInteger returns false for NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      let isSafeIntegerResult16: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult16).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_1700
     * @tc.name testIsSafeInteger2017
     * @tc.desc Verify instance isSafeInteger returns false for POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.POSITIVE_INFINITY);
      let isSafeIntegerResult17: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult17).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_1800
     * @tc.name testIsSafeInteger2018
     * @tc.desc Verify instance isSafeInteger returns false for NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NEGATIVE_INFINITY);
      let isSafeIntegerResult18: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult18).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_1900
     * @tc.name testIsSafeInteger2019
     * @tc.desc Verify instance isSafeInteger returns true for Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MIN_VALUE);
      let isSafeIntegerResult19: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult19).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_2000
     * @tc.name testIsSafeInteger2020
     * @tc.desc Verify instance isSafeInteger returns true for negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-0.0f);
      let isSafeIntegerResult20: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult20).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_2100
     * @tc.name testIsSafeInteger2021
     * @tc.desc Verify instance isSafeInteger returns false for Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MAX_VALUE);
      let isSafeIntegerResult21: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult21).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_2200
     * @tc.name testIsSafeInteger2022
     * @tc.desc Verify instance isSafeInteger returns true for MAX_SAFE_INTEGER minus 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MAX_SAFE_INTEGER - 1.0f);
      let isSafeIntegerResult22: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult22).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_2300
     * @tc.name testIsSafeInteger2023
     * @tc.desc Verify instance isSafeInteger returns false for decimal 0.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.5f);
      let isSafeIntegerResult23: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult23).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_2400
     * @tc.name testIsSafeInteger2024
     * @tc.desc Verify instance isSafeInteger returns true for negative MAX_SAFE_INTEGER plus 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-Float.MAX_SAFE_INTEGER + 1.0f);
      let isSafeIntegerResult24: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult24).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_2500
     * @tc.name testIsSafeInteger2025
     * @tc.desc Verify instance isSafeInteger and static isSafeInteger consistent for safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(5.0f);
      let isSafeIntegerResult25: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult25).assertEqual(Float.isSafeInteger(5.0f));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_2600
     * @tc.name testIsSafeInteger2026
     * @tc.desc Verify instance isSafeInteger and static isSafeInteger consistent for non-integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(2.5f);
      let isSafeIntegerResult26: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult26).assertEqual(Float.isSafeInteger(2.5f));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_2700
     * @tc.name testIsSafeInteger2027
     * @tc.desc Verify instance isSafeInteger and static isSafeInteger consistent for NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      let isSafeIntegerResult27: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult27).assertEqual(Float.isSafeInteger(Float.NaN));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_2800
     * @tc.name testIsSafeInteger2028
     * @tc.desc Verify instance isSafeInteger and static isSafeInteger consistent for out of range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      let isSafeIntegerResult28: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult28).assertEqual(Float.isSafeInteger(Float.MAX_SAFE_INTEGER + 1.0f));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_2900
     * @tc.name testIsSafeInteger2029
     * @tc.desc Verify instance isSafeInteger returns false for computed NaN (0.0f / 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f / 0.0f);
      let isSafeIntegerResult29: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult29).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_3000
     * @tc.name testIsSafeInteger2030
     * @tc.desc Verify instance isSafeInteger returns false for computed Infinity (1.0f / 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0f / 0.0f);
      let isSafeIntegerResult30: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult30).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_3100
     * @tc.name testIsSafeInteger2031
     * @tc.desc Verify instance isSafeInteger returns false for computed negative Infinity (-1.0f / 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-1.0f / 0.0f);
      let isSafeIntegerResult31: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult31).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_3200
     * @tc.name testIsSafeInteger2032
     * @tc.desc Verify instance isSafeInteger returns true for min safe integer (-MAX_SAFE_INTEGER)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-Float.MAX_SAFE_INTEGER);
      let isSafeIntegerResult32: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult32).assertTrue();
      let isSafeIntegerResult33: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult33).assertEqual(Float.isSafeInteger(-Float.MAX_SAFE_INTEGER));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_3300
     * @tc.name testIsSafeInteger2033
     * @tc.desc Verify instance isSafeInteger returns false for MIN_SAFE_INTEGER minus 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-Float.MAX_SAFE_INTEGER - 1.0f);
      let isSafeIntegerResult34: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult34).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_2_3400
     * @tc.name testIsSafeInteger2034
     * @tc.desc Verify instance isSafeInteger returns true for MIN_SAFE_INTEGER plus 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-Float.MAX_SAFE_INTEGER + 1.0f);
      let isSafeIntegerResult35: boolean = value.isSafeInteger();
      expect(isSafeIntegerResult35).assertTrue();
    });
  });
}
