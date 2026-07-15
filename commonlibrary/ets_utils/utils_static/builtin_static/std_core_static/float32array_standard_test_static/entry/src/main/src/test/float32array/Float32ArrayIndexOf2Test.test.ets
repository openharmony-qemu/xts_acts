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

export default function Float32ArrayIndexOf2Test(): void {
  describe('Float32ArrayIndexOf2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0010
     * @tc.name testFloat32ArrayIndexOfTWO001
     * @tc.desc Verify indexOf finds a negative business special value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.0, -1.0, 99.99);
      const r = a.indexOf(-1.0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0020
     * @tc.name testFloat32ArrayIndexOfTWO002
     * @tc.desc Verify indexOf does not find an absent hexadecimal literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(4.0, 5.0, 6.0);
      const r = a.indexOf(0x10);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0030
     * @tc.name testFloat32ArrayIndexOfTWO003
     * @tc.desc Verify indexOf on an empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const r = a.indexOf(1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0040
     * @tc.name testFloat32ArrayIndexOfTWO004
     * @tc.desc Verify indexOf finds a binary literal in a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0b1010);
      const r = a.indexOf(0b1010);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0050
     * @tc.name testFloat32ArrayIndexOfTWO005
     * @tc.desc Verify indexOf with NaN search value returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(NaN, 1.0, 2.0);
      const r = a.indexOf(NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0060
     * @tc.name testFloat32ArrayIndexOfTWO006
     * @tc.desc Verify indexOf finds Infinity in an ArrayBuffer offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const a = new Float32Array(buf, 4, 2);
      a.$_set(0, Infinity);
      const r = a.indexOf(Infinity);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0070
     * @tc.name testFloat32ArrayIndexOfTWO007
     * @tc.desc Verify indexOf accepts a number search value and an int fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 0.0, 2.0);
      const search: number = 0.0;
      const fromIndex: int = 1;
      const r = a.indexOf(search, fromIndex);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0080
     * @tc.name testFloat32ArrayIndexOfTWO008
     * @tc.desc Verify indexOf with an int fromIndex skips earlier matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 2.0, 3.0, 2.0, 1.0);
      const fromIndex: int = 2;
      const r = a.indexOf(2, fromIndex);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0090
     * @tc.name testFloat32ArrayIndexOfTWO009
     * @tc.desc Verify indexOf with an int zero fromIndex starts at the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      const fromIndex: int = 0;
      const r = a.indexOf(0x10, fromIndex);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0100
     * @tc.name testFloat32ArrayIndexOfTWO010
     * @tc.desc Verify indexOf with a negative int fromIndex normalizes from the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const fromIndex: int = -2;
      const r = a.indexOf(3, fromIndex);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0110
     * @tc.name testFloat32ArrayIndexOfTWO011
     * @tc.desc Verify indexOf finds a value in an offset view array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 4, 3);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      const r = a.indexOf(3);
      expect(r).assertEqual(2);
      expect(a.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0120
     * @tc.name testFloat32ArrayIndexOfTWO012
     * @tc.desc Verify indexOf finds Float32.MAX from a Float32Array.from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.from([3.4028234663852886e+38, 1.0]);
      const r = a.indexOf(3.4028234663852886e+38);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0130
     * @tc.name testFloat32ArrayIndexOfTWO013
     * @tc.desc Verify indexOf finds MIN_VALUE in an offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf, 0, 2);
      a.$_set(1, 1.401298464324817e-45);
      const r = a.indexOf(1.401298464324817e-45);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0140
     * @tc.name testFloat32ArrayIndexOfTWO014
     * @tc.desc Verify indexOf treats negative zero search value as matching positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.0, 1.0);
      const search: number = -0.0;
      const r = a.indexOf(search);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0150
     * @tc.name testFloat32ArrayIndexOfTWO015
     * @tc.desc Verify indexOf with an out-of-bounds int fromIndex returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      const fromIndex: int = 10;
      const r = a.indexOf(0x10, fromIndex);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0160
     * @tc.name testFloat32ArrayIndexOfTWO016
     * @tc.desc Verify the return value is not a Float32Array instance when found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      const r = a.indexOf(0b1010);
      expect(r instanceof Float32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0170
     * @tc.name testFloat32ArrayIndexOfTWO017
     * @tc.desc Verify the return value is not a Float32Array instance when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      const r = a.indexOf(99);
      expect(r instanceof Float32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0180
     * @tc.name testFloat32ArrayIndexOfTWO018
     * @tc.desc Verify the return value is a primitive number that can participate in arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      const r = a.indexOf(0b1010);
      expect(r + 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0190
     * @tc.name testFloat32ArrayIndexOfTWO019
     * @tc.desc Verify indexOf finds the first element and returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(4.0, 5.0, 6.0);
      expect(a.indexOf(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0200
     * @tc.name testFloat32ArrayIndexOfTWO020
     * @tc.desc Verify indexOf finds the second element and returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(4.0, 5.0, 6.0);
      expect(a.indexOf(5)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0210
     * @tc.name testFloat32ArrayIndexOfTWO021
     * @tc.desc Verify indexOf finds the last element and returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(4.0, 5.0, 6.0);
      expect(a.indexOf(6)).assertEqual(a.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0220
     * @tc.name testFloat32ArrayIndexOfTWO022
     * @tc.desc Verify indexOf finds the middle element and returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      expect(a.indexOf(30)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0230
     * @tc.name testFloat32ArrayIndexOfTWO023
     * @tc.desc Verify the first occurrence of a duplicate element is at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 2.0, 5.0, 5.0);
      expect(a.indexOf(5)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0240
     * @tc.name testFloat32ArrayIndexOfTWO024
     * @tc.desc Verify all identical elements return 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(7.0, 7.0, 7.0, 7.0, 7.0);
      expect(a.indexOf(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0250
     * @tc.name testFloat32ArrayIndexOfTWO025
     * @tc.desc Verify a single-element array finds the element and returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(9.0);
      expect(a.indexOf(9)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0260
     * @tc.name testFloat32ArrayIndexOfTWO026
     * @tc.desc Verify a two-element array finds the second element and returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(3.0, 8.0);
      expect(a.indexOf(8)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0270
     * @tc.name testFloat32ArrayIndexOfTWO027
     * @tc.desc Verify fromIndex of 0 returns the same value as the default call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      expect(a.indexOf(0b1010, 0)).assertEqual(a.indexOf(0b1010));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0280
     * @tc.name testFloat32ArrayIndexOfTWO028
     * @tc.desc Verify fromIndex equals the element index and returns that index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      expect(a.indexOf(3, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0290
     * @tc.name testFloat32ArrayIndexOfTWO029
     * @tc.desc Verify fromIndex is the element index minus 1 and returns that index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      expect(a.indexOf(3, 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0300
     * @tc.name testFloat32ArrayIndexOfTWO030
     * @tc.desc Verify fromIndex is the element index plus 1, skips the first occurrence and returns the next occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 2.0, 3.0, 2.0, 4.0);
      expect(a.indexOf(2, 2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0310
     * @tc.name testFloat32ArrayIndexOfTWO031
     * @tc.desc Verify a negative fromIndex normalizes and finds the element, returning the correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      expect(a.indexOf(0.0, -2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0320
     * @tc.name testFloat32ArrayIndexOfTWO032
     * @tc.desc Verify the element is at index 0 and a negative fromIndex out of bounds normalizes to 0, finds the element and returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(9.0, 8.0, 7.0);
      expect(a.indexOf(9, -10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0330
     * @tc.name testFloat32ArrayIndexOfTWO033
     * @tc.desc Verify indexOf finds Float32.MAX and returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 3.4028234663852886e+38, 2.0);
      expect(a.indexOf(3.4028234663852886e+38)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0340
     * @tc.name testFloat32ArrayIndexOfTWO034
     * @tc.desc Verify indexOf finds MIN_VALUE and returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 1.401298464324817e-45, 2.0);
      expect(a.indexOf(1.401298464324817e-45)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0350
     * @tc.name testFloat32ArrayIndexOfTWO035
     * @tc.desc Verify indexOf finds +0 and returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 0.0, 2.0);
      expect(a.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0360
     * @tc.name testFloat32ArrayIndexOfTWO036
     * @tc.desc Verify the array contains -0, searching for +0 returns its index (+0 equals -0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, -0.0, 2.0);
      expect(a.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0370
     * @tc.name testFloat32ArrayIndexOfTWO037
     * @tc.desc Verify the array contains +0, searching for -0 returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 0.0, 2.0);
      expect(a.indexOf(-0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0380
     * @tc.name testFloat32ArrayIndexOfTWO038
     * @tc.desc Verify indexOf finds Infinity and returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, Infinity, 2.0);
      expect(a.indexOf(Infinity)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0390
     * @tc.name testFloat32ArrayIndexOfTWO039
     * @tc.desc Verify indexOf finds -Infinity and returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, -Infinity, 2.0);
      expect(a.indexOf(-Infinity)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0400
     * @tc.name testFloat32ArrayIndexOfTWO040
     * @tc.desc Verify indexOf finds 0.1 and returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.1, 0.2, 0.3);
      expect(a.indexOf(Math.fround(0.1))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0410
     * @tc.name testFloat32ArrayIndexOfTWO041
     * @tc.desc Verify indexOf finds the exact integer 2^24 and returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 16777216.0, 2.0);
      expect(a.indexOf(16777216)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0420
     * @tc.name testFloat32ArrayIndexOfTWO042
     * @tc.desc Verify indexOf finds the hexadecimal integer 0x10 literal and returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 0x10, 2.0);
      expect(a.indexOf(0x10)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0430
     * @tc.name testFloat32ArrayIndexOfTWO043
     * @tc.desc Verify indexOf finds the octal 0o17 literal and returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 0o17, 2.0);
      expect(a.indexOf(0o17)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0440
     * @tc.name testFloat32ArrayIndexOfTWO044
     * @tc.desc Verify indexOf finds the binary 0b1010 literal and returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 0b1010, 2.0);
      expect(a.indexOf(0b1010)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0450
     * @tc.name testFloat32ArrayIndexOfTWO045
     * @tc.desc Verify indexOf finds the scientific notation 1.0e3 and returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 1.0e3, 2.0);
      expect(a.indexOf(1.0e3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0460
     * @tc.name testFloat32ArrayIndexOfTWO046
     * @tc.desc Verify fromIndex skips the first occurrence and returns the second occurrence index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(2.0, 1.0, 2.0, 1.0, 2.0);
      expect(a.indexOf(2, 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0470
     * @tc.name testFloat32ArrayIndexOfTWO047
     * @tc.desc Verify element not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      expect(a.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0480
     * @tc.name testFloat32ArrayIndexOfTWO048
     * @tc.desc Verify the array contains NaN, searching for NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(NaN, 1.0, 2.0);
      expect(a.indexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0490
     * @tc.name testFloat32ArrayIndexOfTWO049
     * @tc.desc Verify fromIndex equals length returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      expect(a.indexOf(0x10, 3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0500
     * @tc.name testFloat32ArrayIndexOfTWO050
     * @tc.desc Verify fromIndex greater than length returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      expect(a.indexOf(0x10, 5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0510
     * @tc.name testFloat32ArrayIndexOfTWO051
     * @tc.desc Verify fromIndex is a huge positive number returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      expect(a.indexOf(0x10, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0520
     * @tc.name testFloat32ArrayIndexOfTWO052
     * @tc.desc Verify fromIndex is -length-1, normalizes to 0 but the element is not found, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      expect(a.indexOf(9, -4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0530
     * @tc.name testFloat32ArrayIndexOfTWO053
     * @tc.desc Verify searching for a value greater than all elements returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      expect(a.indexOf(100)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0540
     * @tc.name testFloat32ArrayIndexOfTWO054
     * @tc.desc Verify searching for a value less than all elements returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      expect(a.indexOf(-100)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0550
     * @tc.name testFloat32ArrayIndexOfTWO055
     * @tc.desc Verify fromIndex exceeds the last occurrence returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 2.0, 1.0, 2.0, 1.0);
      expect(a.indexOf(1, 5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0560
     * @tc.name testFloat32ArrayIndexOfTWO056
     * @tc.desc Verify a finite array searching for Infinity returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      expect(a.indexOf(Infinity)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0570
     * @tc.name testFloat32ArrayIndexOfTWO057
     * @tc.desc Verify a positive array searching for -Infinity returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      expect(a.indexOf(-Infinity)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0580
     * @tc.name testFloat32ArrayIndexOfTWO058
     * @tc.desc Verify stores 1.0000001, searching for 1.0 returns -1 due to float32 precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0000001);
      expect(a.indexOf(1.0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0590
     * @tc.name testFloat32ArrayIndexOfTWO059
     * @tc.desc Verify stores 2^24+1 truncated to 16777216, searching for the stored value finds it at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(16777217.0);
      expect(a.indexOf(a[0])).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0600
     * @tc.name testFloat32ArrayIndexOfTWO060
     * @tc.desc Verify stores 1.0e40 (overflows to Infinity), searching for 1.0e40 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0e40);
      expect(a.indexOf(1.0e40)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0610
     * @tc.name testFloat32ArrayIndexOfTWO061
     * @tc.desc Verify stores 1.0e-46 (underflows to +0), searching for 1.0e-46 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0e-46);
      expect(a.indexOf(1.0e-46)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0620
     * @tc.name testFloat32ArrayIndexOfTWO062
     * @tc.desc Verify a single-element array searching for a different value returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(5.0);
      expect(a.indexOf(6)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0630
     * @tc.name testFloat32ArrayIndexOfTWO063
     * @tc.desc Verify fromIndex is the element index plus 1 and there is only one occurrence, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      expect(a.indexOf(0b1010, 2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0640
     * @tc.name testFloat32ArrayIndexOfTWO064
     * @tc.desc Verify stores 1.1, searching for 1.0000001 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.1);
      expect(a.indexOf(1.0000001)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0650
     * @tc.name testFloat32ArrayIndexOfTWO065
     * @tc.desc Verify multiple NaN searching for NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(NaN, NaN, NaN);
      expect(a.indexOf(NaN)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0660
     * @tc.name testFloat32ArrayIndexOfTWO066
     * @tc.desc Verify NaN at the last position, searching for NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 2.0, NaN);
      expect(a.indexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0670
     * @tc.name testFloat32ArrayIndexOfTWO067
     * @tc.desc Verify contains NaN, searching for NaN with fromIndex returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, NaN, 3.0);
      expect(a.indexOf(NaN, 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0680
     * @tc.name testFloat32ArrayIndexOfTWO068
     * @tc.desc Verify contains NaN, searching for NaN with a negative fromIndex returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, NaN, 3.0);
      expect(a.indexOf(NaN, -2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0690
     * @tc.name testFloat32ArrayIndexOfTWO069
     * @tc.desc Verify the array contains -0, searching for -0 returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, -0.0, 2.0);
      expect(a.indexOf(-0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0700
     * @tc.name testFloat32ArrayIndexOfTWO070
     * @tc.desc Verify the array contains +0 and -0, searching for +0 returns the first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-0.0, 0.0, 1.0);
      expect(a.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0710
     * @tc.name testFloat32ArrayIndexOfTWO071
     * @tc.desc Verify stores 2^24+1 (truncated to 2^24), searching for 2^24 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(16777217.0);
      expect(a.indexOf(16777216)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0720
     * @tc.name testFloat32ArrayIndexOfTWO072
     * @tc.desc Verify stores 1.0e40 (overflows to Infinity), searching for Infinity returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0e40);
      expect(a.indexOf(Infinity)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0730
     * @tc.name testFloat32ArrayIndexOfTWO073
     * @tc.desc Verify stores 1.0e-46 (underflows to +0), searching for 0 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0e-46);
      expect(a.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0740
     * @tc.name testFloat32ArrayIndexOfTWO074
     * @tc.desc Verify stores -1.0e40 (overflows to -Infinity), searching for -Infinity returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-1.0e40);
      expect(a.indexOf(-Infinity)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0750
     * @tc.name testFloat32ArrayIndexOfTWO075
     * @tc.desc Verify length is unchanged after finding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      const before = a.length;
      a.indexOf(0b1010);
      expect(a.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0760
     * @tc.name testFloat32ArrayIndexOfTWO076
     * @tc.desc Verify length is unchanged after not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      const before = a.length;
      a.indexOf(99);
      expect(a.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0770
     * @tc.name testFloat32ArrayIndexOfTWO077
     * @tc.desc Verify byteLength is unchanged after finding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      const before = a.byteLength;
      a.indexOf(0b1010);
      expect(a.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0780
     * @tc.name testFloat32ArrayIndexOfTWO078
     * @tc.desc Verify byteLength is unchanged after not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      const before = a.byteLength;
      a.indexOf(99);
      expect(a.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0790
     * @tc.name testFloat32ArrayIndexOfTWO079
     * @tc.desc Verify byteLength is unchanged with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const before = a.byteLength;
      a.indexOf(2, 2);
      expect(a.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0800
     * @tc.name testFloat32ArrayIndexOfTWO080
     * @tc.desc Verify view array byteOffset is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const a = new Float32Array(buf, 4, 3);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      const before = a.byteOffset;
      a.indexOf(2);
      expect(a.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0810
     * @tc.name testFloat32ArrayIndexOfTWO081
     * @tc.desc Verify view array length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const a = new Float32Array(buf, 8, 2);
      a.$_set(0, 1);
      a.$_set(1, 2);
      const before = a.length;
      a.indexOf(2);
      expect(a.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0820
     * @tc.name testFloat32ArrayIndexOfTWO082
     * @tc.desc Verify underlying buffer.byteLength is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      const before = a.buffer.byteLength;
      a.indexOf(0b1010);
      expect(a.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0830
     * @tc.name testFloat32ArrayIndexOfTWO083
     * @tc.desc Verify after indexOf on an empty array length is still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      a.indexOf(1);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0840
     * @tc.name testFloat32ArrayIndexOfTWO084
     * @tc.desc Verify view array byteLength is unchanged (with offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const a = new Float32Array(buf, 4, 4);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      const before = a.byteLength;
      a.indexOf(3);
      expect(a.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0850
     * @tc.name testFloat32ArrayIndexOfTWO085
     * @tc.desc Verify the first element value is unchanged after finding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      a.indexOf(0b1010);
      expect(a.$_get(0)).assertEqual(0x10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0860
     * @tc.name testFloat32ArrayIndexOfTWO086
     * @tc.desc Verify the first element value is unchanged after not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      a.indexOf(99);
      expect(a.$_get(0)).assertEqual(0x10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0870
     * @tc.name testFloat32ArrayIndexOfTWO087
     * @tc.desc Verify the middle element value is unchanged with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      a.indexOf(3, 1);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0880
     * @tc.name testFloat32ArrayIndexOfTWO088
     * @tc.desc Verify the element value is unchanged after searching for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(NaN, 1.0, 2.0);
      a.indexOf(NaN);
      expect(a.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0890
     * @tc.name testFloat32ArrayIndexOfTWO089
     * @tc.desc Verify the element value is unchanged after searching for Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(3.4028234663852886e+38, 1.0);
      a.indexOf(3.4028234663852886e+38);
      expect(a.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0900
     * @tc.name testFloat32ArrayIndexOfTWO090
     * @tc.desc Verify the element value is unchanged after searching for -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-0.0, 1.0);
      a.indexOf(-0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0910
     * @tc.name testFloat32ArrayIndexOfTWO091
     * @tc.desc Verify the last element at(-1) is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      a.indexOf(0b1010);
      expect(a.at(-1)).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0920
     * @tc.name testFloat32ArrayIndexOfTWO092
     * @tc.desc Verify iterator content is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      a.indexOf(0b1010);
      const it = a.values();
      expect(it.next().value).assertEqual(0x10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0930
     * @tc.name testFloat32ArrayIndexOfTWO093
     * @tc.desc Verify the element value is unchanged after fromIndex is out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 0b1010, -1.0);
      a.indexOf(0x10, 10);
      expect(a.$_get(0)).assertEqual(0x10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0940
     * @tc.name testFloat32ArrayIndexOfTWO094
     * @tc.desc Verify after indexOf on a view array byteOffset is still 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const a = new Float32Array(buf, 4, 3);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.indexOf(2);
      expect(a.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0950
     * @tc.name testFloat32ArrayIndexOfTWO095
     * @tc.desc Verify after indexOf on a view array byteLength is still 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const a = new Float32Array(buf, 4, 3);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.indexOf(2);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0960
     * @tc.name testFloat32ArrayIndexOfTWO096
     * @tc.desc Verify with a shared buffer, after view A searches view B data is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      a.$_set(0, 1);
      a.$_set(1, 2);
      b.$_set(0, 3);
      b.$_set(1, 4);
      a.indexOf(2);
      expect(b.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0970
     * @tc.name testFloat32ArrayIndexOfTWO097
     * @tc.desc Verify with a shared buffer, after view B searches view A data is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      a.$_set(0, 1);
      a.$_set(1, 2);
      b.$_set(0, 3);
      b.$_set(1, 4);
      b.indexOf(3);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0980
     * @tc.name testFloat32ArrayIndexOfTWO098
     * @tc.desc Verify offset view indexOf returns the index relative to the view start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const a = new Float32Array(buf, 8, 3);
      a.$_set(0, 10);
      a.$_set(1, 20);
      a.$_set(2, 30);
      expect(a.indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_0990
     * @tc.name testFloat32ArrayIndexOfTWO099
     * @tc.desc Verify subarray shares buffer, after the original array searches the subarray view data is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const sub = base.subarray(1, 4);
      base.indexOf(-1.0);
      expect(sub.$_get(0)).assertEqual(0b1010);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_1000
     * @tc.name testFloat32ArrayIndexOfTWO100
     * @tc.desc Verify after the subarray view searches the original array data is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const sub = base.subarray(1, 4);
      sub.indexOf(3);
      expect(base.$_get(2)).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_1010
     * @tc.name testFloat32ArrayIndexOfTWO101
     * @tc.desc Verify with a shared buffer the underlying byteLength is unchanged after searching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const a = new Float32Array(buf, 4, 3);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.indexOf(2);
      expect(buf.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_1020
     * @tc.name testFloat32ArrayIndexOfTWO102
     * @tc.desc Verify a view array searching not found returns -1 and the buffer reference is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 4);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      const r = a.indexOf(99);
      expect(r).assertEqual(-1);
      expect(a.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_OFTWO_1030
     * @tc.name testFloat32ArrayIndexOfTWO103
     * @tc.desc Verify indexOf on an offset view returns the view-local index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexOfTWO103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const view = parent.subarray(1, 4);
      expect(view.indexOf(3.0)).assertEqual(1);
    });

  });
}
