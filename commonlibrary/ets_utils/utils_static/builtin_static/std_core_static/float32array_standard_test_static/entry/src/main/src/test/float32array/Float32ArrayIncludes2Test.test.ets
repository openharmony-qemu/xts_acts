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

export default function Float32ArrayIncludes2Test(): void {
  describe('Float32ArrayIncludes2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0010
     * @tc.name testFloat32ArrayIncludesTWO001
     * @tc.desc Verify includes matches a hexadecimal literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 0x10, 3.0);
      expect(arr.includes(0x10)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0020
     * @tc.name testFloat32ArrayIncludesTWO002
     * @tc.desc Verify includes does not match an absent binary literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.includes(0b1010)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0030
     * @tc.name testFloat32ArrayIncludesTWO003
     * @tc.desc Verify includes on an empty array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      expect(arr.includes(1.0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0040
     * @tc.name testFloat32ArrayIncludesTWO004
     * @tc.desc Verify includes matches NaN with SameValueZero comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      expect(arr.includes(NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0050
     * @tc.name testFloat32ArrayIncludesTWO005
     * @tc.desc Verify includes matches positive infinity in an ArrayBuffer offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 4, 2);
      arr.$_set(0, Infinity);
      expect(arr.includes(Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0060
     * @tc.name testFloat32ArrayIncludesTWO006
     * @tc.desc Verify includes matches negative infinity in a subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, -Infinity, 3.0]);
      const arr = base.subarray(1, 2);
      expect(arr.includes(-Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0070
     * @tc.name testFloat32ArrayIncludesTWO007
     * @tc.desc Verify includes accepts a number search value with an int fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 0.0, 2.0);
      const search: number = 0.0;
      const fromIndex: int = 1;
      expect(arr.includes(search, fromIndex)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0080
     * @tc.name testFloat32ArrayIncludesTWO008
     * @tc.desc Verify includes treats negative zero search value as matching positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const search: number = -0.0;
      expect(arr.includes(search)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0090
     * @tc.name testFloat32ArrayIncludesTWO009
     * @tc.desc Verify includes matches a three-digit integer value from a Float32Array.from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([100.0, 200.0, 300.0]);
      expect(arr.includes(200.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0100
     * @tc.name testFloat32ArrayIncludesTWO010
     * @tc.desc Verify includes matches the smallest positive denormalized number from an offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 0, 2);
      arr.$_set(1, 1.401298464324817e-45);
      expect(arr.includes(1.401298464324817e-45, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0110
     * @tc.name testFloat32ArrayIncludesTWO011
     * @tc.desc Verify includes matches when an int fromIndex skips earlier values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const fromIndex: int = 1;
      expect(arr.includes(-1.0, fromIndex)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0120
     * @tc.name testFloat32ArrayIncludesTWO012
     * @tc.desc Verify includes with a negative fromIndex starts from the tail window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const fromIndex: int = -1;
      expect(arr.includes(-1.0, fromIndex)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0130
     * @tc.name testFloat32ArrayIncludesTWO013
     * @tc.desc Verify includes with an out-of-bounds fromIndex returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const fromIndex: int = 2147483647;
      expect(arr.includes(0x10, fromIndex)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0140
     * @tc.name testFloat32ArrayIncludesTWO014
     * @tc.desc Verify includes matches -1 in a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0]);
      expect(arr.includes(-1.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0150
     * @tc.name testFloat32ArrayIncludesTWO015
     * @tc.desc Verify includes matches an integer business-threshold value in a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1000000.0, 3.0, 4.0, 5.0, 6.0]);
      expect(arr.includes(1000000.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0160
     * @tc.name testFloat32ArrayIncludesTWO016
     * @tc.desc Verify includes with fromIndex 0 starts at the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const fromIndex: int = 0;
      expect(arr.includes(1.0, fromIndex)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0170
     * @tc.name testFloat32ArrayIncludesTWO017
     * @tc.desc Verify includes matches the default zero value in an all-zero array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 0.0, 0.0]);
      expect(arr.includes(0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0180
     * @tc.name testFloat32ArrayIncludesTWO018
     * @tc.desc Verify length is unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.length;
      arr.includes(0b1010);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0190
     * @tc.name testFloat32ArrayIncludesTWO019
     * @tc.desc Verify length is unchanged after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.length;
      arr.includes(99.0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0200
     * @tc.name testFloat32ArrayIncludesTWO020
     * @tc.desc Verify length is still 0 after includes on an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const before = arr.length;
      arr.includes(1.0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0210
     * @tc.name testFloat32ArrayIncludesTWO021
     * @tc.desc Verify length is unchanged after a match with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.length;
      arr.includes(-1.0, 1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0220
     * @tc.name testFloat32ArrayIncludesTWO022
     * @tc.desc Verify length is unchanged after a match with a negative fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.length;
      arr.includes(-1.0, -1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0230
     * @tc.name testFloat32ArrayIncludesTWO023
     * @tc.desc Verify length is unchanged after matching NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 1.0, 2.0]);
      const before = arr.length;
      arr.includes(NaN);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0240
     * @tc.name testFloat32ArrayIncludesTWO024
     * @tc.desc Verify length is unchanged after includes on a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      const before = arr.length;
      arr.includes(5.0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0250
     * @tc.name testFloat32ArrayIncludesTWO025
     * @tc.desc Verify length is unchanged after includes on a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const before = arr.length;
      arr.includes(99.0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0260
     * @tc.name testFloat32ArrayIncludesTWO026
     * @tc.desc Verify length is unchanged after matching positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      const before = arr.length;
      arr.includes(Infinity);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0270
     * @tc.name testFloat32ArrayIncludesTWO027
     * @tc.desc Verify length is unchanged after matching negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      const before = arr.length;
      arr.includes(-0.0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0280
     * @tc.name testFloat32ArrayIncludesTWO028
     * @tc.desc Verify length is unchanged after multiple includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.length;
      arr.includes(0x10);
      arr.includes(0b1010);
      arr.includes(99.0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0290
     * @tc.name testFloat32ArrayIncludesTWO029
     * @tc.desc Verify length is unchanged after matching the Float32 maximum finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      const before = arr.length;
      arr.includes(3.4028234663852886e+38);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0300
     * @tc.name testFloat32ArrayIncludesTWO030
     * @tc.desc Verify length is unchanged after an out-of-bounds fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.length;
      arr.includes(0x10, 5);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0310
     * @tc.name testFloat32ArrayIncludesTWO031
     * @tc.desc Verify length is unchanged after a negative fromIndex is clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.length;
      arr.includes(4.0, -5);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0320
     * @tc.name testFloat32ArrayIncludesTWO032
     * @tc.desc Verify length is unchanged after includes on an all-identical array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 0.0, 0.0]);
      const before = arr.length;
      arr.includes(0.0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0330
     * @tc.name testFloat32ArrayIncludesTWO033
     * @tc.desc Verify length is unchanged after matching 2 to the 24th power
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216]);
      const before = arr.length;
      arr.includes(16777216);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0340
     * @tc.name testFloat32ArrayIncludesTWO034
     * @tc.desc Verify length is unchanged after matching a scientific notation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1e3]);
      const before = arr.length;
      arr.includes(1000.0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0350
     * @tc.name testFloat32ArrayIncludesTWO035
     * @tc.desc Verify length is unchanged after matching the smallest finite negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38]);
      const before = arr.length;
      arr.includes(-3.4028234663852886e+38);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0360
     * @tc.name testFloat32ArrayIncludesTWO036
     * @tc.desc Verify byteLength is unchanged after a match (3 elements, 12 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteLength;
      arr.includes(0b1010);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0370
     * @tc.name testFloat32ArrayIncludesTWO037
     * @tc.desc Verify byteLength is unchanged after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteLength;
      arr.includes(99.0);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0380
     * @tc.name testFloat32ArrayIncludesTWO038
     * @tc.desc Verify byteLength is still 0 after includes on an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const before = arr.byteLength;
      arr.includes(1.0);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0390
     * @tc.name testFloat32ArrayIncludesTWO039
     * @tc.desc Verify byteLength is unchanged after includes on a single-element array (4 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      const before = arr.byteLength;
      arr.includes(5.0);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0400
     * @tc.name testFloat32ArrayIncludesTWO040
     * @tc.desc Verify byteLength is unchanged after a match with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteLength;
      arr.includes(-1.0, 1);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0410
     * @tc.name testFloat32ArrayIncludesTWO041
     * @tc.desc Verify byteLength is unchanged after matching NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 1.0, 2.0]);
      const before = arr.byteLength;
      arr.includes(NaN);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0420
     * @tc.name testFloat32ArrayIncludesTWO042
     * @tc.desc Verify byteLength is unchanged after includes on a multi-element array (24 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const before = arr.byteLength;
      arr.includes(99.0);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0430
     * @tc.name testFloat32ArrayIncludesTWO043
     * @tc.desc Verify byteLength is unchanged after matching the Float32 maximum finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      const before = arr.byteLength;
      arr.includes(3.4028234663852886e+38);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0440
     * @tc.name testFloat32ArrayIncludesTWO044
     * @tc.desc Verify byteLength is unchanged after multiple includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteLength;
      arr.includes(0x10);
      arr.includes(0b1010);
      arr.includes(99.0);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0450
     * @tc.name testFloat32ArrayIncludesTWO045
     * @tc.desc Verify byteLength is unchanged after matching negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity]);
      const before = arr.byteLength;
      arr.includes(-Infinity);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0460
     * @tc.name testFloat32ArrayIncludesTWO046
     * @tc.desc Verify byteLength is unchanged after an out-of-bounds fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteLength;
      arr.includes(0x10, 5);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0470
     * @tc.name testFloat32ArrayIncludesTWO047
     * @tc.desc Verify byteLength is unchanged after a negative fromIndex is clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteLength;
      arr.includes(4.0, -5);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0480
     * @tc.name testFloat32ArrayIncludesTWO048
     * @tc.desc Verify byteLength is unchanged after includes on an all-identical array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 0.0, 0.0]);
      const before = arr.byteLength;
      arr.includes(0.0);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0490
     * @tc.name testFloat32ArrayIncludesTWO049
     * @tc.desc Verify byteLength is unchanged after matching 2 to the 24th power
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216]);
      const before = arr.byteLength;
      arr.includes(16777216);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0500
     * @tc.name testFloat32ArrayIncludesTWO050
     * @tc.desc Verify byteLength is unchanged after includes on a 4-element array (16 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.byteLength;
      arr.includes(2.0);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0510
     * @tc.name testFloat32ArrayIncludesTWO051
     * @tc.desc Verify byteOffset is still 0 after includes on the default view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteOffset;
      arr.includes(0b1010);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0520
     * @tc.name testFloat32ArrayIncludesTWO052
     * @tc.desc Verify byteOffset is unchanged after includes on a view with offset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 8, 2);
      arr.$_set(0, 1.0);
      arr.$_set(1, 2.0);
      const before = arr.byteOffset;
      arr.includes(1.0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0530
     * @tc.name testFloat32ArrayIncludesTWO053
     * @tc.desc Verify byteOffset is unchanged after includes on an empty view with offset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 4, 0);
      const before = arr.byteOffset;
      arr.includes(1.0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0540
     * @tc.name testFloat32ArrayIncludesTWO054
     * @tc.desc Verify byteOffset is unchanged after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteOffset;
      arr.includes(99.0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0550
     * @tc.name testFloat32ArrayIncludesTWO055
     * @tc.desc Verify byteOffset is unchanged after a match with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteOffset;
      arr.includes(-1.0, 1);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0560
     * @tc.name testFloat32ArrayIncludesTWO056
     * @tc.desc Verify byteOffset is unchanged after includes on a subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const arr = base.subarray(1);
      const before = arr.byteOffset;
      arr.includes(3.0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0570
     * @tc.name testFloat32ArrayIncludesTWO057
     * @tc.desc Verify byteOffset is unchanged after includes on a view with offset 4 and length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 4, 2);
      arr.$_set(0, 2.0);
      arr.$_set(1, 3.0);
      const before = arr.byteOffset;
      arr.includes(2.0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0580
     * @tc.name testFloat32ArrayIncludesTWO058
     * @tc.desc Verify byteOffset is unchanged after multiple includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteOffset;
      arr.includes(0x10);
      arr.includes(0b1010);
      arr.includes(99.0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0590
     * @tc.name testFloat32ArrayIncludesTWO059
     * @tc.desc Verify byteOffset is unchanged after includes on a view with offset 8 containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 8, 2);
      arr.$_set(0, NaN);
      arr.$_set(1, 1.0);
      const before = arr.byteOffset;
      arr.includes(NaN);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0600
     * @tc.name testFloat32ArrayIncludesTWO060
     * @tc.desc Verify byteOffset is unchanged after includes on a view with offset 0 and length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 0, 4);
      arr.$_set(0, 1.0);
      arr.$_set(3, 4.0);
      const before = arr.byteOffset;
      arr.includes(4.0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0610
     * @tc.name testFloat32ArrayIncludesTWO061
     * @tc.desc Verify byteOffset is unchanged after includes on a subarray(2) view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const arr = base.subarray(2);
      const before = arr.byteOffset;
      arr.includes(4.0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0620
     * @tc.name testFloat32ArrayIncludesTWO062
     * @tc.desc Verify byteOffset is unchanged after includes on a view with offset 12 and length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 12, 1);
      arr.$_set(0, 1.0);
      const before = arr.byteOffset;
      arr.includes(1.0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0630
     * @tc.name testFloat32ArrayIncludesTWO063
     * @tc.desc Verify the matched-position element value is unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.includes(0b1010);
      expect(arr.$_get(1)).assertEqual(0b1010);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0640
     * @tc.name testFloat32ArrayIncludesTWO064
     * @tc.desc Verify the last element value is unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.includes(-1.0);
      expect(arr.$_get(2)).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0650
     * @tc.name testFloat32ArrayIncludesTWO065
     * @tc.desc Verify the first element value is unchanged after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.includes(99.0);
      expect(arr.$_get(0)).assertEqual(0x10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0660
     * @tc.name testFloat32ArrayIncludesTWO066
     * @tc.desc Verify the NaN element is still NaN after matching NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 1.0, 2.0]);
      arr.includes(NaN);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0670
     * @tc.name testFloat32ArrayIncludesTWO067
     * @tc.desc Verify that element value is unchanged after matching the Float32 maximum finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      arr.includes(3.4028234663852886e+38);
      expect(arr.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0680
     * @tc.name testFloat32ArrayIncludesTWO068
     * @tc.desc Verify that element value is unchanged after matching the smallest positive denormalized number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      arr.includes(1.401298464324817e-45);
      expect(arr.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0690
     * @tc.name testFloat32ArrayIncludesTWO069
     * @tc.desc Verify the non-matched-position element value is unchanged after a match with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.includes(-1.0, 1);
      expect(arr.$_get(1)).assertEqual(0b1010);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0700
     * @tc.name testFloat32ArrayIncludesTWO070
     * @tc.desc Verify the middle element value is unchanged after no match in a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.includes(99.0);
      expect(arr.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0710
     * @tc.name testFloat32ArrayIncludesTWO071
     * @tc.desc Verify the first element value is unchanged after a match with a negative fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.includes(-1.0, -1);
      expect(arr.$_get(0)).assertEqual(0x10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0720
     * @tc.name testFloat32ArrayIncludesTWO072
     * @tc.desc Verify that element value is unchanged after matching 2 to the 24th power
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216]);
      arr.includes(16777216);
      expect(arr.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0730
     * @tc.name testFloat32ArrayIncludesTWO073
     * @tc.desc Verify the first element value is unchanged after multiple includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.includes(0x10);
      arr.includes(0b1010);
      arr.includes(99.0);
      expect(arr.$_get(0)).assertEqual(0x10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0740
     * @tc.name testFloat32ArrayIncludesTWO074
     * @tc.desc Verify that element value is unchanged after matching positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      arr.includes(Infinity);
      expect(arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0750
     * @tc.name testFloat32ArrayIncludesTWO075
     * @tc.desc Verify that element value is unchanged after matching 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0]);
      arr.includes(9.0);
      expect(arr.$_get(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0760
     * @tc.name testFloat32ArrayIncludesTWO076
     * @tc.desc Verify the index 2 element value is unchanged after a match in a 4-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.includes(2.0);
      expect(arr.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0770
     * @tc.name testFloat32ArrayIncludesTWO077
     * @tc.desc Verify that element value is unchanged after matching a scientific notation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1e3]);
      arr.includes(1000.0);
      expect(arr.$_get(0)).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0780
     * @tc.name testFloat32ArrayIncludesTWO078
     * @tc.desc Verify that element value is unchanged after matching the smallest finite negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38]);
      arr.includes(-3.4028234663852886e+38);
      expect(arr.$_get(0)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0790
     * @tc.name testFloat32ArrayIncludesTWO079
     * @tc.desc Verify the last element value is unchanged after a negative fromIndex is clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.includes(4.0, -5);
      expect(arr.$_get(2)).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0800
     * @tc.name testFloat32ArrayIncludesTWO080
     * @tc.desc Verify the middle element value is unchanged after a match in an all-identical array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 5.0, 5.0]);
      arr.includes(5.0);
      expect(arr.$_get(1)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0810
     * @tc.name testFloat32ArrayIncludesTWO081
     * @tc.desc Verify the last element value is unchanged after a match in a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.includes(4.0);
      expect(arr.$_get(5)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0820
     * @tc.name testFloat32ArrayIncludesTWO082
     * @tc.desc Verify the first element value is unchanged after matching a negative value in an array containing negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, -2.0]);
      arr.includes(-2.0);
      expect(arr.$_get(0)).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0830
     * @tc.name testFloat32ArrayIncludesTWO083
     * @tc.desc Verify buffer reference is unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const buf = arr.buffer;
      arr.includes(1.0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0840
     * @tc.name testFloat32ArrayIncludesTWO084
     * @tc.desc Verify buffer capacity byteLength is unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.buffer.byteLength;
      arr.includes(0b1010);
      expect(arr.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0850
     * @tc.name testFloat32ArrayIncludesTWO085
     * @tc.desc Verify buffer reference is unchanged after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const buf = arr.buffer;
      arr.includes(99.0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0860
     * @tc.name testFloat32ArrayIncludesTWO086
     * @tc.desc Verify buffer reference is unchanged after matching NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 1.0]);
      const buf = arr.buffer;
      arr.includes(NaN);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0870
     * @tc.name testFloat32ArrayIncludesTWO087
     * @tc.desc Verify buffer capacity is unchanged after a match with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const before = arr.buffer.byteLength;
      arr.includes(1.0, 1);
      expect(arr.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0880
     * @tc.name testFloat32ArrayIncludesTWO088
     * @tc.desc Verify buffer reference is unchanged after multiple includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const buf = arr.buffer;
      arr.includes(1.0);
      arr.includes(2.0);
      arr.includes(99.0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0890
     * @tc.name testFloat32ArrayIncludesTWO089
     * @tc.desc Verify buffer reference is unchanged after matching the Float32 maximum finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      const buf = arr.buffer;
      arr.includes(3.4028234663852886e+38);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0900
     * @tc.name testFloat32ArrayIncludesTWO090
     * @tc.desc Verify buffer capacity is unchanged after a match in a 4-element array (16 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.buffer.byteLength;
      arr.includes(3.0);
      expect(arr.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0910
     * @tc.name testFloat32ArrayIncludesTWO091
     * @tc.desc Verify buffer reference is unchanged after includes on an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const buf = arr.buffer;
      arr.includes(1.0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0920
     * @tc.name testFloat32ArrayIncludesTWO092
     * @tc.desc Verify buffer reference is unchanged after matching positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity, -Infinity]);
      const buf = arr.buffer;
      arr.includes(Infinity);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0930
     * @tc.name testFloat32ArrayIncludesTWO093
     * @tc.desc Verify buffer reference is unchanged after no match in a 3-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const buf = arr.buffer;
      arr.includes(99.0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0940
     * @tc.name testFloat32ArrayIncludesTWO094
     * @tc.desc Verify buffer reference is unchanged after multiple includes on an array containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 1.0, 2.0]);
      const buf = arr.buffer;
      arr.includes(NaN);
      arr.includes(1.0);
      arr.includes(99.0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0950
     * @tc.name testFloat32ArrayIncludesTWO095
     * @tc.desc Verify shared buffer two views - a match in view a does not affect view b elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      a.$_set(0, 5.0);
      b.$_set(0, 9.0);
      a.includes(5.0);
      expect(b.$_get(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0960
     * @tc.name testFloat32ArrayIncludesTWO096
     * @tc.desc Verify shared buffer two views - view b length is unchanged after includes in view a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      const before = b.length;
      a.includes(1.0);
      expect(b.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0970
     * @tc.name testFloat32ArrayIncludesTWO097
     * @tc.desc Verify original array elements are unchanged after includes on a subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = base.subarray(1, 3);
      view.includes(3.0);
      expect(base.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0980
     * @tc.name testFloat32ArrayIncludesTWO098
     * @tc.desc Verify shared buffer two views - shared buffer capacity is unchanged after includes in view a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      const before = buf.byteLength;
      a.includes(1.0);
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_0990
     * @tc.name testFloat32ArrayIncludesTWO099
     * @tc.desc Verify shared buffer two views - view b byteOffset is unchanged after includes in view a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      const before = b.byteOffset;
      a.includes(1.0);
      expect(b.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_1000
     * @tc.name testFloat32ArrayIncludesTWO100
     * @tc.desc Verify shared buffer three views - includes in a and b respectively does not affect view c elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      const c = new Float32Array(buf, 16, 2);
      a.$_set(0, 1.0);
      b.$_set(0, 2.0);
      c.$_set(0, 3.0);
      a.includes(1.0);
      b.includes(2.0);
      expect(c.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_1010
     * @tc.name testFloat32ArrayIncludesTWO101
     * @tc.desc Verify the first element of the original array is unchanged after includes on a subarray(2) view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const view = base.subarray(2);
      view.includes(5.0);
      expect(base.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_1020
     * @tc.name testFloat32ArrayIncludesTWO102
     * @tc.desc Verify shared buffer two views - view a's own elements are unchanged after a match in view a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      a.$_set(0, 7.0);
      a.includes(7.0);
      expect(a.$_get(0)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_1030
     * @tc.name testFloat32ArrayIncludesTWO103
     * @tc.desc Verify shared buffer two views - includes in view b does not affect view a elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      a.$_set(0, 3.0);
      b.includes(99.0);
      expect(a.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_1040
     * @tc.name testFloat32ArrayIncludesTWO104
     * @tc.desc Verify original array two non-adjacent subarray views - includes in the front view does not affect the rear view elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([10.0, 20.0, 30.0]);
      const v1 = base.subarray(0, 1);
      const v2 = base.subarray(2, 3);
      v1.includes(10.0);
      expect(v2.$_get(0)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_1050
     * @tc.name testFloat32ArrayIncludesTWO105
     * @tc.desc Verify shared buffer two views - view b byteLength is unchanged after view a searches for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      const before = b.byteLength;
      a.includes(NaN);
      expect(b.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_1060
     * @tc.name testFloat32ArrayIncludesTWO106
     * @tc.desc Verify shared buffer two views - both views' elements are unchanged after a and b each match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      a.$_set(0, 2.0);
      b.$_set(0, 3.0);
      a.includes(2.0);
      b.includes(3.0);
      expect(a.$_get(0)).assertEqual(2.0);
      expect(b.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_1070
     * @tc.name testFloat32ArrayIncludesTWO107
     * @tc.desc Verify original array two adjacent subarray views - includes in the front view does not affect the rear view's last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const v1 = base.subarray(0, 2);
      const v2 = base.subarray(2, 4);
      v1.includes(1.0);
      expect(v2.$_get(1)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_1080
     * @tc.name testFloat32ArrayIncludesTWO108
     * @tc.desc Verify shared buffer two views - view b elements are unchanged after view a matches the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      a.$_set(0, 2.0);
      b.$_set(0, 2.0);
      a.includes(2.0);
      expect(b.$_get(0)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESTWO_1090
     * @tc.name testFloat32ArrayIncludesTWO109
     * @tc.desc Verify includes fromIndex on an offset view is relative to the view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesTWO109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const view = parent.subarray(1, 4);
      expect(view.includes(2.0, 1)).assertFalse();
      expect(view.includes(3.0, 1)).assertTrue();
    });

  });
}
