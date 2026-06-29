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

function buildRandomThresholdFromHelper(): number {
  return 0.5;
}

export default function mathRandomTest(): void {
  describe('MathRandomTest', (): void => {
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
     * @tc.name testMathRandom001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0100
     * @tc.desc Verify random method with a single call returns a value within [0,1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = Math.random();
      expect(value >= 0.0).assertTrue();
      expect(value < 1.0).assertTrue();
    });

    /**
     * @tc.name testMathRandom002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0200
     * @tc.desc Verify random method returns a finite value that is not Double.NaN on a single call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = Math.random();
      expect(Utils.isNaNValue(value)).assertFalse();
      expect(Utils.isFiniteValue(value)).assertTrue();
    });

    /**
     * @tc.name testMathRandom003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0300
     * @tc.desc Verify random method values remain within range across a for-loop sample set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterations: int = 256;
      for (let i: int = 0; i < iterations; i++) {
        let value: double = Math.random();
        expect(value >= 0.0).assertTrue();
        expect(value < 1.0).assertTrue();
      }
    });

    /**
     * @tc.name testMathRandom004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0400
     * @tc.desc Verify random method values remain finite and not Double.NaN across repeated calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterations: int = 128;
      for (let i: int = 0; i < iterations; i++) {
        let value: double = Math.random();
        expect(Utils.isNaNValue(value)).assertFalse();
        expect(Utils.isFiniteValue(value)).assertTrue();
      }
    });

    /**
     * @tc.name testMathRandom005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0500
     * @tc.desc Verify random method output as an auxiliary branch source against a helper threshold
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threshold: number = buildRandomThresholdFromHelper();
      let value: double = Math.random();
      let branchMarker: int = value < threshold ? -1 : 1;
      if (value < threshold) {
        expect(branchMarker).assertEqual(-1);
      } else {
        expect(branchMarker).assertEqual(1);
      }
    });

    /**
     * @tc.name testMathRandom006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0600
     * @tc.desc Verify random method output can be assigned through a number typed variable without leaving range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Math.random();
      let copy: number = value;
      expect(copy >= 0.0).assertTrue();
      expect(copy < 1.0).assertTrue();
    });

    /**
     * @tc.name testMathRandom007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0700
     * @tc.desc Verify random method output can participate in arithmetic and stay within derived bounds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = Math.random();
      let doubled: double = value + value;
      let shifted: double = value + Math.E;
      expect(doubled >= 0.0).assertTrue();
      expect(doubled < 2.0).assertTrue();
      expect(shifted >= Math.E).assertTrue();
      expect(shifted < Math.E + 1.0).assertTrue();
    });

    /**
     * @tc.name testMathRandom008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0800
     * @tc.desc Verify random method can fill a fixed-length array with in-range values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: double[] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
      for (let i: int = 0; i < values.length; i++) {
        values[i] = Math.random();
        expect(values[i] >= 0.0).assertTrue();
        expect(values[i] < 1.0).assertTrue();
      }
    });

    /**
     * @tc.name testMathRandom009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0900
     * @tc.desc Verify random method keeps the sum of ten samples finite and below ten
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: double = 0.0;
      for (let i: int = 0; i < 10; i++) {
        let value: double = Math.random();
        sum += value;
      }
      expect(Utils.isFiniteValue(sum)).assertTrue();
      expect(sum >= 0.0).assertTrue();
      expect(sum < 10.0).assertTrue();
    });

    /**
     * @tc.name testMathRandom010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1000
     * @tc.desc Verify random method keeps the product of three samples finite and below one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.random();
      let second: double = Math.random();
      let third: double = Math.random();
      let product: double = first * second * third;
      expect(Utils.isFiniteValue(product)).assertTrue();
      expect(product >= 0.0).assertTrue();
      expect(product < 1.0).assertTrue();
    });

    /**
     * @tc.name testMathRandom011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1100
     * @tc.desc Verify random method sample set keeps its minimum and maximum within the valid range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: double = 1.0;
      let maxValue: double = 0.0;
      let iterations: int = 16;
      for (let i: int = 0; i < iterations; i++) {
        let value: double = Math.random();
        if (value < minValue) {
          minValue = value;
        }
        if (value > maxValue) {
          maxValue = value;
        }
      }
      expect(minValue >= 0.0).assertTrue();
      expect(maxValue < 1.0).assertTrue();
      expect(minValue <= maxValue).assertTrue();
    });

    /**
     * @tc.name testMathRandom012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1200
     * @tc.desc Verify random method output can be bucketed with floor into a bounded integer-like range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = Math.random();
      let bucket: double = Math.floor(value * 16.0);
      expect(bucket >= 0.0).assertTrue();
      expect(bucket < 16.0).assertTrue();
      expect(bucket).assertEqual(Math.trunc(bucket));
    });

    /**
     * @tc.name testMathRandom013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1300
     * @tc.desc Verify random method output remains finite after linear transformation into the half-open range from minus one to one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = Math.random();
      let transformed: double = value * 2.0 - 1.0;
      expect(Utils.isFiniteValue(transformed)).assertTrue();
      expect(transformed >= -1.0).assertTrue();
      expect(transformed < 1.0).assertTrue();
    });

    /**
     * @tc.name testMathRandom014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1400
     * @tc.desc Verify random method output remains within range when passed through min and max clamp operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = Math.random();
      let lowerClamped: double = Math.max(value, 0.25);
      let upperClamped: double = Math.min(value, 0.75);
      expect(lowerClamped >= 0.25).assertTrue();
      expect(lowerClamped < 1.0).assertTrue();
      expect(upperClamped >= 0.0).assertTrue();
      expect(upperClamped <= 0.75).assertTrue();
    });

    /**
     * @tc.name testMathRandom015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1500
     * @tc.desc Verify random method output can scale by Double.MAX_VALUE while staying non-negative and finite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = Math.random();
      let scaled: double = value * Double.MAX_VALUE;
      expect(Utils.isNaNValue(scaled)).assertFalse();
      expect(scaled >= 0.0).assertTrue();
      expect(scaled <= Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.name testMathRandom016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1600
     * @tc.desc Verify random method output can drive repeated branch counts while preserving total iteration accounting
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let belowThresholdCount: int = 0;
      let atOrAboveThresholdCount: int = 0;
      let iterations: int = 12;
      for (let i: int = 0; i < iterations; i++) {
        let value: double = Math.random();
        if (value < 0.5) {
          belowThresholdCount++;
        } else {
          atOrAboveThresholdCount++;
        }
        expect(value >= 0.0).assertTrue();
        expect(value < 1.0).assertTrue();
      }
      expect(belowThresholdCount + atOrAboveThresholdCount).assertEqual(iterations);
    });

    /**
     * @tc.name testMathRandom017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1700
     * @tc.desc Verify random method output can select a bounded array slot index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: int[] = [10, 20, 30, 40];
      let index: double = Math.floor(Math.random() * values.length);
      expect(index >= 0.0).assertTrue();
      expect(index < values.length).assertTrue();
    });

    /**
     * @tc.name testMathRandom018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1800
     * @tc.desc Verify random method mean of a fixed sample count stays within the unit interval
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: double = 0.0;
      let iterations: int = 32;
      for (let i: int = 0; i < iterations; i++) {
        sum += Math.random();
      }
      let mean: double = sum / iterations;
      expect(mean >= 0.0).assertTrue();
      expect(mean < 1.0).assertTrue();
    });
  });
}
