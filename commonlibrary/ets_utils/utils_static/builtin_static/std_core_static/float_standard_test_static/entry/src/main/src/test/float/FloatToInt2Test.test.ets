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

export default function FloatToInt2Test(): void {
  describe('FloatToInt2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_0100
     * @tc.name testToInt2001
     * @tc.desc Verify normal parameter count(1 param) for Float.toInt static method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(12.5f);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_0200
     * @tc.name testToInt2002
     * @tc.desc Verify Float.toInt with 0.0f returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(0.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_0300
     * @tc.name testToInt2003
     * @tc.desc Verify Float.toInt with -0.0f returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(-0.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_0400
     * @tc.name testToInt2004
     * @tc.desc Verify positive float truncation for Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toIntResult: int = Float.toInt(3.14f);
      expect(toIntResult).assertEqual(3);
      let toIntResult2: int = Float.toInt(100.0f);
      expect(toIntResult2).assertEqual(100);
      let toIntResult3: int = Float.toInt(12.9f);
      expect(toIntResult3).assertEqual(12);
      let toIntResult4: int = Float.toInt(0.5f);
      expect(toIntResult4).assertEqual(0);
      let toIntResult5: int = Float.toInt(0.999f);
      expect(toIntResult5).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_0500
     * @tc.name testToInt2005
     * @tc.desc Verify negative float truncation for Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toIntResult6: int = Float.toInt(-3.14f);
      expect(toIntResult6).assertEqual(-3);
      let toIntResult7: int = Float.toInt(-100.0f);
      expect(toIntResult7).assertEqual(-100);
      let toIntResult8: int = Float.toInt(-12.9f);
      expect(toIntResult8).assertEqual(-12);
      let toIntResult9: int = Float.toInt(-0.5f);
      expect(toIntResult9).assertEqual(0);
      let toIntResult10: int = Float.toInt(-0.999f);
      expect(toIntResult10).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_0600
     * @tc.name testToInt2006
     * @tc.desc Verify minimal decimal values for Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toIntResult11: int = Float.toInt(0.001f);
      expect(toIntResult11).assertEqual(0);
      let toIntResult12: int = Float.toInt(-0.001f);
      expect(toIntResult12).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_0700
     * @tc.name testToInt2007
     * @tc.desc Verify int max boundary value for Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(2147483647.0f);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_0800
     * @tc.name testToInt2008
     * @tc.desc Verify int min boundary value for Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(-2147483648.0f);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_0900
     * @tc.name testToInt2009
     * @tc.desc Verify zero and negative zero for Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toIntResult13: int = Float.toInt(0.0f);
      expect(toIntResult13).assertEqual(0);
      let toIntResult14: int = Float.toInt(-0.0f);
      expect(toIntResult14).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_1000
     * @tc.name testToInt2010
     * @tc.desc Verify overflow behavior for Float.toInt with large float values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: int = Float.toInt(2147483648.0f);
      const r2: int = Float.toInt(4294967296.0f);
      expect(r1).assertEqual(2147483647);
      expect(r2).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_1100
     * @tc.name testToInt2011
     * @tc.desc Verify underflow behavior for Float.toInt with large negative float values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: int = Float.toInt(-2147483649.0f);
      const r2: int = Float.toInt(-4294967296.0f);
      expect(r1).assertEqual(-2147483648);
      expect(r2).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_1200
     * @tc.name testToInt2012
     * @tc.desc Verify NaN value for Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(Float.NaN);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_1300
     * @tc.name testToInt2013
     * @tc.desc Verify positive infinity for Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_1400
     * @tc.name testToInt2014
     * @tc.desc Verify negative infinity for Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(Float.NEGATIVE_INFINITY);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_1500
     * @tc.name testToInt2015
     * @tc.desc Verify Float.MIN_VALUE and Float.MAX_VALUE for Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toIntResult15: int = Float.toInt(Float.MIN_VALUE);
      expect(toIntResult15).assertEqual(0);
      const maxResult: int = Float.toInt(Float.MAX_VALUE);
      expect(maxResult).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_1600
     * @tc.name testToInt2016
     * @tc.desc Verify int boundary +0.5 overflow for Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: int = Float.toInt(2147483647.5f);
      const r2: int = Float.toInt(-2147483648.5f);
      expect(r1).assertEqual(2147483647);
      expect(r2).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_1700
     * @tc.name testToInt2017
     * @tc.desc Verify Float.toInt with 1.0f returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(1.0f);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_1800
     * @tc.name testToInt2018
     * @tc.desc Verify Float.toInt with -1.0f returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(-1.0f);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_1900
     * @tc.name testToInt2019
     * @tc.desc Verify Float.toInt with large value 1.0e9f preserves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(1.0e9f);
      expect(result).assertEqual(1000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_2000
     * @tc.name testToInt2020
     * @tc.desc Verify Float.toInt with large negative value -1.0e9f preserves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(-1.0e9f);
      expect(result).assertEqual(-1000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_2100
     * @tc.name testToInt2021
     * @tc.desc Verify Float.toInt with near-int-max value truncates correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(2147483000.0f);
      expect(result).assertEqual(2147483008);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_2200
     * @tc.name testToInt2022
     * @tc.desc Verify Float.toInt with near-int-min value truncates correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(-2147483000.0f);
      expect(result).assertEqual(-2147483008);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_2300
     * @tc.name testToInt2023
     * @tc.desc Verify Float.toInt return value correctness
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toIntResult16: int = Float.toInt(12.5f);
      expect(toIntResult16).assertEqual(12);
      let toIntResult17: int = Float.toInt(-12.5f);
      expect(toIntResult17).assertEqual(-12);
      let toIntResult18: int = Float.toInt(100.0f);
      expect(toIntResult18).assertEqual(100);
      let toIntResult19: int = Float.toInt(-100.0f);
      expect(toIntResult19).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_2400
     * @tc.name testToInt2024
     * @tc.desc Verify Float.toInt return value is within int range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(100.0f);
      expect(result >= -2147483648 && result <= 2147483647).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_2500
     * @tc.name testToInt2025
     * @tc.desc Verify Float.toInt return value used in expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum: int = Float.toInt(12.5f) + 1;
      expect(sum).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_2600
     * @tc.name testToInt2026
     * @tc.desc Verify Float.toInt as condition expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cond: boolean = Float.toInt(12.5f) > 0;
      expect(cond).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_2700
     * @tc.name testToInt2027
     * @tc.desc Verify same input multiple calls produce consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: int = Float.toInt(12.5f);
      const r2: int = Float.toInt(12.5f);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_2800
     * @tc.name testToInt2028
     * @tc.desc Verify Float.toInt return boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toIntResult20: int = Float.toInt(1.0f);
      expect(toIntResult20).assertEqual(1);
      let toIntResult21: int = Float.toInt(-1.0f);
      expect(toIntResult21).assertEqual(-1);
      let toIntResult22: int = Float.toInt(0.0f);
      expect(toIntResult22).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_2900
     * @tc.name testToInt2029
     * @tc.desc Verify Float.toInt with float from float|string union after typeof narrowing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float | string = 123.0f;
      if (typeof value !== 'string') {
        let toIntResult23: int = Float.toInt(value);
        expect(toIntResult23).assertEqual(123);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_3000
     * @tc.name testToInt2030
     * @tc.desc Verify float|null union narrowed to float works with Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float | null = 3.14f;
      expect(value !== null).assertTrue();
      let toIntResult24: int = Float.toInt(value!);
      expect(toIntResult24).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_2_3100
     * @tc.name testToInt2031
     * @tc.desc Verify float|undefined union narrowed to float works with Float.toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float | undefined = 42.0f;
      expect(value !== undefined).assertTrue();
      let toIntResult25: int = Float.toInt(value!);
      expect(toIntResult25).assertEqual(42);
    });
  });
}
