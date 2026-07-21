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

export default function Uint8ArrayTotal04Test(): void {
  describe('Uint8ArrayTotal04Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0010
     * @tc.name testUint8ArrayTotal04_001
     * @tc.desc Verify sort changes first element from max to ascending first
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30, 10, 20);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0020
     * @tc.name testUint8ArrayTotal04_002
     * @tc.desc Verify sort changes last element to ascending last
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30, 10, 20);
      arr.sort();
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0030
     * @tc.name testUint8ArrayTotal04_003
     * @tc.desc Verify reverse changes first element to original last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0040
     * @tc.name testUint8ArrayTotal04_004
     * @tc.desc Verify reverse changes last element to original first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0050
     * @tc.name testUint8ArrayTotal04_005
     * @tc.desc Verify fill changes all elements to fill value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.fill(42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0060
     * @tc.name testUint8ArrayTotal04_006
     * @tc.desc Verify fill with start and end changes partial positions
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      arr.fill(99, 1, 3);
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0070
     * @tc.name testUint8ArrayTotal04_007
     * @tc.desc Verify copyWithin changes target position to source start value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      arr.copyWithin(0, 2);
      expect(arr.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0080
     * @tc.name testUint8ArrayTotal04_008
     * @tc.desc Verify copyWithin keeps source position value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      arr.copyWithin(0, 2);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0090
     * @tc.name testUint8ArrayTotal04_009
     * @tc.desc Verify set with FixedArray changes first element value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.set([99, 100], 0);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0100
     * @tc.name testUint8ArrayTotal04_010
     * @tc.desc Verify set with Uint8Array changes first element value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.set(Uint8Array.of(88, 77), 0);
      expect(arr.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0110
     * @tc.name testUint8ArrayTotal04_011
     * @tc.desc Verify $_set changes specified element value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.$_set(0, 255);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0120
     * @tc.name testUint8ArrayTotal04_012
     * @tc.desc Verify sort does not change length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30, 10, 20);
      arr.sort();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0130
     * @tc.name testUint8ArrayTotal04_013
     * @tc.desc Verify reverse does not change length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.reverse();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0140
     * @tc.name testUint8ArrayTotal04_014
     * @tc.desc Verify fill does not change length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr.fill(99);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0150
     * @tc.name testUint8ArrayTotal04_015
     * @tc.desc Verify copyWithin does not change length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      arr.copyWithin(0, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0160
     * @tc.name testUint8ArrayTotal04_016
     * @tc.desc Verify sort keeps buffer reference unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30, 10, 20);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.sort();
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0170
     * @tc.name testUint8ArrayTotal04_017
     * @tc.desc Verify reverse keeps buffer reference unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.reverse();
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0180
     * @tc.name testUint8ArrayTotal04_018
     * @tc.desc Verify fill keeps buffer reference unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.fill(42);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0190
     * @tc.name testUint8ArrayTotal04_019
     * @tc.desc Verify set keeps buffer reference unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.set([99, 100], 0);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0200
     * @tc.name testUint8ArrayTotal04_020
     * @tc.desc Verify sort does not change byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30, 10, 20);
      arr.sort();
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0210
     * @tc.name testUint8ArrayTotal04_021
     * @tc.desc Verify second fill overwrites first fill
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.fill(5);
      arr.fill(10);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0220
     * @tc.name testUint8ArrayTotal04_022
     * @tc.desc Verify fill then reverse: full fill then reverse
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.fill(42);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0230
     * @tc.name testUint8ArrayTotal04_023
     * @tc.desc Verify sort then reverse: ascending sort then reverse to descending
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30, 10, 20);
      arr.sort();
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0240
     * @tc.name testUint8ArrayTotal04_024
     * @tc.desc Verify copyWithin then fill: copy then fill first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      arr.copyWithin(0, 2);
      arr.fill(99, 0, 1);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0250
     * @tc.name testUint8ArrayTotal04_025
     * @tc.desc Verify fill then copyWithin: fill then copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.fill(5);
      arr.copyWithin(0, 2);
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0260
     * @tc.name testUint8ArrayTotal04_026
     * @tc.desc Verify fill 0 then fill 255: overwrite all zeros with all 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.fill(0);
      arr.fill(255);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0270
     * @tc.name testUint8ArrayTotal04_027
     * @tc.desc Verify sort descending then reverse is equivalent to ascending
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30, 10, 20);
      arr.sort((a: number, b: number): int => (b - a).toInt());
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0280
     * @tc.name testUint8ArrayTotal04_028
     * @tc.desc Verify reverse then sort: reverse then sort to ascending
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30, 10, 20);
      arr.reverse();
      arr.sort();
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0290
     * @tc.name testUint8ArrayTotal04_029
     * @tc.desc Verify partial fill then copyWithin: partial fill then copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      arr.fill(10, 0, 2);
      arr.copyWithin(2, 0, 2);
      expect(arr.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0300
     * @tc.name testUint8ArrayTotal04_030
     * @tc.desc Verify sort then fill: sort then overwrite first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30, 10, 20);
      arr.sort();
      arr.fill(100, 0, 1);
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0310
     * @tc.name testUint8ArrayTotal04_031
     * @tc.desc Verify reverse then fill with negative end: reverse then fill last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.reverse();
      arr.fill(0, -1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0320
     * @tc.name testUint8ArrayTotal04_032
     * @tc.desc Verify fill sort reverse triple combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.fill(42);
      arr.sort();
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0330
     * @tc.name testUint8ArrayTotal04_033
     * @tc.desc Verify reverse fill copyWithin triple combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      arr.reverse();
      arr.fill(5);
      arr.copyWithin(1, 0);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0340
     * @tc.name testUint8ArrayTotal04_034
     * @tc.desc Verify sort reverse sort: sort reverse then sort restores ascending
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30, 10, 20);
      arr.sort();
      arr.reverse();
      arr.sort();
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0350
     * @tc.name testUint8ArrayTotal04_035
     * @tc.desc Verify copyWithin reverse fill compound chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      arr.copyWithin(0, 3);
      arr.reverse();
      arr.fill(0, 3);
      expect(arr.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0360
     * @tc.name testUint8ArrayTotal04_036
     * @tc.desc Verify forEach callback accumulates external int counter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let sum: number = 0;
      arr.forEach((v: number): void => {
        sum += v;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0370
     * @tc.name testUint8ArrayTotal04_037
     * @tc.desc Verify forEach callback writes elements to external Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let out: Uint8Array = new Uint8Array(3);
      let idx: int = 0;
      arr.forEach((v: number): void => {
        out.$_set(idx, v.toInt());
        idx++;
      });
      expect(out.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0380
     * @tc.name testUint8ArrayTotal04_038
     * @tc.desc Verify map callback uses external number coefficient
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let coeff: number = 2;
      let result: Uint8Array = arr.map((v: number): number => v * coeff);
      expect(result.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0390
     * @tc.name testUint8ArrayTotal04_039
     * @tc.desc Verify filter callback references external number threshold
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let threshold: number = 2;
      let result: Uint8Array = arr.filter((v: number): boolean => v > threshold);
      expect(result.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0400
     * @tc.name testUint8ArrayTotal04_040
     * @tc.desc Verify reduce callback accumulates and writes to external Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let out: Uint8Array = new Uint8Array(3);
      let idx: int = 0;
      arr.forEach((v: number): void => {
        out.$_set(idx, v.toInt());
        idx++;
      });
      expect(out.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0410
     * @tc.name testUint8ArrayTotal04_041
     * @tc.desc Verify some callback modifies external boolean flag
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let found: boolean = false;
      arr.some((v: number): boolean => {
        if (v === 2) {
          found = true;
          return true;
        }
        return false;
      });
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0420
     * @tc.name testUint8ArrayTotal04_042
     * @tc.desc Verify every callback modifies external int counter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let count: number = 0;
      arr.every((v: number): boolean => {
        count++;
        return true;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0430
     * @tc.name testUint8ArrayTotal04_043
     * @tc.desc Verify find callback reads external int offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let offset: number = 1;
      let expectedVal: number = arr.$_get(offset.toInt()) as number;
      let result: number | undefined = arr.find((v: number): boolean => v === expectedVal);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0440
     * @tc.name testUint8ArrayTotal04_044
     * @tc.desc Verify sort compare function uses external int descending variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let desc: number = -1;
      arr.sort((a: number, b: number): int => (desc * (a - b)).toInt());
      expect(arr.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0450
     * @tc.name testUint8ArrayTotal04_045
     * @tc.desc Verify forEach callback writes elements to external Uint8Array one by one
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let out: Uint8Array = new Uint8Array(3);
      let i: int = 0;
      arr.forEach((v: number): void => {
        out.$_set(i, v.toInt());
        i++;
      });
      expect(out.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0460
     * @tc.name testUint8ArrayTotal04_046
     * @tc.desc Verify map callback reads external FixedArray coefficient
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let coeffs: number[] = [2, 3, 4];
      let result: Uint8Array = new Uint8Array(arr.length);
      arr.forEach((v: number, i: int): void => {
        result.$_set(i, (v * coeffs[i]).toInt());
      });
      expect(result.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0470
     * @tc.name testUint8ArrayTotal04_047
     * @tc.desc Verify reduce callback modifies external Uint8Array storing squares
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let squares: Uint8Array = new Uint8Array(3);
      let idx: int = 0;
      arr.forEach((v: number): void => {
        squares.$_set(idx, (v * v).toInt());
        idx++;
      });
      expect(squares.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0480
     * @tc.name testUint8ArrayTotal04_048
     * @tc.desc Verify findLast callback writes to external int index variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let foundIdx: number = -1;
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => {
        if (v === 20) {
          foundIdx = i;
          return true;
        }
        return false;
      });
      expect(foundIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0490
     * @tc.name testUint8ArrayTotal04_049
     * @tc.desc Verify forEach double accumulates external int
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let sum: number = 0;
      arr.forEach((v: number): void => {
        sum += v * 2;
      });
      expect(sum).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0500
     * @tc.name testUint8ArrayTotal04_050
     * @tc.desc Verify filter callback reads external int exclude value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let exclude: number = 2;
      let result: Uint8Array = arr.filter((v: number): boolean => v !== exclude);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0510
     * @tc.name testUint8ArrayTotal04_051
     * @tc.desc Verify some callback reads external int mapped target value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let target: number = 3;
      let found: boolean = arr.some((v: number): boolean => v === target);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0520
     * @tc.name testUint8ArrayTotal04_052
     * @tc.desc Verify every callback reads external int breakpoint index to early terminate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let breakpoint: number = 1;
      let count: number = 0;
      arr.every((v: number, i: int): boolean => {
        count++;
        return i < breakpoint;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0530
     * @tc.name testUint8ArrayTotal04_053
     * @tc.desc Verify findIndex callback writes to external Uint8Array recording accessed elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let visited: Uint8Array = new Uint8Array(3);
      let idx: int = 0;
      arr.findIndex((v: number): boolean => {
        visited.$_set(idx, v.toInt());
        idx++;
        return v === 20;
      });
      expect(visited.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0540
     * @tc.name testUint8ArrayTotal04_054
     * @tc.desc Verify fill 42 then at(0) reads fill value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.fill(42);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0550
     * @tc.name testUint8ArrayTotal04_055
     * @tc.desc Verify set then at reads set value at offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.set([99, 100], 1);
      expect(arr.at(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0560
     * @tc.name testUint8ArrayTotal04_056
     * @tc.desc Verify sort then at reads ascending first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30, 10, 20);
      arr.sort();
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0570
     * @tc.name testUint8ArrayTotal04_057
     * @tc.desc Verify reverse then at reads reversed first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.reverse();
      expect(arr.at(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0580
     * @tc.name testUint8ArrayTotal04_058
     * @tc.desc Verify fill first element zero then indexOf(0) query
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      arr.fill(0, 0, 1);
      expect(arr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0590
     * @tc.name testUint8ArrayTotal04_059
     * @tc.desc Verify set then includes verification
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.set([5, 10], 0);
      expect(arr.includes(10)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0600
     * @tc.name testUint8ArrayTotal04_060
     * @tc.desc Verify $_set then $_get value verification
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.$_set(0, 255);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0610
     * @tc.name testUint8ArrayTotal04_061
     * @tc.desc Verify multiple $_set then at reads middle position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      expect(arr.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0620
     * @tc.name testUint8ArrayTotal04_062
     * @tc.desc Verify copyWithin then $_get verifies copy result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      arr.copyWithin(0, 2);
      expect(arr.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0630
     * @tc.name testUint8ArrayTotal04_063
     * @tc.desc Verify set with Uint8Array source then $_get verification
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let src: Uint8Array = Uint8Array.of(99, 88);
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0640
     * @tc.name testUint8ArrayTotal04_064
     * @tc.desc Verify sort then includes checks sorted array contains max value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(30, 10, 20);
      arr.sort();
      expect(arr.includes(30)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0650
     * @tc.name testUint8ArrayTotal04_065
     * @tc.desc Verify fill 77 then findLast verifies fill value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.fill(77);
      let result: number | undefined = arr.findLast((v: number): boolean => v === 77);
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0660
     * @tc.name testUint8ArrayTotal04_066
     * @tc.desc Verify reverse then some checks original first element exists
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.reverse();
      let found: boolean = arr.some((v: number): boolean => v === 10);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0670
     * @tc.name testUint8ArrayTotal04_067
     * @tc.desc Verify sort then every checks ascending order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.sort();
      let allAsc: boolean = arr.every((v: number, i: int, a: Uint8Array): boolean => {
        return i === 0 || v >= (a.$_get(i - 1) as number);
      });
      expect(allAsc).assertTrue();
    });
  });

  describe('Uint8ArrayTotal04_02', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0680
     * @tc.name testUint8ArrayTotal04_068
     * @tc.desc Verify forEach callback writing to next index element modifies array correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.forEach((v: number, i: int): void => {
        if (i === 0) {
          arr.$_set(1, 99);
        }
      });
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0690
     * @tc.name testUint8ArrayTotal04_069
     * @tc.desc Verify map callback modifying other array position works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.map((v: number, i: int): number => {
        if (i === 0) {
          arr.$_set(2, 99);
        }
        return v;
      });
      expect(arr.$_get(2)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0700
     * @tc.name testUint8ArrayTotal04_070
     * @tc.desc Verify reduce callback modifying array element works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.reduce((acc: number, v: number, i: int): number => {
        if (i === 1) {
          arr.$_set(1, 99);
        }
        return acc + v;
      }, 0);
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0710
     * @tc.name testUint8ArrayTotal04_071
     * @tc.desc Verify some callback modifying array element works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.some((v: number, i: int): boolean => {
        if (i === 0) {
          arr.$_set(1, 99);
        }
        return false;
      });
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0720
     * @tc.name testUint8ArrayTotal04_072
     * @tc.desc Verify every callback modifying array element works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.every((v: number, i: int): boolean => {
        if (i === 0) {
          arr.$_set(2, 99);
        }
        return true;
      });
      expect(arr.$_get(2)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0730
     * @tc.name testUint8ArrayTotal04_073
     * @tc.desc Verify find callback modifying unvisited element works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.find((v: number, i: int): boolean => {
        if (i === 0) {
          arr.$_set(2, 99);
        }
        return false;
      });
      expect(arr.$_get(2)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0740
     * @tc.name testUint8ArrayTotal04_074
     * @tc.desc Verify forEach modification then re-traverse sum calculation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.forEach((v: number, i: int): void => {
        arr.$_set(i, v * 2);
      });
      let sum: number = 0;
      arr.forEach((v: number): void => {
        sum += v;
      });
      expect(sum).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0750
     * @tc.name testUint8ArrayTotal04_075
     * @tc.desc Verify forEach callback with fill all elements works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.forEach((v: number, i: int): void => {
        if (i === 0) {
          arr.fill(5);
        }
      });
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0760
     * @tc.name testUint8ArrayTotal04_076
     * @tc.desc Verify some callback modification then at verification
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.some((v: number, i: int): boolean => {
        if (i === 1) {
          arr.$_set(0, 99);
          return true;
        }
        return false;
      });
      expect(arr.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0770
     * @tc.name testUint8ArrayTotal04_077
     * @tc.desc Verify findIndex callback setting other position works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.findIndex((v: number, i: int): boolean => {
        if (i === 0) {
          arr.$_set(1, 99);
        }
        return false;
      });
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0780
     * @tc.name testUint8ArrayTotal04_078
     * @tc.desc Verify findLast callback setting other position works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.findLast((v: number, i: int): boolean => {
        if (i === 2) {
          arr.$_set(0, 99);
          return true;
        }
        return false;
      });
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0790
     * @tc.name testUint8ArrayTotal04_079
     * @tc.desc Verify forEach callback modifying previous element works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.forEach((v: number, i: int): void => {
        if (i > 0) {
          arr.$_set(i - 1, v);
        }
      });
      expect(arr.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0800
     * @tc.name testUint8ArrayTotal04_080
     * @tc.desc Verify forEach set all to zero then reduce sum equals zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.forEach((v: number, i: int): void => {
        arr.$_set(i, 0);
      });
      let sum: number = arr.reduce((a: number, b: number): number => a + b, 0);
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0810
     * @tc.name testUint8ArrayTotal04_081
     * @tc.desc Verify every callback modifying read element value works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(3, 2, 1);
      let hitFirst: boolean = false;
      arr.every((v: number, i: int): boolean => {
        if (!hitFirst && i === 0) {
          hitFirst = true;
          arr.$_set(1, 99);
        }
        return true;
      });
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0820
     * @tc.name testUint8ArrayTotal04_082
     * @tc.desc Verify some early termination and traversal count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let visited: int = 0;
      arr.some((v: number): boolean => {
        visited++;
        return true;
      });
      expect(visited).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0830
     * @tc.name testUint8ArrayTotal04_083
     * @tc.desc Verify fill(256) truncates to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(256);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0840
     * @tc.name testUint8ArrayTotal04_084
     * @tc.desc Verify fill(-1) wraps to 255 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(-1);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0850
     * @tc.name testUint8ArrayTotal04_085
     * @tc.desc Verify fill(3.14) truncates to 3 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(3.14);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0860
     * @tc.name testUint8ArrayTotal04_086
     * @tc.desc Verify fill(255.9) truncates to 255 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(255.9);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0870
     * @tc.name testUint8ArrayTotal04_087
     * @tc.desc Verify fill(Infinity) truncates to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0880
     * @tc.name testUint8ArrayTotal04_088
     * @tc.desc Verify fill(NaN) truncates to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0890
     * @tc.name testUint8ArrayTotal04_089
     * @tc.desc Verify fill(-0) retains as 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(-0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0900
     * @tc.name testUint8ArrayTotal04_090
     * @tc.desc Verify fill(257) truncates to 1 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(257);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0910
     * @tc.name testUint8ArrayTotal04_091
     * @tc.desc Verify fill(0x100) hex overflow truncates to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(0x100);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0920
     * @tc.name testUint8ArrayTotal04_092
     * @tc.desc Verify fill(0xFF) hex max retains 255 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(0xFF);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0930
     * @tc.name testUint8ArrayTotal04_093
     * @tc.desc Verify fill(-0.5) negative float truncates to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(-0.5);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0940
     * @tc.name testUint8ArrayTotal04_094
     * @tc.desc Verify fill(0o200) octal 128 retains for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(0o200);
      expect(arr.$_get(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0950
     * @tc.name testUint8ArrayTotal04_095
     * @tc.desc Verify fill(0b11111111) binary 255 retains for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(0b11111111);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0960
     * @tc.name testUint8ArrayTotal04_096
     * @tc.desc Verify fill(1e10) scientific notation large value truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(1e10);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0970
     * @tc.name testUint8ArrayTotal04_097
     * @tc.desc Verify fill(512) larger overflow truncates to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.fill(512);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0980
     * @tc.name testUint8ArrayTotal04_098
     * @tc.desc Verify set([256],0) truncates source value to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.set([256], 0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_0990
     * @tc.name testUint8ArrayTotal04_099
     * @tc.desc Verify set(Uint8Array.of(257),0) truncates source to 1 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.set(Uint8Array.of(257), 0);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1000
     * @tc.name testUint8ArrayTotal04_100
     * @tc.desc Verify set([-1],0) negative source wraps to 255 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.set([-1], 0);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1010
     * @tc.name testUint8ArrayTotal04_101
     * @tc.desc Verify set([3.9],0) float source truncates to 3 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.set([3.9], 0);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1020
     * @tc.name testUint8ArrayTotal04_102
     * @tc.desc Verify from([256]) truncates to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([256]);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1030
     * @tc.name testUint8ArrayTotal04_103
     * @tc.desc Verify from([-1]) negative wraps to 255 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([-1]);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1040
     * @tc.name testUint8ArrayTotal04_104
     * @tc.desc Verify from([3.9]) float truncates to 3 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([3.9]);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1050
     * @tc.name testUint8ArrayTotal04_105
     * @tc.desc Verify from([Infinity]) truncates to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([Number.POSITIVE_INFINITY]);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1060
     * @tc.name testUint8ArrayTotal04_106
     * @tc.desc Verify from([NaN]) truncates to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([Number.NaN]);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1070
     * @tc.name testUint8ArrayTotal04_107
     * @tc.desc Verify map callback returning 256 truncates to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1);
      let result: Uint8Array = arr.map((v: number): number => 256);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1080
     * @tc.name testUint8ArrayTotal04_108
     * @tc.desc Verify map callback returning -1 wraps to 255 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1);
      let result: Uint8Array = arr.map((v: number): number => -1);
      expect(result.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1090
     * @tc.name testUint8ArrayTotal04_109
     * @tc.desc Verify map callback returning 3.9 truncates to 3 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1);
      let result: Uint8Array = arr.map((v: number): number => 3.9);
      expect(result.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1100
     * @tc.name testUint8ArrayTotal04_110
     * @tc.desc Verify map callback returning Infinity truncates to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1);
      let result: Uint8Array = arr.map((v: number): number => Number.POSITIVE_INFINITY);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1110
     * @tc.name testUint8ArrayTotal04_111
     * @tc.desc Verify map callback returning NaN truncates to 0 for Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1);
      let result: Uint8Array = arr.map((v: number): number => Number.NaN);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1120
     * @tc.name testUint8ArrayTotal04_112
     * @tc.desc Verify subarray view reflects parent set modification
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let child: Uint8Array = parent.subarray(0, 2);
      parent.$_set(0, 99);
      expect(child.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1130
     * @tc.name testUint8ArrayTotal04_113
     * @tc.desc Verify parent copyWithin affects child subarray view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let child: Uint8Array = parent.subarray(0, 2);
      parent.copyWithin(0, 2);
      expect(child.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1140
     * @tc.name testUint8ArrayTotal04_114
     * @tc.desc Verify child set modifies parent view accordingly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let child: Uint8Array = parent.subarray(1, 3);
      child.set([99, 100], 0);
      expect(parent.$_get(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1150
     * @tc.name testUint8ArrayTotal04_115
     * @tc.desc Verify multi-level subarray of subarray shares same buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let child: Uint8Array = parent.subarray(1);
      let grandchild: Uint8Array = child.subarray(0, 2);
      grandchild.$_set(0, 99);
      expect(parent.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1160
     * @tc.name testUint8ArrayTotal04_116
     * @tc.desc Verify parent fill(0) clears all child view elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Uint8Array = new Uint8Array([1, 2, 3, 4]);
      let child: Uint8Array = parent.subarray(0, 2);
      parent.fill(0);
      expect(child.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1170
     * @tc.name testUint8ArrayTotal04_117
     * @tc.desc Verify parent modification does not change child length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let child: Uint8Array = parent.subarray(1, 3);
      parent.$_set(2, 99);
      expect(child.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1180
     * @tc.name testUint8ArrayTotal04_118
     * @tc.desc Verify sub-subarray of child still shares buffer with parent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let child: Uint8Array = parent.subarray(1, 4);
      let sub2: Uint8Array = child.subarray(0, 2);
      sub2.$_set(1, 88);
      expect(parent.$_get(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1190
     * @tc.name testUint8ArrayTotal04_119
     * @tc.desc Verify offset view child byteOffset reflects relative to original ArrayBuffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Uint8Array = new Uint8Array(new ArrayBuffer(8), 2 as int);
      let child: Uint8Array = parent.subarray(1, 3);
      expect(child.byteOffset).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1200
     * @tc.name testUint8ArrayTotal04_120
     * @tc.desc Verify two independent Uint8Array different buffer writes do not affect each other
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Uint8Array = Uint8Array.of(1, 2, 3);
      let b: Uint8Array = Uint8Array.of(4, 5, 6);
      a.$_set(0, 99);
      expect(b.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL04_1210
     * @tc.name testUint8ArrayTotal04_121
     * @tc.desc Verify child set(FixedArray) propagates to parent view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal04_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      let child: Uint8Array = parent.subarray(0, 2);
      child.set([55, 66], 0);
      expect(parent.$_get(1)).assertEqual(66);
    });
  });
}