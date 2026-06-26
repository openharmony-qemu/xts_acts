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

export default function mathAcoshTest(): void {
  describe('MathAcoshTest', (): void => {
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
     * @tc.name testMathAcosh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0100
     * @tc.desc Verify acosh method with exact domain lower bound 1.0 for positive zero return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0;
      let result: double = Math.acosh(x);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0200
     * @tc.desc Verify acosh method with exact float domain lower bound 1.0f for positive zero return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 1.0f;
      let result: float = Math.acosh(x);
      expect(result).assertEqual(0.0f);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0300
     * @tc.desc Verify acosh method with double input just above 1.0 for tiny finite positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0000000001;
      let result: double = Math.acosh(x);
      let expected: double = 1.4142136208675862e-05;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(result > 0.0).assertTrue();
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathAcosh004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0400
     * @tc.desc Verify acosh method with float input just above 1.0f for finite positive result within float tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 1.0001f;
      let result: float = Math.acosh(x);
      let expected: float = Double.toFloat(0.014142017775251545);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(result > 0.0f).assertTrue();
      expect(diff < 1.0e-5).assertTrue();
    });

    /**
     * @tc.name testMathAcosh005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0500
     * @tc.desc Verify acosh method with representative double input 2.0 for expected hyperbolic inverse result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 2.0;
      let result: double = Math.acosh(x);
      let expected: double = 1.3169578969248166;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathAcosh006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0600
     * @tc.desc Verify acosh method with representative float input 2.0f for expected inverse result within float tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 2.0f;
      let result: float = Math.acosh(x);
      let expected: float = Double.toFloat(1.3169578969248166);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(diff < 1.0e-6).assertTrue();
    });

    /**
     * @tc.name testMathAcosh007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0700
     * @tc.desc Verify acosh method with variable-passed double input 3.0 for normal call path correctness
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.0;
      let result: double = Math.acosh(input);
      let expected: double = 1.7627471740390859;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathAcosh008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0800
     * @tc.desc Verify acosh method with variable-passed float input 3.0f for normal float call path correctness
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = 3.0f;
      let result: float = Math.acosh(input);
      let expected: float = Double.toFloat(1.7627471740390861);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(diff < 1.0e-5).assertTrue();
    });

    /**
     * @tc.name testMathAcosh009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0900
     * @tc.desc Verify acosh method with mathematical constant Math.E for non-integer representative input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.E;
      let result: double = Math.acosh(x);
      let expected: double = 1.6574544541530771;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathAcosh010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1000
     * @tc.desc Verify acosh method with mathematical constant Math.SQRT2 for irrational input handling
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.SQRT2;
      let result: double = Math.acosh(x);
      let expected: double = 0.8813735870195432;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathAcosh011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1100
     * @tc.desc Verify acosh method with increasing double inputs for monotonic growth on domain [1, +infinity), including Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lower: double = Math.acosh(1.5);
      let middle: double = Math.acosh(2.0);
      let upper: double = Math.acosh(10.0);
      expect(lower < middle).assertTrue();
      expect(middle < upper).assertTrue();
    });

    /**
     * @tc.name testMathAcosh012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1200
     * @tc.desc Verify acosh method composed with cosh on double input 10.0 for inverse relationship stability
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 10.0;
      let result: double = Math.acosh(x);
      let recovered: double = Math.cosh(result);
      let diff: double = Utils.getAbsDiff(recovered, x);
      expect(diff < 1.0e-10).assertTrue();
    });

    /**
     * @tc.name testMathAcosh013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1300
     * @tc.desc Verify acosh method composed with cosh on float input 10.0f for inverse relationship within float tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 10.0f;
      let result: float = Math.acosh(x);
      let recovered: float = Math.cosh(result);
      let diff: double = Utils.getAbsDiff(recovered, x);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(diff < 1.0e-5).assertTrue();
    });

    /**
     * @tc.name testMathAcosh014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1400
     * @tc.desc Verify acosh method with very large double input 1e15 for finite logarithmic-scale growth
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1e15;
      let result: double = Math.acosh(x);
      let expected: double = 35.23192357547063;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathAcosh015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1500
     * @tc.desc Verify acosh method with huge double input 1e200 for finite result and no overflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1e200;
      let result: double = Math.acosh(x);
      let expected: double = 461.2101657793691;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathAcosh016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1600
     * @tc.desc Verify acosh method with Double.MAX_VALUE input for largest finite double boundary result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.MAX_VALUE;
      let result: double = Math.acosh(x);
      let expected: double = 710.4758600739439;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 700.0).assertTrue();
      expect(diff < 1.0e-10).assertTrue();
    });

    /**
     * @tc.name testMathAcosh017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1700
     * @tc.desc Verify acosh method with Float.MAX_VALUE input for largest finite float boundary result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = Float.MAX_VALUE;
      let result: float = Math.acosh(x);
      let expected: float = Double.toFloat(89.41598510742188);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(result > 80.0f).assertTrue();
      expect(diff < 1.0e-5).assertTrue();
    });

    /**
     * @tc.name testMathAcosh018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1800
     * @tc.desc Verify acosh method with Double.MIN_VALUE input for Double.NaN result below domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.MIN_VALUE;
      let result: double = Math.acosh(x);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1900
     * @tc.desc Verify acosh method with Float.MIN_VALUE input for Float.NaN result below float domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = Float.MIN_VALUE;
      let result: float = Math.acosh(x);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2000
     * @tc.desc Verify acosh method with positive zero double input returns Double.NaN below the domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveZeroResult: double = Math.acosh(0.0);
      expect(Utils.isNaNValue(positiveZeroResult)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2100
     * @tc.desc Verify acosh method with negative zero double input returns Double.NaN below the domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeZeroResult: double = Math.acosh(-0.0);
      expect(Utils.isNaNValue(negativeZeroResult)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2200
     * @tc.desc Verify acosh method with positive zero float input returns Float.NaN below the float domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveZeroResult: float = Math.acosh(0.0f);
      expect(Utils.isNaNFloat(positiveZeroResult)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2300
     * @tc.desc Verify acosh method with negative zero float input returns Float.NaN below the float domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeZeroInput: float = Double.toFloat(-0.0);
      let negativeZeroResult: float = Math.acosh(negativeZeroInput);
      expect(Utils.isNaNFloat(negativeZeroResult)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2400
     * @tc.desc Verify acosh method with double input 0.5 returns Double.NaN below the domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let halfResult: double = Math.acosh(0.5);
      expect(Utils.isNaNValue(halfResult)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2500
     * @tc.desc Verify acosh method with double input 0.999999 returns Double.NaN below the domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nearBoundaryResult: double = Math.acosh(0.999999);
      expect(Utils.isNaNValue(nearBoundaryResult)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2600
     * @tc.desc Verify acosh method with float input 0.5 returns Float.NaN below the float domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let halfResult: float = Math.acosh(0.5f);
      expect(Utils.isNaNFloat(halfResult)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2700
     * @tc.desc Verify acosh method with float input 0.99999 returns Float.NaN below the float domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nearBoundaryResult: float = Math.acosh(0.99999f);
      expect(Utils.isNaNFloat(nearBoundaryResult)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2800
     * @tc.desc Verify acosh method widened byte input follows the same result path as equivalent double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 12;
      let result: double = Math.acosh(x);
      let reference: double = Math.acosh(12.0);
      expect(result).assertEqual(reference);
    });

    /**
     * @tc.name testMathAcosh029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2900
     * @tc.desc Verify acosh method Int.toByte constructed input follows the same result path as equivalent double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = Int.toByte(0x0C);
      let result: double = Math.acosh(x);
      let reference: double = Math.acosh(12.0);
      expect(result).assertEqual(reference);
    });

    /**
     * @tc.name testMathAcosh030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3000
     * @tc.desc Verify acosh method widened short input follows the same result path as equivalent double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 2048;
      let result: double = Math.acosh(x);
      let reference: double = Math.acosh(2048.0);
      expect(result).assertEqual(reference);
    });

    /**
     * @tc.name testMathAcosh031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3100
     * @tc.desc Verify acosh method widened int input follows the same result path as equivalent double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0x1234;
      let result: double = Math.acosh(x);
      let reference: double = Math.acosh(4660.0);
      expect(result).assertEqual(reference);
    });

    /**
     * @tc.name testMathAcosh032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3200
     * @tc.desc Verify acosh method widened long input follows the same result path as equivalent double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = Long.toLong(10000000000);
      let result: double = Math.acosh(x);
      let reference: double = Math.acosh(10000000000.0);
      expect(result).assertEqual(reference);
    });

    /**
     * @tc.name testMathAcosh033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3300
     * @tc.desc Verify acosh method with double input 1.25 matches natural log of 2 within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.25;
      let result: double = Math.acosh(x);
      let expected: double = Math.LN2;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathAcosh034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3400
     * @tc.desc Verify runtime compatibility for illegal undefined argument construction: cast to double throws ClassCastError before Math.acosh evaluation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.acosh(undefined as double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testMathAcosh035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3500
     * @tc.desc Verify runtime compatibility for illegal null argument construction: cast to double throws ClassCastError before Math.acosh evaluation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.acosh(null as double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testMathAcosh036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3600
     * @tc.desc Verify runtime compatibility for illegal boolean argument construction: cast to double throws ClassCastError before Math.acosh evaluation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.acosh(true as double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testMathAcosh037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3700
     * @tc.desc Verify acosh method accepts number typed variable input and follows double precision path
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 12.5;
      let result: number = Math.acosh(x);
      let expected: double = 3.217271971157258;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathAcosh038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3800
     * @tc.desc Verify acosh method recovers original nonnegative argument from cosh generated input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: double = 4.5;
      let generatedInput: double = Math.cosh(original);
      let recovered: double = Math.acosh(generatedInput);
      let diff: double = Utils.getAbsDiff(recovered, original);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathAcosh039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3900
     * @tc.desc Verify acosh method with negative double input -0.5 returns Double.NaN outside the domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smallNegative: double = Math.acosh(-0.5);
      expect(Utils.isNaNValue(smallNegative)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_4000
     * @tc.desc Verify acosh method with large negative double input returns Double.NaN outside the domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeNegative: double = Math.acosh(-1e200);
      expect(Utils.isNaNValue(largeNegative)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_4100
     * @tc.desc Verify acosh method with negative float input -0.5 returns Float.NaN outside the float domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smallNegative: float = Math.acosh(-0.5f);
      expect(Utils.isNaNFloat(smallNegative)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_4200
     * @tc.desc Verify acosh method with float input -2.0 returns Float.NaN outside the float domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mediumNegative: float = Math.acosh(-2.0f);
      expect(Utils.isNaNFloat(mediumNegative)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_4300
     * @tc.desc Verify acosh method propagates Double.NaN input to Double.NaN output
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanResult: double = Math.acosh(Double.NaN);
      expect(Utils.isNaNValue(nanResult)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_4400
     * @tc.desc Verify acosh method preserves Double.POSITIVE_INFINITY input as Double.POSITIVE_INFINITY output
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInfinityResult: double = Math.acosh(Double.POSITIVE_INFINITY);
      expect(positiveInfinityResult).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathAcosh045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_4500
     * @tc.desc Verify acosh method maps Double.NEGATIVE_INFINITY input to Double.NaN outside the domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeInfinityResult: double = Math.acosh(Double.NEGATIVE_INFINITY);
      expect(Utils.isNaNValue(negativeInfinityResult)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_4600
     * @tc.desc Verify acosh method propagates Float.NaN input to Float.NaN output
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanResult: float = Math.acosh(Float.NaN);
      expect(Utils.isNaNFloat(nanResult)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_4700
     * @tc.desc Verify acosh method preserves Float.POSITIVE_INFINITY input as Float.POSITIVE_INFINITY output
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInfinityResult: float = Math.acosh(Float.POSITIVE_INFINITY);
      expect(positiveInfinityResult).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathAcosh048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_4800
     * @tc.desc Verify acosh method maps Float.NEGATIVE_INFINITY input to Float.NaN outside the float domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeInfinityResult: float = Math.acosh(Float.NEGATIVE_INFINITY);
      expect(Utils.isNaNFloat(negativeInfinityResult)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_4900
     * @tc.desc Verify acosh method widened byte one input returns positive zero at the domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = Int.toByte(1);
      let result: double = Math.acosh(x);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_5000
     * @tc.desc Verify acosh method widened byte negative one input returns Double.NaN below the domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = Int.toByte(-1);
      expect(Utils.isNaNValue(Math.acosh(x))).assertTrue();
    });

    /**
     * @tc.name testMathAcosh051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_5100
     * @tc.desc Verify acosh method widened short one input returns positive zero at the domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = Int.toShort(1);
      let result: double = Math.acosh(x);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_5200
     * @tc.desc Verify acosh method widened short negative one input returns Double.NaN below the domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = Int.toShort(-1);
      expect(Utils.isNaNValue(Math.acosh(x))).assertTrue();
    });

    /**
     * @tc.name testMathAcosh053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_5300
     * @tc.desc Verify acosh method widened int one input returns positive zero at the domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let result: double = Math.acosh(x);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_5400
     * @tc.desc Verify acosh method widened int maximum value returns a finite logarithmic result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = Int.MAX_VALUE;
      let result: double = Math.acosh(x);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 22.0).assertTrue();
      expect(result < 23.0).assertTrue();
    });

    /**
     * @tc.name testMathAcosh055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_5500
     * @tc.desc Verify acosh method widened long one input returns positive zero at the domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = Int.toLong(1);
      let result: double = Math.acosh(x);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAcosh056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_5600
     * @tc.desc Verify acosh method widened Long.MIN_VALUE value returns Double.NaN below the domain lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = Long.MIN_VALUE;
      expect(Utils.isNaNValue(Math.acosh(x))).assertTrue();
    });
  });
}
