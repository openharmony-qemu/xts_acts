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

export default function FloatCompareTest(): void {
  describe('FloatCompareTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_0100
     * @tc.name testCompare001
     * @tc.desc Verify compare static method via class name returns boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(1.0f, 1.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_0200
     * @tc.name testCompare002
     * @tc.desc Verify compare with 2 parameters normal call returns boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(1.0f, 2.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_0300
     * @tc.name testCompare003
     * @tc.desc Verify compare returns true for exactly same values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(-5.0f, -5.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_0400
     * @tc.name testCompare004
     * @tc.desc Verify compare returns true for values with difference less than DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: float = 1.0f;
      let rhs: float = 1.0f + Float.DELTA / 4.0f;
      let result: boolean = Float.compare(lhs, rhs);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_0500
     * @tc.name testCompare005
     * @tc.desc Verify compare returns true for same positive values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(3.14f, 3.14f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_0600
     * @tc.name testCompare006
     * @tc.desc Verify compare returns true for same negative values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(-2.5f, -2.5f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_0700
     * @tc.name testCompare007
     * @tc.desc Verify compare returns true for same zero values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(0.0f, 0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_0800
     * @tc.name testCompare008
     * @tc.desc Verify compare returns true when difference equals DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: float = 1.0f;
      let rhs: float = 1.0f + Float.DELTA;
      let result: boolean = Float.compare(lhs, rhs);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_0900
     * @tc.name testCompare009
     * @tc.desc Verify compare returns true when negative direction difference equals DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: float = 1.0f;
      let rhs: float = 1.0f - Float.DELTA;
      let result: boolean = Float.compare(lhs, rhs);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_1000
     * @tc.name testCompare010
     * @tc.desc Verify compare returns false when difference is slightly greater than DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: float = 0.0f;
      let rhs: float = Float.DELTA + Float.DELTA / 100.0f;
      let result: boolean = Float.compare(lhs, rhs);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_1100
     * @tc.name testCompare011
     * @tc.desc Verify compare returns false when difference is clearly large positive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(1.0f, 10.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_1200
     * @tc.name testCompare012
     * @tc.desc Verify compare returns false when absolute difference is clearly large
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(10.0f, 1.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_1300
     * @tc.name testCompare013
     * @tc.desc Verify compare returns false for positive and negative values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(1.0f, -1.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_1400
     * @tc.name testCompare014
     * @tc.desc Verify compare behavior with NaN and NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.NaN, Float.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_1500
     * @tc.name testCompare015
     * @tc.desc Verify compare behavior with NaN and finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.NaN, 1.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_1600
     * @tc.name testCompare016
     * @tc.desc Verify compare behavior with finite value and NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(1.0f, Float.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_1700
     * @tc.name testCompare017
     * @tc.desc Verify compare behavior with NaN and positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.NaN, Float.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_1800
     * @tc.name testCompare018
     * @tc.desc Verify compare behavior with NaN and negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.NaN, Float.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_1900
     * @tc.name testCompare019
     * @tc.desc Verify compare behavior with positive infinity and NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.POSITIVE_INFINITY, Float.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2000
     * @tc.name testCompare020
     * @tc.desc Verify compare behavior with negative infinity and NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.NEGATIVE_INFINITY, Float.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2100
     * @tc.name testCompare021
     * @tc.desc Verify compare returns false for Infinity vs Infinity (|Infinity-Infinity|=NaN, NaN≤DELTA always false)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2200
     * @tc.name testCompare022
     * @tc.desc Verify compare returns false for -Infinity vs -Infinity (|-Infinity+Infinity|=NaN, NaN≤DELTA always false)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2300
     * @tc.name testCompare023
     * @tc.desc Verify compare returns false for positive infinity vs finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.POSITIVE_INFINITY, 1.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2400
     * @tc.name testCompare024
     * @tc.desc Verify compare behavior for finite value vs positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(1.0f, Float.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2500
     * @tc.name testCompare025
     * @tc.desc Verify compare behavior for negative infinity vs finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.NEGATIVE_INFINITY, -1.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2600
     * @tc.name testCompare026
     * @tc.desc Verify compare returns false for finite negative vs negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(-1.0f, Float.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2700
     * @tc.name testCompare027
     * @tc.desc Verify compare returns false for positive infinity vs negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.POSITIVE_INFINITY, Float.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2800
     * @tc.name testCompare028
     * @tc.desc Verify compare behavior for negative infinity vs positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.NEGATIVE_INFINITY, Float.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_2900
     * @tc.name testCompare029
     * @tc.desc Verify compare returns true for Float.EPSILON and 0.0f (within tolerance)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.EPSILON, 0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_3000
     * @tc.name testCompare030
     * @tc.desc Verify compare returns true for -0.0f and -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(-0.0f, -0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_3100
     * @tc.name testCompare031
     * @tc.desc Verify compare returns true for +0.0f and -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(0.0f, -0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_3200
     * @tc.name testCompare032
     * @tc.desc Verify compare returns true for -0.0f and +0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(-0.0f, 0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_3300
     * @tc.name testCompare033
     * @tc.desc Verify compare returns true for Float.MAX_VALUE vs itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.MAX_VALUE, Float.MAX_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_3400
     * @tc.name testCompare034
     * @tc.desc Verify compare result for Float.MIN_VALUE vs 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.MIN_VALUE, 0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_3500
     * @tc.name testCompare035
     * @tc.desc Verify compare returns false for Float.MAX_VALUE vs -Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.MAX_VALUE, -Float.MAX_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_3600
     * @tc.name testCompare036
     * @tc.desc Verify compare returns false for -Float.MAX_VALUE vs Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(-Float.MAX_VALUE, Float.MAX_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_3700
     * @tc.name testCompare037
     * @tc.desc Verify compare result for -Float.MIN_VALUE vs 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(-Float.MIN_VALUE, 0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_3800
     * @tc.name testCompare038
     * @tc.desc Verify compare returns true for difference less than DELTA by 1 ULP
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: float = Float.DELTA / 2.0f;
      let rhs: float = 0.0f;
      let result: boolean = Float.compare(lhs, rhs);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_3900
     * @tc.name testCompare039
     * @tc.desc Verify compare returns true for difference exactly equal to DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.compare(Float.DELTA, 0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_4000
     * @tc.name testCompare040
     * @tc.desc Verify compare returns false for difference greater than DELTA by 1 ULP
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: float = Float.DELTA + Float.DELTA / 100.0f;
      let rhs: float = 0.0f;
      let result: boolean = Float.compare(lhs, rhs);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_4100
     * @tc.name testCompare041
     * @tc.desc Verify compare returns only true or false across multiple inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let compareResult: boolean = Float.compare(1.0f, 1.0f);
      expect(compareResult).assertTrue();
      let compareResult2: boolean = Float.compare(1.0f, 2.0f);
      expect(compareResult2).assertFalse();
      let compareResult3: boolean = Float.compare(0.0f, 0.0f);
      expect(compareResult3).assertTrue();
      let compareResult4: boolean = Float.compare(Float.MAX_VALUE, Float.MAX_VALUE);
      expect(compareResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_4200
     * @tc.name testCompare042
     * @tc.desc Verify Float.compare after narrowing float|null and float|undefined unions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: float | null = 1.5f;
      let rhs: float | undefined = 1.5f;
      expect(lhs !== null).assertTrue();
      expect(rhs !== undefined).assertTrue();
      let compareResult: boolean = Float.compare(lhs!, rhs!);
      expect(compareResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARE_4300
     * @tc.name testCompare043
     * @tc.desc Verify Float.compare returns false when MAX_SAFE_INTEGER differs by 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCompare043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let diffResult: boolean = Float.compare(Float.MAX_SAFE_INTEGER, Float.MAX_SAFE_INTEGER + 1.0f);
      expect(diffResult).assertFalse();
    });
  });
}
