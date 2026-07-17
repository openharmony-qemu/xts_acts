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

export default function uint16ArrayFill02Test(): void {
  describe('Uint16ArrayFill02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0001
     * @tc.name testUint16ArrayFillTwo001
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(99, 2, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(99);
      expect(arr.at(3)).assertEqual(99);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0002
     * @tc.name testUint16ArrayFillTwo002
     * @tc.desc Verify fill arr[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(88, 2, 3);
      expect(arr.at(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0003
     * @tc.name testUint16ArrayFillTwo003
     * @tc.desc Verify fill arr[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(88, 2, 5);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(88);
      expect(arr.at(3)).assertEqual(88);
      expect(arr.at(4)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0004
     * @tc.name testUint16ArrayFillTwo004
     * @tc.desc Verify fill arr[3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(88, 0, 3);
      expect(arr.at(0)).assertEqual(88);
      expect(arr.at(1)).assertEqual(88);
      expect(arr.at(2)).assertEqual(88);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0005
     * @tc.name testUint16ArrayFillTwo005
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(10, 0, 5);
      arr.fill(20, 0, 5);
      expect(arr.at(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0006
     * @tc.name testUint16ArrayFillTwo006
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(10, 0, 2);
      arr.fill(20, 3, 5);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(3)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0007
     * @tc.name testUint16ArrayFillTwo007
     * @tc.desc Verify fill join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 1, 4);
      const joined: string = arr.join(",");
      expect(joined).assertEqual("0,42,42,42,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0008
     * @tc.name testUint16ArrayFillTwo008
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(0, 1, 4);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0009
     * @tc.name testUint16ArrayFillTwo009
     * @tc.desc Verify fill 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(65535, 2, 3);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0010
     * @tc.name testUint16ArrayFillTwo010
     * @tc.desc Verify fill 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0b1010, 0, 3);
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0011
     * @tc.name testUint16ArrayFillTwo011
     * @tc.desc Verify fill 1e5 100000 % 65536 = 34464
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(1e5, 0, 3);
      expect(arr.at(0)).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0012
     * @tc.name testUint16ArrayFillTwo012
     * @tc.desc Verify fill 65536*5+7 = 327687 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(327687, 0, 3);
      expect(arr.at(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0013
     * @tc.name testUint16ArrayFillTwo013
     * @tc.desc Verify fill -65536*3+9 = -196599 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-196599, 0, 3);
      expect(arr.at(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0014
     * @tc.name testUint16ArrayFillTwo014
     * @tc.desc Verify fill 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(100);
      arr.fill(123, 50, 100);
      expect(arr.at(99)).assertEqual(123);
      expect(arr.at(49)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0015
     * @tc.name testUint16ArrayFillTwo015
     * @tc.desc Verify fill 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(100);
      arr.fill(123, 0, 50);
      expect(arr.at(0)).assertEqual(123);
      expect(arr.at(50)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0016
     * @tc.name testUint16ArrayFillTwo016
     * @tc.desc Verify fill arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(7);
      const lenBefore: int = arr.length;
      arr.fill(99, 2, 5);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0017
     * @tc.name testUint16ArrayFillTwo017
     * @tc.desc Verify fill -65537 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-65537, 0, 3);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0018
     * @tc.name testUint16ArrayFillTwo018
     * @tc.desc Verify fill value=1 start=0, end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(1, 0, 1);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0019
     * @tc.name testUint16ArrayFillTwo019
     * @tc.desc Verify fill value=1 start=4, end=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(1, 4, 5);
      expect(arr.at(4)).assertEqual(1);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0020
     * @tc.name testUint16ArrayFillTwo020
     * @tc.desc Verify fill value=0xFFFE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0xFFFE, 0, 3);
      expect(arr.at(2)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0021
     * @tc.name testUint16ArrayFillTwo021
     * @tc.desc Verify fill with value = 32767 (max signed 16-bit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(4);
      arr.fill(32767, 1, 3);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(32767);
      expect(arr.at(2)).assertEqual(32767);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0022
     * @tc.name testUint16ArrayFillTwo022
     * @tc.desc Verify fill with value = -32768 (becomes 32768)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-32768);
      expect(arr.at(0)).assertEqual(32768);
      expect(arr.at(1)).assertEqual(32768);
      expect(arr.at(2)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0023
     * @tc.name testUint16ArrayFillTwo023
     * @tc.desc Verify fill with start = -10 (clamps to 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(444, -10, 2);
      expect(arr.at(0)).assertEqual(444);
      expect(arr.at(1)).assertEqual(444);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0024
     * @tc.name testUint16ArrayFillTwo024
     * @tc.desc Verify fill with end = -10 (clamps to 0, no-op)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(999, 0, -10);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0025
     * @tc.name testUint16ArrayFillTwo025
     * @tc.desc Verify chaining fill calls with different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(6);
      arr.fill(111, 0, 2).fill(222, 2, 4).fill(333, 4, 6);
      expect(arr.at(0)).assertEqual(111);
      expect(arr.at(1)).assertEqual(111);
      expect(arr.at(2)).assertEqual(222);
      expect(arr.at(3)).assertEqual(222);
      expect(arr.at(4)).assertEqual(333);
      expect(arr.at(5)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_TWO_0026
     * @tc.name testUint16ArrayFillTwo026
     * @tc.desc Verify fill stores the decimal value 255 from the octal literal 0o377
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0o377, 0, 3);
      expect(arr.at(0)).assertEqual(255);
      expect(arr.at(1)).assertEqual(255);
      expect(arr.at(2)).assertEqual(255);
    });

  });
}
