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

export default function FloatToInt1Test(): void {
  describe('FloatToInt1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_0100
     * @tc.name testToInt1001
     * @tc.desc Verify no-arg call to toInt() returns correct int value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(123.5f);
      const result: int = value.toInt();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_0200
     * @tc.name testToInt1002
     * @tc.desc Verify positive float 1.0f converts to int 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(1.0f).toInt();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_0300
     * @tc.name testToInt1003
     * @tc.desc Verify positive float 100.0f converts to int 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(100.0f).toInt();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_0400
     * @tc.name testToInt1004
     * @tc.desc Verify positive float 10000.0f converts to int 10000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(10000.0f).toInt();
      expect(result).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_0500
     * @tc.name testToInt1005
     * @tc.desc Verify zero float 0.0f converts to int 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(0.0f).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_0600
     * @tc.name testToInt1006
     * @tc.desc Verify negative zero -0.0f converts to int 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-0.0f).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_0700
     * @tc.name testToInt1007
     * @tc.desc Verify negative float -1.0f converts to int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-1.0f).toInt();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_0800
     * @tc.name testToInt1008
     * @tc.desc Verify negative float -100.0f converts to int -100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-100.0f).toInt();
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_0900
     * @tc.name testToInt1009
     * @tc.desc Verify negative float -10000.0f converts to int -10000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-10000.0f).toInt();
      expect(result).assertEqual(-10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_1000
     * @tc.name testToInt1010
     * @tc.desc Verify near-zero positive decimal 0.1f truncates to int 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(0.1f).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_1100
     * @tc.name testToInt1011
     * @tc.desc Verify near-zero positive decimal 0.9f truncates to int 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(0.9f).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_1200
     * @tc.name testToInt1012
     * @tc.desc Verify positive decimal 99.99f truncates to int 99
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(99.99f).toInt();
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_1300
     * @tc.name testToInt1013
     * @tc.desc Verify decimal 0.5f truncates to int 0 (truncation not rounding)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(0.5f).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_1400
     * @tc.name testToInt1014
     * @tc.desc Verify negative decimal -123.9f truncates to int -123
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-123.9f).toInt();
      expect(result).assertEqual(-123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_1500
     * @tc.name testToInt1015
     * @tc.desc Verify near-zero negative decimal -0.1f truncates to int 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-0.1f).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_1600
     * @tc.name testToInt1016
     * @tc.desc Verify near-zero negative decimal -0.9f truncates to int 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-0.9f).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_1700
     * @tc.name testToInt1017
     * @tc.desc Verify negative decimal -99.99f truncates to int -99
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-99.99f).toInt();
      expect(result).assertEqual(-99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_1800
     * @tc.name testToInt1018
     * @tc.desc Verify negative decimal -0.5f truncates to int 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-0.5f).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_1900
     * @tc.name testToInt1019
     * @tc.desc Verify tiny positive decimal 1.0e-10f truncates to int 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(1.0e-10f).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_2000
     * @tc.name testToInt1020
     * @tc.desc Verify tiny negative decimal -1.0e-10f truncates to int 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-1.0e-10f).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_2100
     * @tc.name testToInt1021
     * @tc.desc Verify NaN conversion via toInt returns int type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(Float.NaN).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_2200
     * @tc.name testToInt1022
     * @tc.desc Verify positive infinity conversion via toInt returns int type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(Float.POSITIVE_INFINITY).toInt();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_2300
     * @tc.name testToInt1023
     * @tc.desc Verify negative infinity conversion via toInt returns int type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(Float.NEGATIVE_INFINITY).toInt();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_2400
     * @tc.name testToInt1024
     * @tc.desc Verify toInt return value can be converted to string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(123.5f).toInt().toString();
      expect(result).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_2500
     * @tc.name testToInt1025
     * @tc.desc Verify multiple calls on same instance return consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(456.7f);
      const r1: int = f.toInt();
      const r2: int = f.toInt();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_2600
     * @tc.name testToInt1026
     * @tc.desc Verify Float.MAX_VALUE overflow via toInt returns int type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(Float.MAX_VALUE).toInt();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_2700
     * @tc.name testToInt1027
     * @tc.desc Verify precision loss with 16777217.0f toInt returns 16777216
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(16777217.0f).toInt();
      expect(result).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_2800
     * @tc.name testToInt1028
     * @tc.desc Verify int construction 1 converts to int 1 via Float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(1).toInt();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_2900
     * @tc.name testToInt1029
     * @tc.desc Verify int max nearby value 2147483520.0f converts correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(2147483520.0f).toInt();
      expect(result).assertEqual(2147483520);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_3000
     * @tc.name testToInt1030
     * @tc.desc Verify int min -2147483648.0f converts correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-2147483648.0f).toInt();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_3100
     * @tc.name testToInt1031
     * @tc.desc Verify Float.MIN_VALUE converts to int 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(Float.MIN_VALUE).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_3200
     * @tc.name testToInt1032
     * @tc.desc Verify large positive overflow 1.0e10f via toInt returns int type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(1.0e10f).toInt();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_3300
     * @tc.name testToInt1033
     * @tc.desc Verify large negative underflow -1.0e10f via toInt returns int type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-1.0e10f).toInt();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_3400
     * @tc.name testToInt1034
     * @tc.desc Verify regular int range check - result within bounds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(100.0f).toInt();
      expect(result >= -2147483648 && result <= 2147483647).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_3500
     * @tc.name testToInt1035
     * @tc.desc Verify 16777216.0f (exact float representation) converts correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(16777216.0f).toInt();
      expect(result).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_3600
     * @tc.name testToInt1036
     * @tc.desc Verify overflow for 2147483648.0f (int max + 1) returns int type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(2147483648.0f).toInt();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_3700
     * @tc.name testToInt1037
     * @tc.desc Verify underflow for -2147483649.0f (int min - 1) returns int type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(-2147483649.0f).toInt();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_3800
     * @tc.name testToInt1038
     * @tc.desc Verify typical example code produces expected output
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(123.5f);
      const result: int = value.toInt();
      expect(result).assertEqual(123);
      let toStringResult: string = result.toString();
      expect(toStringResult).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_3900
     * @tc.name testToInt1039
     * @tc.desc Verify default constructor Float() toInt returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float().toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_4000
     * @tc.name testToInt1040
     * @tc.desc Verify double literal constructor new Float(1.5) toInt returns 1 (double-to-float narrow then truncate)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(1.5).toInt();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_1_4100
     * @tc.name testToInt1041
     * @tc.desc Verify MAX_SAFE_INTEGER constructor toInt returns correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToInt1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(Float.MAX_SAFE_INTEGER).toInt();
      expect(result).assertEqual(Float.MAX_SAFE_INTEGER);
    });
  });
}
