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
import Utils from '../Util.test';

export default function Float64ArrayReduce1Test(): void {
  describe('Float64ArrayReduce1Test', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0010
     * @tc.name testFloat64ArrayReduce1001
     * @tc.desc Verify reduce with hex byte values 0x0A, 0x80, 0x81
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue0A: number = 0x0A;
      const hexValue80: number = 0x80;
      const hexValue81: number = 0x81;
      const num267Value: number = 267;
      const values = Float64Array.of(hexValue0A, hexValue80, hexValue81);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = num267Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0020
     * @tc.name testFloat64ArrayReduce1002
     * @tc.desc Verify reduce with int normal values 10000, 2147483646, 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2148493646Value: number = 2148493646;
      const values = Float64Array.of(10000, 2147483646, 1000000);
      const result = values.reduce((sum, val) => sum + val, 0.0);
      const expectVal = num2148493646Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0030
     * @tc.name testFloat64ArrayReduce1003
     * @tc.desc Verify reduce without initial value sums normal double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum765Pointfourtwofour: number = -765.424;
      const values = Float64Array.of(123.456, -888.88, 0.0);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = negnum765Pointfourtwofour;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0040
     * @tc.name testFloat64ArrayReduce1004
     * @tc.desc Verify reduce callback index and array arguments with normal double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum765Pointfourtwofour: number = -765.424;
      const twoValue: number = 2;
      const values = Float64Array.of(123.456, -888.88, 0.0);
      let capturedIndex: int = -1;
      let capturedArray: Float64Array | null = null;
      const result = values.reduce((sum: number, val: number, idx: int, arr: Float64Array) => {
        capturedIndex = idx;
        capturedArray = arr;
        return sum + val;
      }, 0.0);
      const expectVal = negnum765Pointfourtwofour;
      expect(result).assertEqual(expectVal);
      const expectVal2 = twoValue;
      expect(capturedIndex).assertEqual(expectVal2);
      const expectVal3 = values;
      expect(capturedArray).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0050
     * @tc.name testFloat64ArrayReduce1005
     * @tc.desc Verify reduce with hex short values 0x7FF, 0x7FFF, 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FF: number = 0x7FF;
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const num67582Value: number = 67582;
      const threeValue: number = 3;
      const values = new Float64Array([hexValue7FF, hexValue7FFF, hexValue8000]);
      let externalCounter: int = 0;
      const result = values.reduce((sum, val) => {
        externalCounter++;
        return sum + val;
      }, 0.0);
      const expectVal = num67582Value;
      expect(result).assertEqual(expectVal);
      const expectVal2 = threeValue;
      expect(externalCounter).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0060
     * @tc.name testFloat64ArrayReduce1006
     * @tc.desc Verify reduce with short boundary values -32768, 32767, 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num65534Value: number = 65534;
      const values = new Float64Array([-32768, 32767, 65535]);
      const result = values.reduce((sum: number, val: number, idx: int, arr: Float64Array) => {
        return sum + arr[idx];
      }, 0.0);
      const expectVal = num65534Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0070
     * @tc.name testFloat64ArrayReduce1007
     * @tc.desc Verify reduce without initial value sums scientific notation and doubles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999234Pointfivesevensix: number = 999234.576;
      const values = Float64Array.of(1.0e6, 123.456, -888.88);
      const result = values.reduce((s, v) => s + v);
      const expectVal = num999234Pointfivesevensix;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0080
     * @tc.name testFloat64ArrayReduce1008
     * @tc.desc Verify reduce typed callback sums scientific notation and doubles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999234Pointfivesevensix: number = 999234.576;
      const values = Float64Array.of(1.0e6, 123.456, -888.88);
      const result = values.reduce((sum: number, val: number) => {
        return sum + val;
      }, 0.0);
      const expectVal = num999234Pointfivesevensix;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0090
     * @tc.name testFloat64ArrayReduce1009
     * @tc.desc Verify reduce with hex int values 0x1234, 0x7FFFFFFF, 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1234: number = 0x1234;
      const hexValue7FFFFFFF: number = 0x7FFFFFFF;
      const hexValue80000000: number = 0x80000000;
      const num4294971955Value: number = 4294971955;
      const values = Float64Array.of(hexValue1234, hexValue7FFFFFFF, hexValue80000000);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = num4294971955Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0100
     * @tc.name testFloat64ArrayReduce1010
     * @tc.desc Verify reduce with int boundary values -2147483648, 2147483647, 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const values = Float64Array.of(-2147483648, 2147483647, 0);
      const result = values.reduce((sum, val) => sum + val, -0.0);
      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0110
     * @tc.name testFloat64ArrayReduce1011
     * @tc.desc Verify reduce without initial value sums business amount and -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num1000123Pointfourfoursix: number = 1000123.446;
      const values = Float64Array.of(999999.99, -0.0, 123.456);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = num1000123Pointfourfoursix;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0120
     * @tc.name testFloat64ArrayReduce1012
     * @tc.desc Verify reduce with -1.0 initial value sums business amount and -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num1000122Pointfourfoursix: number = 1000122.446;
      const values = Float64Array.of(999999.99, -0.0, 123.456);
      const result = values.reduce((sum, val) => sum + val, -1.0);
      const expectVal = num1000122Pointfourfoursix;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0130
     * @tc.name testFloat64ArrayReduce1013
     * @tc.desc Verify reduce with binary values 0b1010, 0b11111111, 0b10101010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1010: number = 0b1010;
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const num435Value: number = 435;
      const values = new Float64Array([binaryValue1010, binaryValue11111111, binaryValue10101010]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = num435Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0140
     * @tc.name testFloat64ArrayReduce1014
     * @tc.desc Verify reduce with long values 9223372036854775806, -1, 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(9223372036854775806, -1, 0);
      const result = values.reduce((sum, val) => sum + val, -0.1);
      const expectVal = true;
      expect(result > 9.0e+18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0150
     * @tc.name testFloat64ArrayReduce1015
     * @tc.desc Verify reduce with NaN initial value over zero and business amount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.0, -0.0, 999999.99);
      const result = values.reduce((sum, val) => sum + val, NaN);
      const actVal1 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0160
     * @tc.name testFloat64ArrayReduce1016
     * @tc.desc Verify reduce with Infinity initial value over zero and business amount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const values = Float64Array.of(0.0, -0.0, 999999.99);
      const result = values.reduce((sum, val) => sum + val, Infinity);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0170
     * @tc.name testFloat64ArrayReduce1017
     * @tc.desc Verify reduce with byte normal values 12, 99, 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const values = new Float64Array([12, 99, 127]);
      const result = values.reduce((sum, val) => sum + val, -Infinity);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0180
     * @tc.name testFloat64ArrayReduce1018
     * @tc.desc Verify reduce with byte boundary values -128, 127, 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue80: number = 0x80;
      const numberMaxValue: number = Number.MAX_VALUE;
      const values = Float64Array.of(-128, 127, hexValue80);
      const result = values.reduce((sum, val) => sum + val, Number.MAX_VALUE);
      const expectVal = numberMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0190
     * @tc.name testFloat64ArrayReduce1019
     * @tc.desc Verify reduce with Number.MIN_VALUE initial over float-like values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negninetysixPointeightfive: number = -96.85;
      const values = Float64Array.of(3.14, -99.99, 0.0);
      const result = values.reduce((sum, val) => sum + val, Number.MIN_VALUE);
      const expectVal = negninetysixPointeightfive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0200
     * @tc.name testFloat64ArrayReduce1020
     * @tc.desc Verify reduce with 1.0e-308 initial over float-like values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negninetysixPointeightfive: number = -96.85;
      const values = Float64Array.of(3.14, -99.99, 0.0);
      const result = values.reduce((sum, val) => sum + val, 1.0e-308);
      const expectVal = negninetysixPointeightfive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0210
     * @tc.name testFloat64ArrayReduce1021
     * @tc.desc Verify reduce with short normal values 100, 2048, 32760
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e+308;
      const values = Float64Array.of(100, 2048, 32760);
      const result = values.reduce((sum, val) => sum + val, 1.0e+308);
      const expectVal = sciValue10e308;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0220
     * @tc.name testFloat64ArrayReduce1022
     * @tc.desc Verify reduce with hex long max 0x7FFFFFFFFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFFFFFFFFFFFFFF: number = 0x7FFFFFFFFFFFFFFF;
      const values = new Float64Array([hexValue7FFFFFFFFFFFFFFF, -1, 0]);
      const result = values.reduce((sum, val) => sum + val, 16.0);
      const expectVal = true;
      expect(result > 9.0e+18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0230
     * @tc.name testFloat64ArrayReduce1023
     * @tc.desc Verify reduce with 8.0 initial value over 9.0 and doubles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum748Pointfourtwofour: number = -748.424;
      const values = new Float64Array([9.0, 123.456, -888.88]);
      const result = values.reduce((sum, val) => sum + val, 8.0);
      const expectVal = negnum748Pointfourtwofour;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0240
     * @tc.name testFloat64ArrayReduce1024
     * @tc.desc Verify reduce with 2.0 initial value over 9.0 and doubles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum754Pointfourtwofour: number = -754.424;
      const values = new Float64Array([9.0, 123.456, -888.88]);
      const result = values.reduce((sum, val) => sum + val, 2.0);
      const expectVal = negnum754Pointfourtwofour;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0250
     * @tc.name testFloat64ArrayReduce1025
     * @tc.desc Verify reduce with hex float value 9.0 with scientific 1.0e6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2148483656Value: number = 2148483656;
      const values = new Float64Array([9.0, 1.0e6, 0.0]);
      const result = values.reduce((sum, val) => sum + val, 2147483647.0);
      const expectVal = num2148483656Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0260
     * @tc.name testFloat64ArrayReduce1026
     * @tc.desc Verify reduce with hex long overflow 0x8000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array([9.223372036854775808e18, zeroValue, zeroValue]);
      const result = values.reduce((sum, val) => sum + val, 0.0);
      const expectVal = true;
      expect(result > 9.0e+18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0270
     * @tc.name testFloat64ArrayReduce1027
     * @tc.desc Verify reduce with MAX_SAFE_INTEGER initial and business large number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue9007209254740992e15: number = 9.007209254740992e+15;
      const values = new Float64Array([10000000000, -1, 0]);
      const result = values.reduce((sum, val) => sum + val, Number.MAX_SAFE_INTEGER);
      const expectVal = sciValue9007209254740992e15;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0280
     * @tc.name testFloat64ArrayReduce1028
     * @tc.desc Verify reduce with MIN_SAFE_INTEGER initial and business large number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsciValue9007189254740992e15: number = -9.007189254740992e+15;
      const values = new Float64Array([10000000000, -1, 0]);
      const result = values.reduce((sum, val) => sum + val, Number.MIN_SAFE_INTEGER);
      const expectVal = negsciValue9007189254740992e15;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0290
     * @tc.name testFloat64ArrayReduce1029
     * @tc.desc Verify reduce initialValue 1.7976931348623157e+308 - near MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const values = new Float64Array([-32768, -128, 0]);
      const result = values.reduce((sum, val) => sum + val, 1.7976931348623157e+308);
      const expectVal = doubleMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0300
     * @tc.name testFloat64ArrayReduce1030
     * @tc.desc Verify reduce initialValue 5e-324 - smallest positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483649Value: number = -2147483649;
      const values = new Float64Array([-2147483648, -1, 0]);
      const result = values.reduce((sum, val) => sum + val, 5e-324);
      const expectVal = negnum2147483649Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0310
     * @tc.name testFloat64ArrayReduce1031
     * @tc.desc Verify reduce initialValue is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue9007199254740991e15: number = 9.007199254740991e+15;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = sciValue9007199254740991e15;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0320
     * @tc.name testFloat64ArrayReduce1032
     * @tc.desc Verify reduce initialValue is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointtwofive: number = 2.25;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const result = values.reduce((acc, val) => acc + val, 0.0);
      const expectVal = twoPointtwofive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0330
     * @tc.name testFloat64ArrayReduce1033
     * @tc.desc Verify reduce initialValue is array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const threeValue: number = 3;
      const values = Float64Array.of(int16MinValue, -128, 0);
      const result = values.reduce<number[]>((acc: number[], val: number) => {
        acc.push(val);
        return acc;
      }, []);
      expect(result.length).assertEqual(threeValue);
      const actVal2 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0340
     * @tc.name testFloat64ArrayReduce1034
     * @tc.desc Verify reduce empty array with initialValue returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, 42.0);
      const expectVal = fillValue42;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0350
     * @tc.name testFloat64ArrayReduce1035
     * @tc.desc Verify reduce empty array with initialValue returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, 0.0);
      const expectVal = zeroPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0360
     * @tc.name testFloat64ArrayReduce1036
     * @tc.desc Verify reduce empty array with initialValue returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, NaN);
      const actVal3 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0370
     * @tc.name testFloat64ArrayReduce1037
     * @tc.desc Verify reduce empty array with initialValue returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, Infinity);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0380
     * @tc.name testFloat64ArrayReduce1038
     * @tc.desc Verify reduce empty array with object initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const values = new Float64Array(0);
      const result = values.reduce((acc, val) => acc + val, 100.0);
      const expectVal = hundredPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0390
     * @tc.name testFloat64ArrayReduce1039
     * @tc.desc Verify reduce single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const values = Float64Array.of(int32MinValue);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = int32MinValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0400
     * @tc.name testFloat64ArrayReduce1040
     * @tc.desc Verify reduce((sum, val) with [0.1] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negninePointnine: number = -9.9;
      const values = Float64Array.of(0.1);
      const result = values.reduce((sum, val) => sum + val, -10.0);
      const expectVal = negninePointnine;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0410
     * @tc.name testFloat64ArrayReduce1041
     * @tc.desc Verify reduce two element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const values = new Float64Array([0.5, 1.5]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0420
     * @tc.name testFloat64ArrayReduce1042
     * @tc.desc Verify reduce multi element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negtwoValue: number = -2;
      const values = Float64Array.of(-32768, -128, 0, 127, 32767);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = negtwoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0430
     * @tc.name testFloat64ArrayReduce1043
     * @tc.desc Verify reduce array with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483649Value: number = -2147483649;
      const values = new Float64Array([-2147483648, -1, 0]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = negnum2147483649Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0440
     * @tc.name testFloat64ArrayReduce1044
     * @tc.desc Verify reduce array with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const numberMinValue: number = Number.MIN_VALUE;
      const values = new Float64Array([1.0, numberMaxValue, numberMinValue]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = numberMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0450
     * @tc.name testFloat64ArrayReduce1045
     * @tc.desc Verify reduce all-zero array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0460
     * @tc.name testFloat64ArrayReduce1046
     * @tc.desc Verify reduce array with all identical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const pointFive: number = 0.5;
      const values = Float64Array.of(pointOneTwoFive, pointOneTwoFive, pointOneTwoFive, pointOneTwoFive);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = pointFive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0470
     * @tc.name testFloat64ArrayReduce1047
     * @tc.desc Verify reduce array with scientific notation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointoneoneone: number = 0.111;
      const values = new Float64Array([1.0e-3, 1.0e-2, 1.0e-1]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = zeroPointoneoneone;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0480
     * @tc.name testFloat64ArrayReduce1048
     * @tc.desc Verify reduce array with negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array([-0.0, -0.0, -0.0]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0490
     * @tc.name testFloat64ArrayReduce1049
     * @tc.desc Verify reduce array with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const values = new Float64Array([0.1, nanValue, 9007199254740991]);
      const result = values.reduce((sum, val) => sum + val);
      const actVal4 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0500
     * @tc.name testFloat64ArrayReduce1050
     * @tc.desc Verify reduce with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const values = new Float64Array([positiveInfinity, 1.5, 0.25]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0510
     * @tc.name testFloat64ArrayReduce1051
     * @tc.desc Verify reduce array with -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const values = new Float64Array([negativeInfinity, -128, 0]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0520
     * @tc.name testFloat64ArrayReduce1052
     * @tc.desc Verify reduce decimal precision boundary 0.1+0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const precisionSumValue: number =
        0.30000000000000004;
      const values = Float64Array.of(0.1, 0.2);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = precisionSumValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0530
     * @tc.name testFloat64ArrayReduce1053
     * @tc.desc Verify reduce return value equals accumulation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointtwofive: number = 2.25;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = twoPointtwofive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0540
     * @tc.name testFloat64ArrayReduce1054
     * @tc.desc Verify reduce original array not modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128, 0]);
      const originalLength = values.length;
      const originalFirst = values.$_get(0);
      values.reduce((sum, val) => sum + val);
      expect(values.length).assertEqual(originalLength);
      const actVal5 = values.$_get(0);
      const expectVal = originalFirst;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0550
     * @tc.name testFloat64ArrayReduce1055
     * @tc.desc Verify reduce original array element values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1, 0]);
      const arrCopy = [values.$_get(0), values.$_get(1), values.$_get(2)];
      values.reduce((sum, val) => sum + val);
      const actVal6 = values.$_get(0);
      const expectVal = arrCopy[0];
      expect(actVal6).assertEqual(expectVal);
      const actVal7 = values.$_get(1);
      const expectVal2 = arrCopy[1];
      expect(actVal7).assertEqual(expectVal2);
      const actVal8 = values.$_get(2);
      const expectVal3 = arrCopy[2];
      expect(actVal8).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0560
     * @tc.name testFloat64ArrayReduce1056
     * @tc.desc Verify reduce returns NaN when initialValue is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const result = values.reduce((sum, val) => sum + val, NaN);
      const actVal9 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal9).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0570
     * @tc.name testFloat64ArrayReduce1057
     * @tc.desc Verify reduce returns Infinity when initialValue is Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const result = values.reduce((sum, val) => sum + val, Infinity);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0580
     * @tc.name testFloat64ArrayReduce1058
     * @tc.desc Verify reduce callbackfn division by zero produces Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const values = new Float64Array([-32768, -128, 0]);
      const result = values.reduce((sum, val) => {
        if (val === 0.0) {
          return sum / val;
        }
        return sum + val;
      }, 0.0);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0590
     * @tc.name testFloat64ArrayReduce1059
     * @tc.desc Verify reduce callbackfn produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1, 0]);
      const result = values.reduce((sum, val) => {
        if (val === 0.0) {
          return sum / val;
        }
        return sum;
      }, 0.0 / 0.0);
      const actVal10 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal10).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0600
     * @tc.name testFloat64ArrayReduce1060
     * @tc.desc Verify reduce callbackfn modifies external accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixtyPointZero: number = 60.0;
      const values = Float64Array.of(10.0, 20.0, 30.0);
      let externalSum: number = 0.0;
      const result = values.reduce((sum, val) => {
        externalSum += val;
        return sum + val;
      }, 0.0);
      const expectVal = sixtyPointZero;
      expect(result).assertEqual(expectVal);
      const expectVal2 = sixtyPointZero;
      expect(externalSum).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0610
     * @tc.name testFloat64ArrayReduce1061
     * @tc.desc Verify reduce callbackfn calls array method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nineValue: number = 9;
      const values = new Float64Array([-32768, -128, 0]);
      const result = values.reduce((sum: number, val: number, idx: int, arr: Float64Array) => {
        return sum + arr.length;
      }, 0.0);
      const expectVal = nineValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0620
     * @tc.name testFloat64ArrayReduce1062
     * @tc.desc Verify reduce consecutive calls produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483649Value: number = -2147483649;
      const values = new Float64Array([-2147483648, -1, 0]);
      const result1 = values.reduce((sum, val) => sum + val);
      const result2 = values.reduce((sum, val) => sum + val);
      const expectVal = negnum2147483649Value;
      expect(result1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0630
     * @tc.name testFloat64ArrayReduce1063
     * @tc.desc Verify reduce multiple calls with different initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointtwofive: number = 2.25;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const result1 = values.reduce((sum, val) => sum + val);
      const result2 = values.reduce((sum, val) => sum + val);
      const expectVal = twoPointtwofive;
      expect(result1).assertEqual(expectVal);
      const expectVal2 = twoPointtwofive;
      expect(result2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0640
     * @tc.name testFloat64ArrayReduce1064
     * @tc.desc Verify reduce callbackfn returns previous result accumulation chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const threeValue: number = 3;
      const zeroPointZero: number = 0.0;
      const negnum32896Value: number = -32896;
      const values = Float64Array.of(int16MinValue, -128, 0);
      const intermediates: number[] = [];
      const result = values.reduce((sum, val) => {
        intermediates.push(sum);
        return sum + val;
      }, 0.0);
      expect(intermediates.length).assertEqual(threeValue);
      expect(intermediates[0]).assertEqual(zeroPointZero);
      expect(intermediates[1]).assertEqual(int16MinValue);
      expect(intermediates[2]).assertEqual(negnum32896Value);
      const expectVal = negnum32896Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0650
     * @tc.name testFloat64ArrayReduce1065
     * @tc.desc Verify reduce initialValue 0.0 array with MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const values = Float64Array.of(numberMaxValue);
      const result = values.reduce((sum, val) => sum + val);
      const actVal11 = Number.isNaN(result);
      const expectVal = false;
      expect(actVal11).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0660
     * @tc.name testFloat64ArrayReduce1066
     * @tc.desc Verify reduce initialValue MAX_VALUE array with 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const values = new Float64Array([-2147483648]);
      const result = values.reduce((sum, val) => sum + val, Number.MAX_VALUE);
      const expectVal = numberMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0670
     * @tc.name testFloat64ArrayReduce1067
     * @tc.desc Verify reduce initialValue MIN_VALUE array with 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const values = new Float64Array([pointOne]);
      const result = values.reduce((sum, val) => sum + val, Number.MIN_VALUE);
      const expectVal = pointOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0680
     * @tc.name testFloat64ArrayReduce1068
     * @tc.desc Verify reduce initialValue 1.0 array with MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMinValue: number = Number.MIN_VALUE;
      const values = new Float64Array([numberMinValue]);
      const result = values.reduce((sum, val) => sum + val);
      const actVal12 = Number.isNaN(result);
      const expectVal = false;
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0690
     * @tc.name testFloat64ArrayReduce1069
     * @tc.desc Verify reduce initialValue NaN array with any value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const result = values.reduce((sum, val) => sum + val, NaN);
      const actVal13 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal13).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0700
     * @tc.name testFloat64ArrayReduce1070
     * @tc.desc Verify reduce initialValue Infinity array with negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const values = new Float64Array([-32768, -128, 0]);
      const result = values.reduce((sum, val) => sum + val, Infinity);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0710
     * @tc.name testFloat64ArrayReduce1071
     * @tc.desc Verify reduce initialValue -Infinity array with positives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const values = new Float64Array([-2147483648, -1, 0]);
      const result = values.reduce((sum, val) => sum + val, -Infinity);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0720
     * @tc.name testFloat64ArrayReduce1072
     * @tc.desc Verify reduce initialValue 0.0 array with -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const values = Float64Array.of(-0.0, zeroPointZero, -0.0);
      const result = values.reduce((sum, val) => sum + val, 0.0);
      const expectVal = zeroPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0730
     * @tc.name testFloat64ArrayReduce1073
     * @tc.desc Verify reduce initialValue -0.0 array with 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const zeroPointsevenfive: number = 0.75;
      const values = Float64Array.of(pointTwoFive, pointTwoFive, pointTwoFive);
      const result = values.reduce((sum, val) => sum + val, -0.0);
      const expectVal = zeroPointsevenfive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0740
     * @tc.name testFloat64ArrayReduce1074
     * @tc.desc Verify reduce initialValue MAX_SAFE_INTEGER array with 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue9007199254708223e15: number = 9.007199254708223e+15;
      const values = Float64Array.of(-32768);
      const result = values.reduce((sum, val) => sum + val, Number.MAX_SAFE_INTEGER);
      const expectVal = sciValue9007199254708223e15;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0750
     * @tc.name testFloat64ArrayReduce1075
     * @tc.desc Verify reduce initialValue 1.0 array with MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const values = new Float64Array([maxSafeInteger]);
      const result = values.reduce((sum, val) => sum + val);
      const actVal14 = Number.isNaN(result);
      const expectVal = false;
      expect(actVal14).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0760
     * @tc.name testFloat64ArrayReduce1076
     * @tc.desc Verify reduce initialValue MIN_SAFE_INTEGER array with -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsciValue900720140222464e15: number = -9.00720140222464e+15;
      const values = new Float64Array([-2147483648]);
      const result = values.reduce((sum, val) => sum + val, Number.MIN_SAFE_INTEGER);
      const expectVal = negsciValue900720140222464e15;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0770
     * @tc.name testFloat64ArrayReduce1077
     * @tc.desc Verify reduce initialValue hex array with decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32880Value: number = -32880;
      const values = new Float64Array([-32768, -128, 0]);
      const result = values.reduce((sum, val) => sum + val, 16.0);
      const expectVal = negnum32880Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0780
     * @tc.name testFloat64ArrayReduce1078
     * @tc.desc Verify reduce initialValue octal array with binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue10: number = 0b10;
      const binaryValue11: number = 0b11;
      const binaryValue100: number = 0b100;
      const seventeenValue: number = 17;
      const values = Float64Array.of(binaryValue10, binaryValue11, binaryValue100);
      const result = values.reduce((sum, val) => sum + val, 8.0);
      const expectVal = seventeenValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0790
     * @tc.name testFloat64ArrayReduce1079
     * @tc.desc Verify reduce initialValue negative array with mixed signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483649Value: number = -2147483649;
      const values = Float64Array.of(-2147483648, -1, 0, 1);
      const result = values.reduce((sum, val) => sum + val, -1.0);
      const expectVal = negnum2147483649Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0800
     * @tc.name testFloat64ArrayReduce1080
     * @tc.desc Verify reduce initialValue MAX_VALUE array with MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const values = Float64Array.of(numberMaxValue, numberMaxValue);
      const result = values.reduce((sum, val) => sum + val);
      const actVal15 = Number.isNaN(result);
      const expectVal = false;
      expect(actVal15).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0810
     * @tc.name testFloat64ArrayReduce1081
     * @tc.desc Verify reduce initialValue 0 array with overflow value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const values = new Float64Array([pointFive]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = pointFive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0820
     * @tc.name testFloat64ArrayReduce1082
     * @tc.desc Verify reduce single element array returns accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = new Float64Array([int16MinValue]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = int16MinValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0830
     * @tc.name testFloat64ArrayReduce1083
     * @tc.desc Verify reduce single element initialValue NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.5]);
      const result = values.reduce((sum, val) => sum + val, NaN);
      const actVal16 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal16).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0840
     * @tc.name testFloat64ArrayReduce1084
     * @tc.desc Verify reduce single element initialValue Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const values = Float64Array.of(-32768);
      const result = values.reduce((sum, val) => sum + val, Infinity);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0850
     * @tc.name testFloat64ArrayReduce1085
     * @tc.desc Verify reduce single element initialValue -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const values = new Float64Array([-2147483648]);
      const result = values.reduce((sum, val) => sum + val, -Infinity);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0860
     * @tc.name testFloat64ArrayReduce1086
     * @tc.desc Verify reduce single element initialValue 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const values = new Float64Array([pointOne]);
      const result = values.reduce((sum, val) => sum + val);
      const expectVal = pointOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0870
     * @tc.name testFloat64ArrayReduce1087
     * @tc.desc Verify reduce single element initialValue -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const values = new Float64Array([pointFive]);
      const result = values.reduce((sum, val) => sum + val, -0.0);
      const expectVal = pointFive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0880
     * @tc.name testFloat64ArrayReduce1088
     * @tc.desc Verify reduce((sum, val) with [-32768] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32818Value: number = -32818;
      const values = Float64Array.of(-32768);
      const result = values.reduce((sum, val) => sum + val, -50.0);
      const expectVal = negnum32818Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0890
     * @tc.name testFloat64ArrayReduce1089
     * @tc.desc Verify reduce single element initialValue scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointonezerozerozeroone: number = 0.10001;
      const values = Float64Array.of(0.1);
      const result = values.reduce((sum, val) => sum + val, 1.0e-5);
      const expectVal = zeroPointonezerozerozeroone;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0900
     * @tc.name testFloat64ArrayReduce1090
     * @tc.desc Verify reduce single element initialValue hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenPointfive: number = 16.5;
      const values = new Float64Array([0.5]);
      const result = values.reduce((sum, val) => sum + val, 16.0);
      const expectVal = sixteenPointfive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0910
     * @tc.name testFloat64ArrayReduce1091
     * @tc.desc Verify reduce single element callbackfn uses index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const values = new Float64Array([int16MinValue]);
      let capturedIndex: int = -1;
      const result = values.reduce((sum, val, idx) => {
        capturedIndex = idx;
        return sum + val;
      }, 0.0);
      const expectVal = int16MinValue;
      expect(result).assertEqual(expectVal);
      const expectVal2 = zeroValue;
      expect(capturedIndex).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0920
     * @tc.name testFloat64ArrayReduce1092
     * @tc.desc Verify reduce single element callbackfn uses array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const oneValue: number = 1;
      const values = Float64Array.of(int32MinValue);
      let capturedLength: int = -1;
      const result = values.reduce((sum: number, val: number, idx: int, arr: Float64Array) => {
        capturedLength = arr.length;
        return sum + val;
      }, 0.0);
      const expectVal = int32MinValue;
      expect(result).assertEqual(expectVal);
      const expectVal2 = oneValue;
      expect(capturedLength).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0930
     * @tc.name testFloat64ArrayReduce1093
     * @tc.desc Verify reduce single element callbackfn returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const values = new Float64Array([pointOne]);
      const result = values.reduce((sum, val) => sum);
      const expectVal = pointOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0940
     * @tc.name testFloat64ArrayReduce1094
     * @tc.desc Verify reduce single element callbackfn ignores initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const values = new Float64Array([pointFive]);
      const result = values.reduce((sum, val) => val * 2);
      const expectVal = pointFive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0950
     * @tc.name testFloat64ArrayReduce1095
     * @tc.desc Verify reduce single element initialValue 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const values = new Float64Array([pointOne]);
      const result = values.reduce((sum, val) => sum + val, 5e-324);
      const expectVal = pointOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0960
     * @tc.name testFloat64ArrayReduce1096
     * @tc.desc Verify reduce single element initialValue 1.7976931348623157e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const values = new Float64Array([0.5]);
      const result = values.reduce((sum, val) => sum + val, 1.7976931348623157e+308);
      const expectVal = doubleMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0970
     * @tc.name testFloat64ArrayReduce1097
     * @tc.desc Verify reduce empty array returns initialValue negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const neghundredPointZero: number = -100.0;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, -100.0);
      const expectVal = neghundredPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0980
     * @tc.name testFloat64ArrayReduce1098
     * @tc.desc Verify reduce empty array returns initialValue decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointonetwothree: number = 0.123;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, 0.123);
      const expectVal = zeroPointonetwothree;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_0990
     * @tc.name testFloat64ArrayReduce1099
     * @tc.desc Verify reduce empty array returns initialValue MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, Number.MAX_VALUE);
      const expectVal = numberMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1000
     * @tc.name testFloat64ArrayReduce1100
     * @tc.desc Verify reduce empty array returns initialValue MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMinValue: number = Number.MIN_VALUE;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, Number.MIN_VALUE);
      const expectVal = numberMinValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1010
     * @tc.name testFloat64ArrayReduce1101
     * @tc.desc Verify reduce empty array returns initialValue -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, -Infinity);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1020
     * @tc.name testFloat64ArrayReduce1102
     * @tc.desc Verify reduce empty array returns initialValue scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e10: number = 1.0e-10;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, 1.0e-10);
      const expectVal = sciValue10e10;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1030
     * @tc.name testFloat64ArrayReduce1103
     * @tc.desc Verify reduce empty array returns initialValue hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num255Pointzero: number = 255.0;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, 255.0);
      const expectVal = num255Pointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1040
     * @tc.name testFloat64ArrayReduce1104
     * @tc.desc Verify reduce empty array returns initialValue octal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixtythreePointzero: number = 63.0;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, 63.0);
      const expectVal = sixtythreePointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1050
     * @tc.name testFloat64ArrayReduce1105
     * @tc.desc Verify reduce empty array returns initialValue binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fifteenPointzero: number = 15.0;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, 15.0);
      const expectVal = fifteenPointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1060
     * @tc.name testFloat64ArrayReduce1106
     * @tc.desc Verify reduce empty array returns initialValue MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, Number.MAX_SAFE_INTEGER);
      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1070
     * @tc.name testFloat64ArrayReduce1107
     * @tc.desc Verify reduce empty array returns initialValue MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, Number.MIN_SAFE_INTEGER);
      const expectVal = minSafeInteger;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1080
     * @tc.name testFloat64ArrayReduce1108
     * @tc.desc Verify reduce empty array returns initialValue object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const values = new Float64Array(0);
      const result = values.reduce((acc, val) => acc + val, 999.0);
      const expectVal = num999Pointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1090
     * @tc.name testFloat64ArrayReduce1109
     * @tc.desc Verify reduce empty array callbackfn never called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const zeroValue: number = 0;
      const values = new Float64Array(0);
      let callCount: int = 0;
      const result = values.reduce((sum, val) => {
        callCount++;
        return sum + val;
      }, 0.0);
      const expectVal = zeroPointZero;
      expect(result).assertEqual(expectVal);
      const expectVal2 = zeroValue;
      expect(callCount).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1100
     * @tc.name testFloat64ArrayReduce1110
     * @tc.desc Verify reduce empty array initialValue 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MaxValue: number = 2147483647;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, 2147483647.0);
      const expectVal = int32MaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1110
     * @tc.name testFloat64ArrayReduce1111
     * @tc.desc Verify reduce empty array initialValue -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, -2147483648.0);
      const expectVal = int32MinValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1120
     * @tc.name testFloat64ArrayReduce1112
     * @tc.desc Verify reduce empty array initialValue 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, 5e-324);
      const expectVal = doubleMinValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1130
     * @tc.name testFloat64ArrayReduce1113
     * @tc.desc Verify reduce empty array initialValue 1.7976931348623157e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, 1.7976931348623157e+308);
      const expectVal = doubleMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1140
     * @tc.name testFloat64ArrayReduce1114
     * @tc.desc Verify reduce empty array initialValue 0.1+0.2 precision boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointThree: number = 0.3;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, 0.3);
      const expectVal = pointThree;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1150
     * @tc.name testFloat64ArrayReduce1115
     * @tc.desc Verify reduce empty array initialValue -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const values = new Float64Array(0);
      const result = values.reduce((sum, val) => sum + val, -0.0);
      const expectVal = negativeZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1160
     * @tc.name testFloat64ArrayReduce1116
     * @tc.desc Verify reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32896Value: number = -32896;
      const values = new Float64Array([-32768, -128, 0]);
      const total = values.reduce((sum, value) => sum + value);
      const expectVal = negnum32896Value;
      expect(total).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1170
     * @tc.name testFloat64ArrayReduce1117
     * @tc.desc Verify reduce product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array([-2147483648, -1, zeroValue]);
      const product = values.reduce((prod, value) => prod * value);
      const expectVal = zeroValue;
      expect(product).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1180
     * @tc.name testFloat64ArrayReduce1118
     * @tc.desc Verify reduce((sum, value) exception handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const values = new Float64Array();
        values.reduce((sum, value) => sum + value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1190
     * @tc.name testFloat64ArrayReduce1119
     * @tc.desc Verify reduce with initialValue sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue9007199254740991e15: number = 9.007199254740991e+15;
      const values = Float64Array.of(0.1, 9007199254740991);
      const total = values.reduce((sum, value) => sum + value, 0.0);
      const expectVal = sciValue9007199254740991e15;
      expect(total).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1200
     * @tc.name testFloat64ArrayReduce1120
     * @tc.desc Verify reduce with initialValue string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.5, 1.5]);
      const text = values.reduce<string>((result, value) => result + value, "");
      const expectVal = '0.51.5';
      expect(text).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1210
     * @tc.name testFloat64ArrayReduce1121
     * @tc.desc Verify reduce with negative initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32897Value: number = -32897;
      const values = new Float64Array([-32768, -128]);
      const result = values.reduce((sum, value) => sum + value, -1.0);
      const expectVal = negnum32897Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1220
     * @tc.name testFloat64ArrayReduce1122
     * @tc.desc Verify reduce result with negative accumulator 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const sum = arr.reduce((acc: number, val: number): number => acc + val, 0.0);
      expect(sum === 6.0).assertFalse();
      expect(sum === 0.0).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1230
     * @tc.name testFloat64ArrayReduce1123
     * @tc.desc Verify reduce with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const num425Value: number = 425;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      const s = arr.reduce((a: number, v: number): number => a + v, 0x00);
      const expectVal = num425Value;
      expect(s).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1240
     * @tc.name testFloat64ArrayReduce1124
     * @tc.desc Verify reduce with binary literal 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const num425Value: number = 425;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010);
      const s = arr.reduce((a: number, v: number): number => a + v, 0b00000000);
      const expectVal = num425Value;
      expect(s).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1250
     * @tc.name testFloat64ArrayReduce1125
     * @tc.desc Verify reduce with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const actVal17 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal17).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1260
     * @tc.name testFloat64ArrayReduce1126
     * @tc.desc Verify reduce with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const actVal18 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1270
     * @tc.name testFloat64ArrayReduce1127
     * @tc.desc Verify reduce with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = doubleMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1280
     * @tc.name testFloat64ArrayReduce1128
     * @tc.desc Verify reduce callbackfn throws RangeError propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0, 2.0, 3.0);
      try {
        values.reduce((sum: Double, val: Double): Double => {
          throw new RangeError("test error");
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1290
     * @tc.name testFloat64ArrayReduce1129
     * @tc.desc Verify reduce callbackfn throws TypeError propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0, 2.0, 3.0);
      try {
        values.reduce((sum: Double, val: Double): Double => {
          throw new TypeError("type error");
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1300
     * @tc.name testFloat64ArrayReduce1130
     * @tc.desc Verify reduce callbackfn throws Error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0, 2.0, 3.0);
      try {
        values.reduce((sum: Double, val: Double): Double => {
          throw new Error("general error");
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1310
     * @tc.name testFloat64ArrayReduce1131
     * @tc.desc Verify reduce callbackfn throws on first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0, 2.0, 3.0);
      try {
        values.reduce((sum, val, idx) => {
          if (idx === 0) {
            throw new Error("first element");
          }
          return sum + val;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1320
     * @tc.name testFloat64ArrayReduce1132
     * @tc.desc Verify reduce callbackfn throws on middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0, 2.0, 3.0);
      try {
        values.reduce((sum, val, idx) => {
          if (idx === 1) {
            throw new Error("middle element");
          }
          return sum + val;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1330
     * @tc.name testFloat64ArrayReduce1133
     * @tc.desc Verify reduce callbackfn throws on last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0, 2.0, 3.0);
      try {
        values.reduce((sum, val, idx) => {
          if (idx === 2) {
            throw new Error("last element");
          }
          return sum + val;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1340
     * @tc.name testFloat64ArrayReduce1134
     * @tc.desc Verify reduce with 50-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num1225Pointzero: number = 1225.0;
      const values = new Float64Array(50);
      for (let i: int = 0; i < 50; i++) {
        values[i] = i;
      }
      const result = values.reduce((sum, val) => sum + val, 0.0);
      const expectVal = num1225Pointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1350
     * @tc.name testFloat64ArrayReduce1135
     * @tc.desc Verify reduce with 100-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num4950Pointzero: number = 4950.0;
      const values = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        values[i] = i;
      }
      const result = values.reduce((sum, val) => sum + val, 0.0);
      const expectVal = num4950Pointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1360
     * @tc.name testFloat64ArrayReduce1136
     * @tc.desc Verify reduce with 200-element array of 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num200Pointzero: number = 200.0;
      const values = new Float64Array(200);
      for (let i: int = 0; i < 200; i++) {
        values[i] = 1.0;
      }
      const result = values.reduce((sum, val) => sum + val, 0.0);
      const expectVal = num200Pointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1370
     * @tc.name testFloat64ArrayReduce1137
     * @tc.desc Verify reduce with 1000-element array of 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thousandPointZero: number = 1000.0;
      const values = new Float64Array(1000);
      for (let i: int = 0; i < 1000; i++) {
        values[i] = 1.0;
      }
      const result = values.reduce((sum, val) => sum + val, 0.0);
      const expectVal = thousandPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1380
     * @tc.name testFloat64ArrayReduce1138
     * @tc.desc Verify reduce<boolean> with all positive values returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0, 2.0, 3.0);
      const result = values.reduce<boolean>((acc, val) => acc && val > 0, true);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1390
     * @tc.name testFloat64ArrayReduce1139
     * @tc.desc Verify reduce<boolean> with negative value returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([1.0, -2.0, 3.0]);
      const result = values.reduce<boolean>((acc, val) => acc && val > 0, true);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1400
     * @tc.name testFloat64ArrayReduce1140
     * @tc.desc Verify reduce callbackfn modifies array via array param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const fourPointZero: number = 4.0;
      const sixPointZero: number = 6.0;
      const values = Float64Array.of(1.0, twoPointZero, 3.0);
      values.reduce((sum, val, idx, ary) => {
        ary[idx] = val * 2.0;
        return sum + val;
      }, 0.0);
      const actVal19 = values.$_get(0);
      const expectVal = twoPointZero;
      expect(actVal19).assertEqual(expectVal);
      const actVal20 = values.$_get(1);
      const expectVal2 = fourPointZero;
      expect(actVal20).assertEqual(expectVal2);
      const actVal21 = values.$_get(2);
      const expectVal3 = sixPointZero;
      expect(actVal21).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1410
     * @tc.name testFloat64ArrayReduce1141
     * @tc.desc Verify reduce callbackfn reads modified element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twelvePointzero: number = 12.0;
      const values = Float64Array.of(1.0, 2.0, 3.0);
      const result = values.reduce((sum, val, idx, ary) => {
        ary[idx] = val * 2.0;
        return sum + ary[idx];
      }, 0.0);
      const expectVal = twelvePointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_1_1420
     * @tc.name testFloat64ArrayReduce1142
     * @tc.desc Verify reduce on empty array without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce1142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      try {
        arr.reduce((sum: number, val: number): number => sum + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    })

  })
}
