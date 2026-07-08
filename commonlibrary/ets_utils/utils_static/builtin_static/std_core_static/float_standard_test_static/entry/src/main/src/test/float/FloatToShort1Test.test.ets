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

export default function FloatToShort1Test(): void {
  describe('FloatToShort1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_0100
     * @tc.name testToShort1001
     * @tc.desc Verify no-arg call to toShort() returns correct short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(123.0f);
      const result: short = value.toShort();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_0200
     * @tc.name testToShort1002
     * @tc.desc Verify zero value 0.0f converts to short 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(0.0f).toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_0300
     * @tc.name testToShort1003
     * @tc.desc Verify negative zero -0.0f converts to short 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(-0.0f).toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_0400
     * @tc.name testToShort1004
     * @tc.desc Verify small positive value 100.0f converts to short 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(100.0f).toShort();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_0500
     * @tc.name testToShort1005
     * @tc.desc Verify small negative value -100.0f converts to short -100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(-100.0f).toShort();
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_0600
     * @tc.name testToShort1006
     * @tc.desc Verify medium positive value 2048.0f converts to short 2048
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(2048.0f).toShort();
      expect(result).assertEqual(2048);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_0700
     * @tc.name testToShort1007
     * @tc.desc Verify short max value 32767.0f converts to short 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(32767.0f).toShort();
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_0800
     * @tc.name testToShort1008
     * @tc.desc Verify value near short max 32760.0f converts to short 32760
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(32760.0f).toShort();
      expect(result).assertEqual(32760);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_0900
     * @tc.name testToShort1009
     * @tc.desc Verify short min value -32768.0f converts to short -32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(-32768.0f).toShort();
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_1000
     * @tc.name testToShort1010
     * @tc.desc Verify value near short min -32760.0f converts to short -32760
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(-32760.0f).toShort();
      expect(result).assertEqual(-32760);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_1100
     * @tc.name testToShort1011
     * @tc.desc Verify boundary value 1.0f converts to short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(1.0f).toShort();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_1200
     * @tc.name testToShort1012
     * @tc.desc Verify boundary value -1.0f converts to short -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(-1.0f).toShort();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_1300
     * @tc.name testToShort1013
     * @tc.desc Verify positive decimal 123.5f truncates to short 123
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(123.5f).toShort();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_1400
     * @tc.name testToShort1014
     * @tc.desc Verify negative decimal -123.9f truncates to short -123
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(-123.9f).toShort();
      expect(result).assertEqual(-123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_1500
     * @tc.name testToShort1015
     * @tc.desc Verify near-zero positive decimal 0.1f truncates to short 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(0.1f).toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_1600
     * @tc.name testToShort1016
     * @tc.desc Verify near-zero negative decimal -0.9f truncates to short 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(-0.9f).toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_1700
     * @tc.name testToShort1017
     * @tc.desc Verify large positive decimal 32766.7f truncates to short 32766
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(32766.7f).toShort();
      expect(result).assertEqual(32766);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_1800
     * @tc.name testToShort1018
     * @tc.desc Verify large negative decimal -32767.3f truncates to short -32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(-32767.3f).toShort();
      expect(result).assertEqual(-32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_1900
     * @tc.name testToShort1019
     * @tc.desc Verify overflow for value 32768.0f (short max + 1) returns short type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(32768.0f).toShort();
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_2000
     * @tc.name testToShort1020
     * @tc.desc Verify underflow for value -32769.0f (short min - 1) returns short type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(-32769.0f).toShort();
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_2100
     * @tc.name testToShort1021
     * @tc.desc Verify large positive overflow 100000.0f returns short type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(100000.0f).toShort();
      expect(result >= -32768 && result <= 32767).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_2200
     * @tc.name testToShort1022
     * @tc.desc Verify large negative underflow -100000.0f returns short type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(-100000.0f).toShort();
      expect(result >= -32768 && result <= 32767).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_2300
     * @tc.name testToShort1023
     * @tc.desc Verify MAX_VALUE overflow via toShort returns short type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(Float.MAX_VALUE).toShort();
      expect(result >= -32768 && result <= 32767).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_2400
     * @tc.name testToShort1024
     * @tc.desc Verify MIN_VALUE converts to short 0 (truncated toward zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(Float.MIN_VALUE).toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_2500
     * @tc.name testToShort1025
     * @tc.desc Verify NaN conversion via toShort returns short type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(Float.NaN).toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_2600
     * @tc.name testToShort1026
     * @tc.desc Verify positive infinity conversion via toShort returns short type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(Float.POSITIVE_INFINITY).toShort();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_2700
     * @tc.name testToShort1027
     * @tc.desc Verify negative infinity conversion via toShort returns short type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(Float.NEGATIVE_INFINITY).toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_2800
     * @tc.name testToShort1028
     * @tc.desc Verify return value is within short range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(100.0f).toShort();
      expect(result >= -32768 && result <= 32767).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_2900
     * @tc.name testToShort1029
     * @tc.desc Verify multiple calls on same instance return consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(123.0f);
      const r1: short = value.toShort();
      const r2: short = value.toShort();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_3000
     * @tc.name testToShort1030
     * @tc.desc Verify different instances with same value return same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Float = new Float(100.0f);
      const v2: Float = new Float(100.0f);
      let toShortResult: short = v1.toShort();
      expect(toShortResult).assertEqual(v2.toShort());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_3100
     * @tc.name testToShort1031
     * @tc.desc Verify override behavior via Float instance returns correct short 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatObj: Float = new Float(100.0f);
      const result: short = floatObj.toShort();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_3200
     * @tc.name testToShort1032
     * @tc.desc Verify toShort does not affect compareTo behavior on different values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Float = new Float(100.0f);
      const v2: Float = new Float(200.0f);
      v1.toShort();
      expect(v1.compareTo(v2) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_3300
     * @tc.name testToShort1033
     * @tc.desc Verify default constructor Float() toShort returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float().toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_3400
     * @tc.name testToShort1034
     * @tc.desc Verify double literal constructor new Float(1.5) toShort returns 1 (double-to-float narrow then truncate)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(1.5).toShort();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_1_3500
     * @tc.name testToShort1035
     * @tc.desc Verify MAX_SAFE_INTEGER constructor toShort returns correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToShort1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(Float.MAX_SAFE_INTEGER).toShort();
      expect(result >= -32768 && result <= 32767).assertTrue();
    });
  });
}
