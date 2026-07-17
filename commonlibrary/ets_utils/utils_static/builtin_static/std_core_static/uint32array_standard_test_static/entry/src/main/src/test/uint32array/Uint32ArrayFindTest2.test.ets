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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayFindTest2(): void {
  describe('Uint32ArrayFindTest2', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_0100
     * @tc.name testUint32ArrayFindPartTwo001
     * @tc.desc Verify find find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      const r1 = values.find((v: number): boolean => v === 99);
      const r2 = values.find((v: number): boolean => v === 99);
      expect(r1).assertUndefined();
      expect(r2).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_0200
     * @tc.name testUint32ArrayFindPartTwo002
     * @tc.desc Verify find 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967296, 5, 6);
      const r = values.find((v: number): boolean => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_0300
     * @tc.name testUint32ArrayFindPartTwo003
     * @tc.desc Verify find $_get(index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(11, 22, 33);
      const r = values.find((v: number): boolean => v === 22);
      expect(r).assertEqual(values.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_0400
     * @tc.name testUint32ArrayFindPartTwo004
     * @tc.desc Verify find values[index]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(11, 22, 33);
      const r = values.find((v: number): boolean => v === 33);
      expect(r).assertEqual(values[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_0500
     * @tc.name testUint32ArrayFindPartTwo005
     * @tc.desc Verify find 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(65535);
      values.$_set(0, 1);
      values.$_set(65534, 7777);
      const r = values.find((v: number): boolean => v === 7777);
      expect(r).assertEqual(7777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_0600
     * @tc.name testUint32ArrayFindPartTwo006
     * @tc.desc Verify find -2147483648 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(-2147483648, 0, 1);
      const r = values.find((v: number): boolean => v === 2147483648);
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_0700
     * @tc.name testUint32ArrayFindPartTwo007
     * @tc.desc Verify find length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      const r = values.find((v: number): boolean => v > 0);
      expect(r).assertEqual(1);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_0800
     * @tc.name testUint32ArrayFindPartTwo008
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(7, 8, 9);
      const r = values.find((v: number): boolean => v === 8);
      expect(r).assertEqual(8);
      expect(values.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_0900
     * @tc.name testUint32ArrayFindPartTwo009
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(7, 8, 9);
      const r = values.find((v: number): boolean => v === 8);
      expect(r).assertEqual(8);
      expect(values.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_1000
     * @tc.name testUint32ArrayFindPartTwo010
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(7, 8, 9);
      const r = values.find((v: number): boolean => v === 8);
      expect(r).assertEqual(8);
      expect(values.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_1100
     * @tc.name testUint32ArrayFindPartTwo011
     * @tc.desc Verify find byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      const r = values.find((v: number): boolean => v === 2);
      expect(r).assertEqual(2);
      expect(values.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_1200
     * @tc.name testUint32ArrayFindPartTwo012
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const r = values.find((v: number): boolean => v === 20);
      expect(r).assertEqual(20);
      expect(values.$_get(0)).assertEqual(10);
      expect(values.$_get(1)).assertEqual(20);
      expect(values.$_get(2)).assertEqual(30);
      expect(values.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_1300
     * @tc.name testUint32ArrayFindPartTwo013
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      const r = values.find((v: number): boolean => v === 99);
      expect(r).assertUndefined();
      expect(values.length).assertEqual(3);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_1400
     * @tc.name testUint32ArrayFindPartTwo014
     * @tc.desc Verify find buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const r = values.find((v: number): boolean => v === 3);
      expect(r).assertEqual(3);
      expect(values.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_1500
     * @tc.name testUint32ArrayFindPartTwo015
     * @tc.desc Verify find byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      const r = values.find((v: number): boolean => v === 2);
      expect(r).assertEqual(2);
      expect(values.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_1600
     * @tc.name testUint32ArrayFindPartTwo016
     * @tc.desc Verify find find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      const r1 = values.find((v: number): boolean => v === 2);
      const r2 = values.find((v: number): boolean => v === 2);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_1700
     * @tc.name testUint32ArrayFindPartTwo017
     * @tc.desc Verify find find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      const r = values.find((v: number): boolean => v === 2);
      values.$_set(0, 999);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_1800
     * @tc.name testUint32ArrayFindPartTwo018
     * @tc.desc Verify find sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3, 1, 2);
      const r = values.find((v: number): boolean => v === 3);
      values.sort();
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_1900
     * @tc.name testUint32ArrayFindPartTwo019
     * @tc.desc Verify find length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const before: int = values.length;
      const r = values.find((v: number): boolean => v === 3);
      const after: int = values.length;
      expect(r).assertEqual(3);
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_2000
     * @tc.name testUint32ArrayFindPartTwo020
     * @tc.desc Verify find byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      const before: int = values.byteLength;
      const r = values.find((v: number): boolean => v === 2);
      const after: int = values.byteLength;
      expect(r).assertEqual(2);
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_2100
     * @tc.name testUint32ArrayFindPartTwo021
     * @tc.desc Verify find length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const view: Uint32Array = base.subarray(1, 4);
      const r = view.find((v: number): boolean => v === 3);
      expect(r).assertEqual(3);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_2200
     * @tc.name testUint32ArrayFindPartTwo022
     * @tc.desc Verify find byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const view: Uint32Array = base.subarray(1, 3);
      const off: int = view.byteOffset;
      const r = view.find((v: number): boolean => v === 2);
      expect(r).assertEqual(2);
      expect(view.byteOffset).assertEqual(off);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_2300
     * @tc.name testUint32ArrayFindPartTwo023
     * @tc.desc Verify find buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const before: int = values.buffer.byteLength;
      const r = values.find((v: number): boolean => v === 4);
      expect(r).assertEqual(4);
      expect(values.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_2400
     * @tc.name testUint32ArrayFindPartTwo024
     * @tc.desc Verify subarray isView === true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const view: Uint32Array = base.subarray(1, 3);
      const r = view.find((v: number): boolean => v === 2);
      expect(r).assertEqual(2);
      expect(view.buffer).assertEqual(base.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_2500
     * @tc.name testUint32ArrayFindPartTwo025
     * @tc.desc Verify find subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = base.subarray(1, 3);
      const r = view.find((v: number): boolean => v === 30);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_2600
     * @tc.name testUint32ArrayFindPartTwo026
     * @tc.desc Verify find buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const view: Uint32Array = base.subarray(0, 2);
      const r1 = view.find((v: number): boolean => v === 1);
      base.$_set(0, 999);
      const r2 = view.find((v: number): boolean => v === 999);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_2700
     * @tc.name testUint32ArrayFindPartTwo027
     * @tc.desc Verify subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const view: Uint32Array = base.subarray(2, 4);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_2800
     * @tc.name testUint32ArrayFindPartTwo028
     * @tc.desc Verify find slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3);
      const copy: Uint32Array = base.slice(0, 3);
      base.$_set(0, 999);
      const r = copy.find((v: number): boolean => v === 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_2900
     * @tc.name testUint32ArrayFindPartTwo029
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = base.subarray(1, 3);
      const r = view.find((v: number): boolean => v === 20);
      expect(r).assertEqual(base.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_3000
     * @tc.name testUint32ArrayFindPartTwo030
     * @tc.desc Verify subarray length find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const view: Uint32Array = base.subarray(0, 2);
      const r = view.find((v: number): boolean => v === 5);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_3100
     * @tc.name testUint32ArrayFindPartTwo031
     * @tc.desc Verify find byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(11, 22, 33, 44);
      const view: Uint32Array = base.subarray(2, 4);
      const r = view.find((v: number): boolean => v === 11);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTTWO_3200
     * @tc.name testUint32ArrayFindPartTwo032
     * @tc.desc Verify buffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const firstHalf: Uint32Array = base.subarray(0, 2);
      const secondHalf: Uint32Array = base.subarray(2, 4);
      const firstResult = firstHalf.find((val: number): boolean => val === 3);
      const secondResult = secondHalf.find((val: number): boolean => val === 3);
      expect(firstResult).assertUndefined();
      expect(secondResult).assertEqual(3);
    });

  });
}
