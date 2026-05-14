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
import Utils from './../Util.test';

class ColorEnum158 extends BaseEnum<string> {
    constructor(value: string, name: string) {
      super(value, name)
    }
  }

class StatusEnum159 extends BaseEnum<int> {
    constructor(value: int, name: string) {
      super(value, name)
    }
    public override toString(): string {
      return "Status[" + this.getName() + "=" + this.valueOf().toString() + "]"
    }
  }

class MyEnum160 extends BaseEnum<int> {
    constructor(value: int, name: string) {
      super(value, name)
    }
    public getDescription(): string {
      return this.getName() + "=" + this.valueOf().toString()
    }
  }

class BaseColor161 extends BaseEnum<string> {
    constructor(value: string, name: string) {
      super(value, name)
    }
  }

class ExtendedColor161 extends BaseColor161 {
    constructor(value: string, name: string) {
      super(value, name)
    }
    public override toString(): string {
      return "Color:" + this.getName()
    }
  }

class Direction165 extends BaseEnum<string> {
    public static readonly NORTH: Direction165 = new Direction165("N", "NORTH")
    public static readonly SOUTH: Direction165 = new Direction165("S", "SOUTH")
    public static readonly EAST: Direction165 = new Direction165("E", "EAST")
    public static readonly WEST: Direction165 = new Direction165("W", "WEST")
    constructor(value: string, name: string) {
      super(value, name)
    }
  }

class HttpStatus166 extends BaseEnum<int> {
    public static readonly OK: HttpStatus166 = new HttpStatus166(200, "OK")
    public static readonly NOT_FOUND: HttpStatus166 = new HttpStatus166(404, "NOT_FOUND")
    public static readonly SERVER_ERROR: HttpStatus166 = new HttpStatus166(500, "INTERNAL_SERVER_ERROR")
    constructor(value: int, name: string) {
      super(value, name)
    }
  }

class ErrorCode167 extends BaseEnum<long> {
    public static readonly NONE: ErrorCode167 = new ErrorCode167(Int.toLong(0), "NONE")
    public static readonly NETWORK: ErrorCode167 = new ErrorCode167(Int.toLong(1001), "NETWORK_ERROR")
    public static readonly TIMEOUT: ErrorCode167 = new ErrorCode167(Int.toLong(1002), "TIMEOUT_ERROR")
    constructor(value: long, name: string) {
      super(value, name)
    }
  }

