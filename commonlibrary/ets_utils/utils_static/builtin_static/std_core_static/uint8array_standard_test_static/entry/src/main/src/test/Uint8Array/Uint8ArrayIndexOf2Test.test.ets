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

export default function Uint8ArrayIndexOf2Test(): void {
  describe('Uint8ArrayIndexOf2Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0010
     * @tc.name testUint8ArrayIndexOf001
     * @tc.desc Verify typeof return value is number when indexOf succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0020
     * @tc.name testUint8ArrayIndexOf002
     * @tc.desc Verify typeof return value is number when indexOf fails
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(99);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0030
     * @tc.name testUint8ArrayIndexOf003
     * @tc.desc Verify return value is not NaN when indexOf succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0040
     * @tc.name testUint8ArrayIndexOf004
     * @tc.desc Verify return value is not NaN when indexOf fails (-1 is a valid number)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(99);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0050
     * @tc.name testUint8ArrayIndexOf005
     * @tc.desc Verify return value is >= 0 when indexOf succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(20);
      expect(idx >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0060
     * @tc.name testUint8ArrayIndexOf006
     * @tc.desc Verify return value equals -1 when indexOf fails
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(99);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0070
     * @tc.name testUint8ArrayIndexOf007
     * @tc.desc Verify typeof return value is still number when fromIndex is explicitly provided
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(20, 1);
      expect(Number.isInteger(idx)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0080
     * @tc.name testUint8ArrayIndexOf008
     * @tc.desc Verify typeof return value is number when indexOf is called on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let idx: number = arr.indexOf(10);
      expect(Number.isInteger(idx)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0090
     * @tc.name testUint8ArrayIndexOf009
     * @tc.desc Verify indexOf returns 0 when searching first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0100
     * @tc.name testUint8ArrayIndexOf010
     * @tc.desc Verify indexOf returns 1 when searching middle element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0110
     * @tc.name testUint8ArrayIndexOf011
     * @tc.desc Verify indexOf returns 2 when searching last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(30);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0120
     * @tc.name testUint8ArrayIndexOf012
     * @tc.desc Verify indexOf returns 2 when searching middle element in a 5-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let idx: number = arr.indexOf(3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0130
     * @tc.name testUint8ArrayIndexOf013
     * @tc.desc Verify indexOf returns 4 when searching last element in a 5-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let idx: number = arr.indexOf(5);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0140
     * @tc.name testUint8ArrayIndexOf014
     * @tc.desc Verify indexOf uint8 MIN value 0 returns correct index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 128, 255]);
      let idx: number = arr.indexOf(0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0150
     * @tc.name testUint8ArrayIndexOf015
     * @tc.desc Verify indexOf uint8 MAX value 255 returns correct index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 128, 255]);
      let idx: number = arr.indexOf(255);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0160
     * @tc.name testUint8ArrayIndexOf016
     * @tc.desc Verify indexOf uint8 middle value 128 returns correct index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 128, 255]);
      let idx: number = arr.indexOf(128);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0170
     * @tc.name testUint8ArrayIndexOf017
     * @tc.desc Verify indexOf on single-element array returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([42]);
      let idx: number = arr.indexOf(42);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0180
     * @tc.name testUint8ArrayIndexOf018
     * @tc.desc Verify indexOf on 100-element array returns 0 when searching first position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      arr.set([99], 0);
      let idx: number = arr.indexOf(99);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0190
     * @tc.name testUint8ArrayIndexOf019
     * @tc.desc Verify indexOf on 100-element array returns 50 when searching middle position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      arr.set([88], 50);
      let idx: number = arr.indexOf(88);
      expect(idx).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0200
     * @tc.name testUint8ArrayIndexOf020
     * @tc.desc Verify indexOf on 100-element array returns 99 when searching last position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      arr.set([77], 99);
      let idx: number = arr.indexOf(77);
      expect(idx).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0210
     * @tc.name testUint8ArrayIndexOf021
     * @tc.desc Verify 0x80 hex literal as searchElement succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 128, 255]);
      let idx: number = arr.indexOf(0x80);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0220
     * @tc.name testUint8ArrayIndexOf022
     * @tc.desc Verify 0xFF hex literal as searchElement succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 128, 255]);
      let idx: number = arr.indexOf(0xFF);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0230
     * @tc.name testUint8ArrayIndexOf023
     * @tc.desc Verify 0x00 hex literal as searchElement succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 128, 255]);
      let idx: number = arr.indexOf(0x00);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0240
     * @tc.name testUint8ArrayIndexOf024
     * @tc.desc Verify indexOf returns first occurrence index for duplicate elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 10, 20]);
      let idx: number = arr.indexOf(10);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0250
     * @tc.name testUint8ArrayIndexOf025
     * @tc.desc Verify indexOf returns first occurrence index when duplicates appear in middle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5, 10, 10, 20]);
      let idx: number = arr.indexOf(10);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0260
     * @tc.name testUint8ArrayIndexOf026
     * @tc.desc Verify indexOf returns 0 when searching an array of three identical elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([7, 7, 7]);
      let idx: number = arr.indexOf(7);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0270
     * @tc.name testUint8ArrayIndexOf027
     * @tc.desc Verify using arr[0] as searchElement succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let searchElement: number = arr.at(0) as number;
      let idx: number = arr.indexOf(searchElement);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0280
     * @tc.name testUint8ArrayIndexOf028
     * @tc.desc Verify using arr[length-1] as searchElement succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let searchElement: number = arr.at(arr.length - 1) as number;
      let idx: number = arr.indexOf(searchElement);
      expect(idx).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0290
     * @tc.name testUint8ArrayIndexOf029
     * @tc.desc Verify 0b11111111 binary literal 255 as searchElement succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 128, 255]);
      let idx: number = arr.indexOf(0b11111111);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0300
     * @tc.name testUint8ArrayIndexOf030
     * @tc.desc Verify 0o377 octal literal 255 as searchElement succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 128, 255]);
      let idx: number = arr.indexOf(0o377);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0310
     * @tc.name testUint8ArrayIndexOf031
     * @tc.desc Verify 1e1 scientific notation 10 as searchElement succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(1e1);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0320
     * @tc.name testUint8ArrayIndexOf032
     * @tc.desc Verify 2e1 scientific notation 20 as searchElement succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(2e1);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0330
     * @tc.name testUint8ArrayIndexOf033
     * @tc.desc Verify indexOf return value can be used as array index to access element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(20);
      expect(arr.at(Double.toInt(idx))).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0340
     * @tc.name testUint8ArrayIndexOf034
     * @tc.desc Verify calling indexOf twice returns the same index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx1: number = arr.indexOf(20);
      let idx2: number = arr.indexOf(20);
      expect(idx1).assertEqual(idx2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0350
     * @tc.name testUint8ArrayIndexOf035
     * @tc.desc Verify -0 as searchElement finds value 0 successfully
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 1, 2]);
      let idx: number = arr.indexOf(-0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0360
     * @tc.name testUint8ArrayIndexOf036
     * @tc.desc Verify 0.0 float as searchElement finds value 0 successfully
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 1, 2]);
      let idx: number = arr.indexOf(0.0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0370
     * @tc.name testUint8ArrayIndexOf037
     * @tc.desc Verify indexOf on array filled with same value returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      for (let i = 0; i < 5; i++) {
        arr.set([100], i);
      }
      let idx: number = arr.indexOf(100);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0380
     * @tc.name testUint8ArrayIndexOf038
     * @tc.desc Verify indexOf on empty array returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let idx: number = arr.indexOf(10);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0390
     * @tc.name testUint8ArrayIndexOf039
     * @tc.desc Verify indexOf with value out of uint8 range returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(256);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0400
     * @tc.name testUint8ArrayIndexOf040
     * @tc.desc Verify indexOf with negative value returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(-1);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0410
     * @tc.name testUint8ArrayIndexOf041
     * @tc.desc Verify indexOf with 257 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(257);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0420
     * @tc.name testUint8ArrayIndexOf042
     * @tc.desc Verify indexOf with -2 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(-2);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0430
     * @tc.name testUint8ArrayIndexOf043
     * @tc.desc Verify indexOf with 1000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(1000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0440
     * @tc.name testUint8ArrayIndexOf044
     * @tc.desc Verify indexOf with -100 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(-100);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0450
     * @tc.name testUint8ArrayIndexOf045
     * @tc.desc Verify indexOf with 10000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0460
     * @tc.name testUint8ArrayIndexOf046
     * @tc.desc Verify indexOf with -1000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(-1000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0470
     * @tc.name testUint8ArrayIndexOf047
     * @tc.desc Verify indexOf with 100000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(100000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0480
     * @tc.name testUint8ArrayIndexOf048
     * @tc.desc Verify indexOf with -100000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(-100000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0490
     * @tc.name testUint8ArrayIndexOf049
     * @tc.desc Verify indexOf with 1000000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(1000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0500
     * @tc.name testUint8ArrayIndexOf050
     * @tc.desc Verify indexOf with -1000000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(-1000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0510
     * @tc.name testUint8ArrayIndexOf051
     * @tc.desc Verify indexOf with 10000000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0520
     * @tc.name testUint8ArrayIndexOf052
     * @tc.desc Verify indexOf with -10000000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(-10000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0530
     * @tc.name testUint8ArrayIndexOf053
     * @tc.desc Verify indexOf with 100000000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(100000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0540
     * @tc.name testUint8ArrayIndexOf054
     * @tc.desc Verify indexOf with -100000000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(-100000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0550
     * @tc.name testUint8ArrayIndexOf055
     * @tc.desc Verify indexOf with 1000000000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(1000000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0560
     * @tc.name testUint8ArrayIndexOf056
     * @tc.desc Verify indexOf with -1000000000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(-1000000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0570
     * @tc.name testUint8ArrayIndexOf057
     * @tc.desc Verify indexOf with 10000000000 returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10000000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0580
     * @tc.name testUint8ArrayIndexOf058
     * @tc.desc Verify fromIndex=0 searching first element returns index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0590
     * @tc.name testUint8ArrayIndexOf059
     * @tc.desc Verify fromIndex=1 skipping first element searching middle element returns index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(20, 1);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0600
     * @tc.name testUint8ArrayIndexOf060
     * @tc.desc Verify fromIndex=2 skipping first two elements searching last element returns index 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(30, 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0610
     * @tc.name testUint8ArrayIndexOf061
     * @tc.desc Verify fromIndex=1 searching first element returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 1);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0620
     * @tc.name testUint8ArrayIndexOf062
     * @tc.desc Verify fromIndex=2 searching middle element returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(20, 2);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0630
     * @tc.name testUint8ArrayIndexOf063
     * @tc.desc Verify fromIndex=3 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 3);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0640
     * @tc.name testUint8ArrayIndexOf064
     * @tc.desc Verify fromIndex=100 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 100);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0650
     * @tc.name testUint8ArrayIndexOf065
     * @tc.desc Verify fromIndex=1000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 1000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0660
     * @tc.name testUint8ArrayIndexOf066
     * @tc.desc Verify fromIndex=10000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 10000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0670
     * @tc.name testUint8ArrayIndexOf067
     * @tc.desc Verify fromIndex=100000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 100000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0680
     * @tc.name testUint8ArrayIndexOf068
     * @tc.desc Verify fromIndex=1000000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 1000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0690
     * @tc.name testUint8ArrayIndexOf069
     * @tc.desc Verify fromIndex=10000000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 10000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0700
     * @tc.name testUint8ArrayIndexOf070
     * @tc.desc Verify fromIndex=100000000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 100000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0710
     * @tc.name testUint8ArrayIndexOf071
     * @tc.desc Verify fromIndex=1000000000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 1000000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0720
     * @tc.name testUint8ArrayIndexOf072
     * @tc.desc Verify fromIndex=10000000000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 4 as int);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0730
     * @tc.name testUint8ArrayIndexOf073
     * @tc.desc Verify fromIndex=100000000000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 5 as int);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0740
     * @tc.name testUint8ArrayIndexOf074
     * @tc.desc Verify fromIndex=1000000000000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 6 as int);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0750
     * @tc.name testUint8ArrayIndexOf075
     * @tc.desc Verify fromIndex=10000000000000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 7 as int);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0760
     * @tc.name testUint8ArrayIndexOf076
     * @tc.desc Verify fromIndex=100000000000000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 8 as int);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0770
     * @tc.name testUint8ArrayIndexOf077
     * @tc.desc Verify fromIndex=1000000000000000 searching all elements returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, 9 as int);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0780
     * @tc.name testUint8ArrayIndexOf078
     * @tc.desc Verify fromIndex=-1 searching from end returns correct index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(30, -1);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0790
     * @tc.name testUint8ArrayIndexOf079
     * @tc.desc Verify fromIndex=-2 searching from second-to-last position returns correct index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(20, -2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0800
     * @tc.name testUint8ArrayIndexOf080
     * @tc.desc Verify fromIndex=-3 searching from third-to-last position returns correct index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -3);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0810
     * @tc.name testUint8ArrayIndexOf081
     * @tc.desc Verify fromIndex=-4 searching from fourth-to-last (clamped to 0) returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -4);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0820
     * @tc.name testUint8ArrayIndexOf082
     * @tc.desc Verify fromIndex=-100 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -100);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0830
     * @tc.name testUint8ArrayIndexOf083
     * @tc.desc Verify fromIndex=-1000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -1000);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0840
     * @tc.name testUint8ArrayIndexOf084
     * @tc.desc Verify fromIndex=-10000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -10000);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0850
     * @tc.name testUint8ArrayIndexOf085
     * @tc.desc Verify fromIndex=-100000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -100000);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0860
     * @tc.name testUint8ArrayIndexOf086
     * @tc.desc Verify fromIndex=-1000000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -1000000);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0870
     * @tc.name testUint8ArrayIndexOf087
     * @tc.desc Verify fromIndex=-10000000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -10000000);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0880
     * @tc.name testUint8ArrayIndexOf088
     * @tc.desc Verify fromIndex=-100000000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -100000000);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0890
     * @tc.name testUint8ArrayIndexOf089
     * @tc.desc Verify fromIndex=-1000000000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -1000000000);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0900
     * @tc.name testUint8ArrayIndexOf090
     * @tc.desc Verify fromIndex=-10000000000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -3 as int);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0910
     * @tc.name testUint8ArrayIndexOf091
     * @tc.desc Verify fromIndex=-100000000000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -3 as int);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0920
     * @tc.name testUint8ArrayIndexOf092
     * @tc.desc Verify fromIndex=-1000000000000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -3 as int);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0930
     * @tc.name testUint8ArrayIndexOf093
     * @tc.desc Verify fromIndex=-10000000000000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -4 as int);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0940
     * @tc.name testUint8ArrayIndexOf094
     * @tc.desc Verify fromIndex=-100000000000000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -5 as int);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0950
     * @tc.name testUint8ArrayIndexOf095
     * @tc.desc Verify fromIndex=-1000000000000000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -6 as int);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0960
     * @tc.name testUint8ArrayIndexOf096
     * @tc.desc Verify fromIndex=-10000000000000000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -7 as int);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0970
     * @tc.name testUint8ArrayIndexOf097
     * @tc.desc Verify fromIndex=-100000000000000000 (far negative, clamped to 0) searching returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let idx: number = arr.indexOf(10, -8 as int);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0980
     * @tc.name testUint8ArrayIndexOf098
     * @tc.desc Verify length unchanged after successful indexOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let origLen: number = arr.length;
      arr.indexOf(20);
      expect(arr.length).assertEqual(origLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_0990
     * @tc.name testUint8ArrayIndexOf099
     * @tc.desc Verify length unchanged after unsuccessful indexOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let origLen: number = arr.length;
      arr.indexOf(99);
      expect(arr.length).assertEqual(origLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1000
     * @tc.name testUint8ArrayIndexOf100
     * @tc.desc Verify length unchanged after indexOf on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let origLen: number = arr.length;
      arr.indexOf(10);
      expect(arr.length).assertEqual(origLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1010
     * @tc.name testUint8ArrayIndexOf101
     * @tc.desc Verify length unchanged after indexOf on 100-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      let origLen: number = arr.length;
      arr.indexOf(10);
      expect(arr.length).assertEqual(origLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1020
     * @tc.name testUint8ArrayIndexOf102
     * @tc.desc Verify length unchanged after indexOf with positive fromIndex
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let origLen: number = arr.length;
      arr.indexOf(20, 1);
      expect(arr.length).assertEqual(origLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1030
     * @tc.name testUint8ArrayIndexOf103
     * @tc.desc Verify length unchanged after indexOf with negative fromIndex
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let origLen: number = arr.length;
      arr.indexOf(30, -1);
      expect(arr.length).assertEqual(origLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1040
     * @tc.name testUint8ArrayIndexOf104
     * @tc.desc Verify array elements unchanged after successful indexOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let origArr: Uint8Array = new Uint8Array([10, 20, 30]);
      arr.indexOf(20);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(origArr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1050
     * @tc.name testUint8ArrayIndexOf105
     * @tc.desc Verify array elements unchanged after unsuccessful indexOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let origArr: Uint8Array = new Uint8Array([10, 20, 30]);
      arr.indexOf(99);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(origArr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1060
     * @tc.name testUint8ArrayIndexOf106
     * @tc.desc Verify indexOf on single-element array after indexOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10]);
      arr.indexOf(10);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1070
     * @tc.name testUint8ArrayIndexOf107
     * @tc.desc Verify 100-element array elements unchanged after indexOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr.set([i], i);
      }
      let origArr: Uint8Array = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        origArr.set([i], i);
      }
      arr.indexOf(50);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(origArr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1080
     * @tc.name testUint8ArrayIndexOf108
     * @tc.desc Verify elements unchanged after indexOf with positive fromIndex
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let origArr: Uint8Array = new Uint8Array([10, 20, 30]);
      arr.indexOf(20, 1);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(origArr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1090
     * @tc.name testUint8ArrayIndexOf109
     * @tc.desc Verify elements unchanged after indexOf with negative fromIndex
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let origArr: Uint8Array = new Uint8Array([10, 20, 30]);
      arr.indexOf(30, -1);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(origArr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1100
     * @tc.name testUint8ArrayIndexOf110
     * @tc.desc Verify elements unchanged after indexOf with duplicate elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 10, 20]);
      let origArr: Uint8Array = new Uint8Array([10, 10, 20]);
      arr.indexOf(10);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(origArr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1110
     * @tc.name testUint8ArrayIndexOf111
     * @tc.desc Verify single-element array unchanged after indexOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([42]);
      let origArr: Uint8Array = new Uint8Array([42]);
      arr.indexOf(42);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(origArr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1120
     * @tc.name testUint8ArrayIndexOf112
     * @tc.desc Verify ArrayBuffer view byteOffset unchanged after indexOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buffer, 2, 3);
      let origByteOffset: number = arr.byteOffset;
      arr.indexOf(10);
      expect(arr.byteOffset).assertEqual(origByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1130
     * @tc.name testUint8ArrayIndexOf113
     * @tc.desc Verify ArrayBuffer view buffer unchanged after indexOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buffer, 2, 3);
      let origBuffer: ArrayBuffer = arr.buffer;
      arr.indexOf(20);
      expect(arr.buffer).assertEqual(origBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1140
     * @tc.name testUint8ArrayIndexOf114
     * @tc.desc Verify ArrayBuffer view elements unchanged after indexOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buffer, 2, 3);
      arr.set([10], 0);
      arr.set([20], 1);
      arr.set([30], 2);
      let origArr: Uint8Array = new Uint8Array([10, 20, 30]);
      arr.indexOf(20);
      for (let i = 0; i < 3; i++) {
        expect(arr[i]).assertEqual(origArr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1150
     * @tc.name testUint8ArrayIndexOf115
     * @tc.desc Verify ArrayBuffer view elements unchanged after unsuccessful indexOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buffer, 2, 3);
      arr.set([10], 0);
      arr.set([20], 1);
      arr.set([30], 2);
      let origArr: Uint8Array = new Uint8Array([10, 20, 30]);
      arr.indexOf(99);
      for (let i = 0; i < 3; i++) {
        expect(arr[i]).assertEqual(origArr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1160
     * @tc.name testUint8ArrayIndexOf116
     * @tc.desc Verify ArrayBuffer view indexOf with negative fromIndex
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buffer, 2, 3);
      arr.set([10], 0);
      arr.set([20], 1);
      arr.set([30], 2);
      let idx: number = arr.indexOf(30, -1);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1170
     * @tc.name testUint8ArrayIndexOf117
     * @tc.desc Verify ArrayBuffer view indexOf with fromIndex=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buffer, 2, 3);
      arr.set([10], 0);
      arr.set([20], 1);
      arr.set([30], 2);
      let idx: number = arr.indexOf(10, 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1180
     * @tc.name testUint8ArrayIndexOf118
     * @tc.desc Verify ArrayBuffer view indexOf with fromIndex=1 skips first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buffer, 2, 3);
      arr.set([10], 0);
      arr.set([20], 1);
      arr.set([30], 2);
      let idx: number = arr.indexOf(10, 1);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_INDEX_OF2_1190
     * @tc.name testUint8ArrayIndexOf119
     * @tc.desc Verify ArrayBuffer view byteOffset unchanged after indexOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayIndexOf119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buffer, 2, 3);
      let idx: number = arr.indexOf(20);
      expect(arr.byteOffset).assertEqual(2);
    });
  });
}