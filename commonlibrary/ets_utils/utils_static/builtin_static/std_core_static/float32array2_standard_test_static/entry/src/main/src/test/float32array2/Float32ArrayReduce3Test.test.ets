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

export default function Float32ArrayReduce3Test(): void {
  describe('Float32ArrayReduce3Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_0100
     * @tc.name testFloat32ArrayReduceThree001
     * @tc.desc Verify reduce<boolean> with AND logic and initial true over all-positive array yields true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<boolean>((prev: boolean, curr: number): boolean => prev && curr > 0, true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_0200
     * @tc.name testFloat32ArrayReduceThree002
     * @tc.desc Verify reduce<boolean> with AND logic yields false when any element is non-positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, -2.0, 3.0);
      const result = arr.reduce<boolean>((prev: boolean, curr: number): boolean => prev && curr > 0, true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_0300
     * @tc.name testFloat32ArrayReduceThree003
     * @tc.desc Verify reduce<boolean> with OR logic and initial false yields true when any element is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, 3.0);
      const result = arr.reduce<boolean>((prev: boolean, curr: number): boolean => prev || curr > 0, false);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_0400
     * @tc.name testFloat32ArrayReduceThree004
     * @tc.desc Verify reduce<boolean> with OR logic and initial false yields false when no element is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const result = arr.reduce<boolean>((prev: boolean, curr: number): boolean => prev || curr > 0, false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_0500
     * @tc.name testFloat32ArrayReduceThree005
     * @tc.desc Verify reduce<boolean> initial value alone determines result on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduce<boolean>((prev: boolean, curr: number): boolean => prev && curr > 0, true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_0600
     * @tc.name testFloat32ArrayReduceThree006
     * @tc.desc Verify reduce<boolean> treats NaN as not greater than zero (AND becomes false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.NaN, 3.0);
      const result = arr.reduce<boolean>((prev: boolean, curr: number): boolean => prev && curr > 0, true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_0700
     * @tc.name testFloat32ArrayReduceThree007
     * @tc.desc Verify reduce<int> sums integer values to int accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<int>((acc: int, v: number): int => (acc + v).toInt(), 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_0800
     * @tc.name testFloat32ArrayReduceThree008
     * @tc.desc Verify reduce<int> truncates running sum toward zero at each step (1.5->1, 3.7->3, 6.2->6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.5, 2.7, 3.2);
      const result = arr.reduce<int>((acc: int, v: number): int => (acc + v).toInt(), 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_0900
     * @tc.name testFloat32ArrayReduceThree009
     * @tc.desc Verify reduce<int> counts elements by ignoring values and incrementing counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 10.0, 15.0, 20.0);
      const result = arr.reduce<int>((acc: int, v: number): int => acc + 1, 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_1000
     * @tc.name testFloat32ArrayReduceThree010
     * @tc.desc Verify reduce<int> on empty array returns initial value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduce<int>((acc: int, v: number): int => (acc + v).toInt(), 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_1100
     * @tc.name testFloat32ArrayReduceThree011
     * @tc.desc Verify reduce<int> with negative values [-1,-2,-3] sums to -6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const result = arr.reduce<int>((acc: int, v: number): int => (acc + v).toInt(), 0);
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_1200
     * @tc.name testFloat32ArrayReduceThree012
     * @tc.desc Verify reduce<int> with negative fractional values truncates each step toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.5, -2.7, -3.2);
      const result = arr.reduce<int>((acc: int, v: number): int => (acc + v).toInt(), 0);
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_1300
     * @tc.name testFloat32ArrayReduceThree013
     * @tc.desc Verify reduce<int> with negative initialValue -10 and negative values sums to -16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const result = arr.reduce<int>((acc: int, v: number): int => (acc + v).toInt(), -10);
      expect(result).assertEqual(-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_THREE_1400
     * @tc.name testFloat32ArrayReduceThree014
     * @tc.desc Verify reduce on subarray only iterates within subarray range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      const view = parent.subarray(1, 4);
      const result = view.reduce<number>((acc: number, v: number): number => acc + v, 0);
      expect(result).assertEqual(90.0);
    });

  });
}
