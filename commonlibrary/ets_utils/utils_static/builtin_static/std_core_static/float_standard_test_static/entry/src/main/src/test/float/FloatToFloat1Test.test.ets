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

export default function FloatToFloat1Test(): void {
  describe('FloatToFloat1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_0100
     * @tc.name testToFloat1001
     * @tc.desc Verify no-arg call to toFloat() returns correct float value 1.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.5f);
      const result: float = value.toFloat();
      expect(result).assertEqual(1.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_0200
     * @tc.name testToFloat1002
     * @tc.desc Verify zero float 0.0f returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(0.0f).toFloat();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_0300
     * @tc.name testToFloat1003
     * @tc.desc Verify negative float -1.5f returns -1.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(-1.5f).toFloat();
      expect(result).assertEqual(-1.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_0400
     * @tc.name testToFloat1004
     * @tc.desc Verify integer float 100.0f returns 100.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(100.0f).toFloat();
      expect(result).assertEqual(100.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_0500
     * @tc.name testToFloat1005
     * @tc.desc Verify pi float 3.14159f returns 3.14159f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(3.14159f).toFloat();
      expect(result).assertEqual(3.14159f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_0600
     * @tc.name testToFloat1006
     * @tc.desc Verify positive float 1.0f returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(1.0f).toFloat();
      expect(result).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_0700
     * @tc.name testToFloat1007
     * @tc.desc Verify negative float -1.0f returns -1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(-1.0f).toFloat();
      expect(result).assertEqual(-1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_0800
     * @tc.name testToFloat1008
     * @tc.desc Verify positive decimal 123.456f returns 123.456f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(123.456f).toFloat();
      expect(result).assertEqual(123.456f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_0900
     * @tc.name testToFloat1009
     * @tc.desc Verify negative decimal -789.012f returns -789.012f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(-789.012f).toFloat();
      expect(result).assertEqual(-789.012f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_1000
     * @tc.name testToFloat1010
     * @tc.desc Verify tiny positive 0.001f returns 0.001f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(0.001f).toFloat();
      expect(result).assertEqual(0.001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_1100
     * @tc.name testToFloat1011
     * @tc.desc Verify tiny negative -0.001f returns -0.001f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(-0.001f).toFloat();
      expect(result).assertEqual(-0.001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_1200
     * @tc.name testToFloat1012
     * @tc.desc Verify NaN returns NaN (NaN compared as not equal to itself)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(Float.NaN).toFloat();
      let isNaNResult: boolean = Float.isNaN(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_1300
     * @tc.name testToFloat1013
     * @tc.desc Verify positive infinity returns positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(Float.POSITIVE_INFINITY).toFloat();
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_1400
     * @tc.name testToFloat1014
     * @tc.desc Verify negative infinity returns negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(Float.NEGATIVE_INFINITY).toFloat();
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_1500
     * @tc.name testToFloat1015
     * @tc.desc Verify MIN_VALUE returns the minimum positive float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(Float.MIN_VALUE).toFloat();
      expect(result).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_1600
     * @tc.name testToFloat1016
     * @tc.desc Verify MAX_VALUE returns the maximum float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(Float.MAX_VALUE).toFloat();
      expect(result).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_1700
     * @tc.name testToFloat1017
     * @tc.desc Verify negative zero -0.0f returns float type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(-0.0f).toFloat();
      let isNegativeZero: boolean = 1.0f / result === Float.NEGATIVE_INFINITY;
      expect(isNegativeZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_1800
     * @tc.name testToFloat1018
     * @tc.desc Verify EPSILON returns the Float.EPSILON value via toFloat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(Float.EPSILON).toFloat();
      expect(result).assertEqual(Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_1900
     * @tc.name testToFloat1019
     * @tc.desc Verify toFloat value equals constructed value for 1.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.5f;
      const result: float = new Float(val).toFloat();
      expect(result).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_2000
     * @tc.name testToFloat1020
     * @tc.desc Verify toFloat value equals constructed value for -2.7f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -2.7f;
      const result: float = new Float(val).toFloat();
      expect(result).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_2100
     * @tc.name testToFloat1021
     * @tc.desc Verify multiple calls on same instance return same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.5f);
      const r1: float = f.toFloat();
      const r2: float = f.toFloat();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_2200
     * @tc.name testToFloat1022
     * @tc.desc Verify toString on toFloat return value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1.5f).toFloat().toString();
      expect(result).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_2300
     * @tc.name testToFloat1023
     * @tc.desc Verify toFloat can participate in arithmetic operations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: float = new Float(2.0f).toFloat() + new Float(3.0f).toFloat();
      expect(r1).assertEqual(5.0f);
      const r2: float = new Float(5.0f).toFloat() - new Float(2.0f).toFloat();
      expect(r2).assertEqual(3.0f);
      const r3: float = new Float(4.0f).toFloat() * new Float(3.0f).toFloat();
      expect(r3).assertEqual(12.0f);
      const r4: float = new Float(10.0f).toFloat() / new Float(2.0f).toFloat();
      expect(r4).assertEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_2400
     * @tc.name testToFloat1024
     * @tc.desc Verify different instances with same value return same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Float = new Float(1.5f);
      const v2: Float = new Float(1.5f);
      let toFloatResult: float = v1.toFloat();
      expect(toFloatResult).assertEqual(v2.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_2500
     * @tc.name testToFloat1025
     * @tc.desc Verify toFloat does not modify the original Float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.5f);
      f.toFloat();
      const val: float = f.toFloat();
      expect(val).assertEqual(1.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_2600
     * @tc.name testToFloat1026
     * @tc.desc Verify value near MAX_VALUE returns correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(3.4028235e38f).toFloat();
      expect(result).assertEqual(3.4028235e38f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_2700
     * @tc.name testToFloat1027
     * @tc.desc Verify value near MIN_VALUE returns correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(1.4e-45f).toFloat();
      expect(result).assertEqual(1.4e-45f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_2800
     * @tc.name testToFloat1028
     * @tc.desc Verify 10 consecutive calls return the same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.14159f);
      let prev: float = f.toFloat();
      for (let i: int = 0; i < 10; i++) {
        const cur: float = f.toFloat();
        expect(cur).assertEqual(prev);
        prev = cur;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_2900
     * @tc.name testToFloat1029
     * @tc.desc Verify typical example code produces expected output
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.5f);
      const result: float = value.toFloat();
      expect(result).assertEqual(1.5f);
      let toStringResult: string = result.toString();
      expect(toStringResult).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_3000
     * @tc.name testToFloat1030
     * @tc.desc Verify default constructor Float() toFloat returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float().toFloat();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_3100
     * @tc.name testToFloat1031
     * @tc.desc Verify double literal constructor new Float(1.5) toFloat returns 1.5f (double-to-float narrow via constructor)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(1.5).toFloat();
      expect(result).assertEqual(1.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_1_3200
     * @tc.name testToFloat1032
     * @tc.desc Verify MAX_SAFE_INTEGER constructor toFloat returns correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(Float.MAX_SAFE_INTEGER).toFloat();
      expect(result).assertEqual(Float.MAX_SAFE_INTEGER);
    });
  });
}
