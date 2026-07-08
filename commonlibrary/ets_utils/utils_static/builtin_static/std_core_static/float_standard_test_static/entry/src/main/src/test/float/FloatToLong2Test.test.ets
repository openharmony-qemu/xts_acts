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

export default function FloatToLong2Test(): void {
  describe('FloatToLong2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_0100
     * @tc.name testToLong2001
     * @tc.desc Verify normal parameter count(1 param) for Float.toLong static method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(12.5f);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_0200
     * @tc.name testToLong2002
     * @tc.desc Verify Float.toLong with 0.0f returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(0.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_0300
     * @tc.name testToLong2003
     * @tc.desc Verify Float.toLong with -0.0f returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(-0.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_0400
     * @tc.name testToLong2004
     * @tc.desc Verify Float.toLong with 1.0f returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(1.0f);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_0500
     * @tc.name testToLong2005
     * @tc.desc Verify positive float value truncation for Float.toLong
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(12.5f)).assertEqual(12);
      expect(Float.toLong(100.0f)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_0600
     * @tc.name testToLong2006
     * @tc.desc Verify negative float value truncation for Float.toLong
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(-12.5f)).assertEqual(-12);
      expect(Float.toLong(-100.0f)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_0700
     * @tc.name testToLong2007
     * @tc.desc Verify zero and negative zero for Float.toLong
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(0.0f)).assertEqual(0);
      expect(Float.toLong(-0.0f)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_0800
     * @tc.name testToLong2008
     * @tc.desc Verify large positive values within long range for Float.toLong
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(2147483647.0f);
      expect(result).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_0900
     * @tc.name testToLong2009
     * @tc.desc Verify large negative values within long range for Float.toLong
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(-2147483648.0f);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_1000
     * @tc.name testToLong2010
     * @tc.desc Verify overflow behavior beyond long range for Float.toLong
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: long = Float.toLong(9.223372E18f);
      const r2: long = Float.toLong(-9.223372E18f);
      expect(r1).assertEqual(9223372036854775807);
      expect(r2).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_1100
     * @tc.name testToLong2011
     * @tc.desc Verify Float.MAX_VALUE and -Float.MAX_VALUE for Float.toLong
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: long = Float.toLong(Float.MAX_VALUE);
      const r2: long = Float.toLong(-Float.MAX_VALUE);
      expect(r1).assertEqual(9223372036854775807);
      expect(r2).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_1200
     * @tc.name testToLong2012
     * @tc.desc Verify NaN value for Float.toLong
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(Float.NaN);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_1300
     * @tc.name testToLong2013
     * @tc.desc Verify positive infinity for Float.toLong
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_1400
     * @tc.name testToLong2014
     * @tc.desc Verify negative infinity for Float.toLong
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(Float.NEGATIVE_INFINITY);
      expect(result).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_1500
     * @tc.name testToLong2015
     * @tc.desc Verify decimal truncation for Float.toLong
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(12.9f)).assertEqual(12);
      expect(Float.toLong(-12.9f)).assertEqual(-12);
      expect(Float.toLong(0.999999f)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_1600
     * @tc.name testToLong2016
     * @tc.desc Verify Float.MIN_VALUE for Float.toLong returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(Float.MIN_VALUE)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_1700
     * @tc.name testToLong2017
     * @tc.desc Verify Float.toLong handles valid float parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(-1.0f);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_1800
     * @tc.name testToLong2018
     * @tc.desc Verify Float.toLong handles valid float parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(100.0f);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_1900
     * @tc.name testToLong2019
     * @tc.desc Verify Float.toLong handles valid float parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(-100.0f);
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_2000
     * @tc.name testToLong2020
     * @tc.desc Verify Float.toLong return value correctness
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(42.0f)).assertEqual(42);
      expect(Float.toLong(12.7f)).assertEqual(12);
      expect(Float.toLong(-12.7f)).assertEqual(-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_2100
     * @tc.name testToLong2021
     * @tc.desc Verify Float.toLong return value within long range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(100.0f);
      expect(result >= -9223372036854775808 && result <= 9223372036854775807).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_2200
     * @tc.name testToLong2022
     * @tc.desc Verify float precision for Float.toLong with large number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1: long = Float.toLong(1234567.0f);
      expect(result1).assertEqual(1234567);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_2300
     * @tc.name testToLong2023
     * @tc.desc Verify multiple consecutive calls to Float.toLong
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(1.0f)).assertEqual(1);
      expect(Float.toLong(2.0f)).assertEqual(2);
      expect(Float.toLong(3.0f)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_2_2400
     * @tc.name testToLong2024
     * @tc.desc Verify same input multiple calls produce consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLong2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: long = Float.toLong(12.5f);
      const r2: long = Float.toLong(12.5f);
      expect(r1).assertEqual(r2);
    });
  });
}
