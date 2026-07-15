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

export default function Float32ArrayFindIndex2Test(): void {
  describe('Float32ArrayFindIndex2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_0100
     * @tc.name testFloat32ArrayFindIndexTWO001
     * @tc.desc Verify no match returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 99.0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_0200
     * @tc.name testFloat32ArrayFindIndexTWO002
     * @tc.desc Verify an empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 10.0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_0300
     * @tc.name testFloat32ArrayFindIndexTWO003
     * @tc.desc Verify a single-element match returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([70.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 70.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_0400
     * @tc.name testFloat32ArrayFindIndexTWO004
     * @tc.desc Verify a single-element no-match returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([70.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 80.0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_0500
     * @tc.name testFloat32ArrayFindIndexTWO005
     * @tc.desc Verify a NaN predicate match returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, NaN, 30.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value !== value);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_0600
     * @tc.name testFloat32ArrayFindIndexTWO006
     * @tc.desc Verify multiple matches select the first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([50.0, 50.0, 50.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 50.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_0700
     * @tc.name testFloat32ArrayFindIndexTWO007
     * @tc.desc Verify matching the last-position element returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 50.0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_0800
     * @tc.name testFloat32ArrayFindIndexTWO008
     * @tc.desc Verify matching a negative value returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, -20.0, 30.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === -20.0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_0900
     * @tc.name testFloat32ArrayFindIndexTWO009
     * @tc.desc Verify matching a zero value returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 0.0, 30.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 0.0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_1000
     * @tc.name testFloat32ArrayFindIndexTWO010
     * @tc.desc Verify matching positive Infinity returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, Infinity, 30.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === Infinity);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_1100
     * @tc.name testFloat32ArrayFindIndexTWO011
     * @tc.desc Verify matching the first element returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 10.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_1200
     * @tc.name testFloat32ArrayFindIndexTWO012
     * @tc.desc Verify multiple matches select the first, returning index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([40.0, 40.0, 40.0, 50.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 40.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_1300
     * @tc.name testFloat32ArrayFindIndexTWO013
     * @tc.desc Verify a matching call returns the expected index without modifying the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(result).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(10.0);
      expect(arr.$_get(1)).assertEqual(20.0);
      expect(arr.$_get(2)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_1400
     * @tc.name testFloat32ArrayFindIndexTWO014
     * @tc.desc Verify all elements remain unchanged after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 99.0);
      expect(arr.$_get(0)).assertEqual(10.0);
      expect(arr.$_get(1)).assertEqual(20.0);
      expect(arr.$_get(2)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_1500
     * @tc.name testFloat32ArrayFindIndexTWO015
     * @tc.desc Verify length remains unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_1600
     * @tc.name testFloat32ArrayFindIndexTWO016
     * @tc.desc Verify length remains unchanged after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 99.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_1700
     * @tc.name testFloat32ArrayFindIndexTWO017
     * @tc.desc Verify byteLength remains unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_1800
     * @tc.name testFloat32ArrayFindIndexTWO018
     * @tc.desc Verify the element sum remains unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      const sum: number = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      expect(sum).assertEqual(60.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_1900
     * @tc.name testFloat32ArrayFindIndexTWO019
     * @tc.desc Verify two calls produce consistent results (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const first: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      const second: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_2000
     * @tc.name testFloat32ArrayFindIndexTWO020
     * @tc.desc Verify still iterable after a match with unchanged element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      let count = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        if (v > 0.0) {
          count = count + 1;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_2100
     * @tc.name testFloat32ArrayFindIndexTWO021
     * @tc.desc Verify $_get reads remain correct after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([100.0, 200.0, 300.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 200.0);
      expect(arr.$_get(0)).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_2200
     * @tc.name testFloat32ArrayFindIndexTWO022
     * @tc.desc Verify at reads remain correct after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([100.0, 200.0, 300.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 200.0);
      expect(arr.at(-1)).assertEqual(300.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_2300
     * @tc.name testFloat32ArrayFindIndexTWO023
     * @tc.desc Verify the array is still writable after a match (fill takes effect)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      arr.fill(9.0);
      expect(arr.$_get(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_2400
     * @tc.name testFloat32ArrayFindIndexTWO024
     * @tc.desc Verify the first element remains unchanged after matching the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([70.0, 80.0, 90.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 70.0);
      expect(arr.$_get(0)).assertEqual(70.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_2500
     * @tc.name testFloat32ArrayFindIndexTWO025
     * @tc.desc Verify the last element remains unchanged after matching the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([70.0, 80.0, 90.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 90.0);
      expect(arr.$_get(2)).assertEqual(90.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_2600
     * @tc.name testFloat32ArrayFindIndexTWO026
     * @tc.desc Verify the array can still be reversed after a match (reverse takes effect)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_2700
     * @tc.name testFloat32ArrayFindIndexTWO027
     * @tc.desc Verify the array object reference stays the same after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const ref: Float32Array = arr;
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr).assertEqual(ref);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_2800
     * @tc.name testFloat32ArrayFindIndexTWO028
     * @tc.desc Verify the underlying buffer reference stays the same after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const bufBefore: ArrayBuffer = arr.buffer;
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_2900
     * @tc.name testFloat32ArrayFindIndexTWO029
     * @tc.desc Verify buffer.byteLength remains unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_3000
     * @tc.name testFloat32ArrayFindIndexTWO030
     * @tc.desc Verify after a match the array is still a view of the buffer (writes propagate to a new view)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const arr: Float32Array = new Float32Array(buf, 0, 3);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      arr.$_set(2, 30.0);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      arr.$_set(0, 99.0);
      const direct: Float32Array = new Float32Array(buf, 0, 3);
      expect(direct.$_get(0)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_3100
     * @tc.name testFloat32ArrayFindIndexTWO031
     * @tc.desc Verify the default view byteOffset is 0 and unchanged after the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_3200
     * @tc.name testFloat32ArrayFindIndexTWO032
     * @tc.desc Verify byteOffset remains unchanged after calling on a non-zero offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const arr: Float32Array = new Float32Array(buf, 8, 3);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      arr.$_set(2, 30.0);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_3300
     * @tc.name testFloat32ArrayFindIndexTWO033
     * @tc.desc Verify the buffer raw data is intact after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Float32Array = new Float32Array(buf, 0, 4);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      arr.$_set(2, 30.0);
      arr.$_set(3, 40.0);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 30.0);
      expect(arr.$_get(0)).assertEqual(10.0);
      expect(arr.$_get(3)).assertEqual(40.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_3400
     * @tc.name testFloat32ArrayFindIndexTWO034
     * @tc.desc Verify two views share a buffer, and after calling on A, B's data is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const a: Float32Array = new Float32Array(buf, 0, 2);
      const b: Float32Array = new Float32Array(buf, 8, 2);
      a.$_set(0, 10.0);
      a.$_set(1, 20.0);
      b.$_set(0, 100.0);
      b.$_set(1, 200.0);
      a.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(b.$_get(0)).assertEqual(100.0);
      expect(b.$_get(1)).assertEqual(200.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_3500
     * @tc.name testFloat32ArrayFindIndexTWO035
     * @tc.desc Verify after the call, writing to A still propagates through the buffer and B is unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const a: Float32Array = new Float32Array(buf, 0, 2);
      const b: Float32Array = new Float32Array(buf, 8, 2);
      a.$_set(0, 10.0);
      a.$_set(1, 20.0);
      b.$_set(0, 100.0);
      b.$_set(1, 200.0);
      a.findIndex((value: number, index: int, array: Float32Array) => value === 10.0);
      a.$_set(0, 99.0);
      expect(a.$_get(0)).assertEqual(99.0);
      expect(b.$_get(0)).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_3600
     * @tc.name testFloat32ArrayFindIndexTWO036
     * @tc.desc Verify the underlying buffer reference stays the same after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const bufBefore: ArrayBuffer = arr.buffer;
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 99.0);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_3700
     * @tc.name testFloat32ArrayFindIndexTWO037
     * @tc.desc Verify the underlying buffer reference stays the same after calling on an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      const bufBefore: ArrayBuffer = arr.buffer;
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 10.0);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_3800
     * @tc.name testFloat32ArrayFindIndexTWO038
     * @tc.desc Verify the array object reference stays the same after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const ref: Float32Array = arr;
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 99.0);
      expect(arr).assertEqual(ref);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_3900
     * @tc.name testFloat32ArrayFindIndexTWO039
     * @tc.desc Verify the array object reference stays the same after calling on an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      const ref: Float32Array = arr;
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 10.0);
      expect(arr).assertEqual(ref);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_4000
     * @tc.name testFloat32ArrayFindIndexTWO040
     * @tc.desc Verify the view's buffer.byteLength remains unchanged after the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Float32Array = new Float32Array(buf, 0, 3);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      arr.$_set(2, 30.0);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_4100
     * @tc.name testFloat32ArrayFindIndexTWO041
     * @tc.desc Verify length*4 equals byteLength after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_4200
     * @tc.name testFloat32ArrayFindIndexTWO042
     * @tc.desc Verify length*4 equals byteLength after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 99.0);
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_4300
     * @tc.name testFloat32ArrayFindIndexTWO043
     * @tc.desc Verify length remains unchanged after calling on a view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Float32Array = new Float32Array(buf, 0, 3);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      arr.$_set(2, 30.0);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_4400
     * @tc.name testFloat32ArrayFindIndexTWO044
     * @tc.desc Verify byteLength remains unchanged after calling on a view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Float32Array = new Float32Array(buf, 0, 3);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      arr.$_set(2, 30.0);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_4500
     * @tc.name testFloat32ArrayFindIndexTWO045
     * @tc.desc Verify byteOffset remains unchanged after calling on an offset-4 view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Float32Array = new Float32Array(buf, 4, 3);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      arr.$_set(2, 30.0);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_4600
     * @tc.name testFloat32ArrayFindIndexTWO046
     * @tc.desc Verify both length and byteLength are 0 after calling on an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 10.0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_4700
     * @tc.name testFloat32ArrayFindIndexTWO047
     * @tc.desc Verify length remains unchanged after matching the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([70.0, 80.0, 90.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 70.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_4800
     * @tc.name testFloat32ArrayFindIndexTWO048
     * @tc.desc Verify length remains unchanged after matching the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([70.0, 80.0, 90.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 90.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_4900
     * @tc.name testFloat32ArrayFindIndexTWO049
     * @tc.desc Verify length remains unchanged after calling on a six-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0, 60.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 50.0);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_5000
     * @tc.name testFloat32ArrayFindIndexTWO050
     * @tc.desc Verify byteLength remains unchanged after calling on a six-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0, 60.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 50.0);
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_5100
     * @tc.name testFloat32ArrayFindIndexTWO051
     * @tc.desc Verify length*4 equals byteLength after calling on an offset-8 view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const arr: Float32Array = new Float32Array(buf, 8, 3);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      arr.$_set(2, 30.0);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_5200
     * @tc.name testFloat32ArrayFindIndexTWO052
     * @tc.desc Verify byteOffset remains unchanged after no match on an offset-12 view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const arr: Float32Array = new Float32Array(buf, 12, 3);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      arr.$_set(2, 30.0);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 99.0);
      expect(arr.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_5300
     * @tc.name testFloat32ArrayFindIndexTWO053
     * @tc.desc Verify a matched index is within bounds and equals the expected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(result >= 0 && result < arr.length).assertTrue();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_5400
     * @tc.name testFloat32ArrayFindIndexTWO054
     * @tc.desc Verify the returned index can be used with $_get to retrieve the matched value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.$_get(result.toInt())).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_5500
     * @tc.name testFloat32ArrayFindIndexTWO055
     * @tc.desc Verify the returned index can be used with $_set to write to the matched position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      arr.$_set(result.toInt(), 99.0);
      expect(arr.$_get(result.toInt())).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_5600
     * @tc.name testFloat32ArrayFindIndexTWO056
     * @tc.desc Verify two consecutive calls with the same predicate produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const r1: number = arr.findIndex((value: number, index: int, array: Float32Array) => value >= 30.0);
      const r2: number = arr.findIndex((value: number, index: int, array: Float32Array) => value >= 30.0);
      expect(r1).assertEqual(2);
      expect(r2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_5700
     * @tc.name testFloat32ArrayFindIndexTWO057
     * @tc.desc Verify the returned index can be used with a subarray view $_get to retrieve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const view: Float32Array = arr.subarray(1, 4);
      const result: number = view.findIndex((value: number, index: int, array: Float32Array) => value === 30.0);
      expect(view.$_get(result.toInt())).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_5800
     * @tc.name testFloat32ArrayFindIndexTWO058
     * @tc.desc Verify a large-array match returns index 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 70.0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_5900
     * @tc.name testFloat32ArrayFindIndexTWO059
     * @tc.desc Verify the returned index can be used with a slice copy $_get to retrieve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      const copy: Float32Array = arr.slice();
      expect(copy.$_get(result.toInt())).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_6000
     * @tc.name testFloat32ArrayFindIndexTWO060
     * @tc.desc Verify two consecutive calls with different predicates, the second result is correct and the array is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 30.0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_6100
     * @tc.name testFloat32ArrayFindIndexTWO061
     * @tc.desc Verify the returned index can be used with at to retrieve the matched value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.at(result.toInt())).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_6200
     * @tc.name testFloat32ArrayFindIndexTWO062
     * @tc.desc Verify a subarray view returns a relative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const view: Float32Array = arr.subarray(2, 5);
      const result: number = view.findIndex((value: number, index: int, array: Float32Array) => value === 40.0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_6300
     * @tc.name testFloat32ArrayFindIndexTWO063
     * @tc.desc Verify calling on a view does not modify the corresponding element of the parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const view: Float32Array = arr.subarray(2, 5);
      view.findIndex((value: number, index: int, array: Float32Array) => value === 40.0);
      expect(arr.$_get(3)).assertEqual(40.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_6400
     * @tc.name testFloat32ArrayFindIndexTWO064
     * @tc.desc Verify two non-overlapping views share a buffer, and after calling on A, B's data is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const a: Float32Array = new Float32Array(buf, 0, 3);
      const b: Float32Array = new Float32Array(buf, 12, 3);
      a.$_set(0, 10.0);
      a.$_set(1, 20.0);
      a.$_set(2, 30.0);
      b.$_set(0, 100.0);
      b.$_set(1, 200.0);
      b.$_set(2, 300.0);
      a.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(b.$_get(1)).assertEqual(200.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_6500
     * @tc.name testFloat32ArrayFindIndexTWO065
     * @tc.desc Verify a non-zero offset view returns a relative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const view: Float32Array = new Float32Array(buf, 4, 4);
      view.$_set(0, 10.0);
      view.$_set(1, 20.0);
      view.$_set(2, 30.0);
      view.$_set(3, 40.0);
      const result: number = view.findIndex((value: number, index: int, array: Float32Array) => value === 30.0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_6600
     * @tc.name testFloat32ArrayFindIndexTWO066
     * @tc.desc Verify matching the last position in a view returns an index less than the view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const view: Float32Array = new Float32Array(buf, 4, 4);
      view.$_set(0, 10.0);
      view.$_set(1, 20.0);
      view.$_set(2, 30.0);
      view.$_set(3, 40.0);
      const result: number = view.findIndex((value: number, index: int, array: Float32Array) => value === 40.0);
      expect(result).assertEqual(3);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_6700
     * @tc.name testFloat32ArrayFindIndexTWO067
     * @tc.desc Verify byteOffset remains unchanged after no match on a non-zero offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const view: Float32Array = new Float32Array(buf, 8, 3);
      view.$_set(0, 10.0);
      view.$_set(1, 20.0);
      view.$_set(2, 30.0);
      view.findIndex((value: number, index: int, array: Float32Array) => value === 99.0);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_6800
     * @tc.name testFloat32ArrayFindIndexTWO068
     * @tc.desc Verify byteLength remains unchanged after a match on a non-zero offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const view: Float32Array = new Float32Array(buf, 8, 3);
      view.$_set(0, 10.0);
      view.$_set(1, 20.0);
      view.$_set(2, 30.0);
      view.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_6900
     * @tc.name testFloat32ArrayFindIndexTWO069
     * @tc.desc Verify the first and last elements of the parent array remain unchanged after calling on a view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0, 60.0]);
      const view: Float32Array = arr.subarray(1, 4);
      view.findIndex((value: number, index: int, array: Float32Array) => value === 30.0);
      expect(arr.$_get(0)).assertEqual(10.0);
      expect(arr.$_get(5)).assertEqual(60.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_7000
     * @tc.name testFloat32ArrayFindIndexTWO070
     * @tc.desc Verify the index returned by a buffer view can be used with the view $_get to retrieve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const view: Float32Array = new Float32Array(buf, 0, 4);
      view.$_set(0, 10.0);
      view.$_set(1, 20.0);
      view.$_set(2, 30.0);
      view.$_set(3, 40.0);
      const result: number = view.findIndex((value: number, index: int, array: Float32Array) => value === 30.0);
      expect(view.$_get(result.toInt())).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_7100
     * @tc.name testFloat32ArrayFindIndexTWO071
     * @tc.desc Verify after calling on a view, writing to the parent array still propagates to the view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const view: Float32Array = arr.subarray(2, 5);
      view.findIndex((value: number, index: int, array: Float32Array) => value === 40.0);
      arr.$_set(3, 99.0);
      expect(view.$_get(1)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_7200
     * @tc.name testFloat32ArrayFindIndexTWO072
     * @tc.desc Verify each of two views' findIndex independently returns a relative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const a: Float32Array = new Float32Array(buf, 0, 3);
      const b: Float32Array = new Float32Array(buf, 12, 3);
      a.$_set(0, 10.0);
      a.$_set(1, 20.0);
      a.$_set(2, 30.0);
      b.$_set(0, 100.0);
      b.$_set(1, 200.0);
      b.$_set(2, 300.0);
      const ra: number = a.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      const rb: number = b.findIndex((value: number, index: int, array: Float32Array) => value === 200.0);
      expect(ra).assertEqual(1);
      expect(rb).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_7300
     * @tc.name testFloat32ArrayFindIndexTWO073
     * @tc.desc Verify a subarray view's length differs from the parent array's length and both remain unchanged after the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const view: Float32Array = arr.subarray(1, 4);
      view.findIndex((value: number, index: int, array: Float32Array) => value === 30.0);
      expect(view.length).assertEqual(3);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_7400
     * @tc.name testFloat32ArrayFindIndexTWO074
     * @tc.desc Verify $_set writing to a specified index takes effect after the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      arr.$_set(0, 99.0);
      expect(arr.$_get(0)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_7500
     * @tc.name testFloat32ArrayFindIndexTWO075
     * @tc.desc Verify slice returns a correct copy after the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      const copy: Float32Array = arr.slice(0, 2);
      expect(copy.$_get(0)).assertEqual(10.0);
      expect(copy.$_get(1)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_7600
     * @tc.name testFloat32ArrayFindIndexTWO076
     * @tc.desc Verify subarray returns a valid view after the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      const view: Float32Array = arr.subarray(1, 3);
      expect(view.$_get(0)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_7700
     * @tc.name testFloat32ArrayFindIndexTWO077
     * @tc.desc Verify copyWithin takes effect after the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      arr.copyWithin(0, 2, 3);
      expect(arr.$_get(0)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_7800
     * @tc.name testFloat32ArrayFindIndexTWO078
     * @tc.desc Verify reverse takes effect after the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      arr.reverse();
      expect(arr.$_get(3)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_7900
     * @tc.name testFloat32ArrayFindIndexTWO079
     * @tc.desc Verify calling findIndex again with a different predicate after the call returns the correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 40.0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_8000
     * @tc.name testFloat32ArrayFindIndexTWO080
     * @tc.desc Verify fill takes effect after the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      arr.fill(7.0);
      expect(arr.$_get(2)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_8100
     * @tc.name testFloat32ArrayFindIndexTWO081
     * @tc.desc Verify indexOf is still correct after the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.indexOf(30.0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_8200
     * @tc.name testFloat32ArrayFindIndexTWO082
     * @tc.desc Verify lastIndexOf is still correct after the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      expect(arr.lastIndexOf(20.0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_8300
     * @tc.name testFloat32ArrayFindIndexTWO083
     * @tc.desc Verify map returns a new array with correct mapping after the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.findIndex((value: number, index: int, array: Float32Array) => value === 20.0);
      const mapped: Float32Array = arr.map((value: number, index: int, array: Float32Array) => value * 2.0);
      expect(mapped.$_get(0)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_8400
     * @tc.name testFloat32ArrayFindIndexTWO084
     * @tc.desc Verify the callback receives the index of the current element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      let receivedIndex: int = -1;
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array): boolean => {
        if (value === 20.0) {
          receivedIndex = index;
          return true;
        }
        return false;
      });
      expect(result).assertEqual(1);
      expect(receivedIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_8500
     * @tc.name testFloat32ArrayFindIndexTWO085
     * @tc.desc Verify the callback receives the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      let sameArray: boolean = false;
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array): boolean => {
        sameArray = array === arr;
        return value === 10.0;
      });
      expect(result).assertEqual(0);
      expect(sameArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_8600
     * @tc.name testFloat32ArrayFindIndexTWO086
     * @tc.desc Verify callback iteration stops after the first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      let callCount: int = 0;
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array): boolean => {
        callCount++;
        return value === 20.0;
      });
      expect(result).assertEqual(1);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_8700
     * @tc.name testFloat32ArrayFindIndexTWO087
     * @tc.desc Verify no match invokes the callback for every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      let callCount: int = 0;
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array): boolean => {
        callCount++;
        return false;
      });
      expect(result).assertEqual(-1);
      expect(callCount).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_8800
     * @tc.name testFloat32ArrayFindIndexTWO088
     * @tc.desc Verify empty array findIndex returns -1 and does not call the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      let callCount: int = 0;
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array): boolean => {
        callCount++;
        return true;
      });
      const expectIndex: number = -1;
      const expectCount: int = 0;
      expect(result).assertEqual(expectIndex);
      expect(callCount).assertEqual(expectCount);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_8900
     * @tc.name testFloat32ArrayFindIndexTWO089
     * @tc.desc Verify predicate mutation of a later element can be observed by a later predicate call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const changedValue: number = 22.0;
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array): boolean => {
        if (index === 0) {
          array.$_set(1, changedValue);
        }
        return value === changedValue;
      });
      const expectIndex: number = 1;
      expect(result).assertEqual(expectIndex);
      expect(arr.$_get(1)).assertEqual(changedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_9000
     * @tc.name testFloat32ArrayFindIndexTWO090
     * @tc.desc Verify first element match stops after one predicate call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const matchValue: number = 5.0;
      const arr: Float32Array = new Float32Array([matchValue, 6.0, 7.0]);
      let callCount: int = 0;
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array): boolean => {
        callCount++;
        return value === matchValue;
      });
      expect(result).assertEqual(0);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_9100
     * @tc.name testFloat32ArrayFindIndexTWO091
     * @tc.desc Verify findIndex on an offset view reports an index relative to the view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const parent: Float32Array = new Float32Array(buf);
      const view: Float32Array = new Float32Array(buf, 8, 3);
      const expectValue: number = 44.0;
      parent.$_set(3, expectValue);
      const result: number = view.findIndex((value: number, index: int, array: Float32Array): boolean => {
        return value === expectValue;
      });
      const expectIndex: number = 1;
      expect(result).assertEqual(expectIndex);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_9200
     * @tc.name testFloat32ArrayFindIndexTWO092
     * @tc.desc Verify no-match predicate can still modify the array while findIndex returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const changedValue: number = 30.0;
      const result: number = arr.findIndex((value: number, index: int, array: Float32Array): boolean => {
        if (index === 2) {
          array.$_set(index, changedValue);
        }
        return false;
      });
      expect(result).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(changedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXTWO_9300
     * @tc.name testFloat32ArrayFindIndexTWO093
     * @tc.desc Verify findIndex on an offset view returns the view-local index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexTWO093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const view = parent.subarray(1, 4);
      const index = view.findIndex((value: number): boolean => value === 3.0);
      expect(index).assertEqual(1);
    });

  });
}
