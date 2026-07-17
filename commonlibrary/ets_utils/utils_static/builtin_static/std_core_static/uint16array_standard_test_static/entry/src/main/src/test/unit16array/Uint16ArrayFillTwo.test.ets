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

export default function uint16ArrayFill102Test(): void {
  describe('Uint16ArrayFill102Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_0100
     * @tc.name testUint16ArrayFill102_001
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(99, 2, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(99);
      expect(arr.at(3)).assertEqual(99);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_0200
     * @tc.name testUint16ArrayFill102_002
     * @tc.desc Verify fill arr[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(88, 2, 3);
      expect(arr.at(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_0300
     * @tc.name testUint16ArrayFill102_003
     * @tc.desc Verify fill arr[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(88, 2, 5);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(88);
      expect(arr.at(3)).assertEqual(88);
      expect(arr.at(4)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_0400
     * @tc.name testUint16ArrayFill102_004
     * @tc.desc Verify fill arr[3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(88, 0, 3);
      expect(arr.at(0)).assertEqual(88);
      expect(arr.at(1)).assertEqual(88);
      expect(arr.at(2)).assertEqual(88);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_0500
     * @tc.name testUint16ArrayFill102_005
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(10, 0, 5);
      arr.fill(20, 0, 5);
      expect(arr.at(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_0600
     * @tc.name testUint16ArrayFill102_006
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(10, 0, 2);
      arr.fill(20, 3, 5);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(3)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_0700
     * @tc.name testUint16ArrayFill102_007
     * @tc.desc Verify fill join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 1, 4);
      const joined: string = arr.join(",");
      expect(joined).assertEqual("0,42,42,42,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_0800
     * @tc.name testUint16ArrayFill102_008
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(0, 1, 4);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_0900
     * @tc.name testUint16ArrayFill102_009
     * @tc.desc Verify fill 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(65535, 2, 3);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_1000
     * @tc.name testUint16ArrayFill102_010
     * @tc.desc Verify fill 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0b1010, 0, 3);
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_1100
     * @tc.name testUint16ArrayFill102_011
     * @tc.desc Verify fill 1e5 100000 % 65536 = 34464
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(1e5, 0, 3);
      expect(arr.at(0)).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_1200
     * @tc.name testUint16ArrayFill102_012
     * @tc.desc Verify fill 65536*5+7 = 327687 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(327687, 0, 3);
      expect(arr.at(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_1300
     * @tc.name testUint16ArrayFill102_013
     * @tc.desc Verify fill -65536*3+9 = -196599 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-196599, 0, 3);
      expect(arr.at(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_1400
     * @tc.name testUint16ArrayFill102_014
     * @tc.desc Verify fill 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(100);
      arr.fill(123, 50, 100);
      expect(arr.at(99)).assertEqual(123);
      expect(arr.at(49)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_1500
     * @tc.name testUint16ArrayFill102_015
     * @tc.desc Verify fill 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(100);
      arr.fill(123, 0, 50);
      expect(arr.at(0)).assertEqual(123);
      expect(arr.at(50)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_1600
     * @tc.name testUint16ArrayFill102_016
     * @tc.desc Verify fill arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(7);
      const lenBefore: int = arr.length;
      arr.fill(99, 2, 5);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_1700
     * @tc.name testUint16ArrayFill102_017
     * @tc.desc Verify fill -65537 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-65537, 0, 3);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_1800
     * @tc.name testUint16ArrayFill102_018
     * @tc.desc Verify fill value=1 start=0, end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(1, 0, 1);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_1900
     * @tc.name testUint16ArrayFill102_019
     * @tc.desc Verify fill value=1 start=4, end=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(1, 4, 5);
      expect(arr.at(4)).assertEqual(1);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_2000
     * @tc.name testUint16ArrayFill102_020
     * @tc.desc Verify fill value=0xFFFE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0xFFFE, 0, 3);
      expect(arr.at(2)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_2100
     * @tc.name testUint16ArrayFill102_021
     * @tc.desc Verify fill(value) on empty array (no-op)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(0);
      const result: Uint16Array = arr.fill(123);
      expect(result).assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_2200
     * @tc.name testUint16ArrayFill102_022
     * @tc.desc Verify fill with value = 32767 (max signed 16-bit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(4);
      arr.fill(32767, 1, 3);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(32767);
      expect(arr.at(2)).assertEqual(32767);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_2300
     * @tc.name testUint16ArrayFill102_023
     * @tc.desc Verify fill with value = -32768 (becomes 32768)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-32768);
      expect(arr.at(0)).assertEqual(32768);
      expect(arr.at(1)).assertEqual(32768);
      expect(arr.at(2)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_2400
     * @tc.name testUint16ArrayFill102_024
     * @tc.desc Verify fill with start = -10 (clamps to 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(444, -10, 2);
      expect(arr.at(0)).assertEqual(444);
      expect(arr.at(1)).assertEqual(444);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_2500
     * @tc.name testUint16ArrayFill102_025
     * @tc.desc Verify fill with end = -10 (clamps to 0, no-op)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(999, 0, -10);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL102_2600
     * @tc.name testUint16ArrayFill102_026
     * @tc.desc Verify chaining fill calls with different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill102_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(6);
      arr.fill(111, 0, 2).fill(222, 2, 4).fill(333, 4, 6);
      expect(arr.at(0)).assertEqual(111);
      expect(arr.at(1)).assertEqual(111);
      expect(arr.at(2)).assertEqual(222);
      expect(arr.at(3)).assertEqual(222);
      expect(arr.at(4)).assertEqual(333);
      expect(arr.at(5)).assertEqual(333);
    });

  });
}
