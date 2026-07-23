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

export default function uint32ArrayFindLastTest2(): void {
  describe('Uint32ArrayFindLastTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_0100
     * @tc.name testUint32ArrayFindLastPartTwo001
     * @tc.desc Verify findLast on ArrayBuffer-backed array returns last match 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const values = new Uint32Array(buf, 0, 3);
      values[0] = 1;
      values[1] = 3;
      values[2] = 5;
      const ret: number = values.findLast((value, index, array) => value > 4);
      expect(ret).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_0200
     * @tc.name testUint32ArrayFindLastPartTwo002
     * @tc.desc Verify findLast(value > 5) from [2, 4, 6, 8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(2, 4, 6, 8);
      const view = parent.subarray(2);
      const ret: number = view.findLast((value, index, array) => value > 5);
      expect(ret).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_0300
     * @tc.name testUint32ArrayFindLastPartTwo003
     * @tc.desc Verify findLast(value > 4) from [1, 7, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = Uint32Array.of(1, 7, 2);
      const copy = original.slice(0);
      const ret: number = copy.findLast((value, index, array) => value > 4);
      expect(ret).assertEqual(7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_0400
     * @tc.name testUint32ArrayFindLastPartTwo004
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const before: number = values.length;
      values.findLast((value, index, array) => value > 4);
      const after: number = values.length;
      expect(before).assertEqual(3);
      expect(after).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_0500
     * @tc.name testUint32ArrayFindLastPartTwo005
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const before: number = values.byteLength;
      values.findLast((value, index, array) => value > 4);
      const after: number = values.byteLength;
      expect(before).assertEqual(12);
      expect(after).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_0600
     * @tc.name testUint32ArrayFindLastPartTwo006
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const before: number = values.byteOffset;
      values.findLast((value, index, array) => value > 4);
      const after: number = values.byteOffset;
      expect(before).assertEqual(0);
      expect(after).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_0700
     * @tc.name testUint32ArrayFindLastPartTwo007
     * @tc.desc Verify findLast on ArrayBuffer with offset does not change byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const values = new Uint32Array(buf, 8, 4);
      values[0] = 1;
      values[3] = 9;
      const before: number = values.byteOffset;
      values.findLast((value, index, array) => value > 4);
      const after: number = values.byteOffset;
      expect(before).assertEqual(8);
      expect(after).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_0800
     * @tc.name testUint32ArrayFindLastPartTwo008
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const before = values.buffer;
      values.findLast((value, index, array) => value > 4);
      const after = values.buffer;
      expect(after).assertEqual(before);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_0900
     * @tc.name testUint32ArrayFindLastPartTwo009
     * @tc.desc Verify findLast(value === 9) from [9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(9);
      const before: number = values.byteLength;
      values.findLast((value, index, array) => value === 9);
      const after: number = values.byteLength;
      expect(before).assertEqual(4);
      expect(after).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_1000
     * @tc.name testUint32ArrayFindLastPartTwo010
     * @tc.desc Verify findLast({ throw new Error('boom') from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const before: number = values.length;
      try {
        values.findLast((value, index, array) => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const after: number = values.length;
      expect(before).assertEqual(3);
      expect(after).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_1100
     * @tc.name testUint32ArrayFindLastPartTwo011
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const before: number = values.BYTES_PER_ELEMENT;
      values.findLast((value, index, array) => value > 4);
      const after: number = values.BYTES_PER_ELEMENT;
      expect(before).assertEqual(4);
      expect(after).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_1200
     * @tc.name testUint32ArrayFindLastPartTwo012
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const before: number = values.buffer.byteLength;
      values.findLast((value, index, array) => value > 4);
      const after: number = values.buffer.byteLength;
      expect(before).assertEqual(12);
      expect(after).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_1300
     * @tc.name testUint32ArrayFindLastPartTwo013
     * @tc.desc Verify findLast on subarray(1) does not change byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(2, 4, 6, 8);
      const view = parent.subarray(1);
      const before: number = view.byteOffset;
      view.findLast((value, index, array) => value > 5);
      const after: number = view.byteOffset;
      expect(before).assertEqual(4);
      expect(after).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_1400
     * @tc.name testUint32ArrayFindLastPartTwo014
     * @tc.desc Verify findLast on subarray(1,3) does not change length or byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(2, 4, 6, 8);
      const view = parent.subarray(1, 3);
      const lenBefore: number = view.length;
      const byteBefore: number = view.byteLength;
      view.findLast((value, index, array) => value > 3);
      expect(lenBefore).assertEqual(2);
      expect(view.length).assertEqual(2);
      expect(byteBefore).assertEqual(8);
      expect(view.byteLength).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_1500
     * @tc.name testUint32ArrayFindLastPartTwo015
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const ret: number = values.findLast((value, index, array) => value > 4);
      expect(ret).assertEqual(6);
      expect(values[0]).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_1600
     * @tc.name testUint32ArrayFindLastPartTwo016
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const snap = values.slice(0);
      const ret: number = values.findLast((value, index, array) => value > 4);
      expect(ret).assertEqual(6);
      expect(values[0]).assertEqual(snap[0]);
      expect(values[1]).assertEqual(snap[1]);
      expect(values[2]).assertEqual(snap[2]);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_1700
     * @tc.name testUint32ArrayFindLastPartTwo017
     * @tc.desc Verify findLast({ throw new Error('boom') from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      try {
        values.findLast((value, index, array) => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(values[0]).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_1800
     * @tc.name testUint32ArrayFindLastPartTwo018
     * @tc.desc Verify findLast(value === 3) from [3, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 2, 3);
      const ret: number = values.findLast((value, index, array) => value === 3);
      expect(ret).assertEqual(3);
      expect(values[0]).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_1900
     * @tc.name testUint32ArrayFindLastPartTwo019
     * @tc.desc Verify findLast(value === 4294967295) from [1, 4294967295]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 4294967295);
      const ret: number = values.findLast((value, index, array) => value === 4294967295);
      expect(ret).assertEqual(4294967295);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(4294967295);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_2000
     * @tc.name testUint32ArrayFindLastPartTwo020
     * @tc.desc Verify findLast(value === 0) from [0, 1, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 1, 0);
      const ret: number = values.findLast((value, index, array) => value === 0);
      expect(ret).assertEqual(0);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(1);
      expect(values[2]).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_2100
     * @tc.name testUint32ArrayFindLastPartTwo021
     * @tc.desc Verify findLast(array.length === 3) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const ret: number = values.findLast((value, index, array) => array.length === 3);
      expect(ret).assertEqual(6);
      expect(values[0]).assertEqual(4);
      expect(values[1]).assertEqual(5);
      expect(values[2]).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_2200
     * @tc.name testUint32ArrayFindLastPartTwo022
     * @tc.desc Verify findLast(value === 9) from [9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(9);
      const ret: number = values.findLast((value, index, array) => value === 9);
      expect(ret).assertEqual(9);
      expect(values[0]).assertEqual(9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_2300
     * @tc.name testUint32ArrayFindLastPartTwo023
     * @tc.desc Verify findLast on subarray(1) does not mutate parent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(2, 4, 6, 8);
      const view = parent.subarray(1);
      view.findLast((value, index, array) => value > 5);
      expect(parent[0]).assertEqual(2);
      expect(parent[1]).assertEqual(4);
      expect(parent[2]).assertEqual(6);
      expect(parent[3]).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_2400
     * @tc.name testUint32ArrayFindLastPartTwo024
     * @tc.desc Verify findLast(value > 15) from [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      values.findLast((value, index, array) => value > 15);
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
      expect(values[3]).assertEqual(40);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_2500
     * @tc.name testUint32ArrayFindLastPartTwo025
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const ret: number = values.findLast((value, index, array) => value > 4);
      const sum: number = ret + 1;
      expect(sum).assertEqual(7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_2600
     * @tc.name testUint32ArrayFindLastPartTwo026
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const ret: number = values.findLast((value, index, array) => value > 4);
      expect(ret * 2).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_2700
     * @tc.name testUint32ArrayFindLastPartTwo027
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const ret: number = values.findLast((value, index, array) => value > 4);
      expect(ret).assertEqual(values[2]);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_2800
     * @tc.name testUint32ArrayFindLastPartTwo028
     * @tc.desc Verify findLast on ArrayBuffer-backed array byteLength equals length times BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const values = new Uint32Array(buf, 0, 3);
      values[0] = 1;
      values[2] = 9;
      values.findLast((value, index, array) => value > 4);
      expect(values.byteLength).assertEqual(values.length * values.BYTES_PER_ELEMENT);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_2900
     * @tc.name testUint32ArrayFindLastPartTwo029
     * @tc.desc Verify findLast on parent does not mutate subarray elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(2, 4, 6, 8);
      const child = parent.subarray(1);
      parent.findLast((value, index, array) => value > 4);
      expect(child[0]).assertEqual(4);
      expect(child[1]).assertEqual(6);
      expect(child[2]).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_3000
     * @tc.name testUint32ArrayFindLastPartTwo030
     * @tc.desc Verify findLast on subarray(1) does not mutate parent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(2, 4, 6, 8);
      const child = parent.subarray(1);
      child.findLast((value, index, array) => value > 5);
      expect(parent[0]).assertEqual(2);
      expect(parent[1]).assertEqual(4);
      expect(parent[2]).assertEqual(6);
      expect(parent[3]).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_3100
     * @tc.name testUint32ArrayFindLastPartTwo031
     * @tc.desc Verify findLast on ArrayBuffer with offset does not change byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const values = new Uint32Array(buf, 8, 3);
      values[0] = 1;
      values[2] = 9;
      const before: number = values.byteOffset;
      values.findLast((value, index, array) => value > 4);
      expect(values.byteOffset).assertEqual(before);
      expect(values.byteOffset).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_3200
     * @tc.name testUint32ArrayFindLastPartTwo032
     * @tc.desc Verify findLast on ArrayBuffer with offset does not change buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const values = new Uint32Array(buf, 8, 3);
      values[0] = 1;
      values[2] = 9;
      const before: number = buf.byteLength;
      values.findLast((value, index, array) => value > 4);
      expect(buf.byteLength).assertEqual(before);
      expect(buf.byteLength).assertEqual(24);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_3300
     * @tc.name testUint32ArrayFindLastPartTwo033
     * @tc.desc Verify findLast on one view does not mutate sibling view over shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint32Array(buf, 0, 2);
      const b = new Uint32Array(buf, 8, 2);
      a[0] = 1;
      a[1] = 2;
      b[0] = 3;
      b[1] = 9;
      a.findLast((value, index, array) => value > 0);
      expect(b[0]).assertEqual(3);
      expect(b[1]).assertEqual(9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_3400
     * @tc.name testUint32ArrayFindLastPartTwo034
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      values.findLast((value, index, array) => value > 4);
      expect(values.toString()).assertEqual('4,5,6');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_3500
     * @tc.name testUint32ArrayFindLastPartTwo035
     * @tc.desc Verify findLast on subarray(2) does not change byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(2, 4, 6, 8);
      const view = parent.subarray(2);
      const before: number = view.byteOffset;
      view.findLast((value, index, array) => value > 5);
      expect(view.byteOffset).assertEqual(before);
      expect(view.byteOffset).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_3600
     * @tc.name testUint32ArrayFindLastPartTwo036
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const buf = values.buffer;
      values.findLast((value, index, array) => value > 4);
      expect(values.buffer).assertEqual(buf);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_3700
     * @tc.name testUint32ArrayFindLastPartTwo037
     * @tc.desc Verify findLast does not change buffer reference between parent and subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(2, 4, 6, 8);
      const child = parent.subarray(1);
      expect(parent.buffer).assertEqual(child.buffer);
      parent.findLast((value, index, array) => value > 4);
      expect(parent.buffer).assertEqual(child.buffer);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTTWO_3800
     * @tc.name testUint32ArrayFindLastPartTwo038
     * @tc.desc Verify findLast(value > 4) from [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      values.findLast((value, index, array) => value > 4);
      const product: number = values.length * 4;
      expect(product).assertEqual(values.byteLength);
    });

  });
}

