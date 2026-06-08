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

export default function FloatToByte1Test(): void {
  describe('FloatToByte1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_0100
     * @tc.name testToByte1001
     * @tc.desc Verify no-arg call to toByte() returns correct byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(12.0f);
      const result: byte = value.toByte();
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_0200
     * @tc.name testToByte1002
     * @tc.desc Verify positive float value 12.0f converts to byte 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(64.0f).toByte();
      expect(result).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_0300
     * @tc.name testToByte1003
     * @tc.desc Verify zero float value 0.0f converts to byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(0.0f).toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_0400
     * @tc.name testToByte1004
     * @tc.desc Verify negative zero -0.0f converts to byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-0.0f).toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_0500
     * @tc.name testToByte1005
     * @tc.desc Verify byte max value 127.0f converts to byte 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(127.0f).toByte();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_0600
     * @tc.name testToByte1006
     * @tc.desc Verify byte min value -128.0f converts to byte -128
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-128.0f).toByte();
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_0700
     * @tc.name testToByte1007
     * @tc.desc Verify boundary value -1.0f converts to byte -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-1.0f).toByte();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_0800
     * @tc.name testToByte1008
     * @tc.desc Verify boundary value 1.0f converts to byte 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(1.0f).toByte();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_0900
     * @tc.name testToByte1009
     * @tc.desc Verify intermediate positive value 99.0f converts to byte 99
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(99.0f).toByte();
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_1000
     * @tc.name testToByte1010
     * @tc.desc Verify intermediate negative value -99.0f converts to byte -99
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-99.0f).toByte();
      expect(result).assertEqual(-99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_1100
     * @tc.name testToByte1011
     * @tc.desc Verify positive decimal 12.5f truncates to byte 12 (truncation toward zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(12.5f).toByte();
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_1200
     * @tc.name testToByte1012
     * @tc.desc Verify negative decimal -12.9f truncates to byte -12 (truncation toward zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-12.9f).toByte();
      expect(result).assertEqual(-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_1300
     * @tc.name testToByte1013
     * @tc.desc Verify near integer positive 126.999f truncates to byte 126
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(126.999f).toByte();
      expect(result).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_1400
     * @tc.name testToByte1014
     * @tc.desc Verify near integer negative -127.999f truncates to byte -127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-127.999f).toByte();
      expect(result).assertEqual(-127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_1500
     * @tc.name testToByte1015
     * @tc.desc Verify tiny positive decimal 0.001f truncates to byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(0.001f).toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_1600
     * @tc.name testToByte1016
     * @tc.desc Verify tiny negative decimal -0.001f truncates to byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-0.001f).toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_1700
     * @tc.name testToByte1017
     * @tc.desc Verify positive decimal 0.5f truncates to byte 0 (truncation not rounding)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(0.5f).toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_1800
     * @tc.name testToByte1018
     * @tc.desc Verify negative decimal -0.5f truncates to byte 0 (truncation not rounding)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-0.5f).toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_1900
     * @tc.name testToByte1019
     * @tc.desc Verify overflow behavior for value 128.0f (byte max + 1) returns byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(128.0f).toByte();
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_2000
     * @tc.name testToByte1020
     * @tc.desc Verify underflow behavior for value -129.0f (byte min - 1) returns byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-129.0f).toByte();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_2100
     * @tc.name testToByte1021
     * @tc.desc Verify large positive overflow value 999.99f returns byte type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(999.99f).toByte();
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_2200
     * @tc.name testToByte1022
     * @tc.desc Verify large negative underflow value -999.99f returns byte type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-999.99f).toByte();
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_2300
     * @tc.name testToByte1023
     * @tc.desc Verify very large float value 32767.0f overflow to byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(32767.0f).toByte();
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_2400
     * @tc.name testToByte1024
     * @tc.desc Verify very large negative float value -32768.0f underflow to byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-32768.0f).toByte();
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_2500
     * @tc.name testToByte1025
     * @tc.desc Verify NaN conversion via toByte returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(Float.NaN).toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_2600
     * @tc.name testToByte1026
     * @tc.desc Verify positive infinity conversion via toByte returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(Float.POSITIVE_INFINITY).toByte();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_2700
     * @tc.name testToByte1027
     * @tc.desc Verify negative infinity conversion via toByte returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(Float.NEGATIVE_INFINITY).toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_2800
     * @tc.name testToByte1028
     * @tc.desc Verify MIN_VALUE converts to byte 0 (truncated toward zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(Float.MIN_VALUE).toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_2900
     * @tc.name testToByte1029
     * @tc.desc Verify MAX_VALUE overflow via toByte returns byte type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(Float.MAX_VALUE).toByte();
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_3000
     * @tc.name testToByte1030
     * @tc.desc Verify return value works in arithmetic expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Float(12.0f).toByte() + 1;
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_3100
     * @tc.name testToByte1031
     * @tc.desc Verify return value comparison with expected value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Float(12.0f).toByte() === 12;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_3200
     * @tc.name testToByte1032
     * @tc.desc Verify toString method on toByte return value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(12.0f).toByte().toString();
      expect(result).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_3300
     * @tc.name testToByte1033
     * @tc.desc Verify multiple calls to toByte on same instance return same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(12.0f);
      const r1: byte = f.toByte();
      const r2: byte = f.toByte();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_3400
     * @tc.name testToByte1034
     * @tc.desc Verify toByte does not modify the original Float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(12.0f);
      f.toByte();
      let toFloatResult: float = f.toFloat();
      expect(toFloatResult).assertEqual(12.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_3500
     * @tc.name testToByte1035
     * @tc.desc Verify all key boundary values within byte range convert correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float(-128.0f).toByte()).assertEqual(-128);
      expect(new Float(-127.0f).toByte()).assertEqual(-127);
      expect(new Float(-1.0f).toByte()).assertEqual(-1);
      expect(new Float(0.0f).toByte()).assertEqual(0);
      expect(new Float(1.0f).toByte()).assertEqual(1);
      expect(new Float(126.0f).toByte()).assertEqual(126);
      expect(new Float(127.0f).toByte()).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_3600
     * @tc.name testToByte1036
     * @tc.desc Verify default constructor Float() converts to byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float().toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOBYTE_1_3700
     * @tc.name testToByte1037
     * @tc.desc Verify scientific notation large negative value -1.0e10 converts to byte 0 via int saturation and low 8-bit truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToByte1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = new Float(-1.0e10).toByte();
      expect(result).assertEqual(0);
    });
  });
}
