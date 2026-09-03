'use static'

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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function FloatToDouble1Test2(): void {
  describe('FloatToDouble1Test2', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(async (): Promise<void> => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_0100
     * @tc.name testFloatToDouble001
     * @tc.desc Verify toDouble() returns double value for int input for 42.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      const f: Float = new Float(val);
      expect(f.toDouble()).assertEqual(42.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_0200
     * @tc.name testFloatToDouble002
     * @tc.desc Verify int 2147483647 Float toDouble for 2147483648.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 2147483647;
      const f: Float = new Float(val);
      expect(f.toDouble()).assertEqual(2147483648.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_0300
     * @tc.name testFloatToDouble003
     * @tc.desc Verify Float toDouble for -3.140000104904175
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -3.14f;
      const f: Float = new Float(val);
      expect(f.toDouble()).assertEqual(-3.140000104904175);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_0400
     * @tc.name testFloatToDouble004
     * @tc.desc Verify Float toDouble for 4.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      expect(f.toDouble()).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_0500
     * @tc.name testFloatToDouble005
     * @tc.desc Verify toDouble for 42.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0);
      const r1: double = f.toDouble();
      const r2: double = f.toDouble();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_0600
     * @tc.name testFloatToDouble006
     * @tc.desc Verify toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(42.0);
      expect(val.toDouble()).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_0700
     * @tc.name testFloatToDouble007
     * @tc.desc Verify Float toDouble for -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -0.0f;
      const f: Float = new Float(val);
      expect(1.0 / f.toDouble()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_0800
     * @tc.name testFloatToDouble008
     * @tc.desc Verify Float.POSITIVE_INFINITY Float toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY;
      const f: Float = new Float(val);
      expect(f.toDouble()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_0900
     * @tc.name testFloatToDouble009
     * @tc.desc Verify short 32767 Float toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 32767;
      const f: Float = new Float(val);
      const r: double = f.toDouble();
      expect(r).assertEqual(32767.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_1000
     * @tc.name testFloatToDouble010
     * @tc.desc Verify short -32768 Float toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = -32768;
      const f: Float = new Float(val);
      const r: double = f.toDouble();
      expect(r).assertEqual(-32768.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_1100
     * @tc.name testFloatToDouble011
     * @tc.desc Verify toDouble() returns double value for short input for 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 0;
      const f: Float = new Float(val);
      const r: double = f.toDouble();
      expect(r).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_1200
     * @tc.name testFloatToDouble012
     * @tc.desc Verify toDouble() returns double value for byte input for 12.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 12 as byte;
      const f: Float = new Float(val);
      const r: double = f.toDouble();
      expect(r).assertEqual(12.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_1300
     * @tc.name testFloatToDouble013
     * @tc.desc Verify byte 127 Float toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 127 as byte;
      const f: Float = new Float(val);
      const r: double = f.toDouble();
      expect(r).assertEqual(127.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_1400
     * @tc.name testFloatToDouble014
     * @tc.desc Verify byte -128 Float toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const f: Float = new Float(val);
      const r: double = f.toDouble();
      expect(r).assertEqual(-128.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_1500
     * @tc.name testFloatToDouble015
     * @tc.desc Verify int -2147483648 Float toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -2147483648;
      const f: Float = new Float(val);
      const r: double = f.toDouble();
      expect(r).assertEqual(-2147483648.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_1600
     * @tc.name testFloatToDouble016
     * @tc.desc Verify long 9223372036854775807 Float toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 9223372036854775807;
      const f: Float = new Float(val);
      const r: double = f.toDouble();
      expect(r).assertClose(9223372036854775807.0, 0.00001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_1700
     * @tc.name testFloatToDouble017
     * @tc.desc Verify long -9223372036854775808 Float toDouble
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = -9223372036854775808;
      const f: Float = new Float(val);
      const r: double = f.toDouble();
      expect(r).assertClose(-9223372036854775808.0, 0.00001);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_1800
     * @tc.name testFloatToDouble018
     * @tc.desc Verify toDouble() on Float(1.0f) returns 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0f;
      const f: Float = new Float(val);
      expect(f.toDouble()).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_1900
     * @tc.name testFloatToDouble019
     * @tc.desc Verify toDouble() on Float(3.14f) returns approximately 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 3.14f;
      const f: Float = new Float(val);
      const result: double = f.toDouble();
      expect(result > 3.13).assertTrue();
      expect(result < 3.15).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_2000
     * @tc.name testFloatToDouble020
     * @tc.desc Verify toDouble() on Float(-1.0f) returns -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -1.0f;
      const f: Float = new Float(val);
      expect(f.toDouble()).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_2100
     * @tc.name testFloatToDouble021
     * @tc.desc Verify toDouble() on Float(-3.14f) returns approximately -3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -3.14f;
      const f: Float = new Float(val);
      const result: double = f.toDouble();
      expect(result < -3.13).assertTrue();
      expect(result > -3.15).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_2200
     * @tc.name testFloatToDouble022
     * @tc.desc Verify toDouble() on Float.MIN_VALUE returns a positive double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MIN_VALUE;
      const f: Float = new Float(val);
      expect(f.toDouble() > 0.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_2300
     * @tc.name testFloatToDouble023
     * @tc.desc Verify toDouble() on -Float.MIN_VALUE returns a negative double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -Float.MIN_VALUE;
      const f: Float = new Float(val);
      expect(f.toDouble() < 0.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_2400
     * @tc.name testFloatToDouble024
     * @tc.desc Verify toDouble() on Float.MAX_VALUE returns a large positive double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_VALUE;
      const f: Float = new Float(val);
      expect(f.toDouble() > 1.0e38).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_2500
     * @tc.name testFloatToDouble025
     * @tc.desc Verify toDouble() on -Float.MAX_VALUE returns a large negative double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -Float.MAX_VALUE;
      const f: Float = new Float(val);
      expect(f.toDouble() < -1.0e38).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_2600
     * @tc.name testFloatToDouble026
     * @tc.desc Verify toDouble() on Float.NaN returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN;
      const f: Float = new Float(val);
      const result: double = f.toDouble();
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_2700
     * @tc.name testFloatToDouble027
     * @tc.desc Verify toDouble() on Float.POSITIVE_INFINITY returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY;
      const f: Float = new Float(val);
      expect(f.toDouble() > 1.0e308).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_2800
     * @tc.name testFloatToDouble028
     * @tc.desc Verify toDouble() on Float.NEGATIVE_INFINITY returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NEGATIVE_INFINITY;
      const f: Float = new Float(val);
      expect(f.toDouble() < -1.0e308).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_2900
     * @tc.name testFloatToDouble029
     * @tc.desc Verify toDouble() on Float(1.0e10f) returns a large double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e10f;
      const f: Float = new Float(val);
      expect(f.toDouble() > 1.0e9).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_3000
     * @tc.name testFloatToDouble030
     * @tc.desc Verify toDouble() on Float(-1.0e10f) returns a large negative double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -1.0e10f;
      const f: Float = new Float(val);
      expect(f.toDouble() < -1.0e9).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_3100
     * @tc.name testFloatToDouble031
     * @tc.desc Verify toDouble() on Float(1.0e-10f) returns a small positive double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e-10f;
      const f: Float = new Float(val);
      expect(f.toDouble() > 0.0).assertTrue();
      expect(f.toDouble() < 1.0e-9).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_3200
     * @tc.name testFloatToDouble032
     * @tc.desc Verify toDouble() on Float(16777216.0f) returns 16777216.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 16777216.0f;
      const f: Float = new Float(val);
      expect(f.toDouble()).assertEqual(16777216.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_3300
     * @tc.name testFloatToDouble033
     * @tc.desc Verify toDouble() on Float(16777217.0f) returns 16777216.0 due to precision loss
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 16777217.0f;
      const f: Float = new Float(val);
      expect(f.toDouble()).assertEqual(16777216.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_3400
     * @tc.name testFloatToDouble034
     * @tc.desc Verify toDouble() on Float(0.0f / 0.0f) NaN returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 0.0f / 0.0f;
      const f: Float = new Float(val);
      const result: double = f.toDouble();
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_ONE_3500
     * @tc.name testFloatToDouble035
     * @tc.desc Verify toDouble() on Float(1.0f / 0.0f) returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToDouble035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0f / 0.0f;
      const f: Float = new Float(val);
      expect(f.toDouble() > 1.0e308).assertTrue();
    });

  });
}
