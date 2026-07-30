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

export default function FloatToShort2Test(): void {
  describe('FloatToShort2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_0100
     * @tc.name testToShort2001
     * @tc.desc Verify normal parameter count(1 param) for Float.toShort static method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(1024.0f);
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_0200
     * @tc.name testToShort2002
     * @tc.desc Verify negative float value -1024.0f for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(-1024.0f);
      expect(result).assertEqual(-1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_0300
     * @tc.name testToShort2003
     * @tc.desc Verify zero and negative zero for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toShortResult: short = Float.toShort(0.0f);
      expect(toShortResult).assertEqual(0);
      let toShortResult2: short = Float.toShort(-0.0f);
      expect(toShortResult2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_0400
     * @tc.name testToShort2004
     * @tc.desc Verify short max boundary value 32767.0f for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(32767.0f);
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_0500
     * @tc.name testToShort2005
     * @tc.desc Verify short min boundary value -32768.0f for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(-32768.0f);
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_0600
     * @tc.name testToShort2006
     * @tc.desc Verify short range positive values for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toShortResult3: short = Float.toShort(12345.0f);
      expect(toShortResult3).assertEqual(12345);
      let toShortResult4: short = Float.toShort(1.0f);
      expect(toShortResult4).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_0700
     * @tc.name testToShort2007
     * @tc.desc Verify short range negative values for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toShortResult5: short = Float.toShort(-12345.0f);
      expect(toShortResult5).assertEqual(-12345);
      let toShortResult6: short = Float.toShort(-1.0f);
      expect(toShortResult6).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_0800
     * @tc.name testToShort2008
     * @tc.desc Verify overflow value 32768.0f for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(32768.0f);
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_0900
     * @tc.name testToShort2009
     * @tc.desc Verify underflow value -32769.0f for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(-32769.0f);
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_1000
     * @tc.name testToShort2010
     * @tc.desc Verify far overflow large values for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: short = Float.toShort(65536.0f);
      const r2: short = Float.toShort(-65536.0f);
      const r3: short = Float.toShort(100000.0f);
      expect(r1).assertEqual(0);
      expect(r2).assertEqual(0);
      expect(r3).assertEqual(-31072);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_1100
     * @tc.name testToShort2011
     * @tc.desc Verify positive decimal truncation for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toShortResult7: short = Float.toShort(3.7f);
      expect(toShortResult7).assertEqual(3);
      let toShortResult8: short = Float.toShort(0.999f);
      expect(toShortResult8).assertEqual(0);
      let toShortResult9: short = Float.toShort(32766.999f);
      expect(toShortResult9).assertEqual(32766);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_1200
     * @tc.name testToShort2012
     * @tc.desc Verify negative decimal truncation for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toShortResult10: short = Float.toShort(-3.7f);
      expect(toShortResult10).assertEqual(-3);
      let toShortResult11: short = Float.toShort(-0.999f);
      expect(toShortResult11).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_1300
     * @tc.name testToShort2013
     * @tc.desc Verify NaN value for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(Float.NaN);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_1400
     * @tc.name testToShort2014
     * @tc.desc Verify positive infinity for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_1500
     * @tc.name testToShort2015
     * @tc.desc Verify negative infinity for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(Float.NEGATIVE_INFINITY);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_1600
     * @tc.name testToShort2016
     * @tc.desc Verify float MIN_VALUE for Float.toShort returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toShortResult12: short = Float.toShort(1.4e-45f);
      expect(toShortResult12).assertEqual(0);
      let toShortResult13: short = Float.toShort(Float.MIN_VALUE);
      expect(toShortResult13).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_1700
     * @tc.name testToShort2017
     * @tc.desc Verify large float value near MAX_VALUE for Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(3.4e38f);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_1800
     * @tc.name testToShort2018
     * @tc.desc Verify Float.toShort return value correctness
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toShortResult14: short = Float.toShort(1024.0f);
      expect(toShortResult14).assertEqual(1024);
      let toShortResult15: short = Float.toShort(-1024.0f);
      expect(toShortResult15).assertEqual(-1024);
      let toShortResult16: short = Float.toShort(0.0f);
      expect(toShortResult16).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_1900
     * @tc.name testToShort2019
     * @tc.desc Verify multiple consecutive calls to Float.toShort
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toShortResult17: short = Float.toShort(1.0f);
      expect(toShortResult17).assertEqual(1);
      let toShortResult18: short = Float.toShort(2.0f);
      expect(toShortResult18).assertEqual(2);
      let toShortResult19: short = Float.toShort(3.0f);
      expect(toShortResult19).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_2000
     * @tc.name testToShort2020
     * @tc.desc Verify Float.toShort return value used in expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum: int = Float.toShort(10.0f) + Float.toShort(20.0f);
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_2100
     * @tc.name testToShort2021
     * @tc.desc Verify Float.toShort result assigned to short variable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: short = Float.toShort(1024.0f);
      expect(r).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_2_2200
     * @tc.name testToShort2022
     * @tc.desc Verify same input multiple calls produce consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: short = Float.toShort(100.0f);
      const r2: short = Float.toShort(100.0f);
      expect(r1).assertEqual(r2);
    });
  });
}
