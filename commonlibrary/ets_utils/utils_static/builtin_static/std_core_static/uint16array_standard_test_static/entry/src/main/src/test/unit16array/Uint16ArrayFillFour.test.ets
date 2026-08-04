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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayFill04Test(): void {
  describe('Uint16ArrayFill04Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0001
     * @tc.name testUint16ArrayFillFour001
     * @tc.desc Verify fill(0x10001, 0, 3) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(0x10001, 0, 3);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0002
     * @tc.name testUint16ArrayFillFour002
     * @tc.desc Verify fill(-65535, 0, 4) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-65535, 0, 4);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(1);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0003
     * @tc.name testUint16ArrayFillFour003
     * @tc.desc Verify fill(65536+1, 2, 5) 1 [2,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536 + 1, 2, 5);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(1);
      expect(arr.at(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0004
     * @tc.name testUint16ArrayFillFour004
     * @tc.desc Verify fill(65535.9, 0, 3) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65535.9, 0, 3);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0005
     * @tc.name testUint16ArrayFillFour005
     * @tc.desc Verify fill(-0.5, 1, 4) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-0.5, 1, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0006
     * @tc.name testUint16ArrayFillFour006
     * @tc.desc Verify fill(1.999, 0, 5) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(1.999, 0, 5);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(1);
      expect(arr.at(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0007
     * @tc.name testUint16ArrayFillFour007
     * @tc.desc Verify fill(65536*2+5, 0, 2) 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536 * 2 + 5, 0, 2);
      expect(arr.at(0)).assertEqual(5);
      expect(arr.at(1)).assertEqual(5);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0008
     * @tc.name testUint16ArrayFillFour008
     * @tc.desc Verify fill(65536*10, 1, 3) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536 * 10, 1, 3);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0009
     * @tc.name testUint16ArrayFillFour009
     * @tc.desc Verify fill(65536, -1, 3) start+ value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536, -1, 3);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0010
     * @tc.name testUint16ArrayFillFour010
     * @tc.desc Verify fill(65536, 0, -1) end+ value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536, 0, -1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0011
     * @tc.name testUint16ArrayFillFour011
     * @tc.desc Verify fill converts value 3.14 to 3 within integer range [1, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(3.14, 1, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(3);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(3);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0012
     * @tc.name testUint16ArrayFillFour012
     * @tc.desc Verify fill(-1, -3, -1) start+ end+ value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-1, -3, -1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(65535);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0013
     * @tc.name testUint16ArrayFillFour013
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(10).fill(20, 0, 2);
      expect(arr.at(0)).assertEqual(20);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(10);
      expect(arr.at(3)).assertEqual(10);
      expect(arr.at(4)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0014
     * @tc.name testUint16ArrayFillFour014
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(99, 2, 4);
      expect(arr.at(2)).assertEqual(99);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0015
     * @tc.name testUint16ArrayFillFour015
     * @tc.desc Verify fill for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(55);
      let allMatch: boolean = true;
      for (const val of arr) {
        if (val !== 55) {
          allMatch = false;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0016
     * @tc.name testUint16ArrayFillFour016
     * @tc.desc Verify fill some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(77);
      let found: boolean = arr.includes(77);
      expect(found).assertTrue();
      expect(arr.at(0)).assertEqual(77);
      expect(arr.at(1)).assertEqual(77);
      expect(arr.at(2)).assertEqual(77);
      expect(arr.at(3)).assertEqual(77);
      expect(arr.at(4)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0017
     * @tc.name testUint16ArrayFillFour017
     * @tc.desc Verify fill every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(88);
      let all: boolean = arr.every((v: number): boolean => v === 88);
      expect(all).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0018
     * @tc.name testUint16ArrayFillFour018
     * @tc.desc Verify fill(0) fill(65535)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
      arr.fill(65535);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(4)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0019
     * @tc.name testUint16ArrayFillFour019
     * @tc.desc Verify fill(NaN, -4, -1) start+ end+NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(Number.NaN, -4, -1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0020
     * @tc.name testUint16ArrayFillFour020
     * @tc.desc Verify fill(-Infinity, 1, -1) +
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-Number.POSITIVE_INFINITY, 1, -1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0021
     * @tc.name testUint16ArrayFillFour021
     * @tc.desc Verify fill(0x10000, -3, 5) + start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(0x10000, -3, 5);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0022
     * @tc.name testUint16ArrayFillFour022
     * @tc.desc Verify fill(1e5, 0, -2) + end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(1e5, 0, -2);
      expect(arr.at(0)).assertEqual(34464);
      expect(arr.at(1)).assertEqual(34464);
      expect(arr.at(2)).assertEqual(34464);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0023
     * @tc.name testUint16ArrayFillFour023
     * @tc.desc Verify fill with float start (truncated to integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(777, Double.toInt(2.5));
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(777);
      expect(arr.at(4)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0024
     * @tc.name testUint16ArrayFillFour024
     * @tc.desc Verify fill with value = 0x7FFF (32767)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(4);
      arr.fill(0x7FFF);
      expect(arr.at(0)).assertEqual(32767);
      expect(arr.at(1)).assertEqual(32767);
      expect(arr.at(2)).assertEqual(32767);
      expect(arr.at(3)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0025
     * @tc.name testUint16ArrayFillFour025
     * @tc.desc Verify fill with value = -0.1 (truncates to 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(-0.1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0026
     * @tc.name testUint16ArrayFillFour026
     * @tc.desc Verify chaining multiple fill calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(7);
      arr.fill(111, 0, 2).fill(222, 2, 5).fill(333, 5, 7);
      expect(arr.at(0)).assertEqual(111);
      expect(arr.at(1)).assertEqual(111);
      expect(arr.at(2)).assertEqual(222);
      expect(arr.at(4)).assertEqual(222);
      expect(arr.at(5)).assertEqual(333);
      expect(arr.at(6)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0027
     * @tc.name testUint16ArrayFillFour027
     * @tc.desc Verify fill offset view fill updates only its backing range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
      view.fill(9);
      expect(all.at(0)).assertEqual(1);
      expect(all.at(1)).assertEqual(9);
      expect(all.at(2)).assertEqual(9);
      expect(all.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0028
     * @tc.name testUint16ArrayFillFour028
     * @tc.desc Verify fill equal start and end leave the receiver unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      arr.fill(9, 1, 1);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0029
     * @tc.name testUint16ArrayFillFour029
     * @tc.desc Verify fill start beyond length leaves the receiver unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      arr.fill(9, 10);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0030
     * @tc.name testUint16ArrayFillFour030
     * @tc.desc Verify fill partial fill preserves elements outside the range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      arr.fill(8, 1, 3);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(8);
      expect(arr.at(2)).assertEqual(8);
      expect(arr.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0031
     * @tc.name testUint16ArrayFillFour031
     * @tc.desc Verify fill conversion on an offset view is visible through DataView and confined to the view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(11, 22, 33, 44);
      let view: Uint16Array = new Uint16Array(backing.buffer, 2, 2);
      let result: Uint16Array = view.fill(-2);
      let dataView: DataView = new DataView(backing.buffer);
      expect(result).assertEqual(view);
      expect(dataView.getUint16(2, true)).assertEqual(65534);
      expect(dataView.getUint16(4, true)).assertEqual(65534);
      expect(backing.at(0)).assertEqual(11);
      expect(backing.at(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0032
     * @tc.name testUint16ArrayFillFour032
     * @tc.desc Verify fill with an explicit range on an offset view uses view-relative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
      view.fill(99, 0, 1);
      expect(view.at(0)).assertEqual(99);
      expect(view.at(1)).assertEqual(30);
      expect(all.at(0)).assertEqual(10);
      expect(all.at(1)).assertEqual(99);
      expect(all.at(2)).assertEqual(30);
      expect(all.at(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0033
     * @tc.name testUint16ArrayFillFour033
     * @tc.desc Verify fill on one sibling view does not change another non-overlapping view on the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let first: Uint16Array = new Uint16Array(buffer, 0, 2);
      let second: Uint16Array = new Uint16Array(buffer, 4, 2);
      first.fill(111);
      second.fill(222);
      first.fill(333);
      expect(first.at(0)).assertEqual(333);
      expect(first.at(1)).assertEqual(333);
      expect(second.at(0)).assertEqual(222);
      expect(second.at(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_FOUR_0034
     * @tc.name testUint16ArrayFillFour034
     * @tc.desc Verify fill on a zero-length offset view returns the same view and leaves the backing array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(11, 22, 33, 44);
      let view: Uint16Array = new Uint16Array(backing.buffer, 2, 0);
      let result: Uint16Array = view.fill(42);
      expect(result).assertEqual(view);
      expect(view.length).assertEqual(0);
      expect(backing.at(0)).assertEqual(11);
      expect(backing.at(1)).assertEqual(22);
      expect(backing.at(2)).assertEqual(33);
      expect(backing.at(3)).assertEqual(44);
    });

  });
}
