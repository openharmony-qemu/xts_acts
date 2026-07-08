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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

function buildCeilInputFromHelper(): number {
  return Math.max(2.25, 1.0);
}


export default function mathCeilTest(): void {
  describe('MathCeilTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0100
     * @tc.name testMathCeil001
     * @tc.desc Verify ceil method with double input 3.7 for expected return 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.7;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0200
     * @tc.name testMathCeil002
     * @tc.desc Verify ceil method with double input 0.618 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.618;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0300
     * @tc.name testMathCeil003
     * @tc.desc Verify ceil method with double input -3.7 for expected return -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -3.7;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0400
     * @tc.name testMathCeil004
     * @tc.desc Verify ceil method with negative fractional double input whose magnitude is less than one preserves negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.618;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0500
     * @tc.name testMathCeil005
     * @tc.desc Verify ceil method with double input 5.0 for expected return 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 5.0;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0600
     * @tc.name testMathCeil006
     * @tc.desc Verify ceil method with double input -5.0 for expected return -5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -5.0;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0700
     * @tc.name testMathCeil007
     * @tc.desc Verify ceil method with double input 0.0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.0;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0800
     * @tc.name testMathCeil008
     * @tc.desc Verify ceil method with double negative zero input preserves negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.0;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0900
     * @tc.name testMathCeil009
     * @tc.desc Verify ceil method with double input 2.0000000001 for expected return 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.0000000001;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1000
     * @tc.name testMathCeil010
     * @tc.desc Verify ceil method with double input 1.9999999999 for expected return 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.9999999999;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1100
     * @tc.name testMathCeil011
     * @tc.desc Verify ceil method with double input -2.0000000001 for expected return -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.0000000001;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1200
     * @tc.name testMathCeil012
     * @tc.desc Verify ceil method with double input -2.9999999999 for expected return -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.9999999999;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1300
     * @tc.name testMathCeil013
     * @tc.desc Verify ceil method with double input 5e-324 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 5e-324;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1400
     * @tc.name testMathCeil014
     * @tc.desc Verify ceil method with smallest negative subnormal double input preserves negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -5e-324;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1500
     * @tc.name testMathCeil015
     * @tc.desc Verify ceil method with double input 2147483647.0 for expected return 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2147483647.0;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1600
     * @tc.name testMathCeil016
     * @tc.desc Verify ceil method with number typed negative fractional input preserves negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = -0.5;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1700
     * @tc.name testMathCeil017
     * @tc.desc Verify ceil method with Double.NaN input returns Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = Double.NaN;
      let result: double = Math.ceil(nanValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1800
     * @tc.name testMathCeil018
     * @tc.desc Verify ceil method with Double.POSITIVE_INFINITY input returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infValue: double = Double.POSITIVE_INFINITY;
      let result: double = Math.ceil(infValue);
      expect(result).assertEqual(infValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1900
     * @tc.name testMathCeil019
     * @tc.desc Verify ceil method with Double.NEGATIVE_INFINITY input returns Double.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfValue: double = Double.NEGATIVE_INFINITY;
      let result: double = Math.ceil(negInfValue);
      expect(result).assertEqual(negInfValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2000
     * @tc.name testMathCeil020
     * @tc.desc Verify ceil method accepts helper function return value typed as number and rounds upward
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildCeilInputFromHelper();
      let result: double = Math.ceil(input);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2100
     * @tc.name testMathCeil021
     * @tc.desc Verify ceil idempotency with repeated same-input calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 3.14159;
      let firstCallResult: double = Math.ceil(x);
      let secondCallResult: double = Math.ceil(x);
      let thirdCallResult: double = Math.ceil(x);
      expect(firstCallResult).assertEqual(4);
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2200
     * @tc.name testMathCeil022
     * @tc.desc Verify ceil return value is not smaller than representative inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveFractionInput: double = 3.14;
      let negativeFractionInput: double = -3.14;
      let largeFractionInput: double = 100.001;
      expect(Math.ceil(positiveFractionInput) >= positiveFractionInput).assertTrue();
      expect(Math.ceil(negativeFractionInput) >= negativeFractionInput).assertTrue();
      expect(Math.ceil(largeFractionInput) >= largeFractionInput).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2300
     * @tc.name testMathCeil023
     * @tc.desc Verify ceil returns integer unchanged for integer inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveIntegerInput: double = 5.0;
      let negativeIntegerInput: double = -5.0;
      let largeIntegerInput: double = 100.0;
      expect(Math.ceil(positiveIntegerInput)).assertEqual(positiveIntegerInput);
      expect(Math.ceil(negativeIntegerInput)).assertEqual(negativeIntegerInput);
      expect(Math.ceil(largeIntegerInput)).assertEqual(largeIntegerInput);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2400
     * @tc.name testMathCeil024
     * @tc.desc Verify ceil method with widened byte zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(0);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2500
     * @tc.name testMathCeil025
     * @tc.desc Verify ceil method with byte underflow conversion input -129 follows wrapped byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(-129);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2600
     * @tc.name testMathCeil026
     * @tc.desc Verify ceil method with byte hexadecimal source 0x0A preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(0x0A);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2700
     * @tc.name testMathCeil027
     * @tc.desc Verify ceil method with byte octal source 0o12 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(0o12);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2800
     * @tc.name testMathCeil028
     * @tc.desc Verify ceil method with widened short zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(0);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2900
     * @tc.name testMathCeil029
     * @tc.desc Verify ceil method with widened short negative marker input preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-1);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3000
     * @tc.name testMathCeil030
     * @tc.desc Verify ceil method with short underflow conversion input -32769 follows wrapped short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-32769);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3100
     * @tc.name testMathCeil031
     * @tc.desc Verify ceil method with short 65535 mapping follows wrapped negative marker value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(65535);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3200
     * @tc.name testMathCeil032
     * @tc.desc Verify ceil method with short hexadecimal source 0x7FF preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(0x7FF);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(2047);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3300
     * @tc.name testMathCeil033
     * @tc.desc Verify ceil method with short octal source 0o7777 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(0o7777);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(4095);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3400
     * @tc.name testMathCeil034
     * @tc.desc Verify ceil method with widened int zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3500
     * @tc.name testMathCeil035
     * @tc.desc Verify ceil method with widened int negative marker input preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = -1;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3600
     * @tc.name testMathCeil036
     * @tc.desc Verify ceil method with widened int maximum boundary preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3700
     * @tc.name testMathCeil037
     * @tc.desc Verify ceil method with widened int just below maximum preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE - 1;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3800
     * @tc.name testMathCeil038
     * @tc.desc Verify ceil method with widened int just above minimum preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MIN_VALUE + 1;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3900
     * @tc.name testMathCeil039
     * @tc.desc Verify ceil method with int underflow from Int.MIN_VALUE minus one follows wrapped maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let input: int = minimumValue - 1;
      let result: double = Math.ceil(input);
      expect(input).assertEqual(Int.MAX_VALUE);
      expect(result).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4000
     * @tc.name testMathCeil040
     * @tc.desc Verify ceil method with octal int input 0o123 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0o123;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(83);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4100
     * @tc.name testMathCeil041
     * @tc.desc Verify ceil method with widened long zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(0);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4200
     * @tc.name testMathCeil042
     * @tc.desc Verify ceil method with widened long negative marker input preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(-1);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4300
     * @tc.name testMathCeil043
     * @tc.desc Verify ceil method with widened long normal input 100 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(100);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4400
     * @tc.name testMathCeil044
     * @tc.desc Verify ceil method with long overflow from Long.MAX_VALUE plus one follows Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let input: long = maximumValue + Long.toLong(1);
      let expectedValue: double = Long.MIN_VALUE;
      let result: double = Math.ceil(input);
      expect(input).assertEqual(Long.MIN_VALUE);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4500
     * @tc.name testMathCeil045
     * @tc.desc Verify ceil method with long underflow from Long.MIN_VALUE minus one follows Long.MAX_VALUE rounded to double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let input: long = minimumValue - Long.toLong(1);
      let expectedValue: double = Long.MAX_VALUE;
      let result: double = Math.ceil(input);
      expect(input).assertEqual(Long.MAX_VALUE);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4600
     * @tc.name testMathCeil046
     * @tc.desc Verify ceil method with long hexadecimal source 0x1234 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(0x1234);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(4660);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4700
     * @tc.name testMathCeil047
     * @tc.desc Verify ceil method with long octal source 0o123 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(0o123);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(83);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4800
     * @tc.name testMathCeil048
     * @tc.desc Verify ceil method with widened long just above minimum boundary preserves the rounded double boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MIN_VALUE + Long.toLong(1);
      let expectedValue: double = Long.MIN_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4900
     * @tc.name testMathCeil049
     * @tc.desc Verify ceil method with Float positive zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.0);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5000
     * @tc.name testMathCeil050
     * @tc.desc Verify ceil method with Float negative zero input preserves negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-0.0);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5100
     * @tc.name testMathCeil051
     * @tc.desc Verify ceil method with Float.POSITIVE_INFINITY input returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.POSITIVE_INFINITY;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5200
     * @tc.name testMathCeil052
     * @tc.desc Verify ceil method with Float.NEGATIVE_INFINITY input returns Double.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5300
     * @tc.name testMathCeil053
     * @tc.desc Verify ceil method with Float scientific notation source 1.0e3 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(1.0e3);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5400
     * @tc.name testMathCeil054
     * @tc.desc Verify ceil method with Double scientific notation source 1.0e6 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0e6;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5500
     * @tc.name testMathCeil055
     * @tc.desc Verify ceil method with Math.E constant input for expected return 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.E;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5600
     * @tc.name testMathCeil056
     * @tc.desc Verify ceil method with Math.PI constant input for expected return 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.PI;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5700
     * @tc.name testMathCeil057
     * @tc.desc Verify ceil method with Math.SQRT2 constant input for expected return 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.SQRT2;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5800
     * @tc.name testMathCeil058
     * @tc.desc Verify ceil method with intermediate double expression result for expected return 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.25 + 1.50;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5900
     * @tc.name testMathCeil059
     * @tc.desc Verify ceil method with widened byte normal input 12 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(12);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6000
     * @tc.name testMathCeil060
     * @tc.desc Verify ceil method with widened byte negative marker input preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(-1);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6100
     * @tc.name testMathCeil061
     * @tc.desc Verify ceil method with widened byte maximum boundary 127 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(127);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6200
     * @tc.name testMathCeil062
     * @tc.desc Verify ceil method with widened byte minimum boundary -128 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(-128);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6300
     * @tc.name testMathCeil063
     * @tc.desc Verify ceil method with widened short normal input 2048 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(2048);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(2048);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6400
     * @tc.name testMathCeil064
     * @tc.desc Verify ceil method with widened short maximum boundary 32767 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(32767);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6500
     * @tc.name testMathCeil065
     * @tc.desc Verify ceil method with widened short minimum boundary -32768 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-32768);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6600
     * @tc.name testMathCeil066
     * @tc.desc Verify ceil method with widened int minimum boundary preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MIN_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6700
     * @tc.name testMathCeil067
     * @tc.desc Verify ceil method with widened long just below maximum boundary preserves the rounded double boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MAX_VALUE - Long.toLong(1);
      let expectedValue: double = Long.MAX_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6800
     * @tc.name testMathCeil068
     * @tc.desc Verify ceil method with widened Long.MIN_VALUE boundary preserves the rounded double boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MIN_VALUE;
      let expectedValue: double = Long.MIN_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6900
     * @tc.name testMathCeil069
     * @tc.desc Verify ceil method with widened Long.MAX_VALUE boundary preserves the rounded double boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MAX_VALUE;
      let expectedValue: double = Long.MAX_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_7000
     * @tc.name testMathCeil070
     * @tc.desc Verify ceil method with float normal input 3.14f returns 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(3.14);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_7100
     * @tc.name testMathCeil071
     * @tc.desc Verify ceil method with negative Float.MAX_VALUE boundary preserves the widened finite boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = -Float.MAX_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_7200
     * @tc.name testMathCeil072
     * @tc.desc Verify ceil method with negative float normal input returns the next greater integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-3.14);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_7300
     * @tc.name testMathCeil073
     * @tc.desc Verify ceil method with Float.MAX_VALUE boundary preserves the widened finite boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.MAX_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_7400
     * @tc.name testMathCeil074
     * @tc.desc Verify ceil method with Float.MIN_VALUE boundary returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.MIN_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_7500
     * @tc.name testMathCeil075
     * @tc.desc Verify ceil method with negative Float.MIN_VALUE preserves negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = -Float.MIN_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_7600
     * @tc.name testMathCeil076
     * @tc.desc Verify ceil method with Double.MAX_VALUE boundary preserves the largest finite boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Double.MAX_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_7700
     * @tc.name testMathCeil077
     * @tc.desc Verify ceil method with negative Double.MAX_VALUE boundary preserves the largest negative finite boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -Double.MAX_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-Double.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_7800
     * @tc.name testMathCeil078
     * @tc.desc Verify ceil method with Double.MIN_VALUE boundary returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Double.MIN_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_7900
     * @tc.name testMathCeil079
     * @tc.desc Verify ceil method with negative Double.MIN_VALUE preserves negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -Double.MIN_VALUE;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_8000
     * @tc.name testMathCeil080
     * @tc.desc Verify ceil method with hexadecimal int input 0x1234 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0x1234;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(4660);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_8100
     * @tc.name testMathCeil081
     * @tc.desc Verify ceil method with binary int input 0b1010 preserves integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0b1010;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_8200
     * @tc.name testMathCeil082
     * @tc.desc Verify ceil method with byte overflow conversion input 128 follows wrapped byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(128);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_8300
     * @tc.name testMathCeil083
     * @tc.desc Verify ceil method with short overflow conversion input 32768 follows wrapped short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(32768);
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_8400
     * @tc.name testMathCeil084
     * @tc.desc Verify ceil method with int overflow from Int.MAX_VALUE plus one follows wrapped minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: int = Int.MAX_VALUE;
      let input: int = maxValue + 1;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_8500
     * @tc.name testMathCeil085
     * @tc.desc Verify ceil method with direct Float.NaN input returns Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NaN;
      let result: double = Math.ceil(input);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
  });
}
