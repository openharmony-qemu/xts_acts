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

export default function uint8ClampedArraySubarrayOneTest(): void {
  describe('Uint8ClampedArraySubarrayOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_0100
     * @tc.name testUint8ClampedArraySubarrayOne001
     * @tc.desc Verify subarray() on [10,20,30] returns length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray();
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_0200
     * @tc.name testUint8ClampedArraySubarrayOne002
     * @tc.desc Verify subarray(2) on [10,20,30,40,50] returns [30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(2);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(30);
      expect(sub[1]).assertEqual(40);
      expect(sub[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_0300
     * @tc.name testUint8ClampedArraySubarrayOne003
     * @tc.desc Verify subarray(0,0) on [1,2,3] returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 0);
      expect(arr.length).assertEqual(3);
      expect(sub.length).assertEqual(0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_0400
     * @tc.name testUint8ClampedArraySubarrayOne004
     * @tc.desc Verify subarray(0,4) on [5,10,15,20] returns [5,10,15,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      const sub = arr.subarray(0, 4);
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(5);
      expect(sub[1]).assertEqual(10);
      expect(sub[2]).assertEqual(15);
      expect(sub[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_0500
     * @tc.name testUint8ClampedArraySubarrayOne005
     * @tc.desc Verify subarray(3) on [10,20,30,40] returns [40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(3);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_0600
     * @tc.name testUint8ClampedArraySubarrayOne006
     * @tc.desc Verify subarray(3) begin=length on [10,20,30] returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray(3);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_0700
     * @tc.name testUint8ClampedArraySubarrayOne007
     * @tc.desc Verify subarray(2147483647) begin=INT_MAX on [1,2,3] returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(2147483647);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_0800
     * @tc.name testUint8ClampedArraySubarrayOne008
     * @tc.desc Verify subarray(-1) on [10,20,30,40] returns [40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(-1);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_0900
     * @tc.name testUint8ClampedArraySubarrayOne009
     * @tc.desc Verify subarray(-4) on [1,2,3,4] returns [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(-4);
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
      expect(sub[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_1000
     * @tc.name testUint8ClampedArraySubarrayOne010
     * @tc.desc Verify subarray(INT_MIN) on [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(-2147483648);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_1100
     * @tc.name testUint8ClampedArraySubarrayOne011
     * @tc.desc Verify subarray(0,1) on [10,20,30,40] returns [10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(0, 1);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_1200
     * @tc.name testUint8ClampedArraySubarrayOne012
     * @tc.desc Verify subarray(0,3) on [10,20,30,40] returns [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(0, 3);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_1300
     * @tc.name testUint8ClampedArraySubarrayOne013
     * @tc.desc Verify subarray(0,5) on [10,20,30,40] returns [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(0, 5);
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
      expect(sub[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_1400
     * @tc.name testUint8ClampedArraySubarrayOne014
     * @tc.desc Verify subarray(0,INT_MAX) on [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 2147483647);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_1500
     * @tc.name testUint8ClampedArraySubarrayOne015
     * @tc.desc Verify subarray(0,-1) on [10,20,30,40] returns [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(0, -1);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_1600
     * @tc.name testUint8ClampedArraySubarrayOne016
     * @tc.desc Verify subarray(0,-4) on [10,20,30,40] returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(0, -4);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_1700
     * @tc.name testUint8ClampedArraySubarrayOne017
     * @tc.desc Verify subarray(0,INT_MIN) on [1,2,3] returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, -2147483648);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_1800
     * @tc.name testUint8ClampedArraySubarrayOne018
     * @tc.desc Verify subarray(0,2) on [100,110,120,130] returns [100,110]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 110, 120, 130]);
      const sub = arr.subarray(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(100);
      expect(sub[1]).assertEqual(110);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_1900
     * @tc.name testUint8ClampedArraySubarrayOne019
     * @tc.desc Verify subarray(2,2) begin=end on [1,2,3,4] returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(2, 2);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_2000
     * @tc.name testUint8ClampedArraySubarrayOne020
     * @tc.desc Verify subarray(3,1) begin>end on [1,2,3,4] returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(3, 1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_2100
     * @tc.name testUint8ClampedArraySubarrayOne021
     * @tc.desc Verify subarray(-3,4) on [10,20,30,40,50] returns [30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(-3, 4);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(30);
      expect(sub[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_2200
     * @tc.name testUint8ClampedArraySubarrayOne022
     * @tc.desc Verify subarray(1,-1) on [10,20,30,40,50] returns [20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(1, -1);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
      expect(sub[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_2300
     * @tc.name testUint8ClampedArraySubarrayOne023
     * @tc.desc Verify subarray(-4,-1) on [10,20,30,40,50] returns [20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(-4, -1);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
      expect(sub[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_2400
     * @tc.name testUint8ClampedArraySubarrayOne024
     * @tc.desc Verify subarray(-1,-2) begin>end on [10,20,30,40] returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(-1, -2);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_2500
     * @tc.name testUint8ClampedArraySubarrayOne025
     * @tc.desc Verify subarray(INT_MAX, INT_MIN) begin>end on [1,2,3] returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(2147483647, -2147483648);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_2600
     * @tc.name testUint8ClampedArraySubarrayOne026
     * @tc.desc Verify subarray() on empty Uint8ClampedArray(0) returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const sub = arr.subarray();
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_2700
     * @tc.name testUint8ClampedArraySubarrayOne027
     * @tc.desc Verify subarray() on [42] returns [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const sub = arr.subarray();
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_2800
     * @tc.name testUint8ClampedArraySubarrayOne028
     * @tc.desc Verify subarray(0,255) on Uint8ClampedArray(255) returns length=255 with all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(255);
      const sub = arr.subarray(0, 255);
      expect(sub.length).assertEqual(255);
      expect(sub[0]).assertEqual(0);
      expect(sub[127]).assertEqual(0);
      expect(sub[254]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_2900
     * @tc.name testUint8ClampedArraySubarrayOne029
     * @tc.desc Verify subarray(254,255) on Uint8ClampedArray(255) returns length=1 with value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(255);
      const sub = arr.subarray(254, 255);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_3000
     * @tc.name testUint8ClampedArraySubarrayOne030
     * @tc.desc Verify subarray() on Uint8ClampedArray(65535) returns length=65535 with all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(65535);
      const sub = arr.subarray();
      expect(sub.length).assertEqual(65535);
      expect(sub[0]).assertEqual(0);
      expect(sub[32767]).assertEqual(0);
      expect(sub[65534]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_3100
     * @tc.name testUint8ClampedArraySubarrayOne031
     * @tc.desc Verify subarray(0,1) on [1,2,3] returns [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 1);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_3200
     * @tc.name testUint8ClampedArraySubarrayOne032
     * @tc.desc Verify subarray() on [1,2,3] returns full array [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray();
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_3300
     * @tc.name testUint8ClampedArraySubarrayOne033
     * @tc.desc Verify subarray(0,2) on [1,2,3] returns [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_3400
     * @tc.name testUint8ClampedArraySubarrayOne034
     * @tc.desc Verify subarray(100) on [1,2,3] returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(100);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_3500
     * @tc.name testUint8ClampedArraySubarrayOne035
     * @tc.desc Verify subarray(0,100) on [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 100)
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_3600
     * @tc.name testUint8ClampedArraySubarrayOne036
     * @tc.desc Verify subarray(-1000) on [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(-1000);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_3700
     * @tc.name testUint8ClampedArraySubarrayOne037
     * @tc.desc Verify subarray(INT_MIN, INT_MAX) on [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(-2147483648, 2147483647);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_3800
     * @tc.name testUint8ClampedArraySubarrayOne038
     * @tc.desc Verify subarray(-3,-1) on [10,20,30,40,50] returns [30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(-3, -1);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(30);
      expect(sub[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_3900
     * @tc.name testUint8ClampedArraySubarrayOne039
     * @tc.desc Verify subarray(0,1000) on [10,20,30] returns [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray(0, 1000);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_4000
     * @tc.name testUint8ClampedArraySubarrayOne040
     * @tc.desc Verify subarray(0,1) on [88,99,100] returns [88]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([88, 99, 100]);
      const sub = arr.subarray(0, 1);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_4100
     * @tc.name testUint8ClampedArraySubarrayOne041
     * @tc.desc Verify subarray(1) on [88,99,100] returns [99,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([88, 99, 100]);
      const sub = arr.subarray(1);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(99);
      expect(sub[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_4200
     * @tc.name testUint8ClampedArraySubarrayOne042
     * @tc.desc Verify subarray() on Uint8ClampedArray from empty ArrayBuffer returns length equals parent length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(0));
      const sub = arr.subarray();
      expect(sub.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_4300
     * @tc.name testUint8ClampedArraySubarrayOne043
     * @tc.desc Verify subarray(1,3) on [10,20,30,40] returns [20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_4400
     * @tc.name testUint8ClampedArraySubarrayOne044
     * @tc.desc Verify subarray(-2) on [5,10,15,20] returns [15,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      const sub = arr.subarray(-2);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(15);
      expect(sub[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_4500
     * @tc.name testUint8ClampedArraySubarrayOne045
     * @tc.desc Verify subarray(1,2) on [1,2,3] with arr[1]=300 (clamped to 255) returns [255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr[1] = 300;
      const sub = arr.subarray(1, 2);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_4600
     * @tc.name testUint8ClampedArraySubarrayOne046
     * @tc.desc Verify subarray(0,1) on [1,2,3] with arr[0]=-5 (clamped to 0) returns [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr[0] = -5;
      const sub = arr.subarray(0, 1);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_4700
     * @tc.name testUint8ClampedArraySubarrayOne047
     * @tc.desc Verify subarray(1,4) on [1,2,3,4,5] returns [2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_4800
     * @tc.name testUint8ClampedArraySubarrayOne048
     * @tc.desc Verify subarray(-2) on [1,2,3,4,5] returns [4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(-2);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(4);
      expect(sub[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_4900
     * @tc.name testUint8ClampedArraySubarrayOne049
     * @tc.desc Verify subarray(100) begin beyond length on [1,2,3,4] returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(100);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_5000
     * @tc.name testUint8ClampedArraySubarrayOne050
     * @tc.desc Verify chained subarray(2).subarray(1) on [1,2,3,4,5,6] returns [4,5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      const sub1 = arr.subarray(2);
      const sub2 = sub1.subarray(1);
      expect(sub1.length).assertEqual(4);
      expect(sub2.length).assertEqual(3);
      expect(sub1[0]).assertEqual(3);
      expect(sub1[1]).assertEqual(4);
      expect(sub1[2]).assertEqual(5);
      expect(sub1[3]).assertEqual(6);
      expect(sub2[0]).assertEqual(4);
      expect(sub2[1]).assertEqual(5);
      expect(sub2[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_5100
     * @tc.name testUint8ClampedArraySubarrayOne051
     * @tc.desc Verify subarray(1) on ArrayBuffer(8) with byteOffset=2, length=4 returns byteOffset=3 and all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const sub = arr.subarray(1);
      expect(sub.length).assertEqual(3);
      expect(sub.byteOffset).assertEqual(3);
      expect(sub[0]).assertEqual(0);
      expect(sub[1]).assertEqual(0);
      expect(sub[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_5200
     * @tc.name testUint8ClampedArraySubarrayOne052
     * @tc.desc Verify subarray(1,3) on [1,2,3,4] returns [2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_5300
     * @tc.name testUint8ClampedArraySubarrayOne053
     * @tc.desc Verify chained subarray(1).subarray(1) on [1,2,3,4] returns [3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub1 = arr.subarray(1);
      const sub2 = sub1.subarray(1);
      expect(sub1.length).assertEqual(3);
      expect(sub2.length).assertEqual(2);
      expect(sub1[0]).assertEqual(2);
      expect(sub1[1]).assertEqual(3);
      expect(sub1[2]).assertEqual(4);
      expect(sub2[0]).assertEqual(3);
      expect(sub2[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_5400
     * @tc.name testUint8ClampedArraySubarrayOne054
     * @tc.desc Verify subarray(0,2) and subarray(2,4) on [1,2,3,4] return [1,2] and [3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const subA = arr.subarray(0, 2);
      const subB = arr.subarray(2, 4);
      expect(subA.length).assertEqual(2);
      expect(subB.length).assertEqual(2);
      expect(subA[0]).assertEqual(1);
      expect(subA[1]).assertEqual(2);
      expect(subB[0]).assertEqual(3);
      expect(subB[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_5500
     * @tc.name testUint8ClampedArraySubarrayOne055
     * @tc.desc Verify subarray(1) on ArrayBuffer(4) shares same buffer and returns length=3 with all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      const sub = arr.subarray(1);
      expect(sub.length).assertEqual(3);
      expect(sub.buffer).assertEqual(buf);
      expect(sub[0]).assertEqual(0);
      expect(sub[1]).assertEqual(0);
      expect(sub[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_5600
     * @tc.name testUint8ClampedArraySubarrayOne056
     * @tc.desc Verify subarray(1,3) on [10,20,30] with arr[1]=99 reflects [99,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray(1, 3);
      arr[1] = 99;
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(99);
      expect(sub[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_5700
     * @tc.name testUint8ClampedArraySubarrayOne057
     * @tc.desc Verify subarray(1,3) on [10,20,30] with arr[2]=500 reflects [20,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray(1, 3);
      arr[2] = 500;
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_5800
     * @tc.name testUint8ClampedArraySubarrayOne058
     * @tc.desc Verify subarray(0,2) on [10,20,30] with arr[0]=-100 reflects [0,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray(0, 2);
      arr[0] = -100;
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(0);
      expect(sub[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_5900
     * @tc.name testUint8ClampedArraySubarrayOne059
     * @tc.desc Verify subarray(1,3) on [10,20,30,40] after arr.fill(7) reflects [7,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(1, 3);
      arr.fill(7);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(7);
      expect(sub[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_6000
     * @tc.name testUint8ClampedArraySubarrayOne060
     * @tc.desc Verify subarray(1,3) on [10,20,30] with sub[0]=88 returns [88,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray(1, 3);
      sub[0] = 88;
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(88);
      expect(sub[1]).assertEqual(30);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_6100
     * @tc.name testUint8ClampedArraySubarrayOne061
     * @tc.desc Verify subarray(0,2) on [10,20,30] with sub[1]=400 (clamped to 255) returns [10,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray(0, 2);
      sub[1] = 400;
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(255);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_6200
     * @tc.name testUint8ClampedArraySubarrayOne062
     * @tc.desc Verify subarray(0,2) on [10,20,30] with sub[0]=NaN (clamped to 0) returns [0,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray(0, 2);
      sub[0] = Number.NaN;
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(0);
      expect(sub[1]).assertEqual(20);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_6300
     * @tc.name testUint8ClampedArraySubarrayOne063
     * @tc.desc Verify subarray(1,3).fill(5) on [10,20,30,40] returns [5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(1, 3);
      sub.fill(5);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(5);
      expect(sub[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_6400
     * @tc.name testUint8ClampedArraySubarrayOne064
     * @tc.desc Verify for..of on subarray sees parent modifications: arr[1]=77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(1, 3);
      arr[1] = 77;
      let firstSeen: number = 0.0;
      for (const v of sub) {
        firstSeen = v ;
        break;
      }
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(77);
      expect(sub[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_6500
     * @tc.name testUint8ClampedArraySubarrayOne065
     * @tc.desc Verify iterator next() on subarray sees parent modifications: arr[1]=88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(1, 3);
      arr[1] = 88;
      const it = sub.values();
      const first = it.next();
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(88);
      expect(sub[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_6600
     * @tc.name testUint8ClampedArraySubarrayOne066
     * @tc.desc Verify subarray(1,3) on [10,20,30,40] with arr[2]=999 reflects clamped value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(1, 3);
      arr[2] = 999;
      let secondSeen: number = 0.0;
      let idx: int = 0;
      for (const v of sub) {
        if (idx === 1) {
          secondSeen = v ;
        }
        idx = idx + 1;
      }
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_6700
     * @tc.name testUint8ClampedArraySubarrayOne067
     * @tc.desc Verify chained subarray(1,4).subarray(1) on [10,20,30,40,50] returns [30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub1 = arr.subarray(1, 4);
      const sub2 = sub1.subarray(1);
      expect(sub1.length).assertEqual(3);
      expect(sub2.length).assertEqual(2);
      expect(sub1[0]).assertEqual(20);
      expect(sub1[1]).assertEqual(30);
      expect(sub1[2]).assertEqual(40);
      expect(sub2[0]).assertEqual(30);
      expect(sub2[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_6800
     * @tc.name testUint8ClampedArraySubarrayOne068
     * @tc.desc Verify chained subarray(1).subarray(1) on [1,2,3,4,5] with arr[2]=200 propagates value through both views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub1 = arr.subarray(1);
      const sub2 = sub1.subarray(1);
      arr[2] = 200;
      expect(sub1.length).assertEqual(4);
      expect(sub2.length).assertEqual(3);
      expect(sub1[0]).assertEqual(2);
      expect(sub1[1]).assertEqual(200);
      expect(sub1[2]).assertEqual(4);
      expect(sub1[3]).assertEqual(5);
      expect(sub2[0]).assertEqual(200);
      expect(sub2[1]).assertEqual(4);
      expect(sub2[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_6900
     * @tc.name testUint8ClampedArraySubarrayOne069
     * @tc.desc Verify chained subarray(1).subarray(1) on [1,2,3,4,5] with sub2[0]=150 propagates to arr and sub1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub1 = arr.subarray(1);
      const sub2 = sub1.subarray(1);
      sub2[0] = 150;
      expect(sub1.length).assertEqual(4);
      expect(sub2.length).assertEqual(3);
      expect(sub1[0]).assertEqual(2);
      expect(sub1[1]).assertEqual(150);
      expect(sub1[2]).assertEqual(4);
      expect(sub1[3]).assertEqual(5);
      expect(sub2[0]).assertEqual(150);
      expect(sub2[1]).assertEqual(4);
      expect(sub2[2]).assertEqual(5);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_7000
     * @tc.name testUint8ClampedArraySubarrayOne070
     * @tc.desc Verify chained subarray(1).subarray(1) on [1,2,3,4,5] with sub2[0]=999 (clamped to 255) propagates to arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub1 = arr.subarray(1);
      const sub2 = sub1.subarray(1);
      sub2[0] = 999;
      expect(sub1.length).assertEqual(4);
      expect(sub2.length).assertEqual(3);
      expect(sub1[0]).assertEqual(2);
      expect(sub1[1]).assertEqual(255);
      expect(sub1[2]).assertEqual(4);
      expect(sub1[3]).assertEqual(5);
      expect(sub2[0]).assertEqual(255);
      expect(sub2[1]).assertEqual(4);
      expect(sub2[2]).assertEqual(5);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_7100
     * @tc.name testUint8ClampedArraySubarrayOne071
     * @tc.desc Verify subarray(1,3).fill(9) on [1,2,3,4] returns [9,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      const ret = sub.fill(9);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(9);
      expect(sub[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_7200
     * @tc.name testUint8ClampedArraySubarrayOne072
     * @tc.desc Verify subarray(0,3).slice() on [1,2,3,4] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(0, 3);
      const s = sub.slice();
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_7300
     * @tc.name testUint8ClampedArraySubarrayOne073
     * @tc.desc Verify subarray(0,3).reverse() on [1,2,3,4] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(0, 3);
      const ret = sub.reverse();
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(3);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_7400
     * @tc.name testUint8ClampedArraySubarrayOne074
     * @tc.desc Verify subarray() on [1,2,3,4] returns full array [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray();
      const t: string = typeof sub;
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
      expect(sub[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_7500
     * @tc.name testUint8ClampedArraySubarrayOne075
     * @tc.desc Verify subarray(0,0) on [1,2,3] returns empty view with length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 0);
      const t: string = typeof sub;
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_7600
     * @tc.name testUint8ClampedArraySubarrayOne076
     * @tc.desc Verify subarray(0,3) on [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 3);
      const t: string = typeof sub;
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_7700
     * @tc.name testUint8ClampedArraySubarrayOne077
     * @tc.desc Verify subarray(-1) on [1,2,3] returns [3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(-1);
      const t: string = typeof sub;
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_7800
     * @tc.name testUint8ClampedArraySubarrayOne078
     * @tc.desc Verify empty ArrayBuffer subarray() typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(0));
      const sub = arr.subarray();
      const t: string = typeof sub;
      expect(t).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_7900
     * @tc.name testUint8ClampedArraySubarrayOne079
     * @tc.desc Verify subarray(0) on [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_8000
     * @tc.name testUint8ClampedArraySubarrayOne080
     * @tc.desc Verify subarray(2,1) with begin>=end on [1,2,3] returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(2, 1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_8100
     * @tc.name testUint8ClampedArraySubarrayOne081
     * @tc.desc Verify subarray(999) on [1,2,3] beyond begin returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(999);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_8200
     * @tc.name testUint8ClampedArraySubarrayOne082
     * @tc.desc Verify subarray(0,0) on empty ArrayBuffer returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(0));
      const sub = arr.subarray(0, 0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_8300
     * @tc.name testUint8ClampedArraySubarrayOne083
     * @tc.desc Verify subarray(0x2) hex begin on [10,20,30,40,50] returns [30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(0x2);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(30);
      expect(sub[1]).assertEqual(40);
      expect(sub[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_8400
     * @tc.name testUint8ClampedArraySubarrayOne084
     * @tc.desc Verify subarray(0o3) on [10,20,30,40,50] returns [40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(0o3);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(40);
      expect(sub[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_8500
     * @tc.name testUint8ClampedArraySubarrayOne085
     * @tc.desc Verify subarray(0b10) on [10,20,30,40,50] returns [30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(0b10);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(30);
      expect(sub[1]).assertEqual(40);
      expect(sub[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_8600
     * @tc.name testUint8ClampedArraySubarrayOne086
     * @tc.desc Verify subarray(0x0) on [10,20,30] returns [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray(0x0);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SUBARRAY_ONE_8700
     * @tc.name testUint8ClampedArraySubarrayOne087
     * @tc.desc Verify subarray(0o0) on [10,20,30] returns [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySubarrayOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sub = arr.subarray(0o0);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
    });
  });
}
