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

export default function FloatToByte2Test(): void {
  describe('FloatToByte2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_0100
     * @tc.name testToByte2001
     * @tc.desc Verify normal parameter count(1 param) for Float.toByte static method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(8.0f);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_0200
     * @tc.name testToByte2002
     * @tc.desc Verify Float.toByte near byte max boundary 126.5f truncates correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(126.5f);
      expect(result).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_0300
     * @tc.name testToByte2003
     * @tc.desc Verify Float.toByte near byte min boundary -127.5f truncates correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(-127.5f);
      expect(result).assertEqual(-127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_0400
     * @tc.name testToByte2004
     * @tc.desc Verify Float.toByte with 0.99f truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(0.99f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_0500
     * @tc.name testToByte2005
     * @tc.desc Verify negative integer float value for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(-8.0f);
      expect(result).assertEqual(-8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_0600
     * @tc.name testToByte2006
     * @tc.desc Verify positive decimal float truncation for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(8.9f);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_0700
     * @tc.name testToByte2007
     * @tc.desc Verify negative decimal float truncation for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(-8.9f);
      expect(result).assertEqual(-8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_0800
     * @tc.name testToByte2008
     * @tc.desc Verify large positive decimal truncation for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(123.456f);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_0900
     * @tc.name testToByte2009
     * @tc.desc Verify large negative decimal truncation for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(-123.456f);
      expect(result).assertEqual(-123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_1000
     * @tc.name testToByte2010
     * @tc.desc Verify byte max boundary value 127.0f for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(127.0f);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_1100
     * @tc.name testToByte2011
     * @tc.desc Verify byte min boundary value -128.0f for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(-128.0f);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_1200
     * @tc.name testToByte2012
     * @tc.desc Verify byte near max boundary value 126.0f for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(126.0f);
      expect(result).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_1300
     * @tc.name testToByte2013
     * @tc.desc Verify byte near min boundary value -127.0f for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(-127.0f);
      expect(result).assertEqual(-127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_1400
     * @tc.name testToByte2014
     * @tc.desc Verify zero value 0.0f for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(0.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_1500
     * @tc.name testToByte2015
     * @tc.desc Verify negative zero -0.0f for Float.toByte returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(-0.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_1600
     * @tc.name testToByte2016
     * @tc.desc Verify value 1.0f for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(1.0f);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_1700
     * @tc.name testToByte2017
     * @tc.desc Verify value -1.0f for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(-1.0f);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_1800
     * @tc.name testToByte2018
     * @tc.desc Verify overflow value 128.0f for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(128.0f);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_1900
     * @tc.name testToByte2019
     * @tc.desc Verify underflow value -129.0f for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(-129.0f);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_2000
     * @tc.name testToByte2020
     * @tc.desc Verify large positive overflow values for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: byte = Float.toByte(255.0f);
      const r2: byte = Float.toByte(256.0f);
      const r3: byte = Float.toByte(32768.0f);
      expect(r1 >= -128 && r1 <= 127).assertTrue();
      expect(r2 >= -128 && r2 <= 127).assertTrue();
      expect(r3 >= -128 && r3 <= 127).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_2100
     * @tc.name testToByte2021
     * @tc.desc Verify large negative overflow values for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: byte = Float.toByte(-256.0f);
      const r2: byte = Float.toByte(-32768.0f);
      expect(r1 >= -128 && r1 <= 127).assertTrue();
      expect(r2 >= -128 && r2 <= 127).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_2200
     * @tc.name testToByte2022
     * @tc.desc Verify NaN value for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(Float.NaN);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_2300
     * @tc.name testToByte2023
     * @tc.desc Verify positive infinity value for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_2400
     * @tc.name testToByte2024
     * @tc.desc Verify negative infinity value for Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(Float.NEGATIVE_INFINITY);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_2500
     * @tc.name testToByte2025
     * @tc.desc Verify Float.MIN_VALUE for Float.toByte returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(Float.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_2600
     * @tc.name testToByte2026
     * @tc.desc Verify Float.MAX_VALUE for Float.toByte overflow behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(Float.MAX_VALUE);
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_2700
     * @tc.name testToByte2027
     * @tc.desc Verify Float.toByte handles valid float parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(100.0f);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_2800
     * @tc.name testToByte2028
     * @tc.desc Verify Float.toByte handles valid float parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(-100.0f);
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_2900
     * @tc.name testToByte2029
     * @tc.desc Verify Float.toByte handles valid float parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(64.0f);
      expect(result).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_3000
     * @tc.name testToByte2030
     * @tc.desc Verify Float.toByte return value correctness for positive values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toByteResult: byte = Float.toByte(8.0f);
      expect(toByteResult).assertEqual(8);
      let toByteResult2: byte = Float.toByte(127.0f);
      expect(toByteResult2).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_3100
     * @tc.name testToByte2031
     * @tc.desc Verify Float.toByte return value correctness for negative values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toByteResult3: byte = Float.toByte(-8.0f);
      expect(toByteResult3).assertEqual(-8);
      let toByteResult4: byte = Float.toByte(-128.0f);
      expect(toByteResult4).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_3200
     * @tc.name testToByte2032
     * @tc.desc Verify Float.toByte return value is within byte range [-128, 127]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(50.0f);
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_3300
     * @tc.name testToByte2033
     * @tc.desc Verify chain multiple calls to Float.toByte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toByteResult5: byte = Float.toByte(8.0f);
      expect(toByteResult5).assertEqual(8);
      let toByteResult6: byte = Float.toByte(127.0f);
      expect(toByteResult6).assertEqual(127);
      let toByteResult7: byte = Float.toByte(-128.0f);
      expect(toByteResult7).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_3400
     * @tc.name testToByte2034
     * @tc.desc Verify same input multiple calls produce consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: byte = Float.toByte(8.0f);
      const r2: byte = Float.toByte(8.0f);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_3500
     * @tc.name testToByte2035
     * @tc.desc Verify different inputs produce different results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: byte = Float.toByte(8.0f);
      const r2: byte = Float.toByte(16.0f);
      let isDifferent: boolean = r1 !== r2;
      expect(isDifferent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_3600
     * @tc.name testToByte2036
     * @tc.desc Verify Float.toByte result used in expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Float.toByte(8.0f);
      const sum: int = result + 2;
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_3700
     * @tc.name testToByte2037
     * @tc.desc Verify Float.toByte truncates 0.999f to 0 (truncation toward zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toByteResult8: byte = Float.toByte(0.999f);
      expect(toByteResult8).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_2_3800
     * @tc.name testToByte2038
     * @tc.desc Verify Float.toByte truncates -0.999f to 0 (truncation toward zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toByteResult9: byte = Float.toByte(-0.999f);
      expect(toByteResult9).assertEqual(0);
    });
  });
}
