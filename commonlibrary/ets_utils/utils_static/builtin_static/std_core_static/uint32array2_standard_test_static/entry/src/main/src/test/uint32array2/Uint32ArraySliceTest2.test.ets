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

export default function uint32ArraySliceTwoTest(): void {
  describe('Uint32ArraySliceTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_0100
     * @tc.name testUint32ArraySliceTwo001
     * @tc.desc Verify slice() returns array with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const result = src.slice();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_0200
     * @tc.name testUint32ArraySliceTwo002
     * @tc.desc Verify slice(0) returns array with length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 8, 9, 11);
      const result = src.slice(0);
      expect(result.length).assertEqual(4);
      expect(result.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_0300
     * @tc.name testUint32ArraySliceTwo003
     * @tc.desc Verify slice(1, 1) returns array with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.slice(1, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_0400
     * @tc.name testUint32ArraySliceTwo004
     * @tc.desc Verify slice() returns array with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const result = src.slice();
      expect(result.length).assertEqual(0);
      expect(result.byteLength).assertEqual(0);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_0500
     * @tc.name testUint32ArraySliceTwo005
     * @tc.desc Verify slice(-1) returns array with length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 10, 15);
      const result = src.slice(-1);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_0600
     * @tc.name testUint32ArraySliceTwo006
     * @tc.desc Verify slice(0, 3) returns array with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42, 43, 44);
      const result = src.slice(0, 3);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_0700
     * @tc.name testUint32ArraySliceTwo007
     * @tc.desc Verify slice(0, 0) returns array with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(9, 8, 7);
      const result = src.slice(0, 0);
      expect(result.length).assertEqual(0);
      expect(result.byteLength).assertEqual(0);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_0800
     * @tc.name testUint32ArraySliceTwo008
     * @tc.desc Verify slice(3) returns array with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 6, 9);
      const result = src.slice(3);
      expect(result.length).assertEqual(0);
      expect(result.byteLength).assertEqual(0);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_0900
     * @tc.name testUint32ArraySliceTwo009
     * @tc.desc Verify slice(-2) returns array with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(100, 200, 300, 400);
      const result = src.slice(-2);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_1000
     * @tc.name testUint32ArraySliceTwo010
     * @tc.desc Verify slice(3, 1) returns array with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.slice(3, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_1100
     * @tc.name testUint32ArraySliceTwo011
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(111, 222, 333);
      const result = src.slice();
      expect(result.$_get(0)).assertEqual(111);
      expect(result.$_get(2)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_1200
     * @tc.name testUint32ArraySliceTwo012
     * @tc.desc Verify slice(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30, 40);
      const result = src.slice(0);
      expect(result.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_1300
     * @tc.name testUint32ArraySliceTwo013
     * @tc.desc Verify slice(1) index1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30, 40);
      const result = src.slice(1);
      expect(result.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_1400
     * @tc.name testUint32ArraySliceTwo014
     * @tc.desc Verify slice(0, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(77, 88, 99);
      const result = src.slice(0, 1);
      expect(result.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_1500
     * @tc.name testUint32ArraySliceTwo015
     * @tc.desc Verify slice(0, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 14, 21, 28);
      const result = src.slice(0, 2);
      expect(result.$_get(0)).assertEqual(7);
      expect(result.$_get(1)).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_1600
     * @tc.name testUint32ArraySliceTwo016
     * @tc.desc Verify slice(1, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(100, 200, 300, 400);
      const result = src.slice(1, 3);
      expect(result.$_get(0)).assertEqual(200);
      expect(result.$_get(1)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_1700
     * @tc.name testUint32ArraySliceTwo017
     * @tc.desc Verify slice(length-1, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 10, 15, 20);
      const result = src.slice(3, 4);
      expect(result.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_1800
     * @tc.name testUint32ArraySliceTwo018
     * @tc.desc Verify slice(0, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(9, 18, 27);
      const result = src.slice(0, 3);
      expect(result.$_get(2)).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_1900
     * @tc.name testUint32ArraySliceTwo019
     * @tc.desc Verify slice(2, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5, 6);
      const result = src.slice(2, 5);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_2000
     * @tc.name testUint32ArraySliceTwo020
     * @tc.desc Verify slice(1, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(11, 22, 33, 44, 55);
      const result = src.slice(1, 4);
      expect(result.$_get(0)).assertEqual(22);
      expect(result.$_get(2)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_2100
     * @tc.name testUint32ArraySliceTwo021
     * @tc.desc Verify slice(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(100, 200, 300);
      const result = src.slice(-1);
      expect(result.$_get(0)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_2200
     * @tc.name testUint32ArraySliceTwo022
     * @tc.desc Verify slice(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(100, 200, 300, 400);
      const result = src.slice(-2);
      expect(result.$_get(0)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_2300
     * @tc.name testUint32ArraySliceTwo023
     * @tc.desc Verify slice(-3, -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.slice(-3, -1);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_2400
     * @tc.name testUint32ArraySliceTwo024
     * @tc.desc Verify slice(-2, -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 8, 9, 10);
      const result = src.slice(-2, -1);
      expect(result.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_2500
     * @tc.name testUint32ArraySliceTwo025
     * @tc.desc Verify slice(-100) begin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42, 43, 44);
      const result = src.slice(-100);
      expect(result.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_2600
     * @tc.name testUint32ArraySliceTwo026
     * @tc.desc Verify slice(0, -100) end 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.slice(0, -100);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_2700
     * @tc.name testUint32ArraySliceTwo027
     * @tc.desc Verify slice(-100, -1) begin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(11, 22, 33, 44);
      const result = src.slice(-100, -1);
      expect(result.$_get(0)).assertEqual(11);
      expect(result.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_2800
     * @tc.name testUint32ArraySliceTwo028
     * @tc.desc Verify slice(-5, -2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 6, 9, 12, 15, 18);
      const result = src.slice(-5, -2);
      expect(result.$_get(0)).assertEqual(6);
      expect(result.$_get(2)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_2900
     * @tc.name testUint32ArraySliceTwo029
     * @tc.desc Verify slice(0, length+1) end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 10, 15);
      const result = src.slice(0, 4);
      expect(result.$_get(2)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_3000
     * @tc.name testUint32ArraySliceTwo030
     * @tc.desc Verify slice(0, length+10) end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 8, 9);
      const result = src.slice(0, 100);
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(7);
      expect(result.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_3100
     * @tc.name testUint32ArraySliceTwo031
     * @tc.desc Verify slice(2, 1) begin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.slice(2, 1);
      expect(result.length).assertEqual(0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_3200
     * @tc.name testUint32ArraySliceTwo032
     * @tc.desc Verify slice(-length) begin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 14, 21);
      const result = src.slice(-3);
      expect(result.$_get(2)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_3300
     * @tc.name testUint32ArraySliceTwo033
     * @tc.desc Verify slice(-length-1) begin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(9, 18, 27);
      const result = src.slice(-4);
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(9);
      expect(result.$_get(2)).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_3400
     * @tc.name testUint32ArraySliceTwo034
     * @tc.desc Verify slice() uint32.MAX (4294967295)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295, 1, 2);
      const result = src.slice();
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(4294967295);
      expect(src.$_get(0)).assertEqual(4294967295);
      expect(result.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_3500
     * @tc.name testUint32ArraySliceTwo035
     * @tc.desc Verify slice() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0);
      const result = src.slice();
      expect(result.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_3600
     * @tc.name testUint32ArraySliceTwo036
     * @tc.desc Verify slice() 0x80000000 (2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0x80000000, 1);
      const result = src.slice();
      expect(result.$_get(0)).assertEqual(0x80000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_3700
     * @tc.name testUint32ArraySliceTwo037
     * @tc.desc Verify slice() 2147483647 (int32.MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2147483647, 2);
      const result = src.slice();
      expect(result.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_3800
     * @tc.name testUint32ArraySliceTwo038
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 2147483647, 4294967295, 1);
      const result = src.slice();
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_3900
     * @tc.name testUint32ArraySliceTwo039
     * @tc.desc Verify slice(0, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295, 0, 2147483647);
      const result = src.slice(0, 2);
      expect(result.$_get(0)).assertEqual(4294967295);
      expect(result.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_4000
     * @tc.name testUint32ArraySliceTwo040
     * @tc.desc Verify slice(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 2147483647, 4294967295);
      const result = src.slice(-2);
      expect(result.$_get(0)).assertEqual(2147483647);
      expect(result.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_4100
     * @tc.name testUint32ArraySliceTwo041
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(12345);
      const result = src.slice();
      expect(result.$_get(0)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_4200
     * @tc.name testUint32ArraySliceTwo042
     * @tc.desc Verify slice(0, -1) returns length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.slice(0, -1);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_4300
     * @tc.name testUint32ArraySliceTwo043
     * @tc.desc Verify slice(0, length+10) clamps to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.slice(0, 14);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_4400
     * @tc.name testUint32ArraySliceTwo044
     * @tc.desc Verify slice() length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(99);
      const result = src.slice();
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_4500
     * @tc.name testUint32ArraySliceTwo045
     * @tc.desc Verify slice() byteLength equals length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.slice();
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_4600
     * @tc.name testUint32ArraySliceTwo046
     * @tc.desc Verify slice(-2) byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.slice(-2);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_4700
     * @tc.name testUint32ArraySliceTwo047
     * @tc.desc Verify slice(0, -1) byteLength equals (length - 1) * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.slice(0, -1);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_4800
     * @tc.name testUint32ArraySliceTwo048
     * @tc.desc Verify slice(length+1) byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.slice(5);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_4900
     * @tc.name testUint32ArraySliceTwo049
     * @tc.desc Verify slice() byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.slice();
      expect(result.byteOffset).assertEqual(0);
      const sameBuffer = src.buffer === result.buffer;
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_5000
     * @tc.name testUint32ArraySliceTwo050
     * @tc.desc Verify slice(1, 3) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30, 40);
      const result = src.slice(1, 3);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_5100
     * @tc.name testUint32ArraySliceTwo051
     * @tc.desc Verify slice(1, 1) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.slice(1, 1);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_5200
     * @tc.name testUint32ArraySliceTwo052
     * @tc.desc Verify slice(-2) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 10, 15, 20);
      const result = src.slice(-2);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_5300
     * @tc.name testUint32ArraySliceTwo053
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(100, 200, 300);
      const result = src.slice();
      expect(src.$_get(0)).assertEqual(100);
      expect(result.$_get(0)).assertEqual(100);
      expect(src.$_get(2)).assertEqual(300);
      expect(result.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_5400
     * @tc.name testUint32ArraySliceTwo054
     * @tc.desc Verify slice() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.slice();
      expect(src.length).assertEqual(5);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_5500
     * @tc.name testUint32ArraySliceTwo055
     * @tc.desc Verify slice(0, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 8, 9);
      const result = src.slice(0, 3);
      expect(src.$_get(0)).assertEqual(7);
      expect(src.$_get(2)).assertEqual(9);
      expect(result.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_5600
     * @tc.name testUint32ArraySliceTwo056
     * @tc.desc Verify slice(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(11, 22, 33, 44);
      const result = src.slice(-2);
      expect(src.$_get(3)).assertEqual(44);
      expect(result.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_5700
     * @tc.name testUint32ArraySliceTwo057
     * @tc.desc Verify slice(0, -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30, 40);
      const result = src.slice(0, -1);
      expect(src.$_get(3)).assertEqual(40);
      expect(result.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_5800
     * @tc.name testUint32ArraySliceTwo058
     * @tc.desc Verify slice(1, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.slice(1, 3);
      expect(src.$_get(2)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(3);
      expect(result.length).assertEqual(2);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_5900
     * @tc.name testUint32ArraySliceTwo059
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.slice();
      src.$_set(1, 888);
      expect(result.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_6000
     * @tc.name testUint32ArraySliceTwo060
     * @tc.desc Verify slice(1, 3) buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30, 40);
      const result = src.slice(1, 3);
      const sameBuffer = src.buffer === result.buffer;
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_6100
     * @tc.name testUint32ArraySliceTwo061
     * @tc.desc Verify slice() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const a = src.slice();
      const b = src.slice();
      const sameBuffer = b.buffer === a.buffer;
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_6200
     * @tc.name testUint32ArraySliceTwo062
     * @tc.desc Verify slice() $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 10, 15);
      const result = src.slice();
      expect(result.$_get(1)).assertEqual(10);
      expect(src.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_6300
     * @tc.name testUint32ArraySliceTwo063
     * @tc.desc Verify slice() $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 8, 9);
      const result = src.slice();
      result.$_set(2, 777);
      expect(result.$_get(2)).assertEqual(777);
      expect(src.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_6400
     * @tc.name testUint32ArraySliceTwo064
     * @tc.desc Verify slice().slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.slice().slice(1, 3);
      expect(result.$_get(0)).assertEqual(2);
      expect(result.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_TWO_6500
     * @tc.name testUint32ArraySliceTwo065
     * @tc.desc Verify slice(-2).slice(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30, 40);
      const result = src.slice(-2).slice(-1);
      expect(result.$_get(0)).assertEqual(40);
    });

  });
}
