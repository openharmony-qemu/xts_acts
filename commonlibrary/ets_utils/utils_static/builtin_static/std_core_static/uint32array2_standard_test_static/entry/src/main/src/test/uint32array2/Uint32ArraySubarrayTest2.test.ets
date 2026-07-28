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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArraySubarrayTwoTest(): void {
  describe('Uint32ArraySubarrayTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_0100
     * @tc.name testUint32ArraySubarrayTwo001
     * @tc.desc Verify subarray with no arguments returns full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray();
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_0200
     * @tc.name testUint32ArraySubarrayTwo002
     * @tc.desc Verify subarray from 0 to 0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_0300
     * @tc.name testUint32ArraySubarrayTwo003
     * @tc.desc Verify subarray starting from index 1 has correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1);
      expect(result.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_0400
     * @tc.name testUint32ArraySubarrayTwo004
     * @tc.desc Verify subarray with negative end index has correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(0, -1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_0500
     * @tc.name testUint32ArraySubarrayTwo005
     * @tc.desc Verify subarray from 0 to 2 on buffer-based array has correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint32Array = new Uint32Array(buf, 0, 4);
      arr.$_set(0, 10);
      const result: Uint32Array = arr.subarray(0, 2);
      expect(result.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_0600
     * @tc.name testUint32ArraySubarrayTwo006
     * @tc.desc Verify chained subarray calls have correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1).subarray(1);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_0700
     * @tc.name testUint32ArraySubarrayTwo007
     * @tc.desc Verify subarray with out-of-range start returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(10, 20);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_0800
     * @tc.name testUint32ArraySubarrayTwo008
     * @tc.desc Verify subarray() no-arg returns first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray();
      expect(result.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_0900
     * @tc.name testUint32ArraySubarrayTwo009
     * @tc.desc Verify subarray() no-arg returns last element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray();
      expect(result.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_1000
     * @tc.name testUint32ArraySubarrayTwo010
     * @tc.desc Verify subarray(1) first element equals source[1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1);
      expect(result.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_1100
     * @tc.name testUint32ArraySubarrayTwo011
     * @tc.desc Verify subarray(0, 2) second element equals source[1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(0, 2);
      expect(result.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_1200
     * @tc.name testUint32ArraySubarrayTwo012
     * @tc.desc Verify subarray(2, 4) first element equals source[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(2, 4);
      expect(result.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_1300
     * @tc.name testUint32ArraySubarrayTwo013
     * @tc.desc Verify subarray(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(-2);
      expect(result.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_1400
     * @tc.name testUint32ArraySubarrayTwo014
     * @tc.desc Verify subarray(0, -1) last element value with negative end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(0, -1);
      expect(result.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_1500
     * @tc.name testUint32ArraySubarrayTwo015
     * @tc.desc Verify subarray(-3, -1) first element value with negative range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(-3, -1);
      expect(result.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_1600
     * @tc.name testUint32ArraySubarrayTwo016
     * @tc.desc Verify $_get(0) on empty subarray throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(0, 0);
      try {
        result.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_1700
     * @tc.name testUint32ArraySubarrayTwo017
     * @tc.desc Verify subarray uint32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 0, 4294967295);
      const result: Uint32Array = arr.subarray(0, 1);
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_1800
     * @tc.name testUint32ArraySubarrayTwo018
     * @tc.desc Verify subarray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const result: Uint32Array = arr.subarray(1, 2);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_1900
     * @tc.name testUint32ArraySubarrayTwo019
     * @tc.desc Verify subarray(1, 3) second element equals source[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1, 3);
      expect(result.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_2000
     * @tc.name testUint32ArraySubarrayTwo020
     * @tc.desc Verify subarray(0) on single-element array preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(99);
      const result: Uint32Array = arr.subarray(0);
      expect(result.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_2100
     * @tc.name testUint32ArraySubarrayTwo021
     * @tc.desc Verify subarray(-1) length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(-1);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_2200
     * @tc.name testUint32ArraySubarrayTwo022
     * @tc.desc Verify subarray(-2) length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(-2);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_2300
     * @tc.name testUint32ArraySubarrayTwo023
     * @tc.desc Verify subarray(3, 1) begin end length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(3, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_2400
     * @tc.name testUint32ArraySubarrayTwo024
     * @tc.desc Verify subarray(0, 100) end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(0, 100);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_2500
     * @tc.name testUint32ArraySubarrayTwo025
     * @tc.desc Verify subarray(-100) begin 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(-100);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_2600
     * @tc.name testUint32ArraySubarrayTwo026
     * @tc.desc Verify subarray(0, -100) end 0 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(0, -100);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_2700
     * @tc.name testUint32ArraySubarrayTwo027
     * @tc.desc Verify subarray(0, 2) byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(0, 2);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_2800
     * @tc.name testUint32ArraySubarrayTwo028
     * @tc.desc Verify subarray(1, 3) byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1, 3);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_2900
     * @tc.name testUint32ArraySubarrayTwo029
     * @tc.desc Verify subarray() byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray();
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_3000
     * @tc.name testUint32ArraySubarrayTwo030
     * @tc.desc Verify subarray(1) byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1);
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_3100
     * @tc.name testUint32ArraySubarrayTwo031
     * @tc.desc Verify subarray(0) byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(0);
      expect(result.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_3200
     * @tc.name testUint32ArraySubarrayTwo032
     * @tc.desc Verify subarray(1) byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1);
      expect(result.byteOffset).assertEqual(arr.byteOffset + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_3300
     * @tc.name testUint32ArraySubarrayTwo033
     * @tc.desc Verify subarray(2) byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(2);
      expect(result.byteOffset).assertEqual(arr.byteOffset + 8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_3400
     * @tc.name testUint32ArraySubarrayTwo034
     * @tc.desc Verify subarray(-1) byteOffset 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(-1);
      expect(result.byteOffset).assertEqual(arr.byteOffset + 12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_3500
     * @tc.name testUint32ArraySubarrayTwo035
     * @tc.desc Verify ArrayBuffer 8 subarray(1, 3) byteOffset 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const arr: Uint32Array = new Uint32Array(buf, 8, 4);
      const result: Uint32Array = arr.subarray(1, 3);
      expect(result.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_3600
     * @tc.name testUint32ArraySubarrayTwo036
     * @tc.desc Verify subarray(4, 4) byteOffset byteOffset 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(4, 4);
      expect(result.byteOffset).assertEqual(arr.byteOffset + 16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_3700
     * @tc.name testUint32ArraySubarrayTwo037
     * @tc.desc Verify subarray(0, 2) first element equals source[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(0, 2);
      expect(result.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_3800
     * @tc.name testUint32ArraySubarrayTwo038
     * @tc.desc Verify subarray(2, 4) second element equals source[3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(2, 4);
      expect(result.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_3900
     * @tc.name testUint32ArraySubarrayTwo039
     * @tc.desc Verify two independent subarray calls have expected lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const r1: Uint32Array = arr.subarray(1);
      const r2: Uint32Array = arr.subarray(0, 2);
      expect(r1.length).assertEqual(3);
      expect(r2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_4000
     * @tc.name testUint32ArraySubarrayTwo040
     * @tc.desc Verify $_set on subarray writes through to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1, 3);
      result.$_set(0, 999);
      expect(arr.$_get(1)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_4100
     * @tc.name testUint32ArraySubarrayTwo041
     * @tc.desc Verify subarray shares buffer with original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1, 3);
      arr.$_set(2, 888);
      expect(result.$_get(1)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_4200
     * @tc.name testUint32ArraySubarrayTwo042
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const r1: Uint32Array = arr.subarray(0, 2);
      const r2: Uint32Array = arr.subarray(2, 4);
      expect(r1.buffer).assertEqual(r2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_4300
     * @tc.name testUint32ArraySubarrayTwo043
     * @tc.desc Verify subarray(2, 4) $_set writes through to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(2, 4);
      result.$_set(0, 777);
      expect(arr.$_get(2)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_4400
     * @tc.name testUint32ArraySubarrayTwo044
     * @tc.desc Verify subarray subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const r1: Uint32Array = arr.subarray(0, 4);
      const r2: Uint32Array = r1.subarray(1, 3);
      expect(r2.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_4500
     * @tc.name testUint32ArraySubarrayTwo045
     * @tc.desc Verify subarray-of-subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const r1: Uint32Array = arr.subarray(0, 4);
      const r2: Uint32Array = r1.subarray(1, 3);
      r2.$_set(0, 666);
      expect(arr.$_get(1)).assertEqual(666);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_4600
     * @tc.name testUint32ArraySubarrayTwo046
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(0, 0);
      expect(result.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_4700
     * @tc.name testUint32ArraySubarrayTwo047
     * @tc.desc Verify negative-begin subarray $_set writes through to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(-2);
      result.$_set(0, 444);
      expect(arr.$_get(2)).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_4800
     * @tc.name testUint32ArraySubarrayTwo048
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray();
      result.$_set(2, 333);
      expect(arr.$_get(2)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_4900
     * @tc.name testUint32ArraySubarrayTwo049
     * @tc.desc Verify subarray(1).subarray(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1).subarray(1);
      expect(result.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_5000
     * @tc.name testUint32ArraySubarrayTwo050
     * @tc.desc Verify subarray(1).subarray(1) byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1).subarray(1);
      expect(result.byteOffset).assertEqual(arr.byteOffset + 8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_5100
     * @tc.name testUint32ArraySubarrayTwo051
     * @tc.desc Verify subarray(0).subarray(0, 0) length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(0).subarray(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_5200
     * @tc.name testUint32ArraySubarrayTwo052
     * @tc.desc Verify subarray(1).subarray(1).subarray(0, 1) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1).subarray(1).subarray(0, 1);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_5300
     * @tc.name testUint32ArraySubarrayTwo053
     * @tc.desc Verify subarray(1).subarray(1).subarray(0, 1) byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const result: Uint32Array = arr.subarray(1).subarray(1).subarray(0, 1);
      expect(result.byteOffset).assertEqual(arr.byteOffset + 8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_5400
     * @tc.name testUint32ArraySubarrayTwo054
     * @tc.desc Verify subarray(0,0) on empty source returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = new Uint32Array(0);
      const view: Uint32Array = src.subarray(0, 0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_5500
     * @tc.name testUint32ArraySubarrayTwo055
     * @tc.desc Verify subarray returns a Uint32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = src.subarray(1, 3);
      expect(view.length).assertEqual(2);
      expect(view.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_5600
     * @tc.name testUint32ArraySubarrayTwo056
     * @tc.desc Verify subarray shares buffer with source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = src.subarray(1, 3);
      expect(view.buffer).assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_TWO_5700
     * @tc.name testUint32ArraySubarrayTwo057
     * @tc.desc Verify slice copies buffer independently from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const copy: Uint32Array = src.slice(1, 3);
      expect(copy.buffer === src.buffer).assertFalse();
    });

  });
}
