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

export default function FloatIsInteger2Test(): void {
  describe('FloatIsInteger2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_0100
     * @tc.name testIsInteger2001
     * @tc.desc Verify instance isInteger returns true for positive integer float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(2.0f);
      let isIntegerResult: boolean = value.isInteger();
      expect(isIntegerResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_0200
     * @tc.name testIsInteger2002
     * @tc.desc Verify instance isInteger returns true for larger positive integer float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(100.0f);
      let isIntegerResult2: boolean = value.isInteger();
      expect(isIntegerResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_0300
     * @tc.name testIsInteger2003
     * @tc.desc Verify instance isInteger returns true for positive integer float 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0f);
      let isIntegerResult3: boolean = value.isInteger();
      expect(isIntegerResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_0400
     * @tc.name testIsInteger2004
     * @tc.desc Verify instance isInteger returns true for zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f);
      let isIntegerResult4: boolean = value.isInteger();
      expect(isIntegerResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_0500
     * @tc.name testIsInteger2005
     * @tc.desc Verify instance isInteger returns true for negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-0.0f);
      let isIntegerResult5: boolean = value.isInteger();
      expect(isIntegerResult5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_0600
     * @tc.name testIsInteger2006
     * @tc.desc Verify instance isInteger returns true for negative integer float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-5.0f);
      let isIntegerResult6: boolean = value.isInteger();
      expect(isIntegerResult6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_0700
     * @tc.name testIsInteger2007
     * @tc.desc Verify instance isInteger returns true for negative integer float -100.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-100.0f);
      let isIntegerResult7: boolean = value.isInteger();
      expect(isIntegerResult7).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_0800
     * @tc.name testIsInteger2008
     * @tc.desc Verify instance isInteger returns true for negative integer float -1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-1.0f);
      let isIntegerResult8: boolean = value.isInteger();
      expect(isIntegerResult8).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_0900
     * @tc.name testIsInteger2009
     * @tc.desc Verify instance isInteger returns false for positive decimal float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(2.5f);
      let isIntegerResult9: boolean = value.isInteger();
      expect(isIntegerResult9).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_1000
     * @tc.name testIsInteger2010
     * @tc.desc Verify instance isInteger returns false for pi float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(3.14f);
      let isIntegerResult10: boolean = value.isInteger();
      expect(isIntegerResult10).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_1100
     * @tc.name testIsInteger2011
     * @tc.desc Verify instance isInteger returns false for small decimal float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.1f);
      let isIntegerResult11: boolean = value.isInteger();
      expect(isIntegerResult11).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_1200
     * @tc.name testIsInteger2012
     * @tc.desc Verify instance isInteger returns false for negative decimal float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-2.5f);
      let isIntegerResult12: boolean = value.isInteger();
      expect(isIntegerResult12).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_1300
     * @tc.name testIsInteger2013
     * @tc.desc Verify instance isInteger returns false for negative pi float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-3.14f);
      let isIntegerResult13: boolean = value.isInteger();
      expect(isIntegerResult13).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_1400
     * @tc.name testIsInteger2014
     * @tc.desc Verify instance isInteger returns false for negative small decimal float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-0.1f);
      let isIntegerResult14: boolean = value.isInteger();
      expect(isIntegerResult14).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_1500
     * @tc.name testIsInteger2015
     * @tc.desc Verify instance isInteger returns false for NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      let isIntegerResult15: boolean = value.isInteger();
      expect(isIntegerResult15).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_1600
     * @tc.name testIsInteger2016
     * @tc.desc Verify instance isInteger returns false for POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.POSITIVE_INFINITY);
      let isIntegerResult16: boolean = value.isInteger();
      expect(isIntegerResult16).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_1700
     * @tc.name testIsInteger2017
     * @tc.desc Verify instance isInteger returns false for NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NEGATIVE_INFINITY);
      let isIntegerResult17: boolean = value.isInteger();
      expect(isIntegerResult17).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_1800
     * @tc.name testIsInteger2018
     * @tc.desc Verify instance isInteger returns true for Float.MAX_VALUE (mathematically integer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MAX_VALUE);
      let isIntegerResult18: boolean = value.isInteger();
      expect(isIntegerResult18).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_1900
     * @tc.name testIsInteger2019
     * @tc.desc Verify instance isInteger returns true for Float.MIN_VALUE (ArkTS treats MIN_VALUE as integer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MIN_VALUE);
      let isIntegerResult19: boolean = value.isInteger();
      expect(isIntegerResult19).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_2000
     * @tc.name testIsInteger2020
     * @tc.desc Verify instance isInteger returns true for computed integer value (20.0f / 5.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(20.0f / 5.0f);
      let isIntegerResult20: boolean = value.isInteger();
      expect(isIntegerResult20).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_2100
     * @tc.name testIsInteger2021
     * @tc.desc Verify instance isInteger and static Float.isInteger return consistent result for integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(5.0f);
      let isIntegerResult21: boolean = value.isInteger();
      expect(isIntegerResult21).assertEqual(Float.isInteger(5.0f));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_2200
     * @tc.name testIsInteger2022
     * @tc.desc Verify instance isInteger and static Float.isInteger return consistent result for non-integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(2.5f);
      let isIntegerResult22: boolean = value.isInteger();
      expect(isIntegerResult22).assertEqual(Float.isInteger(2.5f));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_2300
     * @tc.name testIsInteger2023
     * @tc.desc Verify instance isInteger and static Float.isInteger return consistent result for NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      let isIntegerResult23: boolean = value.isInteger();
      expect(isIntegerResult23).assertEqual(Float.isInteger(Float.NaN));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_2_2400
     * @tc.name testIsInteger2024
     * @tc.desc Verify instance isInteger and static Float.isInteger return consistent result for Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsInteger2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.POSITIVE_INFINITY);
      let isIntegerResult24: boolean = value.isInteger();
      expect(isIntegerResult24).assertEqual(Float.isInteger(Float.POSITIVE_INFINITY));
    });
  });
}
