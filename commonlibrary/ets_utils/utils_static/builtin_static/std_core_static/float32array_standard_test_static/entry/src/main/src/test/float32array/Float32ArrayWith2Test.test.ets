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

export default function Float32ArrayWith2Test(): void {
  describe('Float32ArrayWith2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_0100
     * @tc.name testFloat32ArrayWithTWO001
     * @tc.desc Verify with accepts 2 arguments (index: int, value: number) and returns a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(1, 5.5);
      expect(result.$_get(1)).assertEqual(5.5);
      expect(result.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_0200
     * @tc.name testFloat32ArrayWithTWO002
     * @tc.desc Verify index=0 replaces the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(0, 10.5);
      expect(result.$_get(0)).assertEqual(10.5);
      expect(result.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_0300
     * @tc.name testFloat32ArrayWithTWO003
     * @tc.desc Verify index=1 replaces the middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(1, 20.5);
      expect(result.$_get(1)).assertEqual(20.5);
      expect(result.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_0400
     * @tc.name testFloat32ArrayWithTWO004
     * @tc.desc Verify index=length-1 replaces the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(2, 30.5);
      expect(result.$_get(2)).assertEqual(30.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_0500
     * @tc.name testFloat32ArrayWithTWO005
     * @tc.desc Verify index=-1 replaces the last element (legal negative index, no RangeError)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(-1, 99.0);
      expect(result.$_get(0)).assertEqual(16);
      expect(result.$_get(1)).assertEqual(10);
      expect(result.$_get(2)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_0600
     * @tc.name testFloat32ArrayWithTWO006
     * @tc.desc Verify index=-length replaces the first element (legal negative index, no RangeError)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(-3, 77.0);
      expect(result.$_get(0)).assertEqual(77.0);
      expect(result.$_get(1)).assertEqual(10);
      expect(result.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_0700
     * @tc.name testFloat32ArrayWithTWO007
     * @tc.desc Verify value=0 write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.with(0, 0);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_0800
     * @tc.name testFloat32ArrayWithTWO008
     * @tc.desc Verify value=-0 (negative zero) detects sign via 1/x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.with(0, -0);
      expect(1 / result.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_0900
     * @tc.name testFloat32ArrayWithTWO009
     * @tc.desc Verify value=1 write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 1);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_1000
     * @tc.name testFloat32ArrayWithTWO010
     * @tc.desc Verify value=-1 write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, -1);
      expect(result.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_1100
     * @tc.name testFloat32ArrayWithTWO011
     * @tc.desc Verify value=0.1 float32 truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 0.1);
      const expected: number = new Float32Array([0.1])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_1200
     * @tc.name testFloat32ArrayWithTWO012
     * @tc.desc Verify value=0.2 float32 truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 0.2);
      const expected: number = new Float32Array([0.2])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_1300
     * @tc.name testFloat32ArrayWithTWO013
     * @tc.desc Verify value=0.3 float32 truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 0.3);
      const expected: number = new Float32Array([0.3])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_1400
     * @tc.name testFloat32ArrayWithTWO014
     * @tc.desc Verify value=0.1+0.2 classic precision-loss value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const sum: number = 0.1 + 0.2;
      const result = arr.with(0, sum);
      const expected: number = new Float32Array([sum])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_1500
     * @tc.name testFloat32ArrayWithTWO015
     * @tc.desc Verify value=1.1 float32 truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 1.1);
      const expected: number = new Float32Array([1.1])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_1600
     * @tc.name testFloat32ArrayWithTWO016
     * @tc.desc Verify value=1.0000001 precision truncation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 1.0000001);
      const expected: number = new Float32Array([1.0000001])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_1700
     * @tc.name testFloat32ArrayWithTWO017
     * @tc.desc Verify value=-Float32.MAX smallest finite negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const v: number = -3.4028234663852886e+38;
      const result = arr.with(0, v);
      expect(result.$_get(0)).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_1800
     * @tc.name testFloat32ArrayWithTWO018
     * @tc.desc Verify value=Float32.MIN_NORMAL (1.1754943508222875e-38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const v: number = 1.1754943508222875e-38;
      const result = arr.with(0, v);
      expect(result.$_get(0)).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_1900
     * @tc.name testFloat32ArrayWithTWO019
     * @tc.desc Verify value=Float32.MIN_VALUE (1.401298464324817e-45)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const v: number = 1.401298464324817e-45;
      const result = arr.with(0, v);
      expect(result.$_get(0)).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_2000
     * @tc.name testFloat32ArrayWithTWO020
     * @tc.desc Verify value=-Infinity write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, -Infinity);
      expect(result.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_2100
     * @tc.name testFloat32ArrayWithTWO021
     * @tc.desc Verify value=16777216 (2^24 largest exactly representable integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 16777216);
      expect(result.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_2200
     * @tc.name testFloat32ArrayWithTWO022
     * @tc.desc Verify value=1.0e40 exceeds float32 range and converts to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 1.0e40);
      expect(result.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_2300
     * @tc.name testFloat32ArrayWithTWO023
     * @tc.desc Verify value=-1.0e40 exceeds float32 range and converts to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, -1.0e40);
      expect(result.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_2400
     * @tc.name testFloat32ArrayWithTWO024
     * @tc.desc Verify value=1.0e-46 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.with(0, 1.0e-46);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_2500
     * @tc.name testFloat32ArrayWithTWO025
     * @tc.desc Verify value=2147483647 (int max value as number, truncated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 2147483647);
      const expected: number = new Float32Array([2147483647])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_2600
     * @tc.name testFloat32ArrayWithTWO026
     * @tc.desc Verify value=-2147483648 (int min value as number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, -2147483648);
      const expected: number = new Float32Array([-2147483648])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_2700
     * @tc.name testFloat32ArrayWithTWO027
     * @tc.desc Verify value=1.0e3 scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 1.0e3);
      expect(result.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_2800
     * @tc.name testFloat32ArrayWithTWO028
     * @tc.desc Verify value=Number.MAX_SAFE_INTEGER truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const v: number = Number.MAX_SAFE_INTEGER;
      const result = arr.with(0, v);
      const expected: number = new Float32Array([v])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_2900
     * @tc.name testFloat32ArrayWithTWO029
     * @tc.desc Verify value=Number.MAX_SAFE_INTEGER + 1 truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const v: number = Number.MAX_SAFE_INTEGER + 1;
      const result = arr.with(0, v);
      const expected: number = new Float32Array([v])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_3000
     * @tc.name testFloat32ArrayWithTWO030
     * @tc.desc Verify value=Number.MIN_SAFE_INTEGER truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const v: number = Number.MIN_SAFE_INTEGER;
      const result = arr.with(0, v);
      const expected: number = new Float32Array([v])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_3100
     * @tc.name testFloat32ArrayWithTWO031
     * @tc.desc Verify value=Number.MAX_VALUE exceeds float32 and converts to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, Number.MAX_VALUE);
      expect(result.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_3200
     * @tc.name testFloat32ArrayWithTWO032
     * @tc.desc Verify value=Number.MIN_VALUE underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.with(0, Number.MIN_VALUE);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_3300
     * @tc.name testFloat32ArrayWithTWO033
     * @tc.desc Verify value=3.141592653589793 (pi) truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 3.141592653589793);
      const expected: number = new Float32Array([3.141592653589793])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_3400
     * @tc.name testFloat32ArrayWithTWO034
     * @tc.desc Verify value=2.718281828459045 (Euler's number) truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 2.718281828459045);
      const expected: number = new Float32Array([2.718281828459045])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_3500
     * @tc.name testFloat32ArrayWithTWO035
     * @tc.desc Verify value=0.5 exactly representable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 0.5);
      expect(result.$_get(0)).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_3600
     * @tc.name testFloat32ArrayWithTWO036
     * @tc.desc Verify value=0.25 exactly representable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 0.25);
      expect(result.$_get(0)).assertEqual(0.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_3700
     * @tc.name testFloat32ArrayWithTWO037
     * @tc.desc Verify value=0.125 exactly representable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 0.125);
      expect(result.$_get(0)).assertEqual(0.125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_3800
     * @tc.name testFloat32ArrayWithTWO038
     * @tc.desc Verify value=100.5 exactly representable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 100.5);
      expect(result.$_get(0)).assertEqual(100.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_3900
     * @tc.name testFloat32ArrayWithTWO039
     * @tc.desc Verify value=0.9999999 truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 0.9999999);
      const expected: number = new Float32Array([0.9999999])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_4000
     * @tc.name testFloat32ArrayWithTWO040
     * @tc.desc Verify value=1e-7 truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 1e-7);
      const expected: number = new Float32Array([1e-7])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_4100
     * @tc.name testFloat32ArrayWithTWO041
     * @tc.desc Verify value=1e-8 truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 1e-8);
      const expected: number = new Float32Array([1e-8])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_4200
     * @tc.name testFloat32ArrayWithTWO042
     * @tc.desc Verify value=1e20 truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 1e20);
      const expected: number = new Float32Array([1e20])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_4300
     * @tc.name testFloat32ArrayWithTWO043
     * @tc.desc Verify value=-1e20 truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, -1e20);
      const expected: number = new Float32Array([-1e20])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_4400
     * @tc.name testFloat32ArrayWithTWO044
     * @tc.desc Verify value=1234567.89 truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 1234567.89);
      const expected: number = new Float32Array([1234567.89])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_4500
     * @tc.name testFloat32ArrayWithTWO045
     * @tc.desc Verify value=9999999999999999 precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 9999999999999999);
      const expected: number = new Float32Array([9999999999999999])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_4600
     * @tc.name testFloat32ArrayWithTWO046
     * @tc.desc Verify value=1/3 repeating decimal truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const v: number = 1 / 3;
      const result = arr.with(0, v);
      const expected: number = new Float32Array([v])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_4700
     * @tc.name testFloat32ArrayWithTWO047
     * @tc.desc Verify value=6.022e23 (Avogadro's number) truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const result = arr.with(0, 6.022e23);
      const expected: number = new Float32Array([6.022e23])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_4800
     * @tc.name testFloat32ArrayWithTWO048
     * @tc.desc Verify value=2.2250738585072014e-308 (double smallest positive normalized number) underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.with(0, 2.2250738585072014e-308);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_4900
     * @tc.name testFloat32ArrayWithTWO049
     * @tc.desc Verify value=-0.0 explicit negative zero literal replacing the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const v: number = -0.0;
      const result = arr.with(2, v);
      expect(1 / result.$_get(2)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_5000
     * @tc.name testFloat32ArrayWithTWO050
     * @tc.desc Verify value=Number.POSITIVE_INFINITY explicit constant replacing the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(2, Number.POSITIVE_INFINITY);
      expect(result.$_get(2)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_5100
     * @tc.name testFloat32ArrayWithTWO051
     * @tc.desc Verify value=Number.NEGATIVE_INFINITY explicit constant replacing the middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(1, Number.NEGATIVE_INFINITY);
      expect(result.$_get(1)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_5200
     * @tc.name testFloat32ArrayWithTWO052
     * @tc.desc Verify value=Number.NaN explicit constant written to a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(1, Number.NaN);
      expect(result.$_get(1)).assertNaN();
      expect(result.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_5300
     * @tc.name testFloat32ArrayWithTWO053
     * @tc.desc Verify return value is a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const result = arr.with(0, 5.0);
      expect(result instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_5400
     * @tc.name testFloat32ArrayWithTWO054
     * @tc.desc Verify returns a new array; modifying the returned array does not affect the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(0, 5.0);
      result.$_set(1, 99.0);
      expect(arr.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_5500
     * @tc.name testFloat32ArrayWithTWO055
     * @tc.desc Verify the first element of the original array remains unchanged after with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(0, 5.0);
      expect(result.$_get(0)).assertEqual(5.0);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_5600
     * @tc.name testFloat32ArrayWithTWO056
     * @tc.desc Verify the replaced position of the original array remains unchanged after with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(1, 5.0);
      expect(result.$_get(1)).assertEqual(5.0);
      expect(arr.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_5700
     * @tc.name testFloat32ArrayWithTWO057
     * @tc.desc Verify returned array length equals the original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result = arr.with(2, 5.0);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_5800
     * @tc.name testFloat32ArrayWithTWO058
     * @tc.desc Verify returned array byteLength equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(0, 5.0);
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_5900
     * @tc.name testFloat32ArrayWithTWO059
     * @tc.desc Verify returned array byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(0, 5.0);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_6000
     * @tc.name testFloat32ArrayWithTWO060
     * @tc.desc Verify returned array does not share buffer with the original array (modifying the original array does not affect the returned array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(0, 5.0);
      arr.$_set(2, 99.0);
      expect(result.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_6100
     * @tc.name testFloat32ArrayWithTWO061
     * @tc.desc Verify non-target elements of the returned array keep their original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result = arr.with(1, 9.0);
      expect(result.$_get(0)).assertEqual(1.0);
      expect(result.$_get(2)).assertEqual(3.0);
      expect(result.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_6200
     * @tc.name testFloat32ArrayWithTWO062
     * @tc.desc Verify chained with calls produce the final array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(0, 10.0).with(1, 20.0).with(2, 30.0);
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(20);
      expect(result.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_6300
     * @tc.name testFloat32ArrayWithTWO063
     * @tc.desc Verify after with, read the modified value via at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(1, 7.5);
      expect(result.at(1)).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_6400
     * @tc.name testFloat32ArrayWithTWO064
     * @tc.desc Verify after with, read the first value via the values() iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(0, 9.0);
      const it = result.values();
      expect(it.next().value!).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_6500
     * @tc.name testFloat32ArrayWithTWO065
     * @tc.desc Verify the array returned by with can be further modified via $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const result = arr.with(0, 5.0);
      result.$_set(1, 6.0);
      expect(result.$_get(1)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_6600
     * @tc.name testFloat32ArrayWithTWO066
     * @tc.desc Verify with works on an array constructed by from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([1.0, 2.0, 3.0]);
      const result = arr.with(2, 8.0);
      expect(result.$_get(2)).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_6700
     * @tc.name testFloat32ArrayWithTWO067
     * @tc.desc Verify with works on an array constructed by of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(0, 4.0);
      expect(result.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_6800
     * @tc.name testFloat32ArrayWithTWO068
     * @tc.desc Verify calling with on a subarray view returns an independent new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = buf.subarray(1, 3);
      const result = view.with(0, 9.0);
      expect(result.$_get(0)).assertEqual(9.0);
      expect(buf.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_6900
     * @tc.name testFloat32ArrayWithTWO069
     * @tc.desc Verify with returns an array of length 1 (single-element source)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.with(0, 2.0);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_7000
     * @tc.name testFloat32ArrayWithTWO070
     * @tc.desc Verify after with, traverse the returned array with an indexed loop and sum it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(1, 9.0);
      let sum: number = 0;
      for (let __f32i = 0; __f32i < result.length; __f32i++) {
        const v = result.$_get(__f32i);
        sum += v;
      }
      expect(sum).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_7100
     * @tc.name testFloat32ArrayWithTWO071
     * @tc.desc Verify multiple with calls on the same original array (original array always unchanged)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const r1 = arr.with(0, 10.0);
      const r2 = arr.with(0, 20.0);
      expect(arr.$_get(0)).assertEqual(16);
      expect(r1.$_get(0)).assertEqual(10);
      expect(r2.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_7200
     * @tc.name testFloat32ArrayWithTWO072
     * @tc.desc Verify with returned array buffer.byteLength equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const result = arr.with(2, 0.0);
      expect(result.buffer.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_7300
     * @tc.name testFloat32ArrayWithTWO073
     * @tc.desc Verify index=length is out of bounds and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.with(3, 5.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_7400
     * @tc.name testFloat32ArrayWithTWO074
     * @tc.desc Verify index=length+1 is out of bounds and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.with(4, 5.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_7500
     * @tc.name testFloat32ArrayWithTWO075
     * @tc.desc Verify index=-length-1 negative index is out of bounds and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.with(-4, 5.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_7600
     * @tc.name testFloat32ArrayWithTWO076
     * @tc.desc Verify index=2147483647 (int max) is out of bounds and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.with(2147483647, 5.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_7700
     * @tc.name testFloat32ArrayWithTWO077
     * @tc.desc Verify index=-2147483648 (int min) is out of bounds and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.with(-2147483648, 5.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_7800
     * @tc.name testFloat32ArrayWithTWO078
     * @tc.desc Verify index=0 on an empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      try {
        arr.with(0, 5.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_7900
     * @tc.name testFloat32ArrayWithTWO079
     * @tc.desc Verify index=-1 on an empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      try {
        arr.with(-1, 5.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_8000
     * @tc.name testFloat32ArrayWithTWO080
     * @tc.desc Verify original array remains unchanged when an out-of-bounds error is thrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.with(10, 5.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_8100
     * @tc.name testFloat32ArrayWithTWO081
     * @tc.desc Verify index=1 on a single-element array is out of bounds and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      try {
        arr.with(1, 5.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_8200
     * @tc.name testFloat32ArrayWithTWO082
     * @tc.desc Verify last index combined with Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(2, Infinity);
      expect(result.$_get(2)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_8300
     * @tc.name testFloat32ArrayWithTWO083
     * @tc.desc Verify first index combined with -0 value; other elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(0, -0);
      expect(1 / result.$_get(0)).assertEqual(-Infinity);
      expect(result.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_8400
     * @tc.name testFloat32ArrayWithTWO084
     * @tc.desc Verify middle index combined with Float32.MAX value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const v: number = 3.4028234663852886e+38;
      const result = arr.with(1, v);
      expect(result.$_get(1)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_8500
     * @tc.name testFloat32ArrayWithTWO085
     * @tc.desc Verify replace a non-NaN position in an array containing NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 2.0, NaN]);
      const result = arr.with(1, 5.0);
      expect(result.$_get(0)).assertNaN();
      expect(result.$_get(1)).assertEqual(5.0);
      expect(result.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_8600
     * @tc.name testFloat32ArrayWithTWO086
     * @tc.desc Verify replace the NaN position in an array containing NaN elements with a finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 2.0, NaN]);
      const result = arr.with(0, 5.0);
      expect(result.$_get(0)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_8700
     * @tc.name testFloat32ArrayWithTWO087
     * @tc.desc Verify replace an element in an array containing Infinity elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity, 2.0, -Infinity]);
      const result = arr.with(0, 1.0);
      expect(result.$_get(0)).assertEqual(1.0);
      expect(result.$_get(2)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_8800
     * @tc.name testFloat32ArrayWithTWO088
     * @tc.desc Verify after with replacement, look up the new value via lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0]);
      const result = arr.with(0, 2.0);
      expect(result.lastIndexOf(2.0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_8900
     * @tc.name testFloat32ArrayWithTWO089
     * @tc.desc Verify after with replacement, find the new value's position via indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(2, 1.0);
      expect(result.indexOf(1.0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_9000
     * @tc.name testFloat32ArrayWithTWO090
     * @tc.desc Verify after with writes NaN, indexOf returns -1 (NaN is not matched by equality)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(1, NaN);
      expect(result.indexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_9100
     * @tc.name testFloat32ArrayWithTWO091
     * @tc.desc Verify after with writes NaN, includes returns true (behavioral difference from indexOf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(1, NaN);
      expect(result.includes(NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_9200
     * @tc.name testFloat32ArrayWithTWO092
     * @tc.desc Verify after with replacement, verify the copy contents via slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(1, 9.0);
      const sliced = result.slice(1, 3);
      expect(sliced.$_get(0)).assertEqual(9);
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_9300
     * @tc.name testFloat32ArrayWithTWO093
     * @tc.desc Verify after with replaces with 1e10 (float32 truncated), read it back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(0, 1e10);
      const expected: number = new Float32Array([1e10])[0];
      expect(result.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_9400
     * @tc.name testFloat32ArrayWithTWO094
     * @tc.desc Verify after with replaces with -1e10 (float32 truncated), read it back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.with(2, -1e10);
      const expected: number = new Float32Array([-1e10])[0];
      expect(result.$_get(2)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_9500
     * @tc.name testFloat32ArrayWithTWO095
     * @tc.desc Verify with replaces the middle element with 0.5; other integer elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const result = arr.with(1, 0.5);
      expect(result.$_get(0)).assertEqual(10.0);
      expect(result.$_get(1)).assertEqual(0.5);
      expect(result.$_get(2)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHTWO_9600
     * @tc.name testFloat32ArrayWithTWO096
     * @tc.desc Verify with returns an array backed by a different buffer from the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithTWO096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Float32Array.of(1.0, 2.0, 3.0);
      const result = source.with(1, 9.0);
      expect(result.buffer === source.buffer).assertFalse();
      result.$_set(0, 99.0);
      expect(source.$_get(0)).assertEqual(1.0);
    });

  });
}
