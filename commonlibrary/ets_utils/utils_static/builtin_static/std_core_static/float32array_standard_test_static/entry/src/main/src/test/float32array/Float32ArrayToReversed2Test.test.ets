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

export default function Float32ArrayToReversed2Test(): void {
  describe('Float32ArrayToReversed2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_0100
     * @tc.name testFloat32ArrayToReversedTWO001
     * @tc.desc Verify toReversed returns reversed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.length).assertEqual(3);
      expect(rev.$_get(0)).assertEqual(-1);
      expect(rev.$_get(1)).assertEqual(10);
      expect(rev.$_get(2)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_0200
     * @tc.name testFloat32ArrayToReversedTWO002
     * @tc.desc Verify toReversed keeps the source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(-1);
      expect(rev.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_0300
     * @tc.name testFloat32ArrayToReversedTWO003
     * @tc.desc Verify toReversed returns a Float32Array with reversed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(-1);
      expect(rev.$_get(2)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_0400
     * @tc.name testFloat32ArrayToReversedTWO004
     * @tc.desc Verify The BYTES_PER_ELEMENT of the toReversed return value is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_0500
     * @tc.name testFloat32ArrayToReversedTWO005
     * @tc.desc Verify toReversed on a from-constructed array returns reversed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([1.0, 2.0, 3.0]);
      const rev = arr.toReversed();
      expect(rev.length).assertEqual(3);
      expect(rev.$_get(0)).assertEqual(3);
      expect(rev.$_get(1)).assertEqual(2);
      expect(rev.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_0600
     * @tc.name testFloat32ArrayToReversedTWO006
     * @tc.desc Verify toReversed on an offset view returns reversed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.$_set(0, 0x10);
      arr.$_set(1, 0b1010);
      arr.$_set(2, -1.0);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(-1);
      expect(rev.$_get(1)).assertEqual(10);
      expect(rev.$_get(2)).assertEqual(16);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_0700
     * @tc.name testFloat32ArrayToReversedTWO007
     * @tc.desc Verify toReversed on a subarray view returns reversed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = base.subarray(1, 3);
      const rev = view.toReversed();
      expect(rev.length).assertEqual(2);
      expect(rev.$_get(0)).assertEqual(3);
      expect(rev.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_0800
     * @tc.name testFloat32ArrayToReversedTWO008
     * @tc.desc Verify toReversed return length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_0900
     * @tc.name testFloat32ArrayToReversedTWO009
     * @tc.desc Verify toReversed return byteLength equals source byteLength for an offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      const rev = arr.toReversed();
      expect(rev.byteLength).assertEqual(arr.byteLength);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_1000
     * @tc.name testFloat32ArrayToReversedTWO010
     * @tc.desc Verify After reversing a two-element array, the first element is the original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_1100
     * @tc.name testFloat32ArrayToReversedTWO011
     * @tc.desc Verify After reversing a two-element array, the last element is the original first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_1200
     * @tc.name testFloat32ArrayToReversedTWO012
     * @tc.desc Verify toReversed return value is not the source array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const rev = arr.toReversed();
      expect(rev === arr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_1300
     * @tc.name testFloat32ArrayToReversedTWO013
     * @tc.desc Verify After reversing an array of identical elements, the first element is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 7.0, 7.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_1400
     * @tc.name testFloat32ArrayToReversedTWO014
     * @tc.desc Verify After reversing an array containing negative values, the first element is the original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, -2.0, -3.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(-3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_1500
     * @tc.name testFloat32ArrayToReversedTWO015
     * @tc.desc Verify After reversing an array containing negative values, the last element is the original first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, -2.0, -3.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(2)).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_1600
     * @tc.name testFloat32ArrayToReversedTWO016
     * @tc.desc Verify NaN at the last position falls to the first position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, NaN]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_1700
     * @tc.name testFloat32ArrayToReversedTWO017
     * @tc.desc Verify NaN at the first position falls to the last position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 1.0, 2.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_1800
     * @tc.name testFloat32ArrayToReversedTWO018
     * @tc.desc Verify After reversing an array containing Infinity, Infinity falls to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity, 1.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_1900
     * @tc.name testFloat32ArrayToReversedTWO019
     * @tc.desc Verify After reversing an array containing -Infinity, -Infinity falls to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity, 1.0, 2.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(2)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_2000
     * @tc.name testFloat32ArrayToReversedTWO020
     * @tc.desc Verify After reversing an array containing -0, the sign of -0 is preserved (1/x is -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, -0.0]);
      const rev = arr.toReversed();
      expect(1.0 / rev.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_2100
     * @tc.name testFloat32ArrayToReversedTWO021
     * @tc.desc Verify After reversing float32 precision values, the first element equals the original last stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1, 0.2, 0.3]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_2200
     * @tc.name testFloat32ArrayToReversedTWO022
     * @tc.desc Verify After reversing, the float32 largest finite value is preserved at the first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 3.4028234663852886e+38]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_2300
     * @tc.name testFloat32ArrayToReversedTWO023
     * @tc.desc Verify After reversing, the float32 smallest positive subnormal number is preserved at the first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.401298464324817e-45]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_2400
     * @tc.name testFloat32ArrayToReversedTWO024
     * @tc.desc Verify The 2^24+1 truncated value, after reversing, equals the original last stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216, 16777217]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(arr.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_2500
     * @tc.name testFloat32ArrayToReversedTWO025
     * @tc.desc Verify After reversing octal and binary literal elements, the first element is the binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0o17, 0b101]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(0b101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_2600
     * @tc.name testFloat32ArrayToReversedTWO026
     * @tc.desc Verify After reversing scientific notation elements, the first element is the original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e3, 2.0e3]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(2.0e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_2700
     * @tc.name testFloat32ArrayToReversedTWO027
     * @tc.desc Verify The out-of-range value 1.0e40, truncated to Infinity, falls to the last position after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40, 1.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_2800
     * @tc.name testFloat32ArrayToReversedTWO028
     * @tc.desc Verify After reversing a four-element array, the last element is the original first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(3)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_2900
     * @tc.name testFloat32ArrayToReversedTWO029
     * @tc.desc Verify After reversing a five-element array, the middle element position is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const rev = arr.toReversed();
      expect(rev.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_3000
     * @tc.name testFloat32ArrayToReversedTWO030
     * @tc.desc Verify After reversing, the sum of the array equals the sum of the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const rev = arr.toReversed();
      let s1: number = 0;
      let s2: number = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        s1 += v;
      }
      for (let __f32i = 0; __f32i < rev.length; __f32i++) {
        const v = rev.$_get(__f32i);
        s2 += v;
      }
      expect(s2).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_3100
     * @tc.name testFloat32ArrayToReversedTWO031
     * @tc.desc Verify After reversing, reading via at(-1) gives the original first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.at(-1)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_3200
     * @tc.name testFloat32ArrayToReversedTWO032
     * @tc.desc Verify After reversing, reading via at(0) gives the original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.at(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_3300
     * @tc.name testFloat32ArrayToReversedTWO033
     * @tc.desc Verify After reversing an array containing decimal elements, the first element is the original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_3400
     * @tc.name testFloat32ArrayToReversedTWO034
     * @tc.desc Verify A single decimal element is unchanged after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.5]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_3500
     * @tc.name testFloat32ArrayToReversedTWO035
     * @tc.desc Verify After reversing an array containing two-decimal-place elements, the first element is the original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([100.25, 200.75]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(200.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_3600
     * @tc.name testFloat32ArrayToReversedTWO036
     * @tc.desc Verify After reversing a from-constructed array, the last element is the original first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([1.0, 2.0, 3.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(2)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_3700
     * @tc.name testFloat32ArrayToReversedTWO037
     * @tc.desc Verify After reversing a from-constructed array, NaN at the last position becomes the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([0x10, 0b1010, NaN]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_3800
     * @tc.name testFloat32ArrayToReversedTWO038
     * @tc.desc Verify After reversing a three-element array, byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_3900
     * @tc.name testFloat32ArrayToReversedTWO039
     * @tc.desc Verify After reversing an empty array, byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      const rev = arr.toReversed();
      expect(rev.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_4000
     * @tc.name testFloat32ArrayToReversedTWO040
     * @tc.desc Verify After reversing, length equals the original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const rev = arr.toReversed();
      expect(rev.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_4100
     * @tc.name testFloat32ArrayToReversedTWO041
     * @tc.desc Verify After reversing, byteLength equals the original array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_4200
     * @tc.name testFloat32ArrayToReversedTWO042
     * @tc.desc Verify After reversing a subarray view, length equals the view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = base.subarray(1, 3);
      const rev = view.toReversed();
      expect(rev.length).assertEqual(view.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_4300
     * @tc.name testFloat32ArrayToReversedTWO043
     * @tc.desc Verify After reversing, buffer.byteLength equals byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.buffer.byteLength).assertEqual(rev.byteLength);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_4400
     * @tc.name testFloat32ArrayToReversedTWO044
     * @tc.desc Verify After reversing, the first element of the original array remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(-1);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_4500
     * @tc.name testFloat32ArrayToReversedTWO045
     * @tc.desc Verify After reversing, the last element of the original array remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.$_get(2)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_4600
     * @tc.name testFloat32ArrayToReversedTWO046
     * @tc.desc Verify After reversing, the length of the original array remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.length).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_4700
     * @tc.name testFloat32ArrayToReversedTWO047
     * @tc.desc Verify After reversing, the byteLength of the original array remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.byteLength).assertEqual(12);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_4800
     * @tc.name testFloat32ArrayToReversedTWO048
     * @tc.desc Verify After reversing, the middle element of the original array remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_4900
     * @tc.name testFloat32ArrayToReversedTWO049
     * @tc.desc Verify After reversing, the original array and the returned array satisfy the reversal relationship at corresponding positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(arr.$_get(0)).assertEqual(rev.$_get(2));
      expect(arr.$_get(2)).assertEqual(rev.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_5000
     * @tc.name testFloat32ArrayToReversedTWO050
     * @tc.desc Verify After reversing a single-element array, the original array element is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(5.0);
      expect(arr.$_get(0)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_5100
     * @tc.name testFloat32ArrayToReversedTWO051
     * @tc.desc Verify After reversing an empty array, the original array length is still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      const rev = arr.toReversed();
      expect(rev.length).assertEqual(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_5200
     * @tc.name testFloat32ArrayToReversedTWO052
     * @tc.desc Verify After reversing, the original array can still be iterated in original order to compute the sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const rev = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(4.0);
      let s: number = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        s += v;
      }
      expect(s).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_5300
     * @tc.name testFloat32ArrayToReversedTWO053
     * @tc.desc Verify After two reverse calls, the original array remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const r1 = arr.toReversed();
      const r2 = arr.toReversed();
      expect(arr.$_get(0)).assertEqual(16);
      expect(r1.$_get(0)).assertEqual(-1);
      expect(r2.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_5400
     * @tc.name testFloat32ArrayToReversedTWO054
     * @tc.desc Verify After reversing, the byteOffset of the original view remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const arr = base.subarray(1, 3);
      const rev = arr.toReversed();
      expect(arr.byteOffset).assertEqual(4);
      expect(rev.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_5500
     * @tc.name testFloat32ArrayToReversedTWO055
     * @tc.desc Verify After reversing, the buffer.byteLength of the original array remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.buffer.byteLength).assertEqual(12);
      expect(arr.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_5600
     * @tc.name testFloat32ArrayToReversedTWO056
     * @tc.desc Verify toReversed returns a new object (modifying the first element of the returned array does not affect the original array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      rev.$_set(0, 999.0);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_5700
     * @tc.name testFloat32ArrayToReversedTWO057
     * @tc.desc Verify toReversed returns a new object (modifying the middle element of the returned array does not affect the original array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      rev.$_set(1, 555.0);
      expect(arr.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_5800
     * @tc.name testFloat32ArrayToReversedTWO058
     * @tc.desc Verify Double reversing restores the original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev2 = arr.toReversed().toReversed();
      expect(rev2.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_5900
     * @tc.name testFloat32ArrayToReversedTWO059
     * @tc.desc Verify The double-reversed result is a new array (modifications do not affect the original array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev2 = arr.toReversed().toReversed();
      rev2.$_set(2, 888.0);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_6000
     * @tc.name testFloat32ArrayToReversedTWO060
     * @tc.desc Verify Triple reversing is equivalent to a single reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev3 = arr.toReversed().toReversed().toReversed();
      expect(rev3.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_6100
     * @tc.name testFloat32ArrayToReversedTWO061
     * @tc.desc Verify Chained toReversed().at(0) returns the last element of the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.toReversed().at(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_6200
     * @tc.name testFloat32ArrayToReversedTWO062
     * @tc.desc Verify The reversed result does not share buffer with the original array (modifying the last element of the returned array does not affect the original array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      rev.$_set(2, 777.0);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_6300
     * @tc.name testFloat32ArrayToReversedTWO063
     * @tc.desc Verify The reversed result does not share buffer with the original array (modifying the original array does not affect the returned array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      arr.$_set(0, 444.0);
      expect(rev.$_get(2)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_6400
     * @tc.name testFloat32ArrayToReversedTWO064
     * @tc.desc Verify The buffer of the reversed result is an ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      expect(rev.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_6500
     * @tc.name testFloat32ArrayToReversedTWO065
     * @tc.desc Verify The buffer.byteLength of the reversed result equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const rev = arr.toReversed();
      expect(rev.buffer.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_6600
     * @tc.name testFloat32ArrayToReversedTWO066
     * @tc.desc Verify The reversed result of a subarray view has an independent buffer (byteOffset is 0 and differs from the view)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = base.subarray(1, 3);
      const rev = view.toReversed();
      expect(rev.byteOffset).assertEqual(0);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_6700
     * @tc.name testFloat32ArrayToReversedTWO067
     * @tc.desc Verify After modifying the reversed result, reversing the original array again yields a brand-new copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const r1 = arr.toReversed();
      r1.$_set(0, 999.0);
      const r2 = arr.toReversed();
      expect(r2.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_6800
     * @tc.name testFloat32ArrayToReversedTWO068
     * @tc.desc Verify The reversed result buffer and the original array buffer are different references (modifying the middle element of the original array does not affect the result)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      arr.$_set(1, 666.0);
      expect(rev.$_get(1)).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_REVERSEDTWO_6900
     * @tc.name testFloat32ArrayToReversedTWO069
     * @tc.desc Verify toReversed on an offset view returns a compact independent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToReversedTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const view = parent.subarray(1, 4);
      const reversed = view.toReversed();
      expect(reversed.byteOffset).assertEqual(0);
      reversed.$_set(0, 99.0);
      expect(parent.$_get(3)).assertEqual(4.0);
    });

  });
}