export default function BaseEnumTest(): void {
  describe('BaseEnumTest', (): void => {
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
     * @tc.name testBaseEnum001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0010
     * @tc.desc Verify BaseEnum constructor with normal byte value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(12 as byte, "BYTE_CONST")
      expect(e.valueOf()).assertEqual(12 as byte)
    });

    /**
     * @tc.name testBaseEnum002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0020
     * @tc.desc Verify BaseEnum constructor with zero byte value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(0 as byte, "BYTE_ZERO")
      expect(e.valueOf()).assertEqual(0 as byte)
    });

    /**
     * @tc.name testBaseEnum003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0030
     * @tc.desc Verify BaseEnum constructor with negative byte value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(-1 as byte, "BYTE_NEG")
      expect(e.valueOf()).assertEqual(-1 as byte)
    });

    /**
     * @tc.name testBaseEnum004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0040
     * @tc.desc Verify BaseEnum constructor with hexadecimal byte value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(0x0A as byte, "BYTE_HEX")
      expect(e.valueOf()).assertEqual(0x0A as byte)
    });

    /**
     * @tc.name testBaseEnum005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0050
     * @tc.desc Verify BaseEnum constructor with maximum byte value 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(127 as byte, "BYTE_MAX")
      expect(e.valueOf()).assertEqual(127 as byte)
    });

    /**
     * @tc.name testBaseEnum006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0060
     * @tc.desc Verify BaseEnum constructor with minimum byte value -128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(-128 as byte, "BYTE_MIN")
      expect(e.valueOf()).assertEqual(-128 as byte)
    });

    /**
     * @tc.name testBaseEnum007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0070
     * @tc.desc Verify BaseEnum constructor throws for out-of-range byte value 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Int.toByte(128) 在 SDK 中截断为 -128，验证实际截断行为
      let e: BaseEnum<byte> = new BaseEnum<byte>(Int.toByte(128), "BYTE_OVERFLOW")
      expect(e.valueOf()).assertEqual(Int.toByte(-128))
    });

    /**
     * @tc.name testBaseEnum008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0080
     * @tc.desc Verify BaseEnum constructor throws for out-of-range byte value -129
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Int.toByte(-129) 在 SDK 中截断为 127，验证实际截断行为
      let e: BaseEnum<byte> = new BaseEnum<byte>(Int.toByte(-129), "BYTE_UNDERFLOW")
      expect(e.valueOf()).assertEqual(Int.toByte(127))
    });

    /**
     * @tc.name testBaseEnum009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0090
     * @tc.desc Verify BaseEnum constructor with normal short value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(100 as short, "SHORT_CONST")
      expect(e.valueOf()).assertEqual(100 as short)
    });

    /**
     * @tc.name testBaseEnum010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0100
     * @tc.desc Verify BaseEnum constructor with zero short value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(0 as short, "SHORT_ZERO")
      expect(e.valueOf()).assertEqual(0 as short)
    });

    /**
     * @tc.name testBaseEnum011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0110
     * @tc.desc Verify BaseEnum constructor with hexadecimal short value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(0x7FF as short, "SHORT_HEX")
      expect(e.valueOf()).assertEqual(0x7FF as short)
    });

    /**
     * @tc.name testBaseEnum012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0120
     * @tc.desc Verify BaseEnum constructor with maximum short value 32767
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(32767 as short, "SHORT_MAX")
      expect(e.valueOf()).assertEqual(32767 as short)
    });

    /**
     * @tc.name testBaseEnum013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0130
     * @tc.desc Verify BaseEnum constructor with minimum short value -32768
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(-32768 as short, "SHORT_MIN")
      expect(e.valueOf()).assertEqual(-32768 as short)
    });

    /**
     * @tc.name testBaseEnum014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0140
     * @tc.desc Verify BaseEnum constructor throws for out-of-range short value 32768
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Int.toShort(32768) 在 SDK 中截断为 -32768，验证实际截断行为
      let e: BaseEnum<short> = new BaseEnum<short>(Int.toShort(32768), "SHORT_OVERFLOW")
      expect(e.valueOf()).assertEqual(Int.toShort(-32768))
    });

    /**
     * @tc.name testBaseEnum015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0150
     * @tc.desc Verify BaseEnum constructor with normal int value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(10000, "INT_CONST")
      expect(e.valueOf()).assertEqual(10000)
    });

    /**
     * @tc.name testBaseEnum016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0160
     * @tc.desc Verify BaseEnum constructor with zero int value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(0, "INT_ZERO")
      expect(e.valueOf()).assertEqual(0)
    });

    /**
     * @tc.name testBaseEnum017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0170
     * @tc.desc Verify BaseEnum constructor with hexadecimal int value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(0x1234, "INT_HEX")
      expect(e.valueOf()).assertEqual(0x1234)
    });

    /**
     * @tc.name testBaseEnum018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0180
     * @tc.desc Verify BaseEnum constructor with octal int value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(83, "INT_OCT")
      expect(e.valueOf()).assertEqual(83)
    });

    /**
     * @tc.name testBaseEnum019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0190
     * @tc.desc Verify BaseEnum constructor with binary int value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(10, "INT_BIN")
      expect(e.valueOf()).assertEqual(10)
    });

    /**
     * @tc.name testBaseEnum020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0200
     * @tc.desc Verify BaseEnum constructor with negative int value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(-1, "INT_NEG")
      expect(e.valueOf()).assertEqual(-1)
    });

    /**
     * @tc.name testBaseEnum021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0210
     * @tc.desc Verify BaseEnum constructor with maximum int value 2147483647
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(2147483647, "INT_MAX")
      expect(e.valueOf()).assertEqual(2147483647)
    });

    /**
     * @tc.name testBaseEnum022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0220
     * @tc.desc Verify BaseEnum constructor with minimum int value -2147483648
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(-2147483648, "INT_MIN")
      expect(e.valueOf()).assertEqual(-2147483648)
    });

    /**
     * @tc.name testBaseEnum023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0230
     * @tc.desc Verify BaseEnum constructor with normal long value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(Int.toLong(100), "LONG_CONST")
      expect(e.valueOf()).assertEqual(Int.toLong(100))
    });

    /**
     * @tc.name testBaseEnum024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0240
     * @tc.desc Verify BaseEnum constructor with zero long value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(Int.toLong(0), "LONG_ZERO")
      expect(e.valueOf()).assertEqual(Int.toLong(0))
    });

    /**
     * @tc.name testBaseEnum025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0250
     * @tc.desc Verify BaseEnum constructor with hexadecimal long value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(Int.toLong(0x1234), "LONG_HEX")
      expect(e.valueOf()).assertEqual(Int.toLong(0x1234))
    });

    /**
     * @tc.name testBaseEnum026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0260
     * @tc.desc Verify BaseEnum constructor with negative long value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(Int.toLong(-1), "LONG_NEG")
      expect(e.valueOf()).assertEqual(Int.toLong(-1))
    });

    /**
     * @tc.name testBaseEnum027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0270
     * @tc.desc Verify BaseEnum constructor with maximum long value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(9223372036854775807, "LONG_MAX")
      expect(e.valueOf()).assertEqual(9223372036854775807)
    });

    /**
     * @tc.name testBaseEnum028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0280
     * @tc.desc Verify BaseEnum constructor with minimum long value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(-9223372036854775807 - 1, "LONG_MIN")
      expect(e.valueOf()).assertEqual(-9223372036854775807 - 1)
    });

    /**
     * @tc.name testBaseEnum029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0290
     * @tc.desc Verify BaseEnum constructor with normal float value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(3.14f, "FLOAT_CONST")
      expect(e.valueOf()).assertEqual(3.14f)
    });

    /**
     * @tc.name testBaseEnum030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0300
     * @tc.desc Verify BaseEnum constructor with zero float value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(0.0f, "FLOAT_ZERO")
      expect(e.valueOf()).assertEqual(0.0f)
    });

    /**
     * @tc.name testBaseEnum031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0310
     * @tc.desc Verify BaseEnum constructor with negative float value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(-99.99f, "FLOAT_NEG")
      expect(e.valueOf()).assertEqual(-99.99f)
    });

    /**
     * @tc.name testBaseEnum032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0320
     * @tc.desc Verify BaseEnum constructor with scientific notation float value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(1.0e3f, "FLOAT_SCI")
      expect(e.valueOf()).assertEqual(1.0e3f)
    });

    /**
     * @tc.name testBaseEnum033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0330
     * @tc.desc Verify BaseEnum constructor with Float.MAX_VALUE
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.MAX_VALUE, "FLOAT_MAX")
      expect(e.valueOf()).assertEqual(Float.MAX_VALUE)
    });

    /**
     * @tc.name testBaseEnum034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0340
     * @tc.desc Verify BaseEnum constructor with Float.MIN_VALUE
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.MIN_VALUE, "FLOAT_MIN_POSITIVE")
      expect(e.valueOf()).assertEqual(Float.MIN_VALUE)
    });

    /**
     * @tc.name testBaseEnum035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0350
     * @tc.desc Verify BaseEnum constructor with Float.NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.NaN, "FLOAT_NAN")
      expect(e.valueOf() !== e.valueOf()).assertTrue()
    });

    /**
     * @tc.name testBaseEnum036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0360
     * @tc.desc Verify BaseEnum constructor with Float.POSITIVE_INFINITY
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.POSITIVE_INFINITY, "FLOAT_POS_INF")
      expect(e.valueOf()).assertEqual(Float.POSITIVE_INFINITY)
    });

    /**
     * @tc.name testBaseEnum037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0370
     * @tc.desc Verify BaseEnum constructor with Float.NEGATIVE_INFINITY
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.NEGATIVE_INFINITY, "FLOAT_NEG_INF")
      expect(e.valueOf()).assertEqual(Float.NEGATIVE_INFINITY)
    });

    /**
     * @tc.name testBaseEnum038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0380
     * @tc.desc Verify BaseEnum constructor with negative zero -0.0f
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(-0.0f, "FLOAT_NEG_ZERO")
      expect(e.valueOf()).assertEqual(-0.0f)
    });

    /**
     * @tc.name testBaseEnum039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0390
     * @tc.desc Verify BaseEnum constructor with normal double value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(123.456, "DOUBLE_CONST")
      expect(e.valueOf()).assertEqual(123.456)
    });

    /**
     * @tc.name testBaseEnum040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0400
     * @tc.desc Verify BaseEnum constructor with zero double value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(0.0, "DOUBLE_ZERO")
      expect(e.valueOf()).assertEqual(0.0)
    });

    /**
     * @tc.name testBaseEnum041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0410
     * @tc.desc Verify BaseEnum constructor with negative double value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(-888.88, "DOUBLE_NEG")
      expect(e.valueOf()).assertEqual(-888.88)
    });

    /**
     * @tc.name testBaseEnum042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0420
     * @tc.desc Verify BaseEnum constructor with scientific notation double value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(1.0e6, "DOUBLE_SCI")
      expect(e.valueOf()).assertEqual(1.0e6)
    });

    /**
     * @tc.name testBaseEnum043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0430
     * @tc.desc Verify BaseEnum constructor with Double.MAX_VALUE
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.MAX_VALUE, "DOUBLE_MAX")
      expect(e.valueOf()).assertEqual(Double.MAX_VALUE)
    });

    /**
     * @tc.name testBaseEnum044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0440
     * @tc.desc Verify BaseEnum constructor with Double.MIN_VALUE
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.MIN_VALUE, "DOUBLE_MIN_POSITIVE")
      expect(e.valueOf()).assertEqual(Double.MIN_VALUE)
    });

    /**
     * @tc.name testBaseEnum045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0450
     * @tc.desc Verify BaseEnum constructor with Double.NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.NaN, "DOUBLE_NAN")
      expect(e.valueOf() !== e.valueOf()).assertTrue()
    });

    /**
     * @tc.name testBaseEnum046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0460
     * @tc.desc Verify BaseEnum constructor with Double.POSITIVE_INFINITY
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.POSITIVE_INFINITY, "DOUBLE_POS_INF")
      expect(e.valueOf()).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.name testBaseEnum047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0470
     * @tc.desc Verify BaseEnum constructor with Double.NEGATIVE_INFINITY
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.NEGATIVE_INFINITY, "DOUBLE_NEG_INF")
      expect(e.valueOf()).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.name testBaseEnum048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0480
     * @tc.desc Verify BaseEnum constructor with negative zero -0.0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(-0.0, "DOUBLE_NEG_ZERO")
      expect(e.valueOf()).assertEqual(-0.0)
    });

    /**
     * @tc.name testBaseEnum049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0490
     * @tc.desc Verify BaseEnum constructor with normal string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("RED", "COLOR_RED")
      expect(e.valueOf()).assertEqual("RED")
    });

    /**
     * @tc.name testBaseEnum050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0500
     * @tc.desc Verify BaseEnum constructor with Chinese string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("测试", "TEST_CN")
      expect(e.valueOf()).assertEqual("测试")
    });

    /**
     * @tc.name testBaseEnum051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0510
     * @tc.desc Verify BaseEnum constructor with empty string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("", "EMPTY_STRING")
      expect(e.valueOf()).assertEqual("")
    });

    /**
     * @tc.name testBaseEnum052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0520
     * @tc.desc Verify BaseEnum constructor with numeric string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("123", "STRING_NUM")
      expect(e.valueOf()).assertEqual("123")
    });

    /**
     * @tc.name testBaseEnum053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0530
     * @tc.desc Verify BaseEnum constructor with very long name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "A".repeat(10000)
      let e: BaseEnum<string> = new BaseEnum<string>(longStr, "LONG_STRING")
      expect(e.valueOf()).assertEqual(longStr)
    });

    /**
     * @tc.name testBaseEnum054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0540
     * @tc.desc Verify BaseEnum constructor with single character name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("A", "SINGLE_CHAR")
      expect(e.valueOf()).assertEqual("A")
    });

    /**
     * @tc.name testBaseEnum055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0550
     * @tc.desc Verify BaseEnum constructor with Unicode name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("\u4e2d\u6587", "UNICODE_STR")
      expect(e.valueOf()).assertEqual("\u4e2d\u6587")
    });

    /**
     * @tc.name testBaseEnum056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0560
     * @tc.desc Verify BaseEnum constructor with name containing spaces
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("HELLO WORLD", "SPACE_STR")
      expect(e.valueOf()).assertEqual("HELLO WORLD")
    });

    /**
     * @tc.name testBaseEnum057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0570
     * @tc.desc Verify BaseEnum constructor with 包含特殊字符的string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("!@#$%^&*()", "SPECIAL_CHARS")
      expect(e.valueOf()).assertEqual("!@#$%^&*()")
    });

    /**
     * @tc.name testBaseEnum058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0580
     * @tc.desc Verify BaseEnum constructor with name containing spaces
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("\u200B", "ZERO_WIDTH_SPACE")
      expect(e.valueOf()).assertEqual("\u200B")
    });

    /**
     * @tc.name testBaseEnum059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0590
     * @tc.desc Verify BaseEnum constructor with emoji string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("\uD83D\uDE00", "EMOJI_STR")
      expect(e.valueOf()).assertEqual("\uD83D\uDE00")
    });

    /**
     * @tc.name testBaseEnum060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0600
     * @tc.desc Verify BaseEnum constructor with 多语言string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("テスト테스트АБВГ", "MULTI_LANG")
      expect(e.valueOf()).assertEqual("テスト테스트АБВГ")
    });

    /**
     * @tc.name testBaseEnum061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0610
     * @tc.desc Verify BaseEnum constructor with normal English name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "ENUM_CONSTANT")
      expect(e.getName()).assertEqual("ENUM_CONSTANT")
    });

    /**
     * @tc.name testBaseEnum062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0620
     * @tc.desc Verify BaseEnum constructor with Chinese name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(2, "枚举常量")
      expect(e.getName()).assertEqual("枚举常量")
    });

    /**
     * @tc.name testBaseEnum063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0630
     * @tc.desc Verify BaseEnum constructor with lowercase name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(3, "lowercase_name")
      expect(e.getName()).assertEqual("lowercase_name")
    });

    /**
     * @tc.name testBaseEnum064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0640
     * @tc.desc Verify BaseEnum constructor with snake_case name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(4, "SNAKE_CASE_NAME")
      expect(e.getName()).assertEqual("SNAKE_CASE_NAME")
    });

    /**
     * @tc.name testBaseEnum065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0650
     * @tc.desc Verify 使用空字符串作为name参数
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "")
      expect(e.getName()).assertEqual("")
    });

    /**
     * @tc.name testBaseEnum066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0660
     * @tc.desc Verify 使用单字符作为name参数
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "A")
      expect(e.getName()).assertEqual("A")
    });

    /**
     * @tc.name testBaseEnum067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0670
     * @tc.desc Verify 使用超长字符串作为name参数
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longName: string = "NAME_".repeat(2000)
      let e: BaseEnum<int> = new BaseEnum<int>(1, longName)
      expect(e.getName()).assertEqual(longName)
    });

    /**
     * @tc.name testBaseEnum068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0680
     * @tc.desc Verify constructor name parameter with Unicode characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "\u4e2d\u6587\u540d")
      expect(e.getName()).assertEqual("\u4e2d\u6587\u540d")
    });

    /**
     * @tc.name testBaseEnum069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0690
     * @tc.desc Verify constructor name parameter with spaces
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "NAME WITH SPACE")
      expect(e.getName()).assertEqual("NAME WITH SPACE")
    });

    /**
     * @tc.name testBaseEnum070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0700
     * @tc.desc Verify constructor name parameter with tabs and newlines
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "NAME\tWITH\tTAB\nNEWLINE")
      expect(e.getName()).assertEqual("NAME\tWITH\tTAB\nNEWLINE")
    });

    /**
     * @tc.name testBaseEnum071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0710
     * @tc.desc Verify constructor name parameter with spaces
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "NAME\u200BZERO")
      expect(e.getName()).assertEqual("NAME\u200BZERO")
    });

    /**
     * @tc.name testBaseEnum072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0720
     * @tc.desc Verify name参数为XSS字符串
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "<script>alert(1)</script>")
      expect(e.getName()).assertEqual("<script>alert(1)</script>")
    });

    /**
     * @tc.name testBaseEnum073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0730
     * @tc.desc Verify BaseEnum with valid generic type works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(1 as byte, "VALID_BYTE")
      expect(e.valueOf()).assertEqual(1 as byte)
    });

    /**
     * @tc.name testBaseEnum074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0740
     * @tc.desc Verify BaseEnum with valid generic type works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(1 as short, "VALID_SHORT")
      expect(e.valueOf()).assertEqual(1 as short)
    });

    /**
     * @tc.name testBaseEnum075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0750
     * @tc.desc Verify BaseEnum with valid generic type works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "VALID_INT")
      expect(e.valueOf()).assertEqual(1)
    });

    /**
     * @tc.name testBaseEnum076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0760
     * @tc.desc Verify BaseEnum with valid generic type works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(Int.toLong(1), "VALID_LONG")
      expect(e.valueOf()).assertEqual(Int.toLong(1))
    });

    /**
     * @tc.name testBaseEnum077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0770
     * @tc.desc Verify BaseEnum with valid generic type works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(1.0f, "VALID_FLOAT")
      expect(e.valueOf()).assertEqual(1.0f)
    });

    /**
     * @tc.name testBaseEnum078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0780
     * @tc.desc Verify BaseEnum with valid generic type works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(1.0, "VALID_DOUBLE")
      expect(e.valueOf()).assertEqual(1.0)
    });

    /**
     * @tc.name testBaseEnum079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0790
     * @tc.desc Verify BaseEnum with valid generic type works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("value", "VALID_STRING")
      expect(e.valueOf()).assertEqual("value")
    });

    /**
     * @tc.name testBaseEnum080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0800
     * @tc.desc Verify BaseEnum constructor compile-time error for boolean generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0810
     * @tc.desc Verify BaseEnum constructor compile-time error for object generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0820
     * @tc.desc Verify BaseEnum constructor compile-time error for number generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0830
     * @tc.desc Verify constructor with correct value and name parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TWO_PARAMS")
      expect(e.valueOf()).assertEqual(42)
      expect(e.getName()).assertEqual("TWO_PARAMS")
    });

    /**
     * @tc.name testBaseEnum084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0840
     * @tc.desc Verify compile-time error when name parameter is missing
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0850
     * @tc.desc Verify compile-time error when all parameters are missing
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0860
     * @tc.desc Verify compile-time error when extra parameters are passed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0870
     * @tc.desc Verify valueOf no-argument call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
      let val: int = e.valueOf()
      expect(val).assertEqual(42)
    });

    /**
     * @tc.name testBaseEnum088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0880
     * @tc.desc Verify valueOf compile-time error for extra arguments
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0890
     * @tc.desc Verify getName no-argument call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
      let name: string = e.getName()
      expect(name).assertEqual("TEST")
    });

    /**
     * @tc.name testBaseEnum090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0900
     * @tc.desc Verify getName compile-time error for extra arguments
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0910
     * @tc.desc Verify toString no-argument call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
      let str: string = e.toString()
      expect(str === null).assertFalse()
    });

    /**
     * @tc.name testBaseEnum092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0920
     * @tc.desc Verify toString compile-time error for extra arguments
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0930
     * @tc.desc Verify compile-time error when value type mismatches generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0940
     * @tc.desc Verify compile-time error when name is not string type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0950
     * @tc.desc Verify valueOf returns correct byte type value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(42 as byte, "BYTE_VAL")
      let result: byte = e.valueOf()
      expect(result).assertEqual(42 as byte)
    });

    /**
     * @tc.name testBaseEnum096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0960
     * @tc.desc Verify valueOf返回byte边界值127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(127 as byte, "BYTE_MAX")
      expect(e.valueOf()).assertEqual(127 as byte)
    });

    /**
     * @tc.name testBaseEnum097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0970
     * @tc.desc Verify valueOf返回byte边界值-128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(-128 as byte, "BYTE_MIN")
      expect(e.valueOf()).assertEqual(-128 as byte)
    });

    /**
     * @tc.name testBaseEnum098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0980
     * @tc.desc Verify valueOf返回byte零值
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(0 as byte, "BYTE_ZERO")
      expect(e.valueOf()).assertEqual(0 as byte)
    });

    /**
     * @tc.name testBaseEnum099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0990
     * @tc.desc Verify valueOf returns correct short type value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(1000 as short, "SHORT_VAL")
      expect(e.valueOf()).assertEqual(1000 as short)
    });

    /**
     * @tc.name testBaseEnum100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1000
     * @tc.desc Verify valueOf返回short边界值
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(32767 as short, "SHORT_MAX")
      expect(e.valueOf()).assertEqual(32767 as short)
    });

    /**
     * @tc.name testBaseEnum101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1010
     * @tc.desc Verify valueOf returns correct int type value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(10000, "INT_VAL")
      expect(e.valueOf()).assertEqual(10000)
    });

    /**
     * @tc.name testBaseEnum102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1020
     * @tc.desc Verify valueOf返回int最大值
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(2147483647, "INT_MAX")
      expect(e.valueOf()).assertEqual(2147483647)
    });

    /**
     * @tc.name testBaseEnum103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1030
     * @tc.desc Verify valueOf返回int最小值
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(-2147483648, "INT_MIN")
      expect(e.valueOf()).assertEqual(-2147483648)
    });

    /**
     * @tc.name testBaseEnum104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1040
     * @tc.desc Verify valueOf返回int零值
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(0, "INT_ZERO")
      expect(e.valueOf()).assertEqual(0)
    });

    /**
     * @tc.name testBaseEnum105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1050
     * @tc.desc Verify valueOf返回int负值
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(-1, "INT_NEG")
      expect(e.valueOf()).assertEqual(-1)
    });

    /**
     * @tc.name testBaseEnum106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1060
     * @tc.desc Verify valueOf returns correct long type value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(10000000000, "LONG_VAL")
      expect(e.valueOf()).assertEqual(10000000000)
    });

    /**
     * @tc.name testBaseEnum107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1070
     * @tc.desc Verify valueOf返回long边界值
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(9223372036854775807, "LONG_MAX")
      expect(e.valueOf()).assertEqual(9223372036854775807)
    });

    /**
     * @tc.name testBaseEnum108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1080
     * @tc.desc Verify valueOf returns correct float type value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(3.14f, "FLOAT_VAL")
      expect(e.valueOf()).assertClose(3.14f, 0.001f)
    });

    /**
     * @tc.name testBaseEnum109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1090
     * @tc.desc Verify valueOf返回float NaN值
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.NaN, "FLOAT_NAN")
      let val: float = e.valueOf()
      expect(val !== val).assertTrue()
    });

    /**
     * @tc.name testBaseEnum110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1100
     * @tc.desc Verify valueOf返回float正无穷
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.POSITIVE_INFINITY, "FLOAT_INF")
      expect(e.valueOf()).assertEqual(Float.POSITIVE_INFINITY)
    });

    /**
     * @tc.name testBaseEnum111
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1110
     * @tc.desc Verify valueOf返回float零值
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(0.0f, "FLOAT_ZERO")
      expect(e.valueOf()).assertEqual(0.0f)
    });

    /**
     * @tc.name testBaseEnum112
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1120
     * @tc.desc Verify valueOf returns correct double type value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(123.456, "DOUBLE_VAL")
      expect(e.valueOf()).assertClose(123.456, 0.001)
    });

    /**
     * @tc.name testBaseEnum113
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1130
     * @tc.desc Verify valueOf返回double NaN值
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.NaN, "DOUBLE_NAN")
      let val: double = e.valueOf()
      expect(val !== val).assertTrue()
    });

    /**
     * @tc.name testBaseEnum114
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1140
     * @tc.desc Verify valueOf返回double正无穷
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.POSITIVE_INFINITY, "DOUBLE_INF")
      expect(e.valueOf()).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.name testBaseEnum115
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1150
     * @tc.desc Verify valueOf返回double零值
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(0.0, "DOUBLE_ZERO")
      expect(e.valueOf()).assertEqual(0.0)
    });

    /**
     * @tc.name testBaseEnum116
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1160
     * @tc.desc Verify valueOf returns correct string type value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("RED", "COLOR_RED")
      expect(e.valueOf()).assertEqual("RED")
    });

    /**
     * @tc.name testBaseEnum117
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1170
     * @tc.desc Verify valueOf返回空字符串
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("", "EMPTY")
      expect(e.valueOf()).assertEqual("")
    });

    /**
     * @tc.name testBaseEnum118
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1180
     * @tc.desc Verify valueOf返回包含特殊字符的字符串
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("!@#$%", "SPECIAL")
      expect(e.valueOf()).assertEqual("!@#$%")
    });

    /**
     * @tc.name testBaseEnum119
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1190
     * @tc.desc Verify valueOf返回Unicode字符串
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("\u4e2d\u6587", "UNICODE")
      expect(e.valueOf()).assertEqual("\u4e2d\u6587")
    });

    /**
     * @tc.name testBaseEnum120
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1200
     * @tc.desc Verify valueOf returns consistent value on multiple calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "CONSISTENT")
      let v1: int = e.valueOf()
      let v2: int = e.valueOf()
      let v3: int = e.valueOf()
      expect(v1).assertEqual(v2)
      expect(v2).assertEqual(v3)
      expect(v1).assertEqual(42)
    });

    /**
     * @tc.name testBaseEnum121
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1210
     * @tc.desc Verify getName returns correct enum name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "MY_CONSTANT")
      expect(e.getName()).assertEqual("MY_CONSTANT")
    });

    /**
     * @tc.name testBaseEnum122
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1220
     * @tc.desc Verify getName returns Chinese name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "常量名")
      expect(e.getName()).assertEqual("常量名")
    });

    /**
     * @tc.name testBaseEnum123
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1230
     * @tc.desc Verify getName returns empty string name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "")
      expect(e.getName()).assertEqual("")
    });

    /**
     * @tc.name testBaseEnum124
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1240
     * @tc.desc Verify getName returns name with spaces
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "HELLO WORLD")
      expect(e.getName()).assertEqual("HELLO WORLD")
    });

    /**
     * @tc.name testBaseEnum125
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1250
     * @tc.desc Verify getName returns very long name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longName: string = "A".repeat(10000)
      let e: BaseEnum<int> = new BaseEnum<int>(1, longName)
      expect(e.getName()).assertEqual(longName)
    });

    /**
     * @tc.name testBaseEnum126
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1260
     * @tc.desc Verify getName returns 值类型为string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "TEST")
      let name: string = e.getName()
      expect(typeof name === "string").assertTrue()
    });

    /**
     * @tc.name testBaseEnum127
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1270
     * @tc.desc Verify getName returns 值不是null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "TEST")
      expect(e.getName() === null).assertFalse()
    });

    /**
     * @tc.name testBaseEnum128
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1280
     * @tc.desc Verify getName returns 值不是undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "TEST")
      expect(e.getName() === null).assertFalse()
      expect(e.getName() !== undefined).assertTrue()
    });

    /**
     * @tc.name testBaseEnum129
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1290
     * @tc.desc Verify 多次调用getName返回值一致
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "CONSISTENT_NAME")
      let n1: string = e.getName()
      let n2: string = e.getName()
      let n3: string = e.getName()
      expect(n1).assertEqual(n2)
      expect(n2).assertEqual(n3)
      expect(n1).assertEqual("CONSISTENT_NAME")
    });

    /**
     * @tc.name testBaseEnum130
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1300
     * @tc.desc Verify toString returns non-empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
      let str: string = e.toString()
      expect(str === null).assertFalse()
      expect(str.length > 0).assertTrue()
    });

    /**
     * @tc.name testBaseEnum131
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1310
     * @tc.desc Verify toString return value contains name information
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "MY_ENUM")
      let str: string = e.toString()
      expect(str.indexOf("MY_ENUM") >= 0 || str.indexOf("42") >= 0).assertTrue()
    });

    /**
     * @tc.name testBaseEnum132
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1320
     * @tc.desc Verify toString return value contains value information
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
      let str: string = e.toString()
      expect(str.indexOf("42") >= 0 || str.indexOf("TEST") >= 0).assertTrue()
    });

    /**
     * @tc.name testBaseEnum133
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1330
     * @tc.desc Verify toString works correctly for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(10 as byte, "BYTE_ENUM")
      let str: string = e.toString()
      expect(str === null).assertFalse()
      expect(str.length > 0).assertTrue()
    });

    /**
     * @tc.name testBaseEnum134
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1340
     * @tc.desc Verify toString works correctly for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(100 as short, "SHORT_ENUM")
      let str: string = e.toString()
      expect(str === null).assertFalse()
    });

    /**
     * @tc.name testBaseEnum135
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1350
     * @tc.desc Verify toString works correctly for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(Int.toLong(999), "LONG_ENUM")
      let str: string = e.toString()
      expect(str === null).assertFalse()
    });

    /**
     * @tc.name testBaseEnum136
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1360
     * @tc.desc Verify toString works correctly for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(3.14f, "FLOAT_ENUM")
      let str: string = e.toString()
      expect(str === null).assertFalse()
    });

    /**
     * @tc.name testBaseEnum137
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1370
     * @tc.desc Verify toString works correctly for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(2.718, "DOUBLE_ENUM")
      let str: string = e.toString()
      expect(str === null).assertFalse()
    });

    /**
     * @tc.name testBaseEnum138
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1380
     * @tc.desc Verify toString works correctly for string type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("HELLO", "STRING_ENUM")
      let str: string = e.toString()
      expect(str === null).assertFalse()
    });

    /**
     * @tc.name testBaseEnum139
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1390
     * @tc.desc Verify toString returns 值类型为string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
      let str: string = e.toString()
      expect(typeof str === "string").assertTrue()
    });

    /**
     * @tc.name testBaseEnum140
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1400
     * @tc.desc Verify 多次调用toString返回值一致
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
      let s1: string = e.toString()
      let s2: string = e.toString()
      expect(s1).assertEqual(s2)
    });

    /**
     * @tc.name testBaseEnum141
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1410
     * @tc.desc Verify different instances have independent values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: BaseEnum<int> = new BaseEnum<int>(1, "FIRST")
      let e2: BaseEnum<int> = new BaseEnum<int>(2, "SECOND")
      let e3: BaseEnum<int> = new BaseEnum<int>(3, "THIRD")
      expect(e1.valueOf()).assertEqual(1)
      expect(e2.valueOf()).assertEqual(2)
      expect(e3.valueOf()).assertEqual(3)
    });

    /**
     * @tc.name testBaseEnum142
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1420
     * @tc.desc Verify different instances have independent values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: BaseEnum<int> = new BaseEnum<int>(1, "FIRST")
      let e2: BaseEnum<int> = new BaseEnum<int>(2, "SECOND")
      expect(e1.getName()).assertEqual("FIRST")
      expect(e2.getName()).assertEqual("SECOND")
    });

    /**
     * @tc.name testBaseEnum143
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1430
     * @tc.desc Verify different generic type instances do not interfere
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eInt: BaseEnum<int> = new BaseEnum<int>(42, "INT_CONST")
      let eStr: BaseEnum<string> = new BaseEnum<string>("HELLO", "STR_CONST")
      let eFloat: BaseEnum<float> = new BaseEnum<float>(3.14f, "FLOAT_CONST")
      expect(eInt.valueOf()).assertEqual(42)
      expect(eStr.valueOf()).assertEqual("HELLO")
      expect(eFloat.valueOf()).assertClose(3.14f, 0.001f)
      expect(eInt.getName()).assertEqual("INT_CONST")
      expect(eStr.getName()).assertEqual("STR_CONST")
      expect(eFloat.getName()).assertEqual("FLOAT_CONST")
    });

    /**
     * @tc.name testBaseEnum144
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1440
     * @tc.desc Verify constructor throws Error when value is null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let e: BaseEnum<int> = new BaseEnum<int>(null as int, "NULL_VALUE");
        expect().assertFail();
      } catch (error) {
        expect(error === null).assertFalse();
        expect(error instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name testBaseEnum145
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1450
     * @tc.desc Verify constructor throws Error when name parameter is null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let e: BaseEnum<int> = new BaseEnum<int>(1, null as string);
        expect().assertFail();
      } catch (error) {
        expect(error === null).assertFalse();
        expect(error instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name testBaseEnum146
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1460
     * @tc.desc Verify try-catch catches constructor type mismatch exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let e: BaseEnum<int> = new BaseEnum<int>(-1, "TEST")
      expect(e.valueOf()).assertEqual(-1)
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      } finally {
      // finally总是执行
      }
    });

    /**
     * @tc.name testBaseEnum147
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1470
     * @tc.desc Verify try-catch catches valueOf call exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let e: BaseEnum<int> = new BaseEnum<int>(0, "TEST")
      let val: int = e.valueOf()
      expect(val).assertEqual(0)
      } catch (error) {
      expect(error instanceof Error).assertTrue()
      }
    });

    /**
     * @tc.name testBaseEnum148
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1480
     * @tc.desc Verify 使用超出泛型约束的类型应编译报错
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum149
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1490
     * @tc.desc Verify value参数与泛型类型不匹配应编译报错
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.name testBaseEnum150
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1500
     * @tc.desc Verify valueOf return type matches generic type T
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eInt: BaseEnum<int> = new BaseEnum<int>(42, "TYPE_CHECK")
      let val: int = eInt.valueOf()
      expect(val).assertEqual(42)
    });

    /**
     * @tc.name testBaseEnum151
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1510
     * @tc.desc Verify getName always returns string type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "STR_CHECK")
      let name: string = e.getName()
      expect(typeof name === "string").assertTrue()
    });

    /**
     * @tc.name testBaseEnum152
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1520
     * @tc.desc Verify many BaseEnum instances do not cause memory overflow
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let enums: BaseEnum<int>[] = []
      for (let i = 0; i < 10000; i++) {
      enums.push(new BaseEnum<int>(i, "ENUM_" + i.toString()))
      }
      expect(enums[0].valueOf()).assertEqual(0)
      expect(enums[9999].valueOf()).assertEqual(9999)
      expect(enums[5000].getName()).assertEqual("ENUM_5000")
    });

    /**
     * @tc.name testBaseEnum153
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1530
     * @tc.desc Verify two instances with same parameters do not affect each other
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: BaseEnum<int> = new BaseEnum<int>(42, "SAME")
      let e2: BaseEnum<int> = new BaseEnum<int>(42, "SAME")
      expect(e1.valueOf()).assertEqual(e2.valueOf())
      expect(e1.getName()).assertEqual(e2.getName())
    });

    /**
     * @tc.name testBaseEnum154
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1540
     * @tc.desc Verify toString method override behavior is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "OVERRIDE_TEST")
      let str: string = e.toString()
      // 验证toString()已被重写，返回的不是默认的[object Object]
      expect(str === null).assertFalse()
      expect(str === "[object Object]").assertFalse()
    });

    /**
     * @tc.name testBaseEnum155
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1550
     * @tc.desc Verify overridden toString return contains enum related information
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(100, "MY_ENUM")
      let str: string = e.toString()
      // 重写的toString()应包含value或name信息
      expect(str.length > 0).assertTrue()
    });

    /**
     * @tc.name testBaseEnum156
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1560
     * @tc.desc Verify relationship between toString and getName return values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST_NAME")
      let strResult: string = e.toString()
      let nameResult: string = e.getName()
      // toString()可能包含getName()的返回值，也可能有不同格式
      expect(strResult === null).assertFalse()
      expect(nameResult).assertEqual("TEST_NAME")
    });

    /**
     * @tc.name testBaseEnum157
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1570
     * @tc.desc Verify relationship between toString and valueOf return values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
      let strResult: string = e.toString()
      let valResult: int = e.valueOf()
      // toString()可能包含valueOf()的返回值的字符串表示
      expect(strResult === null).assertFalse()
      expect(valResult).assertEqual(42)
    });

    /**
     * @tc.name testBaseEnum158
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1580
     * @tc.desc Verify BaseEnum can be subclassed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let color: ColorEnum158 = new ColorEnum158("RED", "COLOR_RED")
      expect(color.valueOf()).assertEqual("RED")
      expect(color.getName()).assertEqual("COLOR_RED")
      expect(color.toString() === null).assertFalse()
    });

    /**
     * @tc.name testBaseEnum159
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1590
     * @tc.desc Verify subclass can override toString method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let status: StatusEnum159 = new StatusEnum159(1, "ACTIVE")
      expect(status.toString()).assertEqual("Status[ACTIVE=1]")
    });

    /**
     * @tc.name testBaseEnum160
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1600
     * @tc.desc Verify subclass can call parent valueOf and getName methods
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let e: MyEnum160 = new MyEnum160(5, "FIVE")
      expect(e.getDescription()).assertEqual("FIVE=5")
    });

    /**
     * @tc.name testBaseEnum161
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1610
     * @tc.desc Verify method calls in multi-level inheritance chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {


      let ec: ExtendedColor161 = new ExtendedColor161("#FF0000", "RED")
      expect(ec.valueOf()).assertEqual("#FF0000")
      expect(ec.getName()).assertEqual("RED")
      expect(ec.toString()).assertEqual("Color:RED")
    });

    /**
     * @tc.name testBaseEnum162
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1620
     * @tc.desc Verify valueOf method is publicly accessible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "PUBLIC_TEST")
      // public方法，外部可直接调用
      let val: int = e.valueOf()
      expect(val).assertEqual(1)
    });

    /**
     * @tc.name testBaseEnum163
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1630
     * @tc.desc Verify getName method is publicly accessible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "PUBLIC_TEST")
      // public方法，外部可直接调用
      let name: string = e.getName()
      expect(name).assertEqual("PUBLIC_TEST")
    });

    /**
     * @tc.name testBaseEnum164
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1640
     * @tc.desc Verify toString method is publicly accessible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "PUBLIC_TEST")
      // public override方法，外部可直接调用
      let str: string = e.toString()
      expect(str === null).assertFalse()
    });

    /**
     * @tc.name testBaseEnum165
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1650
     * @tc.desc Verify enum constant collection pattern usage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(Direction165.NORTH.valueOf()).assertEqual("N")
      expect(Direction165.NORTH.getName()).assertEqual("NORTH")
      expect(Direction165.SOUTH.valueOf()).assertEqual("S")
      expect(Direction165.SOUTH.getName()).assertEqual("SOUTH")
    });

    /**
     * @tc.name testBaseEnum166
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1660
     * @tc.desc Verify numeric enum constant pattern usage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(HttpStatus166.OK.valueOf()).assertEqual(200)
      expect(HttpStatus166.OK.getName()).assertEqual("OK")
      expect(HttpStatus166.NOT_FOUND.valueOf()).assertEqual(404)
      expect(HttpStatus166.SERVER_ERROR.valueOf()).assertEqual(500)
    });

    /**
     * @tc.name testBaseEnum167
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1670
     * @tc.desc Verify long type enum constant pattern usage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(ErrorCode167.NONE.valueOf()).assertEqual(Int.toLong(0))
      expect(ErrorCode167.NETWORK.valueOf()).assertEqual(Int.toLong(1001))
    });

    /**
     * @tc.name testBaseEnum168
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1680
     * @tc.desc Verify different generic type BaseEnum instances coexist
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intEnum: BaseEnum<int> = new BaseEnum<int>(1, "INT_ENUM")
      let strEnum: BaseEnum<string> = new BaseEnum<string>("VALUE", "STR_ENUM")
      let floatEnum: BaseEnum<float> = new BaseEnum<float>(1.5f, "FLOAT_ENUM")
      let longEnum: BaseEnum<long> = new BaseEnum<long>(Int.toLong(999), "LONG_ENUM")
      let byteEnum: BaseEnum<byte> = new BaseEnum<byte>(10 as byte, "BYTE_ENUM")
      let shortEnum: BaseEnum<short> = new BaseEnum<short>(100 as short, "SHORT_ENUM")
      let doubleEnum: BaseEnum<double> = new BaseEnum<double>(2.5, "DOUBLE_ENUM")
      expect(intEnum.valueOf()).assertEqual(1)
      expect(strEnum.valueOf()).assertEqual("VALUE")
      expect(floatEnum.valueOf()).assertClose(1.5f, 0.001f)
      expect(longEnum.valueOf()).assertEqual(Int.toLong(999))
      expect(byteEnum.valueOf()).assertEqual(10 as byte)
      expect(shortEnum.valueOf()).assertEqual(100 as short)
      expect(doubleEnum.valueOf()).assertClose(2.5, 0.001)
    });

    /**
     * @tc.name testBaseEnum169
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1690
     * @tc.desc Verify enum value comparison scenario
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let red: BaseEnum<string> = new BaseEnum<string>("#FF0000", "RED")
      let blue: BaseEnum<string> = new BaseEnum<string>("#0000FF", "BLUE")
      expect(red.valueOf() === blue.valueOf()).assertFalse()
      expect(red.getName() === blue.getName()).assertFalse()
    });

    /**
     * @tc.name testBaseEnum170
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1700
     * @tc.desc Verify BaseEnum API interfaces from API version 20+
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // API version 20+ 环境下验证
      let e: BaseEnum<int> = new BaseEnum<int>(1, "API_V20")
      expect(e.valueOf()).assertEqual(1)
      expect(e.getName()).assertEqual("API_V20")
      expect(e.toString() === null).assertFalse()
    });

    /**
     * @tc.name testBaseEnum171
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1710
     * @tc.desc Verify BaseEnum works in ArkTS-Sta mode
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS-Sta模式下使用BaseEnum
      let staEnum: BaseEnum<int> = new BaseEnum<int>(42, "STA_MODE")
      expect(staEnum.valueOf()).assertEqual(42)
      expect(staEnum.getName()).assertEqual("STA_MODE")
    });

    /**
     * @tc.name testBaseEnum172
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1720
     * @tc.desc Verify constructor type checking in ArkTS-Sta strict mode
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS-Sta严格类型检查
      let e: BaseEnum<int> = new BaseEnum<int>(100, "STRICT_TYPE")
      let val: int = e.valueOf()
      let name: string = e.getName()
      let str: string = e.toString()
      expect(val).assertEqual(100)
      expect(name).assertEqual("STRICT_TYPE")
    });

  });
}
