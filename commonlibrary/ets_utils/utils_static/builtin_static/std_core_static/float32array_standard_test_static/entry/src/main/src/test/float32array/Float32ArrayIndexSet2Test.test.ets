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

export default function Float32ArrayIndexSet2Test(): void {
  describe('Float32ArrayIndexSet2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0010
     * @tc.name testFloat32ArrayIndexSetTWO001
     * @tc.desc Verify two-argument arity (E overload) index+value completes the write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const value = 42;
      arr.$_set(0, value);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0020
     * @tc.name testFloat32ArrayIndexSetTWO002
     * @tc.desc Verify two-argument arity (number overload) index+value completes the write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0030
     * @tc.name testFloat32ArrayIndexSetTWO003
     * @tc.desc Verify two consecutive $_set each passing two arguments, the second does not depend on the first's return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0040
     * @tc.name testFloat32ArrayIndexSetTWO004
     * @tc.desc Verify index=0 writes the first position, $_get(0) reads back the target value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.$_set(0, 7);
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0050
     * @tc.name testFloat32ArrayIndexSetTWO005
     * @tc.desc Verify index=length-1 writes the last position, $_get(length-1) reads back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.$_set(3, 9);
      expect(arr.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0060
     * @tc.name testFloat32ArrayIndexSetTWO006
     * @tc.desc Verify index=1 writes the second position, does not conflate with index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(1, 50);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0070
     * @tc.name testFloat32ArrayIndexSetTWO007
     * @tc.desc Verify same value written to different indexes, positions are distinguishable on read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.$_set(0, 8);
      arr.$_set(2, 8);
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0080
     * @tc.name testFloat32ArrayIndexSetTWO008
     * @tc.desc Verify E overload writes an integer via const float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const value = 255;
      arr.$_set(0, value);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0090
     * @tc.name testFloat32ArrayIndexSetTWO009
     * @tc.desc Verify number overload writes an integer via a number variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const n: number = 1000;
      arr.$_set(0, n);
      expect(arr.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0100
     * @tc.name testFloat32ArrayIndexSetTWO010
     * @tc.desc Verify number overload writes a negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, -7);
      expect(arr.$_get(0)).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0110
     * @tc.name testFloat32ArrayIndexSetTWO011
     * @tc.desc Verify number overload writes a decimal (exactly representable in float32)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 2.5);
      expect(arr.$_get(0)).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0120
     * @tc.name testFloat32ArrayIndexSetTWO012
     * @tc.desc Verify E overload stores a float value and reads back consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const value = 16;
      arr.$_set(0, value);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0130
     * @tc.name testFloat32ArrayIndexSetTWO013
     * @tc.desc Verify number overload stores a number value and reads back consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const n: number = 16;
      arr.$_set(0, n);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0140
     * @tc.name testFloat32ArrayIndexSetTWO014
     * @tc.desc Verify two overloads write the same value to the same index, the stored results are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const value = 99;
      arr.$_set(0, value);
      arr.$_set(1, 99);
      expect(arr.$_get(0)).assertEqual(arr.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0150
     * @tc.name testFloat32ArrayIndexSetTWO015
     * @tc.desc Verify E overload and number overload write to different indexes respectively, do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const value = 5;
      arr.$_set(0, value);
      arr.$_set(1, 6);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0160
     * @tc.name testFloat32ArrayIndexSetTWO016
     * @tc.desc Verify after write, the $_get return value typeof is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 3);
      expect(typeof arr.$_get(0)).assertEqual('number');
      expect(arr.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0170
     * @tc.name testFloat32ArrayIndexSetTWO017
     * @tc.desc Verify after write, the array instance is instanceof Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 3);
      expect(arr instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0180
     * @tc.name testFloat32ArrayIndexSetTWO018
     * @tc.desc Verify after write, the buffer is instanceof ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 3);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0190
     * @tc.name testFloat32ArrayIndexSetTWO019
     * @tc.desc Verify after writing to the view, the subarray result is instanceof Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(0, 5);
      const sub = arr.subarray(0, 2);
      expect(sub instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0200
     * @tc.name testFloat32ArrayIndexSetTWO020
     * @tc.desc Verify after writing NaN, the $_get return value typeof is still number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, NaN);
      expect(typeof arr.$_get(0)).assertEqual('number');
      const v: number = arr.$_get(0);
      expect(v).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0210
     * @tc.name testFloat32ArrayIndexSetTWO021
     * @tc.desc Verify after writing Infinity, the $_get return value typeof is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, Infinity);
      expect(typeof arr.$_get(0)).assertEqual('number');
      expect(arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0220
     * @tc.name testFloat32ArrayIndexSetTWO022
     * @tc.desc Verify writing the Float32 max finite value reads back equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 3.4028234663852886e+38);
      expect(arr.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0230
     * @tc.name testFloat32ArrayIndexSetTWO023
     * @tc.desc Verify writing the negative max finite value reads back equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, -3.4028234663852886e+38);
      expect(arr.$_get(0)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0240
     * @tc.name testFloat32ArrayIndexSetTWO024
     * @tc.desc Verify writing the minimum positive normalized number reads back equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 1.1754943508222875e-38);
      expect(arr.$_get(0)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0250
     * @tc.name testFloat32ArrayIndexSetTWO025
     * @tc.desc Verify writing the minimum positive subnormal number reads back equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 1.401298464324817e-45);
      expect(arr.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0260
     * @tc.name testFloat32ArrayIndexSetTWO026
     * @tc.desc Verify writing Infinity reads back Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, Infinity);
      expect(arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0270
     * @tc.name testFloat32ArrayIndexSetTWO027
     * @tc.desc Verify writing -Infinity reads back -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, -Infinity);
      expect(arr.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0280
     * @tc.name testFloat32ArrayIndexSetTWO028
     * @tc.desc Verify writing NaN reads back assertNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, NaN);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0290
     * @tc.name testFloat32ArrayIndexSetTWO029
     * @tc.desc Verify writing +0 verified as positive zero via 1/x (result +Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 0);
      expect(1 / arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0300
     * @tc.name testFloat32ArrayIndexSetTWO030
     * @tc.desc Verify writing -0 verified as negative zero via 1/x (result -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, -0);
      expect(1 / arr.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0310
     * @tc.name testFloat32ArrayIndexSetTWO031
     * @tc.desc Verify writing -1 reads back equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, -1);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0320
     * @tc.name testFloat32ArrayIndexSetTWO032
     * @tc.desc Verify after write, find returns the newly written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(1, 44);
      const found = arr.find((x: number) => x === 44);
      expect(found).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0330
     * @tc.name testFloat32ArrayIndexSetTWO033
     * @tc.desc Verify writing 0.75 reads back equal (exactly representable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 0.75);
      expect(arr.$_get(0)).assertEqual(0.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0340
     * @tc.name testFloat32ArrayIndexSetTWO034
     * @tc.desc Verify writing 12345.625 reads back equal (exactly representable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 12345.625);
      expect(arr.$_get(0)).assertEqual(12345.625);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0350
     * @tc.name testFloat32ArrayIndexSetTWO035
     * @tc.desc Verify writing 1e10 reads back the float32 rounded value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 1e10);
      expect(arr.$_get(0)).assertEqual(Math.fround(1e10));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0360
     * @tc.name testFloat32ArrayIndexSetTWO036
     * @tc.desc Verify after write, length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.$_set(0, 7);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0370
     * @tc.name testFloat32ArrayIndexSetTWO037
     * @tc.desc Verify after write, byteLength is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.$_set(0, 7);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0380
     * @tc.name testFloat32ArrayIndexSetTWO038
     * @tc.desc Verify after write, byteLength === length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.$_set(1, 7);
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0390
     * @tc.name testFloat32ArrayIndexSetTWO039
     * @tc.desc Verify after write, buffer.byteLength is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.$_set(0, 7);
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0400
     * @tc.name testFloat32ArrayIndexSetTWO040
     * @tc.desc Verify after write, the buffer reference is unchanged (same instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const before = arr.buffer;
      arr.$_set(0, 7);
      expect(arr.buffer).assertEqual(before);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0410
     * @tc.name testFloat32ArrayIndexSetTWO041
     * @tc.desc Verify after writing to the base array, byteOffset is still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 7);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0420
     * @tc.name testFloat32ArrayIndexSetTWO042
     * @tc.desc Verify after writing to the view, byteOffset keeps the constructed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 8, 2);
      view.$_set(0, 7);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0430
     * @tc.name testFloat32ArrayIndexSetTWO043
     * @tc.desc Verify after multiple writes, the buffer is still an ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0440
     * @tc.name testFloat32ArrayIndexSetTWO044
     * @tc.desc Verify after multiple writes, length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0450
     * @tc.name testFloat32ArrayIndexSetTWO045
     * @tc.desc Verify writing index 1 does not affect index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(1, 99);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0460
     * @tc.name testFloat32ArrayIndexSetTWO046
     * @tc.desc Verify writing index 0 does not affect index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(0, 99);
      expect(arr.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0470
     * @tc.name testFloat32ArrayIndexSetTWO047
     * @tc.desc Verify writing index 0 does not affect index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(0, 99);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0480
     * @tc.name testFloat32ArrayIndexSetTWO048
     * @tc.desc Verify writing the last position does not affect the first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.$_set(3, 99);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0490
     * @tc.name testFloat32ArrayIndexSetTWO049
     * @tc.desc Verify writing the first position does not affect the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.$_set(0, 99);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0500
     * @tc.name testFloat32ArrayIndexSetTWO050
     * @tc.desc Verify writing the middle position does not affect the neighbors on both sides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(1, 99);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0510
     * @tc.name testFloat32ArrayIndexSetTWO051
     * @tc.desc Verify after writing index 0, the remaining elements are all 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.$_set(0, 5);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0520
     * @tc.name testFloat32ArrayIndexSetTWO052
     * @tc.desc Verify 5-element array writes index 2, the other positions are unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      arr.$_set(2, 99);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(3)).assertEqual(40);
      expect(arr.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0530
     * @tc.name testFloat32ArrayIndexSetTWO053
     * @tc.desc Verify writing the same index twice in a row, only that position changes and the rest are unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(0, 7);
      arr.$_set(0, 8);
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0540
     * @tc.name testFloat32ArrayIndexSetTWO054
     * @tc.desc Verify write index 0 then index 1, the two positions each hold their own value and the rest are unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0550
     * @tc.name testFloat32ArrayIndexSetTWO055
     * @tc.desc Verify after writing a position, the element two positions away is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.$_set(1, 99);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0560
     * @tc.name testFloat32ArrayIndexSetTWO056
     * @tc.desc Verify writing to the view does not change the parent array elements outside the view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(1, 3);
      sub.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0570
     * @tc.name testFloat32ArrayIndexSetTWO057
     * @tc.desc Verify after writing to the parent array, the child view subarray reads the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(1, 3);
      arr.$_set(1, 9);
      expect(sub.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0580
     * @tc.name testFloat32ArrayIndexSetTWO058
     * @tc.desc Verify after writing to the child view subarray, the parent array reads the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(1, 3);
      sub.$_set(0, 9);
      expect(arr.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0590
     * @tc.name testFloat32ArrayIndexSetTWO059
     * @tc.desc Verify two views with the same offset share the buffer, write A and read B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 0, 2);
      a.$_set(0, 5);
      expect(b.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0600
     * @tc.name testFloat32ArrayIndexSetTWO060
     * @tc.desc Verify two views with different offsets share the buffer, write the parent and read the offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      a.$_set(1, 6);
      expect(a.$_get(1)).assertEqual(6);
      expect(b.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0610
     * @tc.name testFloat32ArrayIndexSetTWO061
     * @tc.desc Verify after write, ArrayBuffer.isView(arr) is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 7);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0620
     * @tc.name testFloat32ArrayIndexSetTWO062
     * @tc.desc Verify after writing to the child view, the child view byteOffset is kept
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(1, 3);
      sub.$_set(0, 9);
      expect(sub.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0630
     * @tc.name testFloat32ArrayIndexSetTWO063
     * @tc.desc Verify after writing to subarray(1,3), the parent index 1 changes while index 0 is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(1, 3);
      sub.$_set(0, 9);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0640
     * @tc.name testFloat32ArrayIndexSetTWO064
     * @tc.desc Verify parent and child share the same buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const sub = arr.subarray(0, 2);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0650
     * @tc.name testFloat32ArrayIndexSetTWO065
     * @tc.desc Verify two views with the same offset write, the other view reads the float32 rounded value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 0, 2);
      a.$_set(0, 3.14);
      expect(b.$_get(0)).assertEqual(Math.fround(3.14));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0660
     * @tc.name testFloat32ArrayIndexSetTWO066
     * @tc.desc Verify three-level chained views, write at deepest level and read at shallowest level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const s1 = arr.subarray(0, 4);
      const s2 = s1.subarray(0, 4);
      s2.$_set(2, 77);
      expect(arr.$_get(2)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0670
     * @tc.name testFloat32ArrayIndexSetTWO067
     * @tc.desc Verify writing view A, view B with non-overlapping offset is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      a.$_set(0, 5);
      expect(b.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0680
     * @tc.name testFloat32ArrayIndexSetTWO068
     * @tc.desc Verify two views have different byteOffset and are distinguishable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      expect(a.byteOffset).assertEqual(0);
      expect(b.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0690
     * @tc.name testFloat32ArrayIndexSetTWO069
     * @tc.desc Verify parent and child views have equal buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(1, 3);
      arr.$_set(0, 9);
      expect(arr.buffer.byteLength).assertEqual(sub.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0700
     * @tc.name testFloat32ArrayIndexSetTWO070
     * @tc.desc Verify after writing to subarray, the original subarray reference reads the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const sub = arr.subarray(0, 2);
      arr.$_set(1, 42);
      expect(sub.$_get(1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0710
     * @tc.name testFloat32ArrayIndexSetTWO071
     * @tc.desc Verify two Float32Array views share the same ArrayBuffer, write one and read the other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 0, 2);
      b.$_set(1, 13);
      expect(a.$_get(1)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0720
     * @tc.name testFloat32ArrayIndexSetTWO072
     * @tc.desc Verify after writing to the offset view, the view byteOffset and length are unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 4, 3);
      view.$_set(2, 21);
      expect(view.byteOffset).assertEqual(4);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0730
     * @tc.name testFloat32ArrayIndexSetTWO073
     * @tc.desc Verify overwriting write at the same index, the latest value takes effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 5);
      arr.$_set(0, 6);
      expect(arr.$_get(0)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0740
     * @tc.name testFloat32ArrayIndexSetTWO074
     * @tc.desc Verify after write, the reduce sum includes the newly written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(1, 10);
      const sum = arr.reduce((a: number, b: number) => a + b, 0);
      expect(sum).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0750
     * @tc.name testFloat32ArrayIndexSetTWO075
     * @tc.desc Verify after write, at(0) reads back the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 7);
      expect(arr.at(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0760
     * @tc.name testFloat32ArrayIndexSetTWO076
     * @tc.desc Verify after writing the last position, at(-1) reads back the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.$_set(2, 9);
      expect(arr.at(-1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0770
     * @tc.name testFloat32ArrayIndexSetTWO077
     * @tc.desc Verify after write, the values() iterator reads the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 8);
      const it = arr.values();
      expect(it.next().value).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0780
     * @tc.name testFloat32ArrayIndexSetTWO078
     * @tc.desc Verify after write, indexed traversal reads the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.$_set(0, 8);
      let first: number = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        first = v;
        break;
      }
      expect(first).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0790
     * @tc.name testFloat32ArrayIndexSetTWO079
     * @tc.desc Verify after write, toString reflects the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 5);
      expect(arr.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0800
     * @tc.name testFloat32ArrayIndexSetTWO080
     * @tc.desc Verify after loop-writing multiple positions, all read back correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      for (let i = 0; i < 4; i++) {
        arr.$_set(i, (i + 1) * 10);
      }
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0810
     * @tc.name testFloat32ArrayIndexSetTWO081
     * @tc.desc Verify after write, the new value is read back via bracket arr.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 7);
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0820
     * @tc.name testFloat32ArrayIndexSetTWO082
     * @tc.desc Verify after write, subarray then $_get reads back with a consistent chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(1, 50);
      const sub = arr.subarray(1, 3);
      expect(sub.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0830
     * @tc.name testFloat32ArrayIndexSetTWO083
     * @tc.desc Verify after write, the original array instance reference is unchanged (not a chained return)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const ref = arr;
      arr.$_set(0, 7);
      expect(ref.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0840
     * @tc.name testFloat32ArrayIndexSetTWO084
     * @tc.desc Verify 2^24+4 = 16777220 is exactly representable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 16777220);
      expect(arr.$_get(0)).assertEqual(16777220);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0850
     * @tc.name testFloat32ArrayIndexSetTWO085
     * @tc.desc Verify after write, findIndex returns the index of the written position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0, 7.0]);
      arr.$_set(2, 19);
      expect(arr.findIndex((x: number) => x === 19)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0860
     * @tc.name testFloat32ArrayIndexSetTWO086
     * @tc.desc Verify 0.1+0.2 after truncation does not equal 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 0.1 + 0.2);
      expect(arr.$_get(0)).assertEqual(Math.fround(0.1 + 0.2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0870
     * @tc.name testFloat32ArrayIndexSetTWO087
     * @tc.desc Verify 1.0000002 is rounded per float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 1.0000002);
      expect(arr.$_get(0)).assertEqual(Math.fround(1.0000002));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0880
     * @tc.name testFloat32ArrayIndexSetTWO088
     * @tc.desc Verify 3.4028235e+38 rounds to the maximum finite Float32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 3.4028235e+38);
      expect(arr.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0890
     * @tc.name testFloat32ArrayIndexSetTWO089
     * @tc.desc Verify after writing Infinity, includes(Infinity) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, Infinity);
      expect(arr.includes(Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0900
     * @tc.name testFloat32ArrayIndexSetTWO090
     * @tc.desc Verify 2147483649 rounds to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 2147483649);
      expect(arr.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0910
     * @tc.name testFloat32ArrayIndexSetTWO091
     * @tc.desc Verify 123456789 rounds to 123456792
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 123456789);
      expect(arr.$_get(0)).assertEqual(123456792);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0920
     * @tc.name testFloat32ArrayIndexSetTWO092
     * @tc.desc Verify 2^53+1 = 9007199254740993 is rounded per float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 9007199254740993);
      expect(arr.$_get(0)).assertEqual(Math.fround(9007199254740993));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0930
     * @tc.name testFloat32ArrayIndexSetTWO093
     * @tc.desc Verify 0.123456789 is rounded per float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 0.123456789);
      expect(arr.$_get(0)).assertEqual(Math.fround(0.123456789));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0940
     * @tc.name testFloat32ArrayIndexSetTWO094
     * @tc.desc Verify 5e-8 small normalized number is rounded per float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 5e-8);
      expect(arr.$_get(0)).assertEqual(Math.fround(5e-8));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0950
     * @tc.name testFloat32ArrayIndexSetTWO095
     * @tc.desc Verify after write, indexOf returns the index where the written value is located
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.$_set(2, 19);
      expect(arr.indexOf(19)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0960
     * @tc.name testFloat32ArrayIndexSetTWO096
     * @tc.desc Verify 1e20 large number is rounded per float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 1e20);
      expect(arr.$_get(0)).assertEqual(Math.fround(1e20));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0970
     * @tc.name testFloat32ArrayIndexSetTWO097
     * @tc.desc Verify -1e20 large negative number is rounded per float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, -1e20);
      expect(arr.$_get(0)).assertEqual(Math.fround(-1e20));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0980
     * @tc.name testFloat32ArrayIndexSetTWO098
     * @tc.desc Verify 0.5 power-of-two fraction is stored exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 0.5);
      expect(arr.$_get(0)).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_0990
     * @tc.name testFloat32ArrayIndexSetTWO099
     * @tc.desc Verify decimal 0.1 and hexadecimal 0.10000000149011612 have the same stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 0.1);
      arr.$_set(1, 0.10000000149011612);
      expect(arr.$_get(0)).assertEqual(arr.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_1000
     * @tc.name testFloat32ArrayIndexSetTWO100
     * @tc.desc Verify MAX and MAX+1 overflow comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 3.4028234663852886e+38);
      arr.$_set(1, 3.4028235e+38);
      expect(arr.$_get(0)).assertEqual(3.4028234663852886e+38);
      expect(arr.$_get(1)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_1010
     * @tc.name testFloat32ArrayIndexSetTWO101
     * @tc.desc Verify 3.0e38 in-range large number is rounded per float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 3.0e38);
      expect(arr.$_get(0)).assertEqual(Math.fround(3.0e38));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_1020
     * @tc.name testFloat32ArrayIndexSetTWO102
     * @tc.desc Verify after writing NaN, includes(NaN) returns true (different from indexOf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, NaN);
      expect(arr.includes(NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_1030
     * @tc.name testFloat32ArrayIndexSetTWO103
     * @tc.desc Verify after write, the join string reflects the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(1, 8);
      expect(arr.join(',')).assertEqual('16,8,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_1040
     * @tc.name testFloat32ArrayIndexSetTWO104
     * @tc.desc Verify 2.9 decimal is rounded per float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 2.9);
      expect(arr.$_get(0)).assertEqual(Math.fround(2.9));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_1050
     * @tc.name testFloat32ArrayIndexSetTWO105
     * @tc.desc Verify the 0.1 truncated value and the 0.3 truncated value are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 0.1);
      arr.$_set(1, 0.3);
      expect(arr.$_get(0) === arr.$_get(1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_1060
     * @tc.name testFloat32ArrayIndexSetTWO106
     * @tc.desc Verify $_set(-0, value) writes the first element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstValue: number = 12.0;
      const secondValue: number = 24.0;
      const arr = new Float32Array([0.0, secondValue]);
      arr.$_set(-0, firstValue);
      const expectFirst: number = firstValue;
      const expectSecond: number = secondValue;
      expect(arr.$_get(0)).assertEqual(expectFirst);
      expect(arr.$_get(1)).assertEqual(expectSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_1070
     * @tc.name testFloat32ArrayIndexSetTWO107
     * @tc.desc Verify $_set on an offset view updates the corresponding parent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const parent: Float32Array = new Float32Array(buf);
      const view: Float32Array = new Float32Array(buf, 4, 2);
      const expectValue: number = 77.0;
      view.$_set(0, expectValue);
      expect(parent.$_get(1)).assertEqual(expectValue);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_1080
     * @tc.name testFloat32ArrayIndexSetTWO108
     * @tc.desc Verify parent $_set updates a sibling view sharing the same backing buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const parent: Float32Array = new Float32Array(buf);
      const view: Float32Array = new Float32Array(buf, 4, 2);
      const expectValue: number = 88.0;
      parent.$_set(2, expectValue);
      expect(view.$_get(1)).assertEqual(expectValue);
      expect(parent.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_1090
     * @tc.name testFloat32ArrayIndexSetTWO109
     * @tc.desc Verify $_set at length minus one writes only the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstValue: number = 1.0;
      const middleValue: number = 2.0;
      const lastValue: number = 99.0;
      const arr = new Float32Array([firstValue, middleValue, 3.0]);
      const lastIndex: int = arr.length - 1;
      arr.$_set(lastIndex, lastValue);
      expect(arr.$_get(0)).assertEqual(firstValue);
      expect(arr.$_get(1)).assertEqual(middleValue);
      expect(arr.$_get(2)).assertEqual(lastValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_1100
     * @tc.name testFloat32ArrayIndexSetTWO110
     * @tc.desc Verify $_set preserves negative zero sign in Float32 storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const negativeZeroValue: number = -0.0;
      arr.$_set(0, negativeZeroValue);
      const actualValue: number = arr.$_get(0);
      const expectValue: number = Number.NEGATIVE_INFINITY;
      expect(1.0 / actualValue).assertEqual(expectValue);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETTWO_1110
     * @tc.name testFloat32ArrayIndexSetTWO111
     * @tc.desc Verify $_set on an offset view writes through to the parent at the corresponding position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetTWO111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const view = parent.subarray(1, 3);
      view.$_set(0, 9.0);
      expect(parent.$_get(0)).assertEqual(1.0);
      expect(parent.$_get(1)).assertEqual(9.0);
      expect(parent.$_get(3)).assertEqual(4.0);
    });

  });
}
