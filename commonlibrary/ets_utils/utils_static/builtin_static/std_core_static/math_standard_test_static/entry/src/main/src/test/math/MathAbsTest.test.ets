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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

function buildAbsDelta(left: number, right: number): number {
  return left - right;
}

export default function mathAbsTest(): void {
  describe('MathAbsTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    })
    afterAll((): void => {
    })

    /**
     * @tc.name testMathAbs001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0100
     * @tc.desc Verify abs method with byte zero input for zero return value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: byte = 0;
      let result: byte = Math.abs(value);
      expect(result).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testMathAbs002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0200
     * @tc.desc Verify abs method with short zero input for zero return value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: short = 0;
      let result: short = Math.abs(value);
      expect(result).assertEqual(Int.toShort(0));
    });

    /**
     * @tc.name testMathAbs003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0300
     * @tc.desc Verify abs method with int zero input for zero return value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: int = 0;
      let result: int = Math.abs(value);
      expect(result).assertEqual(Int.toInt(0));
    });

    /**
     * @tc.name testMathAbs004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0400
     * @tc.desc Verify abs method with long zero input for zero return value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: long = Int.toLong(0);
      let result: long = Math.abs(value);
      expect(result).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testMathAbs005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0500
     * @tc.desc Verify abs method with float zero input for zero return value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = Double.toFloat(0.0);
      let result: float = Math.abs(value);
      expect(result).assertEqual(Double.toFloat(0.0));
    });

    /**
     * @tc.name testMathAbs006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0600
     * @tc.desc Verify abs method with double zero input for zero return value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = 0.0;
      let result: double = Math.abs(value);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.name testMathAbs007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0700
     * @tc.desc Verify abs method with positive byte input returns the original value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: byte = 42;
      let result: byte = Math.abs(value);
      expect(result).assertEqual(Int.toByte(42));
    });

    /**
     * @tc.name testMathAbs008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0800
     * @tc.desc Verify abs method with positive short input returns the original value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: short = 1000;
      let result: short = Math.abs(value);
      expect(result).assertEqual(Int.toShort(1000));
    });

    /**
     * @tc.name testMathAbs009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0900
     * @tc.desc Verify abs method with positive int input returns the original value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: int = 100000;
      let result: int = Math.abs(value);
      expect(result).assertEqual(Int.toInt(100000));
    });

    /**
     * @tc.name testMathAbs010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1000
     * @tc.desc Verify abs method with positive long input returns the original value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: long = Int.toLong(1000000);
      let result: long = Math.abs(value);
      expect(result).assertEqual(Int.toLong(1000000));
    });

    /**
     * @tc.name testMathAbs011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1100
     * @tc.desc Verify abs method with positive float input returns the original value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = Double.toFloat(2.5);
      let result: float = Math.abs(value);
      expect(result).assertEqual(Double.toFloat(2.5));
    });

    /**
     * @tc.name testMathAbs012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1200
     * @tc.desc Verify abs method with positive double input returns the original value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = 2.5;
      let result: double = Math.abs(value);
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.name testMathAbs013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1300
     * @tc.desc Verify abs method with negative byte input returns the positive magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: byte = -42;
      let result: byte = Math.abs(value);
      expect(result).assertEqual(Int.toByte(42));
    });

    /**
     * @tc.name testMathAbs014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1400
     * @tc.desc Verify abs method with negative short input returns the positive magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: short = -1000;
      let result: short = Math.abs(value);
      expect(result).assertEqual(Int.toShort(1000));
    });

    /**
     * @tc.name testMathAbs015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1500
     * @tc.desc Verify abs method with negative int input returns the positive magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: int = -100000;
      let result: int = Math.abs(value);
      expect(result).assertEqual(Int.toInt(100000));
    });

    /**
     * @tc.name testMathAbs016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1600
     * @tc.desc Verify abs method with negative long input returns the positive magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: long = Int.toLong(-1000000);
      let result: long = Math.abs(value);
      expect(result).assertEqual(Int.toLong(1000000));
    });

    /**
     * @tc.name testMathAbs017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1700
     * @tc.desc Verify abs method with negative float input returns the positive magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = Double.toFloat(-2.5);
      let result: float = Math.abs(value);
      expect(result).assertEqual(Double.toFloat(2.5));
    });

    /**
     * @tc.name testMathAbs018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1800
     * @tc.desc Verify abs method with negative double input returns the positive magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = -2.5;
      let result: double = Math.abs(value);
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.name testMathAbs019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1900
     * @tc.desc Verify abs method with byte minimum input preserves documented overflow semantics without crash
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: byte = -128;
      let result: byte = Math.abs(value);
      expect(result).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testMathAbs020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2000
     * @tc.desc Verify abs method with short minimum input preserves documented overflow semantics without crash
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: short = -32768;
      let result: short = Math.abs(value);
      expect(result).assertEqual(Int.toShort(-32768));
    });

    /**
     * @tc.name testMathAbs021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2100
     * @tc.desc Verify abs method with int minimum input preserves documented overflow semantics without crash
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: int = Int.MIN_VALUE;
      let result: int = Math.abs(value);
      expect(result).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.name testMathAbs022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2200
     * @tc.desc Verify abs method with long minimum input preserves documented overflow semantics without crash
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: long = Long.toLong(-9223372036854775808);
      let result: long = Math.abs(value);
      expect(result).assertEqual(Long.toLong(-9223372036854775808));
    });

    /**
     * @tc.name testMathAbs023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2300
     * @tc.desc Verify abs method with byte maximum input returns the original value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: byte = 127;
      let result: byte = Math.abs(value);
      expect(result).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testMathAbs024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2400
     * @tc.desc Verify abs method with short maximum input returns the original value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: short = 32767;
      let result: short = Math.abs(value);
      expect(result).assertEqual(Int.toShort(32767));
    });

    /**
     * @tc.name testMathAbs025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2500
     * @tc.desc Verify abs method with int maximum input returns the original value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: int = Int.MAX_VALUE;
      let result: int = Math.abs(value);
      expect(result).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.name testMathAbs026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2600
     * @tc.desc Verify abs method with long maximum input returns the original value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: long = Long.toLong(9223372036854775807);
      let result: long = Math.abs(value);
      expect(result).assertEqual(Long.toLong(9223372036854775807));
    });

    /**
     * @tc.name testMathAbs027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2700
     * @tc.desc Verify abs method with float maximum input returns the original value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = Float.MAX_VALUE;
      let result: float = Math.abs(value);
      expect(result).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.name testMathAbs028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2800
     * @tc.desc Verify abs method with double maximum input returns the original value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = Double.MAX_VALUE;
      let result: double = Math.abs(value);
      expect(result).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.name testMathAbs029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2900
     * @tc.desc Verify abs method with float negative zero returns positive zero per IEEE 754
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = Double.toFloat(-0.0);
      let result: float = Math.abs(value);
      expect(result).assertEqual(Double.toFloat(0.0));
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAbs030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3000
     * @tc.desc Verify abs method with double negative zero returns positive zero per IEEE 754
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = -0.0;
      let result: double = Math.abs(value);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAbs031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3100
     * @tc.desc Verify abs method with float NaN input returns NaN using isNaN predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = Float.NaN;
      let result: float = Math.abs(value);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name testMathAbs032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3200
     * @tc.desc Verify abs method with double NaN input returns NaN using isNaN predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = Double.NaN;
      let result: double = Math.abs(value);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name testMathAbs033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3300
     * @tc.desc Verify abs method with float positive and negative infinity returns positive infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let posInf: float = Float.POSITIVE_INFINITY;
      let negInf: float = Float.NEGATIVE_INFINITY;
      expect(Math.abs(posInf)).assertEqual(Float.POSITIVE_INFINITY);
      expect(Math.abs(negInf)).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathAbs034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3400
     * @tc.desc Verify abs method with double positive and negative infinity returns positive infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let posInf: double = Double.POSITIVE_INFINITY;
      let negInf: double = Double.NEGATIVE_INFINITY;
      expect(Math.abs(posInf)).assertEqual(Double.POSITIVE_INFINITY);
      expect(Math.abs(negInf)).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathAbs035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3500
     * @tc.desc Verify abs method with byte hexadecimal and octal literals returns expected absolute values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexValue: byte = 0x0A;
      let octalValue: byte = -0o12;
      expect(Math.abs(hexValue)).assertEqual(Int.toByte(10));
      expect(Math.abs(octalValue)).assertEqual(Int.toByte(10));
    });

    /**
     * @tc.name testMathAbs036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3600
     * @tc.desc Verify abs method with short hexadecimal and octal literals preserves expected values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexValue: short = 0x7FF;
      let octalValue: short = -0o1777;
      expect(Math.abs(hexValue)).assertEqual(Int.toShort(2047));
      expect(Math.abs(octalValue)).assertEqual(Int.toShort(1023));
    });

    /**
     * @tc.name testMathAbs037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3700
     * @tc.desc Verify abs method with int hexadecimal literal returns the expected absolute value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexValue: int = 0x1234;
      expect(Math.abs(hexValue)).assertEqual(Int.toInt(4660));
    });

    /**
     * @tc.name testMathAbs038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3800
     * @tc.desc Verify abs method with int binary literal returns the expected absolute value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binaryValue: int = 0b1010;
      expect(Math.abs(binaryValue)).assertEqual(Int.toInt(10));
    });

    /**
     * @tc.name testMathAbs039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3900
     * @tc.desc Verify abs method with negative int octal literal returns the expected absolute value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let octalValue: int = -0o123;
      expect(Math.abs(octalValue)).assertEqual(Int.toInt(83));
    });

    /**
     * @tc.name testMathAbs040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4000
     * @tc.desc Verify abs method with long hexadecimal literal returns the expected absolute value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexValue: long = Long.toLong(0x1234);
      expect(Math.abs(hexValue)).assertEqual(Long.toLong(4660));
    });

    /**
     * @tc.name testMathAbs041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4100
     * @tc.desc Verify abs method remains stable across repeated invocation for the same int input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: int = -50;
      let first: int = Math.abs(value);
      let second: int = Math.abs(value);
      expect(first).assertEqual(Int.toInt(50));
      expect(second).assertEqual(Int.toInt(50));
      expect(first).assertEqual(second);
    });

    /**
     * @tc.name testMathAbs042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4200
     * @tc.desc Verify abs method supports nested invocation for an int input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Math.abs(Math.abs(-15));
      expect(result).assertEqual(Int.toInt(15));
    });

    /**
     * @tc.name testMathAbs043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4300
     * @tc.desc Verify abs method remains stable across repeated invocation for the same double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = -3.14159;
      let first: double = Math.abs(value);
      let second: double = Math.abs(value);
      expect(first).assertEqual(3.14159);
      expect(second).assertEqual(3.14159);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.name testMathAbs044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4400
     * @tc.desc Verify abs method applied to each element in int array returns normalized element values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputArr: int[] = [-5, 10, -15, 0, -20];
      let absArr: int[] = [0, 0, 0, 0, 0];
      for (let idx: int = 0; idx < inputArr.length; idx++) {
        absArr[idx] = Math.abs(inputArr[idx]);
      }
      expect(absArr[0]).assertEqual(Int.toInt(5));
      expect(absArr[1]).assertEqual(Int.toInt(10));
      expect(absArr[2]).assertEqual(Int.toInt(15));
      expect(absArr[3]).assertEqual(Int.toInt(0));
      expect(absArr[4]).assertEqual(Int.toInt(20));
    });

    /**
     * @tc.name testMathAbs045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4500
     * @tc.desc Verify abs method with int and double subtraction scenarios returns positive difference magnitudes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intDiffPositive: int = Math.abs(100 - 30);
      let intDiffNegative: int = Math.abs(20 - 80);
      let doubleDiff: double = Math.abs(0.5 - 1.5);
      expect(intDiffPositive).assertEqual(Int.toInt(70));
      expect(intDiffNegative).assertEqual(Int.toInt(60));
      expect(doubleDiff).assertEqual(1.0);
    });

    /**
     * @tc.name testMathAbs046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4600
     * @tc.desc Verify abs method captures floating-point error magnitude and keeps it within tolerance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let expectedVal: double = 0.3;
      let actualVal: double = 1.0 - 0.7;
      let epsilon: double = 1e-10;
      let errorMag: double = Math.abs(expectedVal - actualVal);
      expect(errorMag > 0.0).assertTrue();
      expect(errorMag < epsilon).assertTrue();
    });

    /**
     * @tc.name testMathAbs047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4700
     * @tc.desc Verify abs method output can be reused in a threshold comparison for a byte input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: byte = -5;
      let result: byte = Math.abs(value);
      expect(result).assertEqual(Int.toByte(5));
      expect(result > 3).assertTrue();
    });

    /**
     * @tc.name testMathAbs048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4800
     * @tc.desc Verify abs method output can be reused for minimum absolute value selection between int inputs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let absA: int = Math.abs(-10);
      let absB: int = Math.abs(5);
      let minAbs: int = absA < absB ? absA : absB;
      expect(absA).assertEqual(Int.toInt(10));
      expect(absB).assertEqual(Int.toInt(5));
      expect(minAbs).assertEqual(Int.toInt(5));
    });

    /**
     * @tc.name testMathAbs049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4900
     * @tc.desc Verify abs method supports long aggregation scenarios with normalized operand magnitudes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
    */
    it('testMathAbs049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeOperand: long = Int.toLong(-12345);
      let positiveOperand: long = Int.toLong(6789);
      let total: long = Math.abs(negativeOperand) + Math.abs(positiveOperand);
      expect(total).assertEqual(Int.toLong(19134));
    });

    /**
     * @tc.name testMathAbs050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5000
     * @tc.desc Verify abs method supports short array element access scenarios
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: short[] = [Int.toShort(-42)];
      let result: short = Math.abs(values[0]);
      expect(result).assertEqual(Int.toShort(42));
    });

    /**
     * @tc.name testMathAbs051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5100
     * @tc.desc Verify abs method supports int summation scenarios with normalized addends
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = Math.abs(-3) + Math.abs(-7);
      expect(sum).assertEqual(Int.toInt(10));
    });

    /**
     * @tc.name testMathAbs052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5200
     * @tc.desc Verify abs method with number alias input preserves double semantics for positive result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -12.75;
      let result: number = Math.abs(value);
      expect(result).assertEqual(12.75);
    });

    /**
     * @tc.name testMathAbs053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5300
     * @tc.desc Verify abs method with negative float and double minimum subnormal inputs returns positive minimum values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeFloatMin: float = -Float.MIN_VALUE;
      let negativeDoubleMin: double = -Double.MIN_VALUE;
      let floatResult: float = Math.abs(negativeFloatMin);
      let doubleResult: double = Math.abs(negativeDoubleMin);
      expect(floatResult).assertEqual(Float.MIN_VALUE);
      expect(doubleResult).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.name testMathAbs054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5400
     * @tc.desc Verify abs method with explicitly converted long input beyond int range preserves long positive magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: long = Long.toLong(-0x100000000);
      let result: long = Math.abs(value);
      expect(result).assertEqual(Long.toLong(4294967296));
    });

    /**
     * @tc.name testMathAbs055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5500
     * @tc.desc Verify abs method argument runtime cast from undefined to int throws ClassCastError before evaluation completes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: int = Math.abs(undefined as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testMathAbs056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5600
     * @tc.desc Verify abs method argument runtime cast from null to int throws ClassCastError before evaluation completes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: int = Math.abs(null as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testMathAbs057
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5700
     * @tc.desc Verify abs method argument runtime cast from boolean to int throws ClassCastError before evaluation completes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: int = Math.abs(true as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testMathAbs058
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5800
     * @tc.desc Verify abs method accepts tuple element values typed as number and preserves expected magnitudes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let triple: [number, number, number] = [-8.5, 0.0, 13.25];
      let left: number = Math.abs(triple[0]);
      let middle: number = Math.abs(triple[1]);
      let right: number = Math.abs(triple[2]);
      expect(left).assertEqual(8.5);
      expect(middle).assertEqual(0.0);
      expect(right).assertEqual(13.25);
    });

    /**
     * @tc.name testMathAbs059
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5900
     * @tc.desc Verify abs method accepts readonly array element values typed as number without mutating source data
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: readonly number[] = [-4.5, 2.0, -0.25];
      let first: number = Math.abs(values[0]);
      let second: number = Math.abs(values[1]);
      let third: number = Math.abs(values[2]);
      expect(first).assertEqual(4.5);
      expect(second).assertEqual(2.0);
      expect(third).assertEqual(0.25);
      expect(values[0]).assertEqual(-4.5);
    });

    /**
     * @tc.name testMathAbs060
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6000
     * @tc.desc Verify abs method accepts helper function return value typed as number and preserves expected magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
    */
    it('testMathAbs060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let deltaA: number = buildAbsDelta(5.5, 11.75);
      let deltaB: number = buildAbsDelta(-2.0, -7.0);
      let firstDeltaMagnitude: number = Math.abs(deltaA);
      let secondDeltaMagnitude: number = Math.abs(deltaB);
      expect(firstDeltaMagnitude).assertEqual(6.25);
      expect(secondDeltaMagnitude).assertEqual(5.0);
    });

    /**
     * @tc.name testMathAbs061
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6100
     * @tc.desc Verify abs method accepts number values returned by standard library functions and preserves expected magnitudes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: number = Math.min(4.5, -7.25, -3.0);
      let maxNegativeValue: number = Math.max(-8.5, -2.75, -6.0);
      let minResult: number = Math.abs(minValue);
      let maxNegativeResult: number = Math.abs(maxNegativeValue);
      expect(minResult).assertEqual(7.25);
      expect(maxNegativeResult).assertEqual(2.75);
    });

    /**
     * @tc.name testMathAbs062
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6200
     * @tc.desc Verify abs method with positive long business magnitude preserves the original value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveBusinessValue: long = Long.toLong(10000000000);
      expect(Math.abs(positiveBusinessValue)).assertEqual(Long.toLong(10000000000));
    });

    /**
     * @tc.name testMathAbs063
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6300
     * @tc.desc Verify abs method with negative long business magnitude returns the normalized positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeBusinessValue: long = Long.toLong(-10000000000);
      expect(Math.abs(negativeBusinessValue)).assertEqual(Long.toLong(10000000000));
    });

    /**
     * @tc.name testMathAbs064
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6400
     * @tc.desc Verify abs method with positive float scientific notation preserves the original magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let scientificPositive: float = Double.toFloat(1.0e3);
      expect(Math.abs(scientificPositive)).assertEqual(Double.toFloat(1.0e3));
    });

    /**
     * @tc.name testMathAbs065
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6500
     * @tc.desc Verify abs method with negative float scientific notation returns the normalized positive magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let scientificNegative: float = Double.toFloat(-1.0e3);
      expect(Math.abs(scientificNegative)).assertEqual(Double.toFloat(1.0e3));
    });

    /**
     * @tc.name testMathAbs066
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6600
     * @tc.desc Verify abs method with Float.MIN_VALUE input preserves the smallest positive float boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let subnormalMin: float = Float.MIN_VALUE;
      expect(Math.abs(subnormalMin)).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.name testMathAbs067
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6700
     * @tc.desc Verify abs method with tiny negative float input returns the corresponding positive magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tinyNegative: float = Double.toFloat(-1.0e-10);
      expect(Math.abs(tinyNegative)).assertEqual(Double.toFloat(1.0e-10));
    });

    /**
     * @tc.name testMathAbs068
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6800
     * @tc.desc Verify abs method with positive double scientific notation preserves the original magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let scientificPositive: double = 1.0e6;
      expect(Math.abs(scientificPositive)).assertEqual(1.0e6);
    });

    /**
     * @tc.name testMathAbs069
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6900
     * @tc.desc Verify abs method with tiny negative double input returns the corresponding positive magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tinyNegative: double = -1.0e-300;
      expect(Math.abs(tinyNegative)).assertEqual(1.0e-300);
    });

    /**
     * @tc.name testMathAbs070
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7000
     * @tc.desc Verify abs method with large negative double input returns the normalized positive magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeNegative: double = -1.0e200;
      expect(Math.abs(largeNegative)).assertEqual(1.0e200);
    });

    /**
     * @tc.name testMathAbs071
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7100
     * @tc.desc Verify abs method with negative Math.PI constant returns the positive constant value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let piNegative: double = -Math.PI;
      expect(Math.abs(piNegative)).assertEqual(Math.PI);
    });

    /**
     * @tc.name testMathAbs072
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7200
     * @tc.desc Verify abs method with negative float maximum input returns the positive maximum finite boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = -Float.MAX_VALUE;
      let result: float = Math.abs(value);
      expect(result).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.name testMathAbs073
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7300
     * @tc.desc Verify abs method with negative double maximum input returns the positive maximum finite boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = -Double.MAX_VALUE;
      let result: double = Math.abs(value);
      expect(result).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.name testMathAbs074
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7400
     * @tc.desc Verify abs method with byte MAX_VALUE plus one overflow returns the byte minimum boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowedValue: byte = Int.toByte(127 + 1);
      let result: byte = Math.abs(overflowedValue);
      expect(overflowedValue).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testMathAbs075
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7500
     * @tc.desc Verify abs method with byte MIN_VALUE minus one overflow returns the byte maximum boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowedValue: byte = Int.toByte(-128 - 1);
      let result: byte = Math.abs(overflowedValue);
      expect(overflowedValue).assertEqual(Int.toByte(127));
      expect(result).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testMathAbs076
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7600
     * @tc.desc Verify abs method with short MAX_VALUE plus one overflow returns the short minimum boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowedValue: short = Int.toShort(32767 + 1);
      let result: short = Math.abs(overflowedValue);
      expect(overflowedValue).assertEqual(Int.toShort(-32768));
      expect(result).assertEqual(Int.toShort(-32768));
    });

    /**
     * @tc.name testMathAbs077
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7700
     * @tc.desc Verify abs method with short MIN_VALUE minus one overflow returns the short maximum boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowedValue: short = Int.toShort(-32768 - 1);
      let result: short = Math.abs(overflowedValue);
      expect(overflowedValue).assertEqual(Int.toShort(32767));
      expect(result).assertEqual(Int.toShort(32767));
    });

    /**
     * @tc.name testMathAbs078
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7800
     * @tc.desc Verify abs method with int MAX_VALUE plus one overflow returns the int minimum boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: int = Int.MAX_VALUE;
      let overflowedValue: int = maxValue + 1;
      let result: int = Math.abs(overflowedValue);
      expect(overflowedValue).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.name testMathAbs079
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7900
     * @tc.desc Verify abs method with int MIN_VALUE minus one overflow returns the int maximum boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: int = Int.MIN_VALUE;
      let overflowedValue: int = minValue - 1;
      let result: int = Math.abs(overflowedValue);
      expect(overflowedValue).assertEqual(Int.MAX_VALUE);
      expect(result).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.name testMathAbs080
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_8000
     * @tc.desc Verify abs method with long MAX_VALUE plus one overflow returns the long minimum boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: long = Long.toLong(9223372036854775807);
      let overflowedValue: long = maxValue + Int.toLong(1);
      let result: long = Math.abs(overflowedValue);
      expect(overflowedValue).assertEqual(Long.toLong(-9223372036854775808));
      expect(result).assertEqual(Long.toLong(-9223372036854775808));
    });

    /**
     * @tc.name testMathAbs081
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_8100
     * @tc.desc Verify abs method with long MIN_VALUE minus one overflow returns the long maximum boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: long = Long.toLong(-9223372036854775808);
      let overflowedValue: long = minValue - Int.toLong(1);
      let result: long = Math.abs(overflowedValue);
      expect(overflowedValue).assertEqual(Long.toLong(9223372036854775807));
      expect(result).assertEqual(Long.toLong(9223372036854775807));
    });

    /**
     * @tc.name testMathAbs082
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_8200
     * @tc.desc Verify abs method with Float.MAX_VALUE multiplied by ten returns positive infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowedValue: float = Double.toFloat(Float.MAX_VALUE * 10.0);
      let result: float = Math.abs(overflowedValue);
      expect(overflowedValue).assertEqual(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathAbs083
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_8300
     * @tc.desc Verify abs method with Float.MIN_VALUE divided by ten underflows to positive zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let underflowedValue: float = Double.toFloat(Float.MIN_VALUE / 10.0);
      let result: float = Math.abs(underflowedValue);
      expect(underflowedValue).assertEqual(Double.toFloat(0.0));
      expect(Utils.isPositiveZero(underflowedValue)).assertTrue();
      expect(result).assertEqual(Double.toFloat(0.0));
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAbs084
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_8400
     * @tc.desc Verify abs method with Double.MAX_VALUE multiplied by ten returns positive infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowedValue: double = Double.MAX_VALUE * 10.0;
      let result: double = Math.abs(overflowedValue);
      expect(overflowedValue).assertEqual(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathAbs085
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_8500
     * @tc.desc Verify abs method with Double.MIN_VALUE divided by ten underflows to positive zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathAbs085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let underflowedValue: double = Double.MIN_VALUE / 10.0;
      let result: double = Math.abs(underflowedValue);
      expect(underflowedValue).assertEqual(0.0);
      expect(Utils.isPositiveZero(underflowedValue)).assertTrue();
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
  });
}
