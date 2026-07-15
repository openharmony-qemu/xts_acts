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

export default function Float32ArrayToReversed1Test(): void {
  describe('Float32ArrayToReversed1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_0100
     * @tc.name testFloat32ArrayToReversedONE001
     * @tc.desc Verify zero-argument call reverses the order of a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, 2.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(1));
      expect(result.$_get(1)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_0200
     * @tc.name testFloat32ArrayToReversedONE002
     * @tc.desc Verify zero-argument call reverses the order of a three-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_0300
     * @tc.name testFloat32ArrayToReversedONE003
     * @tc.desc Verify zero-argument call reverses the order of a six-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(5));
      expect(result.$_get(5)).assertEqual(input.$_get(0));
      expect(result.$_get(2)).assertEqual(input.$_get(3));
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_0400
     * @tc.name testFloat32ArrayToReversedONE004
     * @tc.desc Verify empty array length boundary reversing returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([]);
      const result: Float32Array = input.toReversed();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_0500
     * @tc.name testFloat32ArrayToReversedONE005
     * @tc.desc Verify single-element array length boundary: after reversing the first element equals the original first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_0600
     * @tc.name testFloat32ArrayToReversedONE006
     * @tc.desc Verify four-element array reversing swaps both ends and the middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(3));
      expect(result.$_get(1)).assertEqual(input.$_get(2));
      expect(result.$_get(3)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_0700
     * @tc.name testFloat32ArrayToReversedONE007
     * @tc.desc Verify reversing a five-element ascending order array yields descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(4));
      expect(result.$_get(4)).assertEqual(input.$_get(0));
      expect(result.$_get(2)).assertEqual(input.$_get(2));
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_0800
     * @tc.name testFloat32ArrayToReversedONE008
     * @tc.desc Verify reversing a five-element descending order array yields ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([5.0, 4.0, 3.0, 2.0, 1.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(4));
      expect(result.$_get(4)).assertEqual(input.$_get(0));
      expect(result.$_get(2)).assertEqual(input.$_get(2));
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_0900
     * @tc.name testFloat32ArrayToReversedONE009
     * @tc.desc Verify ten-element array reversing swaps first and last and preserves the length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(9));
      expect(result.$_get(9)).assertEqual(input.$_get(0));
      expect(result.$_get(4)).assertEqual(input.$_get(5));
      expect(result.length).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_1000
     * @tc.name testFloat32ArrayToReversedONE010
     * @tc.desc Verify single-element NaN is still NaN after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([NaN]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertNaN();
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_1100
     * @tc.name testFloat32ArrayToReversedONE011
     * @tc.desc Verify single-element positive Infinity reversing preserves the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([Infinity]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_1200
     * @tc.name testFloat32ArrayToReversedONE012
     * @tc.desc Verify single-element negative Infinity reversing preserves the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([-Infinity]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_1300
     * @tc.name testFloat32ArrayToReversedONE013
     * @tc.desc Verify single-element positive zero reversing preserves the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([0.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_1400
     * @tc.name testFloat32ArrayToReversedONE014
     * @tc.desc Verify single-element negative zero reversing preserves the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([-0.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_1500
     * @tc.name testFloat32ArrayToReversedONE015
     * @tc.desc Verify positive zero and negative zero two-element reversing swaps the order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([0.0, -0.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(1));
      expect(result.$_get(1)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_1600
     * @tc.name testFloat32ArrayToReversedONE016
     * @tc.desc Verify single-element float32 maximum finite value reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([3.4028234663852886e+38]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_1700
     * @tc.name testFloat32ArrayToReversedONE017
     * @tc.desc Verify single-element float32 minimum finite negative value reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([-3.4028234663852886e+38]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_1800
     * @tc.name testFloat32ArrayToReversedONE018
     * @tc.desc Verify single-element float32 minimum positive normal number reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.1754943508222875e-38]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_1900
     * @tc.name testFloat32ArrayToReversedONE019
     * @tc.desc Verify single-element float32 minimum positive subnormal number reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.401298464324817e-45]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_2000
     * @tc.name testFloat32ArrayToReversedONE020
     * @tc.desc Verify maximum finite value and minimum finite negative value two-element reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([3.4028234663852886e+38, -3.4028234663852886e+38]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(1));
      expect(result.$_get(1)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_2100
     * @tc.name testFloat32ArrayToReversedONE021
     * @tc.desc Verify minimum positive subnormal number and minimum positive normal number two-element reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.401298464324817e-45, 1.1754943508222875e-38]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(1));
      expect(result.$_get(1)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_2200
     * @tc.name testFloat32ArrayToReversedONE022
     * @tc.desc Verify single-element 0.1 after reversing the value equals the original stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([0.1]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_2300
     * @tc.name testFloat32ArrayToReversedONE023
     * @tc.desc Verify single-element 0.2 after reversing the value equals the original stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([0.2]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_2400
     * @tc.name testFloat32ArrayToReversedONE024
     * @tc.desc Verify single-element 0.3 after reversing the value equals the original stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([0.3]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_2500
     * @tc.name testFloat32ArrayToReversedONE025
     * @tc.desc Verify single-element 1.1 precision truncation value reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.1]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_2600
     * @tc.name testFloat32ArrayToReversedONE026
     * @tc.desc Verify single-element 1.0000001 precision truncation value reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0000001]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_2700
     * @tc.name testFloat32ArrayToReversedONE027
     * @tc.desc Verify single-element 16777216 i.e. 2^24 maximum exact integer reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([16777216]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_2800
     * @tc.name testFloat32ArrayToReversedONE028
     * @tc.desc Verify single-element 16777217 i.e. 2^24+1 truncated to 16777216 reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([16777217]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_2900
     * @tc.name testFloat32ArrayToReversedONE029
     * @tc.desc Verify single-element 1.0e40 overflow to positive Infinity reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0e40]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_3000
     * @tc.name testFloat32ArrayToReversedONE030
     * @tc.desc Verify single-element -1.0e40 overflow to negative Infinity reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([-1.0e40]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_3100
     * @tc.name testFloat32ArrayToReversedONE031
     * @tc.desc Verify single-element 1.0e-46 underflow to positive zero reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0e-46]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_3200
     * @tc.name testFloat32ArrayToReversedONE032
     * @tc.desc Verify 0.1 and 0.2 two-element precision value reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([0.1, 0.2]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(1));
      expect(result.$_get(1)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_3300
     * @tc.name testFloat32ArrayToReversedONE033
     * @tc.desc Verify 16777216 and 16777217 two-element exact integer boundary reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([16777216, 16777217]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(1));
      expect(result.$_get(1)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_3400
     * @tc.name testFloat32ArrayToReversedONE034
     * @tc.desc Verify 1.0e40 and -1.0e40 two-element overflow value reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0e40, -1.0e40]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(1));
      expect(result.$_get(1)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_3500
     * @tc.name testFloat32ArrayToReversedONE035
     * @tc.desc Verify 1.0000001 and 1.1 two-element precision truncation value reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0000001, 1.1]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(1));
      expect(result.$_get(1)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_3600
     * @tc.name testFloat32ArrayToReversedONE036
     * @tc.desc Verify single-element 0 reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_3700
     * @tc.name testFloat32ArrayToReversedONE037
     * @tc.desc Verify single-element -1 reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([-1]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_3800
     * @tc.name testFloat32ArrayToReversedONE038
     * @tc.desc Verify single-element 2147483647 i.e. int maximum value reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([2147483647]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_3900
     * @tc.name testFloat32ArrayToReversedONE039
     * @tc.desc Verify single-element -2147483648 i.e. int minimum value reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([-2147483648]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_4000
     * @tc.name testFloat32ArrayToReversedONE040
     * @tc.desc Verify 2147483647 and -2147483648 two-element int boundary reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([2147483647, -2147483648]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(1));
      expect(result.$_get(1)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_4100
     * @tc.name testFloat32ArrayToReversedONE041
     * @tc.desc Verify single-element 256 decimal literal reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([256]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_4200
     * @tc.name testFloat32ArrayToReversedONE042
     * @tc.desc Verify single-element 1e2 scientific notation literal reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1e2]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_4300
     * @tc.name testFloat32ArrayToReversedONE043
     * @tc.desc Verify single-element 1.0e3 scientific notation literal reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0e3]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_4400
     * @tc.name testFloat32ArrayToReversedONE044
     * @tc.desc Verify single-element 9.0 hexadecimal float literal reversing is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([9.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_4500
     * @tc.name testFloat32ArrayToReversedONE045
     * @tc.desc Verify 9.0 and 1.0e3 two-element base literal reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([9.0, 1.0e3]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(1));
      expect(result.$_get(1)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_4600
     * @tc.name testFloat32ArrayToReversedONE046
     * @tc.desc Verify 256 and 0x100 and 0o400 same value different base three-element reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([256, 0x100, 0o400]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_4700
     * @tc.name testFloat32ArrayToReversedONE047
     * @tc.desc Verify NaN placed at the first position of a three-element array falls at the last position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([NaN, 1.0, 2.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(2)).assertNaN();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_4800
     * @tc.name testFloat32ArrayToReversedONE048
     * @tc.desc Verify NaN placed at the middle position of a three-element array still falls at the middle position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, NaN, 2.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(1)).assertNaN();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_4900
     * @tc.name testFloat32ArrayToReversedONE049
     * @tc.desc Verify NaN placed at the last position of a three-element array falls at the first position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, 2.0, NaN]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertNaN();
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_5000
     * @tc.name testFloat32ArrayToReversedONE050
     * @tc.desc Verify positive Infinity placed at the first position of a three-element array falls at the last position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([Infinity, 1.0, 2.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_5100
     * @tc.name testFloat32ArrayToReversedONE051
     * @tc.desc Verify positive Infinity placed at the middle position of a three-element array still falls at the middle position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, Infinity, 2.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_5200
     * @tc.name testFloat32ArrayToReversedONE052
     * @tc.desc Verify positive Infinity placed at the last position of a three-element array falls at the first position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, 2.0, Infinity]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_5300
     * @tc.name testFloat32ArrayToReversedONE053
     * @tc.desc Verify negative Infinity placed at the first position of a three-element array falls at the last position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([-Infinity, 1.0, 2.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_5400
     * @tc.name testFloat32ArrayToReversedONE054
     * @tc.desc Verify negative Infinity placed at the middle position of a three-element array still falls at the middle position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, -Infinity, 2.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_5500
     * @tc.name testFloat32ArrayToReversedONE055
     * @tc.desc Verify negative Infinity placed at the last position of a three-element array falls at the first position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, 2.0, -Infinity]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_5600
     * @tc.name testFloat32ArrayToReversedONE056
     * @tc.desc Verify negative zero placed at the first position of a three-element array falls at the last position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([-0.0, 1.0, 2.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_5700
     * @tc.name testFloat32ArrayToReversedONE057
     * @tc.desc Verify negative zero placed at the middle position of a three-element array still falls at the middle position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, -0.0, 2.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_5800
     * @tc.name testFloat32ArrayToReversedONE058
     * @tc.desc Verify negative zero placed at the last position of a three-element array falls at the first position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, 2.0, -0.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_5900
     * @tc.name testFloat32ArrayToReversedONE059
     * @tc.desc Verify float32 maximum finite value placed at the first position of a three-element array falls at the last position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([3.4028234663852886e+38, 1.0, 2.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_6000
     * @tc.name testFloat32ArrayToReversedONE060
     * @tc.desc Verify float32 maximum finite value placed at the middle position of a three-element array still falls at the middle position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, 3.4028234663852886e+38, 2.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_6100
     * @tc.name testFloat32ArrayToReversedONE061
     * @tc.desc Verify float32 maximum finite value placed at the last position of a three-element array falls at the first position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0, 2.0, 3.4028234663852886e+38]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_6200
     * @tc.name testFloat32ArrayToReversedONE062
     * @tc.desc Verify 0.1 and 0.2 and 0.3 three-element precision value reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([0.1, 0.2, 0.3]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_6300
     * @tc.name testFloat32ArrayToReversedONE063
     * @tc.desc Verify 1.0e40 and 1.0e-46 and 0 three-element overflow underflow zero reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0e40, 1.0e-46, 0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_6400
     * @tc.name testFloat32ArrayToReversedONE064
     * @tc.desc Verify 16777216 and 16777217 and 33554432 three-element exact integer boundary reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([16777216, 16777217, 33554432]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_6500
     * @tc.name testFloat32ArrayToReversedONE065
     * @tc.desc Verify 2147483647 and 0 and -2147483648 three-element int boundary reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([2147483647, 0, -2147483648]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_6600
     * @tc.name testFloat32ArrayToReversedONE066
     * @tc.desc Verify 1.0e3 and 9.0 and 1.0e-46 three-element base and underflow mixed reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0e3, 9.0, 1.0e-46]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_6700
     * @tc.name testFloat32ArrayToReversedONE067
     * @tc.desc Verify minimum subnormal number and 0 and maximum finite value three-element extreme value reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.401298464324817e-45, 0, 3.4028234663852886e+38]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_6800
     * @tc.name testFloat32ArrayToReversedONE068
     * @tc.desc Verify positive zero negative zero positive zero three-element zero sign mixed reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([0.0, -0.0, 0.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_6900
     * @tc.name testFloat32ArrayToReversedONE069
     * @tc.desc Verify NaN and positive Infinity and negative Infinity three-element special value reversing swaps and NaN falls first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([NaN, Infinity, -Infinity]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertNaN();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_7000
     * @tc.name testFloat32ArrayToReversedONE070
     * @tc.desc Verify 1.0000001 and 1.1 and 0.1 three-element precision truncation value reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([1.0000001, 1.1, 0.1]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_7100
     * @tc.name testFloat32ArrayToReversedONE071
     * @tc.desc Verify NaN and positive Infinity and negative zero and negative Infinity four-element special value reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([NaN, Infinity, -Infinity, -0.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(3));
      expect(result.$_get(1)).assertEqual(input.$_get(2));
      expect(result.$_get(2)).assertEqual(input.$_get(1));
      expect(result.$_get(3)).assertNaN();
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_7200
     * @tc.name testFloat32ArrayToReversedONE072
     * @tc.desc Verify 0.1 and 0.2 and 0.3 and 0.4 four-element precision value reversing swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([0.1, 0.2, 0.3, 0.4]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(3));
      expect(result.$_get(1)).assertEqual(input.$_get(2));
      expect(result.$_get(2)).assertEqual(input.$_get(1));
      expect(result.$_get(3)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_7300
     * @tc.name testFloat32ArrayToReversedONE073
     * @tc.desc Verify the single overload reverses the order of an array containing positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([-1.0, 0.0, 1.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(2));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertEqual(input.$_get(0));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_7400
     * @tc.name testFloat32ArrayToReversedONE074
     * @tc.desc Verify the single overload on an array of all identical values leaves elements unchanged after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([7.0, 7.0, 7.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertEqual(input.$_get(2));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_7500
     * @tc.name testFloat32ArrayToReversedONE075
     * @tc.desc Verify the single overload on an all-NaN array leaves each position still NaN after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([NaN, NaN, NaN]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertNaN();
      expect(result.$_get(1)).assertNaN();
      expect(result.$_get(2)).assertNaN();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_7600
     * @tc.name testFloat32ArrayToReversedONE076
     * @tc.desc Verify the single overload on an all-zero array leaves each position still zero after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: Float32Array = new Float32Array([0.0, 0.0, 0.0]);
      const result: Float32Array = input.toReversed();
      expect(result.$_get(0)).assertEqual(input.$_get(0));
      expect(result.$_get(1)).assertEqual(input.$_get(1));
      expect(result.$_get(2)).assertEqual(input.$_get(2));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDONE_7700
     * @tc.name testFloat32ArrayToReversedONE077
     * @tc.desc Verify modifying the toReversed result does not affect the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Float32Array.of(1.0, 2.0, 3.0);
      const reversed = source.toReversed();
      reversed.$_set(0, 9.0);
      expect(source.$_get(2)).assertEqual(3.0);
      expect(reversed.$_get(0)).assertEqual(9.0);
    });

  });
}
