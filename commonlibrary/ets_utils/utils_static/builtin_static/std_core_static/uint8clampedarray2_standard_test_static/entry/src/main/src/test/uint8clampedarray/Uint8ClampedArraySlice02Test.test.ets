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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint8ClampedArraySliceTwoTest(): void {
  describe('Uint8ClampedArraySliceTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_0100
     * @tc.name testUint8ClampedArraySliceTwo001
     * @tc.desc Verify slice(1) on [42] returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.slice(1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_0200
     * @tc.name testUint8ClampedArraySliceTwo002
     * @tc.desc Verify slice(-1) on [42] returns [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.slice(-1);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_0300
     * @tc.name testUint8ClampedArraySliceTwo003
     * @tc.desc Verify slice(5) on [1,2,3,4,5,6,7,8,9,10] returns [6,7,8,9,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const r = arr.slice(5);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(6);
      expect(r[1]).assertEqual(7);
      expect(r[2]).assertEqual(8);
      expect(r[3]).assertEqual(9);
      expect(r[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_0400
     * @tc.name testUint8ClampedArraySliceTwo004
     * @tc.desc Verify slice(0x7FFFFFFF) hex begin=INT_MAX on [1,2,3] returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.slice(0x7FFFFFFF);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_0500
     * @tc.name testUint8ClampedArraySliceTwo005
     * @tc.desc Verify slice(0x0) hex zero begin on [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.slice(0x0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_0600
     * @tc.name testUint8ClampedArraySliceTwo006
     * @tc.desc Verify slice(0o2) octal begin on [10,20,30,40] returns [30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.slice(0o2);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(30);
      expect(r[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_0700
     * @tc.name testUint8ClampedArraySliceTwo007
     * @tc.desc Verify slice(0b10) binary begin on [10,20,30,40] returns [30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.slice(0b10);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(30);
      expect(r[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_0800
     * @tc.name testUint8ClampedArraySliceTwo008
     * @tc.desc Verify slice(0x1) hex begin on [1,2,3,4] returns [2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice(0x1);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_0900
     * @tc.name testUint8ClampedArraySliceTwo009
     * @tc.desc Verify slice(0, 100) end beyond length on [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.slice(0, 100);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_1000
     * @tc.name testUint8ClampedArraySliceTwo010
     * @tc.desc Verify slice(0, -2) on [1,2,3,4,5] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.slice(0, -2);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_1100
     * @tc.name testUint8ClampedArraySliceTwo011
     * @tc.desc Verify slice(0, -100) on [1,2,3] returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.slice(0, -100);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_1200
     * @tc.name testUint8ClampedArraySliceTwo012
     * @tc.desc Verify slice(0,5) on empty returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.slice(0, 5);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_1300
     * @tc.name testUint8ClampedArraySliceTwo013
     * @tc.desc Verify slice(0,-1) on empty returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.slice(0, -1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_1400
     * @tc.name testUint8ClampedArraySliceTwo014
     * @tc.desc Verify slice(0, 0) on [42] returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.slice(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_1500
     * @tc.name testUint8ClampedArraySliceTwo015
     * @tc.desc Verify slice(0, -1) on [42] returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.slice(0, -1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_1600
     * @tc.name testUint8ClampedArraySliceTwo016
     * @tc.desc Verify slice(0, 0x7FFFFFFF) hex end=INT_MAX on [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.slice(0, 0x7FFFFFFF);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_1700
     * @tc.name testUint8ClampedArraySliceTwo017
     * @tc.desc Verify slice(0, 0x0) on [1,2,3] returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.slice(0, 0x0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_1800
     * @tc.name testUint8ClampedArraySliceTwo018
     * @tc.desc Verify slice(0, 0o3) octal end on [10,20,30,40,50] returns [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const r = arr.slice(0, 0o3);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_1900
     * @tc.name testUint8ClampedArraySliceTwo019
     * @tc.desc Verify slice(0, 0b11) binary end on [10,20,30,40,50] returns [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const r = arr.slice(0, 0b11);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_2000
     * @tc.name testUint8ClampedArraySliceTwo020
     * @tc.desc Verify slice(0, 0x2) hex end on [10,20,30,40] returns [10,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.slice(0, 0x2);
      expect(r.length).assertEqual(2);
      expect(r[1]).assertEqual(20);
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_2100
     * @tc.name testUint8ClampedArraySliceTwo021
     * @tc.desc Verify slice(0,0x100) end hex 256 on 256 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.slice(0, 0x100);
      expect(r.length).assertEqual(256);
      expect(r[0]).assertEqual(0);
      expect(r[128]).assertEqual(0);
      expect(r[255]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_2200
     * @tc.name testUint8ClampedArraySliceTwo022
     * @tc.desc Verify slice(0,1) on 1024 elements length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_2300
     * @tc.name testUint8ClampedArraySliceTwo023
     * @tc.desc Verify slice(0,1024) on 1024 elements full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.slice(0, 1024);
      expect(r.length).assertEqual(1024);
      expect(r[0]).assertEqual(0);
      expect(r[512]).assertEqual(0);
      expect(r[1023]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_2400
     * @tc.name testUint8ClampedArraySliceTwo024
     * @tc.desc Verify slice(0,1023) on 1024 elements length 1023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.slice(0, 1023);
      expect(r.length).assertEqual(1023);
      expect(r[0]).assertEqual(0);
      expect(r[511]).assertEqual(0);
      expect(r[1022]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_2500
     * @tc.name testUint8ClampedArraySliceTwo025
     * @tc.desc Verify slice(0,-1) on 1024 elements length 1023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.slice(0, -1);
      expect(r.length).assertEqual(1023);
      expect(r[0]).assertEqual(0);
      expect(r[511]).assertEqual(0);
      expect(r[1022]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_2600
     * @tc.name testUint8ClampedArraySliceTwo026
     * @tc.desc Verify slice(-3, -1) on [1,2,3,4,5] returns [3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.slice(-3, -1);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_2700
     * @tc.name testUint8ClampedArraySliceTwo027
     * @tc.desc Verify slice(-3) on [1,2,3,4] returns [2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice(-3);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_2800
     * @tc.name testUint8ClampedArraySliceTwo028
     * @tc.desc Verify slice(4, 2) begin>end on [1,2,3,4,5] returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.slice(4, 2);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_2900
     * @tc.name testUint8ClampedArraySliceTwo029
     * @tc.desc Verify slice(-3, 4) on [1,2,3,4,5] returns [3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.slice(-3, 4);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_3000
     * @tc.name testUint8ClampedArraySliceTwo030
     * @tc.desc Verify slice(3, 0) begin>end on [1,2,3,4] returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice(3, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_3100
     * @tc.name testUint8ClampedArraySliceTwo031
     * @tc.desc Verify slice(-1,1) on empty returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.slice(-1, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_3200
     * @tc.name testUint8ClampedArraySliceTwo032
     * @tc.desc Verify slice(0x1, 0x3) hex args on [1,2,3,4,5] returns [2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.slice(0x1, 0x3);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_3300
     * @tc.name testUint8ClampedArraySliceTwo033
     * @tc.desc Verify slice(0b01, 0b100) binary args on [1,2,3,4,5] returns [2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.slice(0b01, 0b100);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_3400
     * @tc.name testUint8ClampedArraySliceTwo034
     * @tc.desc Verify slice(1) on [50,60,70,80] returns [60,70,80]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 60, 70, 80]);
      const r = arr.slice(1);
      expect(r.length).assertEqual(3);
      expect(r[1]).assertEqual(70);
      expect(r[0]).assertEqual(60);
      expect(r[2]).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_3500
     * @tc.name testUint8ClampedArraySliceTwo035
     * @tc.desc Verify slice(2, 4) on [100,101,102,103,104] returns [102,103]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 101, 102, 103, 104]);
      const r = arr.slice(2, 4);
      expect(r.length).assertEqual(2);
      expect(r[1]).assertEqual(103);
      expect(r[0]).assertEqual(102);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_3600
     * @tc.name testUint8ClampedArraySliceTwo036
     * @tc.desc Verify slice(-2) on [9,18,27,36] returns [27,36]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 18, 27, 36]);
      const r = arr.slice(-2);
      expect(r.length).assertEqual(2);
      expect(r[1]).assertEqual(36);
      expect(r[0]).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_3700
     * @tc.name testUint8ClampedArraySliceTwo037
     * @tc.desc Verify slice(1, 3) on [1,2,3,4,5] returns [2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.slice(1, 3);
      expect(r.length).assertEqual(2);
      expect(r[1]).assertEqual(3);
      expect(r[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_3800
     * @tc.name testUint8ClampedArraySliceTwo038
     * @tc.desc Verify slice(2, 4) on [100,200,50,150] returns [50,150]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 50, 150]);
      const r = arr.slice(2, 4);
      expect(r.length).assertEqual(2);
      expect(r[1]).assertEqual(150);
      expect(r[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_3900
     * @tc.name testUint8ClampedArraySliceTwo039
     * @tc.desc Verify slice() no-arg on [0,0,0] returns [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const r = arr.slice();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_4000
     * @tc.name testUint8ClampedArraySliceTwo040
     * @tc.desc Verify slice() no-arg on [255,254,253] returns [255,254,253]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 254, 253]);
      const r = arr.slice();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(254);
      expect(r[2]).assertEqual(253);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_4100
     * @tc.name testUint8ClampedArraySliceTwo041
     * @tc.desc Verify slice() on length-10 array length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      const r = arr.slice();
      expect(r.length).assertEqual(10);
      expect(r[0]).assertEqual(0);
      expect(r[5]).assertEqual(0);
      expect(r[9]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_4200
     * @tc.name testUint8ClampedArraySliceTwo042
     * @tc.desc Verify slice(2) on [1,2,3,4,5] byteLength equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.slice(2);
      expect(r.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_4300
     * @tc.name testUint8ClampedArraySliceTwo043
     * @tc.desc Verify slice(0, 0) on [1,2,3] byteLength equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.slice(0, 0);
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_4400
     * @tc.name testUint8ClampedArraySliceTwo044
     * @tc.desc Verify slice(3, 2) on [1,2,3,4] byteLength equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice(3, 2);
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_4500
     * @tc.name testUint8ClampedArraySliceTwo045
     * @tc.desc Verify slice(-2) on [1,2,3,4] byteLength equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice(-2);
      expect(r.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_4600
     * @tc.name testUint8ClampedArraySliceTwo046
     * @tc.desc Verify slice() on empty byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.slice();
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_4700
     * @tc.name testUint8ClampedArraySliceTwo047
     * @tc.desc Verify slice(1) on [1,2,3,4] byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice(1);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_4800
     * @tc.name testUint8ClampedArraySliceTwo048
     * @tc.desc Verify slice(2, 4) on [1,2,3,4,5] byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.slice(2, 4);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_4900
     * @tc.name testUint8ClampedArraySliceTwo049
     * @tc.desc Verify slice(-2) on [1,2,3,4] byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice(-2);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_5000
     * @tc.name testUint8ClampedArraySliceTwo050
     * @tc.desc Verify slice() on empty byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.slice();
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_5100
     * @tc.name testUint8ClampedArraySliceTwo051
     * @tc.desc Verify slice(1) on [1,2,3,4] returns new buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice(1);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_5200
     * @tc.name testUint8ClampedArraySliceTwo052
     * @tc.desc Verify slice(0, 2) on [1,2,3,4] returns new buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice(0, 2);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_5300
     * @tc.name testUint8ClampedArraySliceTwo053
     * @tc.desc Verify slice(-2) on [1,2,3,4] returns new buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice(-2);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_5400
     * @tc.name testUint8ClampedArraySliceTwo054
     * @tc.desc Verify slice(0, 0) on [1,2,3,4] returns new buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice(0, 0);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_5500
     * @tc.name testUint8ClampedArraySliceTwo055
     * @tc.desc Verify slice(0, arr.length) on [1,2,3,4] returns new buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice(0, arr.length);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_5600
     * @tc.name testUint8ClampedArraySliceTwo056
     * @tc.desc Verify slice() on [1,2,3] result is not same instance as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.slice();
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_5700
     * @tc.name testUint8ClampedArraySliceTwo057
     * @tc.desc Verify slice(0) on [4,5,6] result is not same instance as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([4, 5, 6]);
      const r = arr.slice(0);
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_5800
     * @tc.name testUint8ClampedArraySliceTwo058
     * @tc.desc Verify slice(0, arr.length) on [8,16,24,32] result is not same instance as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([8, 16, 24, 32]);
      const r = arr.slice(0, arr.length);
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_5900
     * @tc.name testUint8ClampedArraySliceTwo059
     * @tc.desc Verify slice(1) on [10,20,30,40] returns [20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.slice(1);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(30);
      expect(r[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_6000
     * @tc.name testUint8ClampedArraySliceTwo060
     * @tc.desc Verify slice(0, 2) on [5,15,25,35] returns [5,15]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 15, 25, 35]);
      const r = arr.slice(0, 2);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_6100
     * @tc.name testUint8ClampedArraySliceTwo061
     * @tc.desc Verify slice(-2) on [7,17,27,37] returns [27,37]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 17, 27, 37]);
      const r = arr.slice(-2);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(27);
      expect(r[1]).assertEqual(37);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_6200
     * @tc.name testUint8ClampedArraySliceTwo062
     * @tc.desc Verify slice(2, 1) begin>end on [3,6,9] returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 6, 9]);
      const r = arr.slice(2, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_6300
     * @tc.name testUint8ClampedArraySliceTwo063
     * @tc.desc Verify slice(1, 3) on [10,20,30,40] returns [20,30] unaffected by original mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.slice(1, 3);
      arr[1] = 88;
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_6400
     * @tc.name testUint8ClampedArraySliceTwo064
     * @tc.desc Verify chain slice().slice() on [1,2,3,4] returns buffer distinct from original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r1 = arr.slice();
      const r2 = r1.slice();
      expect(r2.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_6500
     * @tc.name testUint8ClampedArraySliceTwo065
     * @tc.desc Verify slice() on [1,2,3,4] does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.slice();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_6600
     * @tc.name testUint8ClampedArraySliceTwo066
     * @tc.desc Verify slice(1, 3) on [1,2,3,4,5] does not modify original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.slice(1, 3);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_6700
     * @tc.name testUint8ClampedArraySliceTwo067
     * @tc.desc Verify slice() on [11,22,33,44] does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([11, 22, 33, 44]);
      arr.slice();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(22);
      expect(arr[2]).assertEqual(33);
      expect(arr[3]).assertEqual(44);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_6800
     * @tc.name testUint8ClampedArraySliceTwo068
     * @tc.desc Verify slice(2, 1) on [7,14,21,28] does not modify original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 14, 21, 28]);
      arr.slice(2, 1);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_6900
     * @tc.name testUint8ClampedArraySliceTwo069
     * @tc.desc Verify slice() on [1,2,3,4] does not modify original byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.slice();
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_7000
     * @tc.name testUint8ClampedArraySliceTwo070
     * @tc.desc Verify slice() on [1,2,3,4] keeps original buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const originalBuffer = arr.buffer;
      arr.slice();
      expect(arr.buffer).assertEqual(originalBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_7100
     * @tc.name testUint8ClampedArraySliceTwo071
     * @tc.desc Verify slice() on array with byteOffset=2 keeps original byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      arr.slice();
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_7200
     * @tc.name testUint8ClampedArraySliceTwo072
     * @tc.desc Verify slice() on [1,2,3] result buffer.byteLength equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.slice();
      expect(r.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_7300
     * @tc.name testUint8ClampedArraySliceTwo073
     * @tc.desc Verify slice() on [1,2,3,4] result buffer.byteLength equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.slice();
      expect(r.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_7400
     * @tc.name testUint8ClampedArraySliceTwo074
     * @tc.desc Verify slice(1, 3) on [1,2,3,4,5] result buffer.byteLength equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.slice(1, 3);
      expect(r.buffer.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SLICE_TWO_7500
     * @tc.name testUint8ClampedArraySliceTwo075
     * @tc.desc Verify slice(0, 0) on [1,2,3] result buffer.byteLength equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySliceTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.slice(0, 0);
      expect(r.buffer.byteLength).assertEqual(0);
    });
  });
}
