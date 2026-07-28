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

export default function Float32ArrayIndexOf1Test(): void {
  describe('Float32ArrayIndexOf1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0010
     * @tc.name testFloat32ArrayIndexOfONE001
     * @tc.desc Verify arity 1 passing only searchElement finds the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      expect(arr.indexOf(20.0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0020
     * @tc.name testFloat32ArrayIndexOfONE002
     * @tc.desc Verify arity 1 passing only searchElement not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      expect(arr.indexOf(99.0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0030
     * @tc.name testFloat32ArrayIndexOfONE003
     * @tc.desc Verify arity 2 passing searchElement and fromIndex=0 finds the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      expect(arr.indexOf(20.0, 0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0040
     * @tc.name testFloat32ArrayIndexOfONE004
     * @tc.desc Verify arity 2 fromIndex shifts the starting position and finds the later duplicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([20.0, 20.0, 30.0]);
      expect(arr.indexOf(20.0, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0050
     * @tc.name testFloat32ArrayIndexOfONE005
     * @tc.desc Verify Float32.MAX maximum finite value is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 3.4028234663852886e+38, 2.0]);
      expect(arr.indexOf(3.4028234663852886e+38)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0060
     * @tc.name testFloat32ArrayIndexOfONE006
     * @tc.desc Verify Float32.MIN_NORMAL minimum positive normalized number is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38, 2.0]);
      expect(arr.indexOf(1.1754943508222875e-38)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0070
     * @tc.name testFloat32ArrayIndexOfONE007
     * @tc.desc Verify Float32.MIN_VALUE minimum positive subnormal number is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.401298464324817e-45]);
      expect(arr.indexOf(1.401298464324817e-45)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0080
     * @tc.name testFloat32ArrayIndexOfONE008
     * @tc.desc Verify +Infinity positive infinity is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, Number.POSITIVE_INFINITY, 2.0]);
      expect(arr.indexOf(Number.POSITIVE_INFINITY)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0090
     * @tc.name testFloat32ArrayIndexOfONE009
     * @tc.desc Verify -Infinity negative infinity is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, Number.NEGATIVE_INFINITY, 2.0]);
      expect(arr.indexOf(Number.NEGATIVE_INFINITY)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0100
     * @tc.name testFloat32ArrayIndexOfONE010
     * @tc.desc Verify +0 positive zero is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 0.0, 2.0]);
      expect(arr.indexOf(0.0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0110
     * @tc.name testFloat32ArrayIndexOfONE011
     * @tc.desc Verify -0 negative zero is found (array contains -0, searching -0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -0.0, 2.0]);
      expect(arr.indexOf(-0.0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0120
     * @tc.name testFloat32ArrayIndexOfONE012
     * @tc.desc Verify negative maximum finite value -3.4028234663852886e+38 is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38, 2.0]);
      expect(arr.indexOf(-3.4028234663852886e+38)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0130
     * @tc.name testFloat32ArrayIndexOfONE013
     * @tc.desc Verify 2^24=16777216 float32 maximum exact integer is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 16777216, 2.0]);
      expect(arr.indexOf(16777216)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0140
     * @tc.name testFloat32ArrayIndexOfONE014
     * @tc.desc Verify integer 0 is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0, 5.0, 10.0]);
      expect(arr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0150
     * @tc.name testFloat32ArrayIndexOfONE015
     * @tc.desc Verify integer -1 is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, -1, 10.0]);
      expect(arr.indexOf(-1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0160
     * @tc.name testFloat32ArrayIndexOfONE016
     * @tc.desc Verify int upper bound 2147483647 is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2147483647]);
      expect(arr.indexOf(arr[1])).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0170
     * @tc.name testFloat32ArrayIndexOfONE017
     * @tc.desc Verify int lower bound -2147483648 is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2147483648, 2.0]);
      expect(arr.indexOf(-2147483648)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0180
     * @tc.name testFloat32ArrayIndexOfONE018
     * @tc.desc Verify 0.5 exactly representable value is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.5, 1.0]);
      expect(arr.indexOf(0.5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0190
     * @tc.name testFloat32ArrayIndexOfONE019
     * @tc.desc Verify -0.5 exactly representable negative value is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.5, 1.0]);
      expect(arr.indexOf(-0.5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0200
     * @tc.name testFloat32ArrayIndexOfONE020
     * @tc.desc Verify integer 100 is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([50.0, 100.0, 200.0]);
      expect(arr.indexOf(100)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0210
     * @tc.name testFloat32ArrayIndexOfONE021
     * @tc.desc Verify negative value finds the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5.0, -10.0, -15.0]);
      expect(arr.indexOf(-5.0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0220
     * @tc.name testFloat32ArrayIndexOfONE022
     * @tc.desc Verify negative value finds the middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5.0, -10.0, -15.0]);
      expect(arr.indexOf(-10.0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0230
     * @tc.name testFloat32ArrayIndexOfONE023
     * @tc.desc Verify NaN in array, searching for NaN always returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, NaN, 2.0]);
      expect(arr.indexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0240
     * @tc.name testFloat32ArrayIndexOfONE024
     * @tc.desc Verify NaN not in array, searching for NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0250
     * @tc.name testFloat32ArrayIndexOfONE025
     * @tc.desc Verify searching for -0 finds +0 (strict equality -0===0 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 0.0, 2.0]);
      expect(arr.indexOf(-0.0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0260
     * @tc.name testFloat32ArrayIndexOfONE026
     * @tc.desc Verify searching for +0 finds -0 (strict equality 0===-0 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -0.0, 2.0]);
      expect(arr.indexOf(0.0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0270
     * @tc.name testFloat32ArrayIndexOfONE027
     * @tc.desc Verify searching for double 0.1 in float32[0.1] returns -1 due to precision mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1]);
      expect(arr.indexOf(0.1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0280
     * @tc.name testFloat32ArrayIndexOfONE028
     * @tc.desc Verify searching for double 0.2 returns -1 due to precision mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.2]);
      expect(arr.indexOf(0.2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0290
     * @tc.name testFloat32ArrayIndexOfONE029
     * @tc.desc Verify searching for double 0.3 returns -1 due to precision mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.3]);
      expect(arr.indexOf(0.3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0300
     * @tc.name testFloat32ArrayIndexOfONE030
     * @tc.desc Verify searching for 1.0000001 returns -1 due to precision mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0000001]);
      expect(arr.indexOf(1.0000001)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0310
     * @tc.name testFloat32ArrayIndexOfONE031
     * @tc.desc Verify searching for double 1/3 returns -1 due to precision mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0 / 3.0]);
      expect(arr.indexOf(1.0 / 3.0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0320
     * @tc.name testFloat32ArrayIndexOfONE032
     * @tc.desc Verify searching for the stored float32 value (truncated from 16777217) finds it at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      expect(arr.indexOf(arr[0])).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0330
     * @tc.name testFloat32ArrayIndexOfONE033
     * @tc.desc Verify searching for Number.MAX_SAFE_INTEGER returns -1 due to precision mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9007199254740991]);
      expect(arr.indexOf(9007199254740991)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0340
     * @tc.name testFloat32ArrayIndexOfONE034
     * @tc.desc Verify searching for the read-back 0.1 float32 stored value finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1, 0.2]);
      const stored = arr.$_get(0);
      expect(arr.indexOf(stored)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0350
     * @tc.name testFloat32ArrayIndexOfONE035
     * @tc.desc Verify searching for the read-back 1/3 float32 stored value finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0 / 3.0, 2.0]);
      const stored = arr.$_get(0);
      expect(arr.indexOf(stored)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0360
     * @tc.name testFloat32ArrayIndexOfONE036
     * @tc.desc Verify searching for the read-back MAX_SAFE_INTEGER float32 stored value finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9007199254740991, 2.0]);
      const stored = arr.$_get(0);
      expect(arr.indexOf(stored)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0370
     * @tc.name testFloat32ArrayIndexOfONE037
     * @tc.desc Verify searching for the read-back 1.1 float32 stored value finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1, 2.0]);
      const stored = arr.$_get(0);
      expect(arr.indexOf(stored)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0380
     * @tc.name testFloat32ArrayIndexOfONE038
     * @tc.desc Verify 16777217 stored truncated to 16777216, searching for 16777216 finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      expect(arr.indexOf(16777216)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0390
     * @tc.name testFloat32ArrayIndexOfONE039
     * @tc.desc Verify 1.0e40 overflows to +Infinity, searching for Infinity finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40]);
      expect(arr.indexOf(Number.POSITIVE_INFINITY)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0400
     * @tc.name testFloat32ArrayIndexOfONE040
     * @tc.desc Verify -1.0e40 overflows to -Infinity, searching for -Infinity finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0e40]);
      expect(arr.indexOf(Number.NEGATIVE_INFINITY)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0410
     * @tc.name testFloat32ArrayIndexOfONE041
     * @tc.desc Verify 1.0e-46 underflows to +0, searching for 0 finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46]);
      expect(arr.indexOf(0.0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0420
     * @tc.name testFloat32ArrayIndexOfONE042
     * @tc.desc Verify Float32.MAX not in array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(3.4028234663852886e+38)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0430
     * @tc.name testFloat32ArrayIndexOfONE043
     * @tc.desc Verify middle value not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 3.0, 5.0]);
      expect(arr.indexOf(2.0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0440
     * @tc.name testFloat32ArrayIndexOfONE044
     * @tc.desc Verify empty array searching for any value returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      expect(arr.indexOf(1.0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0450
     * @tc.name testFloat32ArrayIndexOfONE045
     * @tc.desc Verify empty array searching for NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      expect(arr.indexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0460
     * @tc.name testFloat32ArrayIndexOfONE046
     * @tc.desc Verify single-element array not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      expect(arr.indexOf(7.0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0470
     * @tc.name testFloat32ArrayIndexOfONE047
     * @tc.desc Verify MIN_VALUE not in array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 1.0]);
      expect(arr.indexOf(1.401298464324817e-45)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0480
     * @tc.name testFloat32ArrayIndexOfONE048
     * @tc.desc Verify single element found at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      expect(arr.indexOf(42.0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0490
     * @tc.name testFloat32ArrayIndexOfONE049
     * @tc.desc Verify duplicate element returns the first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 5.0, 5.0]);
      expect(arr.indexOf(5.0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0500
     * @tc.name testFloat32ArrayIndexOfONE050
     * @tc.desc Verify all identical elements return 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 3.0, 3.0, 3.0]);
      expect(arr.indexOf(3.0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0510
     * @tc.name testFloat32ArrayIndexOfONE051
     * @tc.desc Verify unique value after duplicates is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 2.0, 2.0, 9.0]);
      expect(arr.indexOf(9.0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0520
     * @tc.name testFloat32ArrayIndexOfONE052
     * @tc.desc Verify hexadecimal literal 0xFF=255 is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([255.0, 2.0]);
      expect(arr.indexOf(0xFF)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0530
     * @tc.name testFloat32ArrayIndexOfONE053
     * @tc.desc Verify octal literal 0o10=8 is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([8.0, 2.0]);
      expect(arr.indexOf(0o10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0540
     * @tc.name testFloat32ArrayIndexOfONE054
     * @tc.desc Verify binary literal 0b1010=10 is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 2.0]);
      expect(arr.indexOf(0b1010)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0550
     * @tc.name testFloat32ArrayIndexOfONE055
     * @tc.desc Verify scientific notation 1e1=10 is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0]);
      expect(arr.indexOf(1e1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0560
     * @tc.name testFloat32ArrayIndexOfONE056
     * @tc.desc Verify array contains 1000.0, searching for 1.0e3 finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1000.0, 2.0]);
      expect(arr.indexOf(1.0e3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0570
     * @tc.name testFloat32ArrayIndexOfONE057
     * @tc.desc Verify array contains 1.0e3, searching for 1000.0 finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e3, 2.0]);
      expect(arr.indexOf(1000.0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0580
     * @tc.name testFloat32ArrayIndexOfONE058
     * @tc.desc Verify searching for integer 0 finds 0.0 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 0.0]);
      expect(arr.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0590
     * @tc.name testFloat32ArrayIndexOfONE059
     * @tc.desc Verify searching for 2.5 exactly representable value finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.5, 3.0]);
      expect(arr.indexOf(2.5)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0600
     * @tc.name testFloat32ArrayIndexOfONE060
     * @tc.desc Verify searching for -2.5 exactly representable negative value finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2.5, 1.0, 3.0]);
      expect(arr.indexOf(-2.5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0610
     * @tc.name testFloat32ArrayIndexOfONE061
     * @tc.desc Verify fromIndex=0 finds the first duplicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 5.0, 5.0]);
      expect(arr.indexOf(5.0, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0620
     * @tc.name testFloat32ArrayIndexOfONE062
     * @tc.desc Verify fromIndex=1 skips the first and finds the second duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 5.0, 5.0]);
      expect(arr.indexOf(5.0, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0630
     * @tc.name testFloat32ArrayIndexOfONE063
     * @tc.desc Verify fromIndex=2 finds the last duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 5.0, 5.0]);
      expect(arr.indexOf(5.0, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0640
     * @tc.name testFloat32ArrayIndexOfONE064
     * @tc.desc Verify fromIndex=length-1 finds the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(-1.0, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0650
     * @tc.name testFloat32ArrayIndexOfONE065
     * @tc.desc Verify fromIndex=length out of bounds returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(-1.0, 3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0660
     * @tc.name testFloat32ArrayIndexOfONE066
     * @tc.desc Verify fromIndex=length+1 out of bounds returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(0x10, 4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0670
     * @tc.name testFloat32ArrayIndexOfONE067
     * @tc.desc Verify fromIndex=-1 normalizes to the last index and finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(-1.0, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0680
     * @tc.name testFloat32ArrayIndexOfONE068
     * @tc.desc Verify fromIndex=-1, element only at the front, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 2.0, 3.0]);
      expect(arr.indexOf(5.0, -1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0690
     * @tc.name testFloat32ArrayIndexOfONE069
     * @tc.desc Verify fromIndex=-2 normalizes to the middle index and finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(0b1010, -2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0700
     * @tc.name testFloat32ArrayIndexOfONE070
     * @tc.desc Verify fromIndex=-length normalizes to 0 and finds the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(0x10, -3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0710
     * @tc.name testFloat32ArrayIndexOfONE071
     * @tc.desc Verify fromIndex=-length-1 clamps to 0 and finds the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(0x10, -4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0720
     * @tc.name testFloat32ArrayIndexOfONE072
     * @tc.desc Verify fromIndex=-100 far negative value clamps to 0 and finds the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(0x10, -100)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0730
     * @tc.name testFloat32ArrayIndexOfONE073
     * @tc.desc Verify fromIndex=-100 finds the middle element after clamping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(0b1010, -100)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0740
     * @tc.name testFloat32ArrayIndexOfONE074
     * @tc.desc Verify fromIndex=2147483647 int upper bound exceeds length and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(0x10, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0750
     * @tc.name testFloat32ArrayIndexOfONE075
     * @tc.desc Verify fromIndex=-2147483648 int lower bound clamps to 0 and finds the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(0x10, -2147483648)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0760
     * @tc.name testFloat32ArrayIndexOfONE076
     * @tc.desc Verify fromIndex=-2147483648 finds the last element after clamping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(-1.0, -2147483648)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0770
     * @tc.name testFloat32ArrayIndexOfONE077
     * @tc.desc Verify fromIndex huge positive number 1000000 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.indexOf(-1.0, 1000000)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0780
     * @tc.name testFloat32ArrayIndexOfONE078
     * @tc.desc Verify fromIndex=-2 finds the duplicate element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 7.0, 7.0]);
      expect(arr.indexOf(7.0, -2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0790
     * @tc.name testFloat32ArrayIndexOfONE079
     * @tc.desc Verify fromIndex=-1 finds the duplicate element at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 7.0, 7.0]);
      expect(arr.indexOf(7.0, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0800
     * @tc.name testFloat32ArrayIndexOfONE080
     * @tc.desc Verify empty array fromIndex=0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      expect(arr.indexOf(1.0, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0810
     * @tc.name testFloat32ArrayIndexOfONE081
     * @tc.desc Verify empty array fromIndex=-1 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      expect(arr.indexOf(1.0, -1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0820
     * @tc.name testFloat32ArrayIndexOfONE082
     * @tc.desc Verify single-element array fromIndex=0 finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      expect(arr.indexOf(42.0, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0830
     * @tc.name testFloat32ArrayIndexOfONE083
     * @tc.desc Verify single-element array fromIndex=-1 clamps to 0 and finds it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      expect(arr.indexOf(42.0, -1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0840
     * @tc.name testFloat32ArrayIndexOfONE084
     * @tc.desc Verify single-element array fromIndex=1 equals length, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      expect(arr.indexOf(42.0, 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0850
     * @tc.name testFloat32ArrayIndexOfONE085
     * @tc.desc Verify fromIndex=-1 finds 9.0 at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 9.0]);
      expect(arr.indexOf(9.0, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0860
     * @tc.name testFloat32ArrayIndexOfONE086
     * @tc.desc Verify fromIndex=length searching for NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 2.0, 3.0]);
      expect(arr.indexOf(NaN, 3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0870
     * @tc.name testFloat32ArrayIndexOfONE087
     * @tc.desc Verify fromIndex skips the only occurrence and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0, 7.0]);
      expect(arr.indexOf(5.0, 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0880
     * @tc.name testFloat32ArrayIndexOfONE088
     * @tc.desc Verify fromIndex=2, NaN at the front, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 1.0, 2.0]);
      expect(arr.indexOf(NaN, 2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0890
     * @tc.name testFloat32ArrayIndexOfONE089
     * @tc.desc Verify fromIndex=-1 searching for -0 finds +0 at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 0.0]);
      expect(arr.indexOf(-0.0, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0900
     * @tc.name testFloat32ArrayIndexOfONE090
     * @tc.desc Verify fromIndex=-2, +0 at the front not in search range, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 2.0, 3.0]);
      expect(arr.indexOf(0.0, -2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0910
     * @tc.name testFloat32ArrayIndexOfONE091
     * @tc.desc Verify fromIndex=-length finds the first +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 2.0, 3.0]);
      expect(arr.indexOf(0.0, -3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0920
     * @tc.name testFloat32ArrayIndexOfONE092
     * @tc.desc Verify fromIndex huge negative number clamps and finds Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY, 2.0]);
      expect(arr.indexOf(Number.POSITIVE_INFINITY, -99999999)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0930
     * @tc.name testFloat32ArrayIndexOfONE093
     * @tc.desc Verify fromIndex=length-1, Infinity at the front, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY, 2.0, 3.0]);
      expect(arr.indexOf(Number.POSITIVE_INFINITY, 2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0940
     * @tc.name testFloat32ArrayIndexOfONE094
     * @tc.desc Verify fromIndex=1 finds Float32.MAX at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.4028234663852886e+38]);
      expect(arr.indexOf(3.4028234663852886e+38, 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0950
     * @tc.name testFloat32ArrayIndexOfONE095
     * @tc.desc Verify fromIndex=2 finds Float32.MAX at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.4028234663852886e+38]);
      expect(arr.indexOf(3.4028234663852886e+38, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0960
     * @tc.name testFloat32ArrayIndexOfONE096
     * @tc.desc Verify fromIndex=-1 finds MIN_VALUE at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 1.401298464324817e-45]);
      expect(arr.indexOf(1.401298464324817e-45, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0970
     * @tc.name testFloat32ArrayIndexOfONE097
     * @tc.desc Verify fromIndex=0 finds MIN_NORMAL at the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38, 2.0]);
      expect(arr.indexOf(1.1754943508222875e-38, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0980
     * @tc.name testFloat32ArrayIndexOfONE098
     * @tc.desc Verify fromIndex=1 finds the element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      expect(arr.indexOf(20.0, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_0990
     * @tc.name testFloat32ArrayIndexOfONE099
     * @tc.desc Verify fromIndex=2 finds the element at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      expect(arr.indexOf(30.0, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_1000
     * @tc.name testFloat32ArrayIndexOfONE100
     * @tc.desc Verify fromIndex=-2 finds index 2 in a 4-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      expect(arr.indexOf(30.0, -2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_1010
     * @tc.name testFloat32ArrayIndexOfONE101
     * @tc.desc Verify fromIndex=-3 finds index 1 in a 4-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      expect(arr.indexOf(20.0, -3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_1020
     * @tc.name testFloat32ArrayIndexOfONE102
     * @tc.desc Verify fromIndex=-4=-length finds index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      expect(arr.indexOf(10.0, -4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_1030
     * @tc.name testFloat32ArrayIndexOfONE103
     * @tc.desc Verify fromIndex=-5=-length-1 clamps and finds index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      expect(arr.indexOf(10.0, -5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_1040
     * @tc.name testFloat32ArrayIndexOfONE104
     * @tc.desc Verify fromIndex=3 finds the last element in a 4-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      expect(arr.indexOf(40.0, 3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_1050
     * @tc.name testFloat32ArrayIndexOfONE105
     * @tc.desc Verify fromIndex=4=length out of bounds returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      expect(arr.indexOf(40.0, 4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_1060
     * @tc.name testFloat32ArrayIndexOfONE106
     * @tc.desc Verify fromIndex=-1 finds the duplicate element only at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([8.0, 8.0, 9.0]);
      expect(arr.indexOf(9.0, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFONE_1070
     * @tc.name testFloat32ArrayIndexOfONE107
     * @tc.desc Verify fromIndex equal to length returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfONE107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 1.0);
      expect(arr.indexOf(1.0, arr.length)).assertEqual(-1);
    });

  });
}
