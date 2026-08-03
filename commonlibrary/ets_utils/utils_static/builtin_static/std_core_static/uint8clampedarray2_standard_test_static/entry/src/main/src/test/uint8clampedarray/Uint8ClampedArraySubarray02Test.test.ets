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

export default function uint8ClampedArraySubarrayTwoTest(): void {
  describe('Uint8ClampedArraySubarrayTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_0100
     * @tc.name testUint8ClampedArraySubarrayTwo001
     * @tc.desc Verify subarray [10,20,30] returns [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray(0b0);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_0200
     * @tc.name testUint8ClampedArraySubarrayTwo002
     * @tc.desc Verify begin=(1+1) expression sub[0]=30 [10,20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(1 + 1);
      expect(sub[0]).assertEqual(30);
      expect(sub[1]).assertEqual(40);
      expect(sub[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_0300
     * @tc.name testUint8ClampedArraySubarrayTwo003
     * @tc.desc Verify begin=(3-2) expression sub[0]=20 [10,20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(3 - 2);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
      expect(sub[2]).assertEqual(40);
      expect(sub[3]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_0400
     * @tc.name testUint8ClampedArraySubarrayTwo004
     * @tc.desc Verify subarray(undefined) on [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(undefined);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_0500
     * @tc.name testUint8ClampedArraySubarrayTwo005
     * @tc.desc Verify begin via variable length=3 [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const start: int = 1;
      const sub = arr.subarray(start);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
      expect(sub[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_0600
     * @tc.name testUint8ClampedArraySubarrayTwo006
     * @tc.desc Verify end=0x7FFFFFFF hex INT_MAX length=3 [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 0x7FFFFFFF);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_0700
     * @tc.name testUint8ClampedArraySubarrayTwo007
     * @tc.desc Verify end=0x3 hex length=3 [10,20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(0, 0x3);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_0800
     * @tc.name testUint8ClampedArraySubarrayTwo008
     * @tc.desc Verify end=0o4 octal length=4 [10,20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(0, 0o4);
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
      expect(sub[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_0900
     * @tc.name testUint8ClampedArraySubarrayTwo009
     * @tc.desc Verify end=0b11 binary length=3 [10,20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(0, 0b11);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_1000
     * @tc.name testUint8ClampedArraySubarrayTwo010
     * @tc.desc Verify end=(2+2) expression length=4 [10,20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(0, 2 + 2);
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
      expect(sub[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_1100
     * @tc.name testUint8ClampedArraySubarrayTwo011
     * @tc.desc Verify end=(5-1) expression length=4 [10,20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(0, 5 - 1);
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
      expect(sub[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_1200
     * @tc.name testUint8ClampedArraySubarrayTwo012
     * @tc.desc Verify subarray(1,undefined) on [1,2,3,4] returns [2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, undefined);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_1300
     * @tc.name testUint8ClampedArraySubarrayTwo013
     * @tc.desc Verify end via variable length=3 [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const stop: int = 3;
      const sub = arr.subarray(0, stop);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_1400
     * @tc.name testUint8ClampedArraySubarrayTwo014
     * @tc.desc Verify subarray(0) length=3 [11,22,33]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([11, 22, 33]);
      const sub = arr.subarray(0);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(11);
      expect(sub[1]).assertEqual(22);
      expect(sub[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_1500
     * @tc.name testUint8ClampedArraySubarrayTwo015
     * @tc.desc Verify subarray(1) length=3 [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_1600
     * @tc.name testUint8ClampedArraySubarrayTwo016
     * @tc.desc Verify subarray(3) begin=length-1 length=1 [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(3);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_1700
     * @tc.name testUint8ClampedArraySubarrayTwo017
     * @tc.desc Verify subarray(-5) begin=-length-1 length=4 [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(-5);
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
      expect(sub[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_1800
     * @tc.name testUint8ClampedArraySubarrayTwo018
     * @tc.desc Verify subarray(1,4) length=3 [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_1900
     * @tc.name testUint8ClampedArraySubarrayTwo019
     * @tc.desc Verify subarray(0,1) end=1 length=1 [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(0, 1);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_2000
     * @tc.name testUint8ClampedArraySubarrayTwo020
     * @tc.desc Verify subarray(0,-1) end=-1 length=3 [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(0, -1);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_2100
     * @tc.name testUint8ClampedArraySubarrayTwo021
     * @tc.desc Verify subarray(0,-5) end=-length-1 length=0 [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(0, -5);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_2200
     * @tc.name testUint8ClampedArraySubarrayTwo022
     * @tc.desc Verify subarray(0) first element sub[0]=100 [100,150,200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 150, 200]);
      const sub = arr.subarray(0);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(100);
      expect(sub[1]).assertEqual(150);
      expect(sub[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_2300
     * @tc.name testUint8ClampedArraySubarrayTwo023
     * @tc.desc Verify subarray(-2) last element sub[1]=20 [5,10,15,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      const sub = arr.subarray(-2);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(15);
      expect(sub[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_2400
     * @tc.name testUint8ClampedArraySubarrayTwo024
     * @tc.desc Verify subarray() byteLength=5 [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray();
      expect(sub.byteLength).assertEqual(5);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
      expect(sub[3]).assertEqual(4);
      expect(sub[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_2500
     * @tc.name testUint8ClampedArraySubarrayTwo025
     * @tc.desc Verify subarray(0,0) empty byteLength=0 [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 0);
      expect(sub.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_2600
     * @tc.name testUint8ClampedArraySubarrayTwo026
     * @tc.desc Verify subarray(2,1) begin>=end byteLength=0 [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(2, 1);
      expect(sub.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_2700
     * @tc.name testUint8ClampedArraySubarrayTwo027
     * @tc.desc Verify subarray(-2,-1) byteLength=1 [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(-2, -1);
      expect(sub.byteLength).assertEqual(1);
      expect(sub[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_2800
     * @tc.name testUint8ClampedArraySubarrayTwo028
     * @tc.desc Verify empty ArrayBuffer subarray byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(0));
      const sub = arr.subarray();
      expect(sub.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_2900
     * @tc.name testUint8ClampedArraySubarrayTwo029
     * @tc.desc Verify subarray(0) byteOffset=0 [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(0);
      expect(sub.byteOffset).assertEqual(0);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
      expect(sub[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_3000
     * @tc.name testUint8ClampedArraySubarrayTwo030
     * @tc.desc Verify subarray(2,3) byteOffset=2 [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(2, 3);
      expect(sub.byteOffset).assertEqual(2);
      expect(sub[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_3100
     * @tc.name testUint8ClampedArraySubarrayTwo031
     * @tc.desc Verify subarray(0,0) shares buffer with arr [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 0);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_3200
     * @tc.name testUint8ClampedArraySubarrayTwo032
     * @tc.desc Verify subarray(2,1) begin>=end shares buffer [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(2, 1);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_3300
     * @tc.name testUint8ClampedArraySubarrayTwo033
     * @tc.desc Verify subarray(999) beyond begin shares buffer [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(999);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_3400
     * @tc.name testUint8ClampedArraySubarrayTwo034
     * @tc.desc Verify subarray(0,0) not null [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 0);
      expect(sub).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_3500
     * @tc.name testUint8ClampedArraySubarrayTwo035
     * @tc.desc Verify subarray(0) not same ref as arr [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0);
      expect(sub).not().assertEqual(arr);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_3600
     * @tc.name testUint8ClampedArraySubarrayTwo036
     * @tc.desc Verify subarray(0,length) not same ref as arr [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, arr.length);
      expect(sub).not().assertEqual(arr);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_3700
     * @tc.name testUint8ClampedArraySubarrayTwo037
     * @tc.desc Verify subarray(0,0) on [1,2,3] has BYTES_PER_ELEMENT=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 0);
      expect(sub.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_3800
     * @tc.name testUint8ClampedArraySubarrayTwo038
     * @tc.desc Verify empty array subarray(0) length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const sub = arr.subarray(0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_3900
     * @tc.name testUint8ClampedArraySubarrayTwo039
     * @tc.desc Verify empty array subarray(0,0) length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const sub = arr.subarray(0, 0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_4000
     * @tc.name testUint8ClampedArraySubarrayTwo040
     * @tc.desc Verify empty array subarray(5,10) length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const sub = arr.subarray(5, 10);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_4100
     * @tc.name testUint8ClampedArraySubarrayTwo041
     * @tc.desc Verify empty array subarray(-1) length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const sub = arr.subarray(-1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_4200
     * @tc.name testUint8ClampedArraySubarrayTwo042
     * @tc.desc Verify single element subarray(0,1) sub[0]=42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const sub = arr.subarray(0, 1);
      expect(sub[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_4300
     * @tc.name testUint8ClampedArraySubarrayTwo043
     * @tc.desc Verify single element subarray(1) length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const sub = arr.subarray(1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_4400
     * @tc.name testUint8ClampedArraySubarrayTwo044
     * @tc.desc Verify single element subarray(-1) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const sub = arr.subarray(-1);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_4500
     * @tc.name testUint8ClampedArraySubarrayTwo045
     * @tc.desc Verify 256 elements subarray(128) length=128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      const sub = arr.subarray(128);
      expect(sub.length).assertEqual(128);
      expect(sub[0]).assertEqual(0);
      expect(sub[63]).assertEqual(0);
      expect(sub[127]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_4600
     * @tc.name testUint8ClampedArraySubarrayTwo046
     * @tc.desc Verify 256 elements subarray(0,128) length=128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      const sub = arr.subarray(0, 128);
      expect(sub.length).assertEqual(128);
      expect(sub[0]).assertEqual(0);
      expect(sub[63]).assertEqual(0);
      expect(sub[127]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_4700
     * @tc.name testUint8ClampedArraySubarrayTwo047
     * @tc.desc Verify 1024 elements subarray(512) length=512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      const sub = arr.subarray(512);
      expect(sub.length).assertEqual(512);
      expect(sub[0]).assertEqual(0);
      expect(sub[255]).assertEqual(0);
      expect(sub[511]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_4800
     * @tc.name testUint8ClampedArraySubarrayTwo048
     * @tc.desc Verify 1024 elements subarray(-1) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      const sub = arr.subarray(-1);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_4900
     * @tc.name testUint8ClampedArraySubarrayTwo049
     * @tc.desc Verify 65535 elements subarray(0,1) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(65535);
      const sub = arr.subarray(0, 1);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_5000
     * @tc.name testUint8ClampedArraySubarrayTwo050
     * @tc.desc Verify subarray(4,0) begin far>end length=0 [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(4, 0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_5100
     * @tc.name testUint8ClampedArraySubarrayTwo051
     * @tc.desc Verify subarray(100,200) both over-pos length=0 [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(100, 200);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_5200
     * @tc.name testUint8ClampedArraySubarrayTwo052
     * @tc.desc Verify subarray(-1000,1000) over-neg to over-pos length=4 [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(-1000, 1000);
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
      expect(sub[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_5300
     * @tc.name testUint8ClampedArraySubarrayTwo053
     * @tc.desc Verify subarray(-1000,-1000) both over-neg length=0 [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(-1000, -1000);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_5400
     * @tc.name testUint8ClampedArraySubarrayTwo054
     * @tc.desc Verify subarray(2,3) last single element sub[0]=9 [7,8,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const sub = arr.subarray(2, 3);
      expect(sub[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_5500
     * @tc.name testUint8ClampedArraySubarrayTwo055
     * @tc.desc Verify subarray(-1,0) begin>end length=0 [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(-1, 0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_5600
     * @tc.name testUint8ClampedArraySubarrayTwo056
     * @tc.desc Verify subarray(-100,-50) both over-neg length=0 [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(-100, -50);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_5700
     * @tc.name testUint8ClampedArraySubarrayTwo057
     * @tc.desc Verify subarray(1,3) on [1,2,3,4] does not mutate source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.subarray(1, 3);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_5800
     * @tc.name testUint8ClampedArraySubarrayTwo058
     * @tc.desc Verify subarray(1,2) on [10,20,30] does not mutate source first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.subarray(1, 2);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_5900
     * @tc.name testUint8ClampedArraySubarrayTwo059
     * @tc.desc Verify subarray(0,1) on [10,20,30] does not mutate source last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.subarray(0, 1);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_6000
     * @tc.name testUint8ClampedArraySubarrayTwo060
     * @tc.desc Verify subarray(0,2) on [1,2,3,4] does not mutate source byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.subarray(0, 2);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_6100
     * @tc.name testUint8ClampedArraySubarrayTwo061
     * @tc.desc Verify subarray(999) beyond begin on [1,2,3] does not mutate source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.subarray(999);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_6200
     * @tc.name testUint8ClampedArraySubarrayTwo062
     * @tc.desc Verify subarray(-2) negative begin on [1,2,3] does not mutate source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.subarray(-2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_6300
     * @tc.name testUint8ClampedArraySubarrayTwo063
     * @tc.desc Verify nested subarray(1,4).subarray(1,2) instanceof Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub1 = arr.subarray(1, 4);
      const sub2 = sub1.subarray(1, 2);
      expect(sub2.length).assertEqual(1);
      expect(sub2[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_6400
     * @tc.name testUint8ClampedArraySubarrayTwo064
     * @tc.desc Verify triple nested subarray instanceof Uint8ClampedArray [1..7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7]);
      const sub1 = arr.subarray(1);
      const sub2 = sub1.subarray(1);
      const sub3 = sub2.subarray(1);
      expect(sub3.length).assertEqual(4);
      expect(sub3[0]).assertEqual(4);
      expect(sub3[1]).assertEqual(5);
      expect(sub3[2]).assertEqual(6);
      expect(sub3[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_6500
     * @tc.name testUint8ClampedArraySubarrayTwo065
     * @tc.desc Verify triple nested subarray byteOffset=3 [1..7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7]);
      const sub1 = arr.subarray(1);
      const sub2 = sub1.subarray(1);
      const sub3 = sub2.subarray(1);
      expect(sub3.byteOffset).assertEqual(3);
      expect(sub3[0]).assertEqual(4);
      expect(sub3[1]).assertEqual(5);
      expect(sub3[2]).assertEqual(6);
      expect(sub3[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_6600
     * @tc.name testUint8ClampedArraySubarrayTwo066
     * @tc.desc Verify subarray after fill still shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(0);
      const sub = arr.subarray(0, 2);
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub[0]).assertEqual(0);
      expect(sub[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_6700
     * @tc.name testUint8ClampedArraySubarrayTwo067
     * @tc.desc Verify subarray after reverse still shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.reverse();
      const sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(3);
      expect(sub[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_6800
     * @tc.name testUint8ClampedArraySubarrayTwo068
     * @tc.desc Verify subarray after sort shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([4, 1, 3, 2]);
      arr.sort();
      const sub = arr.subarray(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_6900
     * @tc.name testUint8ClampedArraySubarrayTwo069
     * @tc.desc Verify subarray of byteOffset view byteOffset accumulates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Uint8ClampedArray(buf, 4, 8);
      const sub = parent.subarray(2, 5);
      expect(sub.length).assertEqual(3);
      expect(sub.byteOffset).assertEqual(6);
      expect(sub[0]).assertEqual(0);
      expect(sub[1]).assertEqual(0);
      expect(sub[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_7000
     * @tc.name testUint8ClampedArraySubarrayTwo070
     * @tc.desc Verify subarray of byteOffset view length correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Uint8ClampedArray(buf, 4, 8);
      const sub = parent.subarray(2, 6);
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(0);
      expect(sub[1]).assertEqual(0);
      expect(sub[2]).assertEqual(0);
      expect(sub[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_7100
     * @tc.name testUint8ClampedArraySubarrayTwo071
     * @tc.desc Verify subarray of byteOffset view buffer shared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Uint8ClampedArray(buf, 4, 8);
      const sub = parent.subarray(1, 3);
      expect(sub.buffer).assertEqual(buf);
      expect(sub[0]).assertEqual(0);
      expect(sub[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_7200
     * @tc.name testUint8ClampedArraySubarrayTwo072
     * @tc.desc Verify subarray of zero-length view byteOffset preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Uint8ClampedArray(buf, 8, 0);
      const sub = parent.subarray(0, 0);
      expect(sub.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_7300
     * @tc.name testUint8ClampedArraySubarrayTwo073
     * @tc.desc Verify subarray name equals parent name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      expect(sub.name).assertEqual(arr.name);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_7400
     * @tc.name testUint8ClampedArraySubarrayTwo074
     * @tc.desc Verify subarray BYTES_PER_ELEMENT equals parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      expect(sub.BYTES_PER_ELEMENT).assertEqual(arr.BYTES_PER_ELEMENT);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_7500
     * @tc.name testUint8ClampedArraySubarrayTwo075
     * @tc.desc Verify subarray length + byteOffset <= parent length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(2, 4);
      expect(sub.length + sub.byteOffset).assertLessOrEqual(arr.length);
      expect(sub[0]).assertEqual(30);
      expect(sub[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_7600
     * @tc.name testUint8ClampedArraySubarrayTwo076
     * @tc.desc Verify subarray subarray chain byteOffset sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const baseView = new Uint8ClampedArray(buf, 4, 24);
      const firstSub = baseView.subarray(4, 16);
      const secondSub = firstSub.subarray(4, 8);
      expect(secondSub.length).assertEqual(4);
      expect(secondSub.byteOffset).assertEqual(12);
      expect(secondSub[0]).assertEqual(0);
      expect(secondSub[1]).assertEqual(0);
      expect(secondSub[2]).assertEqual(0);
      expect(secondSub[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_7700
     * @tc.name testUint8ClampedArraySubarrayTwo077
     * @tc.desc Verify subarray(0, length) byteOffset equals parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(0, arr.length);
      expect(sub.byteOffset).assertEqual(arr.byteOffset);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
      expect(sub[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_7800
     * @tc.name testUint8ClampedArraySubarrayTwo078
     * @tc.desc Verify subarray(0, length) length equals parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(0, arr.length);
      expect(sub.length).assertEqual(arr.length);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
      expect(sub[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_7900
     * @tc.name testUint8ClampedArraySubarrayTwo079
     * @tc.desc Verify subarray() equals subarray(0, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const s1 = arr.subarray();
      const s2 = arr.subarray(0, arr.length);
      expect(s1.length).assertEqual(s2.length);
      expect(s1.byteOffset).assertEqual(s2.byteOffset);
      expect(s1[0]).assertEqual(10);
      expect(s1[1]).assertEqual(20);
      expect(s1[2]).assertEqual(30);
      expect(s1[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_8000
     * @tc.name testUint8ClampedArraySubarrayTwo080
     * @tc.desc Verify subarray(0) equals subarray(0, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const s1 = arr.subarray(0);
      const s2 = arr.subarray(0, arr.length);
      expect(s1.length).assertEqual(s2.length);
      expect(s1[0]).assertEqual(10);
      expect(s1[1]).assertEqual(20);
      expect(s1[2]).assertEqual(30);
      expect(s1[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_8100
     * @tc.name testUint8ClampedArraySubarrayTwo081
     * @tc.desc Verify subarray from of() result shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30, 40);
      const sub = arr.subarray(1, 3);
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_8200
     * @tc.name testUint8ClampedArraySubarrayTwo082
     * @tc.desc Verify subarray from from() result shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30, 40];
      const arr = Uint8ClampedArray.from(src);
      const sub = arr.subarray(1, 3);
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_8300
     * @tc.name testUint8ClampedArraySubarrayTwo083
     * @tc.desc Verify modify subarray element reflects in parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(1, 3);
      sub[0] = 99;
      expect(arr[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_8400
     * @tc.name testUint8ClampedArraySubarrayTwo084
     * @tc.desc Verify modify parent reflects in subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(1, 3);
      arr[2] = 88;
      expect(sub[1]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_8500
     * @tc.name testUint8ClampedArraySubarrayTwo085
     * @tc.desc Verify subarray(1,3) on [1,2,3,4] after $_set(0,99) shares buffer and returns [2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.$_set(0, 99);
      const sub = arr.subarray(1, 3);
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_8600
     * @tc.name testUint8ClampedArraySubarrayTwo086
     * @tc.desc Verify subarray sub[0] equals arr[begin]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      const sub = arr.subarray(2, 4);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(arr[2]);
      expect(sub[1]).assertEqual(arr[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_8700
     * @tc.name testUint8ClampedArraySubarrayTwo087
     * @tc.desc Verify subarray sub[last] equals arr[end-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      const sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(arr[1]);
      expect(sub[1]).assertEqual(arr[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_8800
     * @tc.name testUint8ClampedArraySubarrayTwo088
     * @tc.desc Verify subarray of clamped array reflects clamp values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, -1, 128.5, 0.5]);
      const sub = arr.subarray(0, 4);
      expect(sub[0]).assertEqual(255);
      expect(sub[1]).assertEqual(0);
      expect(sub[2]).assertEqual(128);
      expect(sub[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_8900
     * @tc.name testUint8ClampedArraySubarrayTwo089
     * @tc.desc Verify subarray buffer.byteLength equals parent buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      const sub = arr.subarray(2, 5);
      expect(sub.buffer.byteLength).assertEqual(arr.buffer.byteLength);
      expect(sub[0]).assertEqual(3);
      expect(sub[1]).assertEqual(4);
      expect(sub[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_9000
     * @tc.name testUint8ClampedArraySubarrayTwo090
     * @tc.desc Verify subarray toString reflects sub-range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(1, 3);
      const r: string = sub.toString();
      expect(r.length).assertEqual(5);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_9100
     * @tc.name testUint8ClampedArraySubarrayTwo091
     * @tc.desc Verify subarray with end > length clamps end to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray(1, 100);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_9200
     * @tc.name testUint8ClampedArraySubarrayTwo092
     * @tc.desc Verify subarray byteLength equals length times 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      expect(sub.byteLength).assertEqual(sub.length);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_TWO_9300
     * @tc.name testUint8ClampedArraySubarrayTwo093
     * @tc.desc Verify subarray length and byteLength consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 4, 8);
      const sub = arr.subarray(2, 6);
      expect(sub.length).assertEqual(sub.byteLength);
      expect(sub[0]).assertEqual(0);
      expect(sub[1]).assertEqual(0);
      expect(sub[2]).assertEqual(0);
      expect(sub[3]).assertEqual(0);
    });
  });
}
