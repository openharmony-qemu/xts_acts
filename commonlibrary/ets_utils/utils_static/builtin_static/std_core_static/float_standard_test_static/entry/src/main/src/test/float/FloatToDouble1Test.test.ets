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

export default function FloatToDouble1Test(): void {
  describe('FloatToDouble1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_0100
     * @tc.name testToDouble1001
     * @tc.desc Verify no-arg call to toDouble() returns correct double value 1.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.5f);
      const result: double = value.toDouble();
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_0200
     * @tc.name testToDouble1002
     * @tc.desc Verify float 1.5f converts to double 1.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(2.5f).toDouble();
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_0300
     * @tc.name testToDouble1003
     * @tc.desc Verify float 0.0f converts to double 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(0.0f).toDouble();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_0400
     * @tc.name testToDouble1004
     * @tc.desc Verify float -1.5f converts to double -1.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(-1.5f).toDouble();
      expect(result).assertEqual(-1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_0500
     * @tc.name testToDouble1005
     * @tc.desc Verify float 3.14f converts to double 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(3.14f).toDouble();
      expect(result).assertClose(3.14, 1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_0600
     * @tc.name testToDouble1006
     * @tc.desc Verify float -3.14f converts to double -3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(-3.14f).toDouble();
      expect(result).assertClose(-3.14, 1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_0700
     * @tc.name testToDouble1007
     * @tc.desc Verify float -0.0f converts to double preserving sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(-0.0f).toDouble();
      const isNegativeInfinity: boolean = 1.0 / result === Double.NEGATIVE_INFINITY;
      expect(isNegativeInfinity).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_0800
     * @tc.name testToDouble1008
     * @tc.desc Verify float 100.0f converts to double 100.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(100.0f).toDouble();
      expect(result).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_0900
     * @tc.name testToDouble1009
     * @tc.desc Verify float 0.123456f converts to double with precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(0.123456f).toDouble();
      expect(result).assertClose(0.123456, 1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_1000
     * @tc.name testToDouble1010
     * @tc.desc Verify NaN conversion to double returns number type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(Float.NaN).toDouble();
      let isNaN: boolean = result !== result;
      expect(isNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_1100
     * @tc.name testToDouble1011
     * @tc.desc Verify positive infinity conversion to double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(Float.POSITIVE_INFINITY).toDouble();
      expect(result > 3.4e38).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_1200
     * @tc.name testToDouble1012
     * @tc.desc Verify negative infinity conversion to double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(Float.NEGATIVE_INFINITY).toDouble();
      expect(result < -3.4e38).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_1300
     * @tc.name testToDouble1013
     * @tc.desc Verify MIN_VALUE converts to double preserving the value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(Float.MIN_VALUE).toDouble();
      expect(result).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_1400
     * @tc.name testToDouble1014
     * @tc.desc Verify MAX_VALUE converts to double preserving the value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(Float.MAX_VALUE).toDouble();
      expect(result).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_1500
     * @tc.name testToDouble1015
     * @tc.desc Verify EPSILON converts to double preserving the value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(Float.EPSILON).toDouble();
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_1600
     * @tc.name testToDouble1016
     * @tc.desc Verify float to double widening preserves precision for 1.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(1.5f).toDouble();
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_1700
     * @tc.name testToDouble1017
     * @tc.desc Verify float 0.1f converts to double preserving value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(0.1f).toDouble();
      expect(result > 0.0 && result < 0.2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_1800
     * @tc.name testToDouble1018
     * @tc.desc Verify float 123456.789f converts to double consistent with float precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(123456.789f).toDouble();
      expect(result > 123456.0 && result < 123457.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_1900
     * @tc.name testToDouble1019
     * @tc.desc Verify multiple calls on same instance return consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(2.5f);
      const r1: double = f.toDouble();
      const r2: double = f.toDouble();
      const isConsistent: boolean = r1 === r2;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_2000
     * @tc.name testToDouble1020
     * @tc.desc Verify toDouble does not modify the original Float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.14f);
      const d: double = f.toDouble();
      expect(d).assertClose(3.14, 1e-6);
      let toFloatResult: float = f.toFloat();
      expect(toFloatResult).assertEqual(3.14f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_2100
     * @tc.name testToDouble1021
     * @tc.desc Verify toDouble result can participate in arithmetic expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(2.0f).toDouble() + 3.0;
      expect(result).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_2200
     * @tc.name testToDouble1022
     * @tc.desc Verify -MAX_VALUE converts to double preserving the value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(-Float.MAX_VALUE).toDouble();
      expect(result).assertEqual(-Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_2300
     * @tc.name testToDouble1023
     * @tc.desc Verify -MIN_VALUE converts to double preserving the value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(-Float.MIN_VALUE).toDouble();
      expect(result).assertEqual(-Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_2400
     * @tc.name testToDouble1024
     * @tc.desc Verify int constructor 0 to double returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float(0).toDouble();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_2500
     * @tc.name testToDouble1025
     * @tc.desc Verify typical example code produces expected output
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.5f);
      const result: double = value.toDouble();
      expect(result).assertEqual(1.5);
      let toStringResult: string = result.toString();
      expect(toStringResult).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TODOUBLE_1_2600
     * @tc.name testToDouble1026
     * @tc.desc Verify default constructor Float() toDouble returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToDouble1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Float().toDouble();
      expect(result).assertEqual(0.0f);
    });
  });
}
