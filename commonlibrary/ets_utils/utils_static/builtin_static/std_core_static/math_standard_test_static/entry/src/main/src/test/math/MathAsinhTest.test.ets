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
} from '../../../../hypium/index';
import Utils from '../Util.test';

function buildAsinhInputFromHelper(): number {
  return 0.75;
}

function buildAsinhGeneratedInput(): number {
  return 1.6019190803008256;
}

function assertDoubleApprox(actual: double, expected: double, tolerance: double = 1.0e-12): void {
  let diff: double = Utils.getAbsDiff(actual, expected);
  expect(diff < tolerance).assertTrue();
}

function assertFloatApprox(actual: float, expected: float, tolerance: double = 1.0e-5): void {
  let diff: double = Utils.getAbsDiff(actual, expected);
  expect(diff < tolerance).assertTrue();
}

export default function mathAsinhTest(): void {
  describe('MathAsinhTest', (): void => {
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
     * @tc.name testMathAsinh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0100
     * @tc.desc Verify asinh method with exact zero double input 0.0 for precise positive zero return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.asinh(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAsinh002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0200
     * @tc.desc Verify asinh method with float zero input via Double.toFloat(0.0) for precise positive float zero return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: float = Math.asinh(inputValue);
      let expected: float = Double.toFloat(0.0);
      expect(result).assertEqual(expected);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAsinh003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0300
     * @tc.desc Verify asinh method with double negative zero input -0.0 for precise negative zero return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.asinh(inputValue);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAsinh004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0400
     * @tc.desc Verify asinh method with float negative zero input for precise negative float zero return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.0);
      let result: float = Math.asinh(inputValue);
      let expected: float = Double.toFloat(-0.0);
      expect(result).assertEqual(expected);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathAsinh005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0500
     * @tc.desc Verify asinh method with variable-sourced positive double input 0.5 for precise IEEE754 return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let result: double = Math.asinh(inputValue);
      assertDoubleApprox(result, 0.48121182505960347);
    });

    /**
     * @tc.name testMathAsinh006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0600
     * @tc.desc Verify asinh method with variable-sourced positive double input 1.0 for precise IEEE754 return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0;
      let result: double = Math.asinh(inputValue);
      assertDoubleApprox(result, 0.881373587019543);
    });

    /**
     * @tc.name testMathAsinh007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0700
     * @tc.desc Verify asinh method with variable-sourced positive double input 10.0 for precise IEEE754 return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10.0;
      let result: double = Math.asinh(inputValue);
      assertDoubleApprox(result, 2.99822295029797);
    });

    /**
     * @tc.name testMathAsinh008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0800
     * @tc.desc Verify asinh method with representative negative double inputs for precise IEEE754 returns
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      assertDoubleApprox(Math.asinh(-0.5), -0.48121182505960347);
      assertDoubleApprox(Math.asinh(-1.0), -0.881373587019543);
      assertDoubleApprox(Math.asinh(-10.0), -2.99822295029797);
    });

    /**
     * @tc.name testMathAsinh009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0900
     * @tc.desc Verify asinh method with representative float inputs for approximate float-tolerance returns
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      assertFloatApprox(Math.asinh(Double.toFloat(0.5)), Double.toFloat(0.48121182505960347));
      assertFloatApprox(Math.asinh(Double.toFloat(2.0)), Double.toFloat(1.4436354751788103));
      assertFloatApprox(Math.asinh(Double.toFloat(-5.0)), Double.toFloat(-2.3124383412727525));
    });

    /**
     * @tc.name testMathAsinh010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1000
     * @tc.desc Verify asinh method is odd for representative double inputs across small and large magnitudes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smallPositive: double = 0.75;
      let largePositive: double = 15.0;
      expect(Math.asinh(-smallPositive)).assertEqual(-Math.asinh(smallPositive));
      expect(Math.asinh(-largePositive)).assertEqual(-Math.asinh(largePositive));
    });

    /**
     * @tc.name testMathAsinh011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1100
     * @tc.desc Verify asinh method remains near-linear for tiny double inputs around zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      assertDoubleApprox(Math.asinh(1e-10), 1e-10, 1.0e-20);
      assertDoubleApprox(Math.asinh(-1e-10), -1e-10, 1.0e-20);
      assertDoubleApprox(Math.asinh(1e-20), 1e-20, 1.0e-30);
      assertDoubleApprox(Math.asinh(-1e-20), -1e-20, 1.0e-30);
    });

    /**
     * @tc.name testMathAsinh012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1200
     * @tc.desc Verify asinh method preserves smallest positive float and double boundary inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minDoubleResult: double = Math.asinh(Double.MIN_VALUE);
      let minFloatInput: float = Float.MIN_VALUE;
      let minFloatResult: float = Math.asinh(minFloatInput);
      expect(minDoubleResult).assertEqual(Double.MIN_VALUE);
      expect(minDoubleResult > 0.0).assertTrue();
      expect(minFloatResult).assertEqual(minFloatInput);
      expect(minFloatResult > 0.0f).assertTrue();
    });

    /**
     * @tc.name testMathAsinh013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1300
     * @tc.desc Verify asinh method returns finite logarithmic-growth results for largest float and double inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxFloatResult: float = Math.asinh(Float.MAX_VALUE);
      let maxDoubleResult: double = Math.asinh(Double.MAX_VALUE);
      expect(Utils.isFiniteFloat(maxFloatResult)).assertTrue();
      expect(Utils.isFiniteValue(maxDoubleResult)).assertTrue();
      assertFloatApprox(maxFloatResult, Double.toFloat(89.4159862326283));
      assertDoubleApprox(maxDoubleResult, 710.4758600739439);
    });

    /**
     * @tc.name testMathAsinh014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1400
     * @tc.desc Verify asinh method propagates Double.NaN and preserves signed Double.POSITIVE_INFINITY for double inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Utils.isNaNValue(Math.asinh(Double.NaN))).assertTrue();
      expect(Math.asinh(Double.POSITIVE_INFINITY)).assertEqual(Double.POSITIVE_INFINITY);
      expect(Math.asinh(Double.NEGATIVE_INFINITY)).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathAsinh015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1500
     * @tc.desc Verify asinh method propagates Float.NaN and preserves signed Double.POSITIVE_INFINITY for float inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Utils.isNaNFloat(Math.asinh(Float.NaN))).assertTrue();
      expect(Math.asinh(Float.POSITIVE_INFINITY)).assertEqual(Float.POSITIVE_INFINITY);
      expect(Math.asinh(Float.NEGATIVE_INFINITY)).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathAsinh016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1600
     * @tc.desc Verify asinh method accepts widened byte and short inputs and matches equivalent double results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInput: byte = Int.toByte(12);
      let shortInput: short = Int.toShort(1024);
      expect(Math.asinh(byteInput)).assertEqual(Math.asinh(12.0));
      expect(Math.asinh(shortInput)).assertEqual(Math.asinh(1024.0));
    });

    /**
     * @tc.name testMathAsinh017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1700
     * @tc.desc Verify asinh method accepts widened int and long inputs and matches equivalent double results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intInput: int = 2048;
      let longInput: long = Long.toLong(10000000000);
      expect(Math.asinh(intInput)).assertEqual(Math.asinh(2048.0));
      expect(Math.asinh(longInput)).assertEqual(Math.asinh(10000000000.0));
    });

    /**
     * @tc.name testMathAsinh018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1800
     * @tc.desc Verify asinh method accepts number typed variables and helper-returned number inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let literalNumberInput: number = 0.75;
      let helperNumberInput: number = buildAsinhInputFromHelper();
      assertDoubleApprox(Math.asinh(literalNumberInput), 0.6931471805599453);
      assertDoubleApprox(Math.asinh(helperNumberInput), 0.6931471805599453);
    });

    /**
     * @tc.name testMathAsinh019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1900
     * @tc.desc Verify asinh method recovers the expected inverse-image value from helper generated number input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let generatedInput: number = buildAsinhGeneratedInput();
      let recovered: number = Math.asinh(generatedInput);
      assertDoubleApprox(recovered, 1.25);
    });

    /**
     * @tc.name testMathAsinh020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2000
     * @tc.desc Verify asinh method is monotonic for increasing positive constants Math.SQRT2, Math.E and Math.PI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sqrt2Result: double = Math.asinh(Math.SQRT2);
      let eResult: double = Math.asinh(Math.E);
      let piResult: double = Math.asinh(Math.PI);
      expect(sqrt2Result < eResult).assertTrue();
      expect(eResult < piResult).assertTrue();
      assertDoubleApprox(sqrt2Result, 1.1462158347805889);
      assertDoubleApprox(eResult, 1.725382558852315);
      assertDoubleApprox(piResult, 1.8622957433108482);
    });

    /**
     * @tc.name testMathAsinh021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2100
     * @tc.desc Verify asinh method composes with sinh to recover representative finite double inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nearZeroInput: double = 0.25;
      let moderateInput: double = 3.0;
      let largeInput: double = 20.0;
      assertDoubleApprox(Math.sinh(Math.asinh(nearZeroInput)), nearZeroInput);
      assertDoubleApprox(Math.sinh(Math.asinh(moderateInput)), moderateInput);
      assertDoubleApprox(Math.sinh(Math.asinh(largeInput)), largeInput, 1.0e-10);
    });

    /**
     * @tc.name testMathAsinh022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2200
     * @tc.desc Verify asinh method keeps very large finite double inputs finite with correct sign and magnitude
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largePositiveResult: double = Math.asinh(1e100);
      let largeNegativeResult: double = Math.asinh(-1e100);
      expect(Utils.isFiniteValue(largePositiveResult)).assertTrue();
      expect(Utils.isFiniteValue(largeNegativeResult)).assertTrue();
      expect(largePositiveResult > 0.0).assertTrue();
      expect(largeNegativeResult < 0.0).assertTrue();
      assertDoubleApprox(largePositiveResult, 230.95165647996453);
      assertDoubleApprox(largeNegativeResult, -230.95165647996453);
    });

    /**
     * @tc.name testMathAsinh023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2300
     * @tc.desc Verify asinh method argument runtime cast from undefined to double throws ClassCastError before evaluation completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: double = Math.asinh(undefined as double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testMathAsinh024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2400
     * @tc.desc Verify asinh method argument runtime cast from null to double throws ClassCastError before evaluation completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: double = Math.asinh(null as double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testMathAsinh025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2500
     * @tc.desc Verify asinh method argument runtime cast from boolean to double throws ClassCastError before evaluation completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: double = Math.asinh(true as double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testMathAsinh026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2600
     * @tc.desc Verify asinh method with widened byte minimum boundary returns the expected finite negative value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.asinh(inputValue);
      assertDoubleApprox(result, -5.545192702919391, 1.0e-6);
    });

    /**
     * @tc.name testMathAsinh027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2700
     * @tc.desc Verify asinh method with widened short maximum boundary returns the expected finite positive value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.asinh(inputValue);
      assertDoubleApprox(result, 11.090324371148174, 1.0e-6);
    });

    /**
     * @tc.name testMathAsinh028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2800
     * @tc.desc Verify asinh method with widened int maximum boundary returns the expected finite logarithmic value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      let result: double = Math.asinh(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      assertDoubleApprox(result, 22.180709777452588, 1.0e-6);
    });

    /**
     * @tc.name testMathAsinh029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2900
     * @tc.desc Verify asinh method with widened Long.MIN_VALUE boundary returns the expected finite negative logarithmic value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.asinh(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result < 0.0).assertTrue();
      assertDoubleApprox(result, -44.3614195558365, 1.0e-6);
    });

    /**
     * @tc.name testMathAsinh030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_3000
     * @tc.desc Verify asinh method with representative finite float value 99.99f returns the expected finite positive value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = 99.99f;
      let result: float = Math.asinh(inputValue);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      assertFloatApprox(result, Double.toFloat(5.29824236561063));
    });

    /**
     * @tc.name testMathAsinh031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_3100
     * @tc.desc Verify asinh method with representative finite double value 999999.99 returns the expected finite positive value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 999999.99;
      let result: double = Math.asinh(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      assertDoubleApprox(result, 14.508657728524469);
    });
  });
}
