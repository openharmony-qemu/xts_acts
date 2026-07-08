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

export default function FloatIsFinite2Test(): void {
  describe('FloatIsFinite2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_0100
     * @tc.name testIsFinite2001
     * @tc.desc Verify instance isFinite returns true for normal positive float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0f);
      let isFiniteResult: boolean = value.isFinite();
      expect(isFiniteResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_0200
     * @tc.name testIsFinite2002
     * @tc.desc Verify instance isFinite returns true for zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f);
      let isFiniteResult2: boolean = value.isFinite();
      expect(isFiniteResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_0300
     * @tc.name testIsFinite2003
     * @tc.desc Verify instance isFinite returns true for negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-0.0f);
      let isFiniteResult3: boolean = value.isFinite();
      expect(isFiniteResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_0400
     * @tc.name testIsFinite2004
     * @tc.desc Verify instance isFinite returns true for Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MAX_VALUE);
      let isFiniteResult4: boolean = value.isFinite();
      expect(isFiniteResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_0500
     * @tc.name testIsFinite2005
     * @tc.desc Verify instance isFinite returns true for Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MIN_VALUE);
      let isFiniteResult5: boolean = value.isFinite();
      expect(isFiniteResult5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_0600
     * @tc.name testIsFinite2006
     * @tc.desc Verify instance isFinite returns true for negative float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-3.14f);
      let isFiniteResult6: boolean = value.isFinite();
      expect(isFiniteResult6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_0700
     * @tc.name testIsFinite2007
     * @tc.desc Verify instance isFinite returns false for Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.POSITIVE_INFINITY);
      let isFiniteResult7: boolean = value.isFinite();
      expect(isFiniteResult7).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_0800
     * @tc.name testIsFinite2008
     * @tc.desc Verify instance isFinite returns false for Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NEGATIVE_INFINITY);
      let isFiniteResult8: boolean = value.isFinite();
      expect(isFiniteResult8).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_0900
     * @tc.name testIsFinite2009
     * @tc.desc Verify instance isFinite returns false for Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      let isFiniteResult9: boolean = value.isFinite();
      expect(isFiniteResult9).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_1000
     * @tc.name testIsFinite2010
     * @tc.desc Verify instance isFinite returns false for division producing Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0f / 0.0f);
      let isFiniteResult10: boolean = value.isFinite();
      expect(isFiniteResult10).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_1100
     * @tc.name testIsFinite2011
     * @tc.desc Verify instance isFinite returns false for division producing negative Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-1.0f / 0.0f);
      let isFiniteResult11: boolean = value.isFinite();
      expect(isFiniteResult11).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_1200
     * @tc.name testIsFinite2012
     * @tc.desc Verify instance isFinite returns true for computed finite value (100.0f / 10.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(100.0f / 10.0f);
      let isFiniteResult12: boolean = value.isFinite();
      expect(isFiniteResult12).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_1300
     * @tc.name testIsFinite2013
     * @tc.desc Verify instance isFinite returns true for negative Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-Float.MAX_VALUE);
      let isFiniteResult13: boolean = value.isFinite();
      expect(isFiniteResult13).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_1400
     * @tc.name testIsFinite2014
     * @tc.desc Verify instance isFinite returns false for computed NaN (0.0f / 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f / 0.0f);
      let isFiniteResult14: boolean = value.isFinite();
      expect(isFiniteResult14).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_1500
     * @tc.name testIsFinite2015
     * @tc.desc Verify instance isFinite correctly distinguishes MAX_VALUE from POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal = new Float(Float.MAX_VALUE);
      const posInf = new Float(Float.POSITIVE_INFINITY);
      let isFiniteResult15: boolean = maxVal.isFinite();
      expect(isFiniteResult15).assertTrue();
      let isFiniteResult16: boolean = posInf.isFinite();
      expect(isFiniteResult16).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_1600
     * @tc.name testIsFinite2016
     * @tc.desc Verify instance isFinite and static Float.isFinite return consistent result for finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0f);
      let isFiniteResult17: boolean = value.isFinite();
      expect(isFiniteResult17).assertEqual(Float.isFinite(1.0f));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_1700
     * @tc.name testIsFinite2017
     * @tc.desc Verify instance isFinite and static Float.isFinite return consistent result for POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.POSITIVE_INFINITY);
      let isFiniteResult18: boolean = value.isFinite();
      expect(isFiniteResult18).assertEqual(Float.isFinite(Float.POSITIVE_INFINITY));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_1800
     * @tc.name testIsFinite2018
     * @tc.desc Verify instance isFinite and static Float.isFinite return consistent result for NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      let isFiniteResult19: boolean = value.isFinite();
      expect(isFiniteResult19).assertEqual(Float.isFinite(Float.NaN));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_1900
     * @tc.name testIsFinite2019
     * @tc.desc Verify instance isFinite and static Float.isFinite return consistent result for zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f);
      let isFiniteResult20: boolean = value.isFinite();
      expect(isFiniteResult20).assertEqual(Float.isFinite(0.0f));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_2000
     * @tc.name testIsFinite2020
     * @tc.desc Verify multiple calls to instance isFinite on NaN instance all return false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      let isFiniteResult21: boolean = value.isFinite();
      expect(isFiniteResult21).assertFalse();
      let isFiniteResult22: boolean = value.isFinite();
      expect(isFiniteResult22).assertFalse();
      let isFiniteResult23: boolean = value.isFinite();
      expect(isFiniteResult23).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_2100
     * @tc.name testIsFinite2021
     * @tc.desc Verify instance isFinite with float literal constructed Float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(3.14f);
      let isFiniteResult24: boolean = value.isFinite();
      expect(isFiniteResult24).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_2200
     * @tc.name testIsFinite2022
     * @tc.desc Verify instance isFinite with Float constants constructed instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Float(Float.MAX_VALUE);
      const value2 = new Float(Float.MIN_VALUE);
      let isFiniteResult25: boolean = value1.isFinite();
      expect(isFiniteResult25).assertTrue();
      let isFiniteResult26: boolean = value2.isFinite();
      expect(isFiniteResult26).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_2300
     * @tc.name testIsFinite2023
     * @tc.desc Verify instance isFinite is true and instance isNaN is false for finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0f);
      let isFiniteResult27: boolean = value.isFinite();
      expect(isFiniteResult27).assertTrue();
      let isNaNResult: boolean = value.isNaN();
      expect(isNaNResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_2400
     * @tc.name testIsFinite2024
     * @tc.desc Verify instance isFinite is false and instance isNaN is true for NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      let isFiniteResult28: boolean = value.isFinite();
      expect(isFiniteResult28).assertFalse();
      let isNaNResult2: boolean = value.isNaN();
      expect(isNaNResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_2500
     * @tc.name testIsFinite2025
     * @tc.desc Verify instance isFinite is true and instance isInfinite is false for finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(100.0f);
      let isFiniteResult29: boolean = value.isFinite();
      expect(isFiniteResult29).assertTrue();
      expect(!value.isFinite() && !value.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_2600
     * @tc.name testIsFinite2026
     * @tc.desc Verify instance isFinite is false and instance isInfinite is true for POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.POSITIVE_INFINITY);
      let isFiniteResult30: boolean = value.isFinite();
      expect(isFiniteResult30).assertFalse();
      expect(!value.isFinite() && !value.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_2700
     * @tc.name testIsFinite2027
     * @tc.desc Verify NaN is neither finite nor infinite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      let isFiniteResult31: boolean = value.isFinite();
      expect(isFiniteResult31).assertFalse();
      let isNaNResult3: boolean = value.isNaN();
      expect(isNaNResult3).assertTrue();
      expect(!value.isFinite() && value.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_2800
     * @tc.name testIsFinite2028
     * @tc.desc Verify instance isFinite returns true for half of Float.MAX_VALUE (large finite)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MAX_VALUE / 2.0f);
      let isFiniteResult32: boolean = value.isFinite();
      expect(isFiniteResult32).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_2900
     * @tc.name testIsFinite2029
     * @tc.desc Verify instance isFinite returns true for negative Float.MIN_VALUE (negative tiny finite)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-Float.MIN_VALUE);
      let isFiniteResult33: boolean = value.isFinite();
      expect(isFiniteResult33).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_3000
     * @tc.name testIsFinite2030
     * @tc.desc Verify isFinite on Float instance after narrowing from Float|null union
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Float | null = new Float(1.0f);
      expect(value !== null).assertTrue();
      let isFiniteResult34: boolean = value!.isFinite();
      expect(isFiniteResult34).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_3100
     * @tc.name testIsFinite2031
     * @tc.desc Verify isFinite after null reassignment correctly skips narrowing branch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Float | null = null;
      value = new Float(3.14f);
      expect(value !== null).assertTrue();
      let isFiniteResult35: boolean = value!.isFinite();
      expect(isFiniteResult35).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_2_3200
     * @tc.name testIsFinite2032
     * @tc.desc Verify isFinite on Float instance after narrowing from Float|undefined union
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsFinite2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Float | undefined = new Float(2.5f);
      expect(value !== undefined).assertTrue();
      let isFiniteResult36: boolean = value!.isFinite();
      expect(isFiniteResult36).assertTrue();
    });
  });
}
