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

export default function FloatIsNaN2Test(): void {
  describe('FloatIsNaN2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_0100
     * @tc.name testIsNaN2001
     * @tc.desc Verify instance isNaN returns true when Float instance value is Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      const result: boolean = value.isNaN();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_0200
     * @tc.name testIsNaN2002
     * @tc.desc Verify instance isNaN returns false when Float instance value is a normal positive float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5f);
      const result: boolean = value.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_0300
     * @tc.name testIsNaN2003
     * @tc.desc Verify instance isNaN returns false when Float instance value is positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f);
      const result: boolean = value.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_0400
     * @tc.name testIsNaN2004
     * @tc.desc Verify instance isNaN returns false when Float instance value is negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-0.0f);
      const result: boolean = value.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_0500
     * @tc.name testIsNaN2005
     * @tc.desc Verify instance isNaN returns false when Float instance value is Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.POSITIVE_INFINITY);
      const result: boolean = value.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_0600
     * @tc.name testIsNaN2006
     * @tc.desc Verify instance isNaN returns false when Float instance value is Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NEGATIVE_INFINITY);
      const result: boolean = value.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_0700
     * @tc.name testIsNaN2007
     * @tc.desc Verify instance isNaN returns false when Float instance value is Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MAX_VALUE);
      const result: boolean = value.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_0800
     * @tc.name testIsNaN2008
     * @tc.desc Verify instance isNaN returns false when Float instance value is Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MIN_VALUE);
      const result: boolean = value.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_0900
     * @tc.name testIsNaN2009
     * @tc.desc Verify instance isNaN returns true when Float value is computed NaN (0.0f / 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f / 0.0f);
      const result: boolean = value.isNaN();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_1000
     * @tc.name testIsNaN2010
     * @tc.desc Verify instance isNaN returns false when Float value is computed Infinity (1.0f / 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.0f / 0.0f);
      const result: boolean = value.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_1100
     * @tc.name testIsNaN2011
     * @tc.desc Verify instance isNaN and static Float.isNaN return consistent result for NaN value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NaN);
      const instanceResult: boolean = value.isNaN();
      const staticResult: boolean = Float.isNaN(Float.NaN);
      const isConsistent: boolean = instanceResult === staticResult;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_1200
     * @tc.name testIsNaN2012
     * @tc.desc Verify instance isNaN and static Float.isNaN return consistent result for normal value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(1.5f);
      const instanceResult: boolean = value.isNaN();
      const staticResult: boolean = Float.isNaN(1.5f);
      const isConsistent: boolean = instanceResult === staticResult;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_1300
     * @tc.name testIsNaN2013
     * @tc.desc Verify instance isNaN and static Float.isNaN return consistent result for positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(0.0f);
      const instanceResult: boolean = value.isNaN();
      const staticResult: boolean = Float.isNaN(0.0f);
      const isConsistent: boolean = instanceResult === staticResult;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_1400
     * @tc.name testIsNaN2014
     * @tc.desc Verify instance isNaN and static Float.isNaN return consistent result for negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(-0.0f);
      const instanceResult: boolean = value.isNaN();
      const staticResult: boolean = Float.isNaN(-0.0f);
      const isConsistent: boolean = instanceResult === staticResult;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_1500
     * @tc.name testIsNaN2015
     * @tc.desc Verify instance isNaN and static Float.isNaN return consistent result for POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.POSITIVE_INFINITY);
      const instanceResult: boolean = value.isNaN();
      const staticResult: boolean = Float.isNaN(Float.POSITIVE_INFINITY);
      const isConsistent: boolean = instanceResult === staticResult;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_1600
     * @tc.name testIsNaN2016
     * @tc.desc Verify instance isNaN and static Float.isNaN return consistent result for NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.NEGATIVE_INFINITY);
      const instanceResult: boolean = value.isNaN();
      const staticResult: boolean = Float.isNaN(Float.NEGATIVE_INFINITY);
      const isConsistent: boolean = instanceResult === staticResult;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_1700
     * @tc.name testIsNaN2017
     * @tc.desc Verify instance isNaN and static Float.isNaN return consistent result for Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MAX_VALUE);
      const instanceResult: boolean = value.isNaN();
      const staticResult: boolean = Float.isNaN(Float.MAX_VALUE);
      const isConsistent: boolean = instanceResult === staticResult;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_1800
     * @tc.name testIsNaN2018
     * @tc.desc Verify instance isNaN and static Float.isNaN return consistent result for Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float(Float.MIN_VALUE);
      const instanceResult: boolean = value.isNaN();
      const staticResult: boolean = Float.isNaN(Float.MIN_VALUE);
      const isConsistent: boolean = instanceResult === staticResult;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_1900
     * @tc.name testIsNaN2019
     * @tc.desc Verify isNaN on Float instance after narrowing from Float|null union
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Float | null = new Float(Float.NaN);
      expect(value !== null).assertTrue();
      let isNaNResult: boolean = value!.isNaN();
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_2_2000
     * @tc.name testIsNaN2020
     * @tc.desc Verify isNaN on Float|undefined union after re-assigning NaN instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsNaN2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Float | undefined = undefined;
      value = new Float(Float.NaN);
      expect(value !== undefined).assertTrue();
      let isNaNResult2: boolean = value!.isNaN();
      expect(isNaNResult2).assertTrue();
    });
  });
}
