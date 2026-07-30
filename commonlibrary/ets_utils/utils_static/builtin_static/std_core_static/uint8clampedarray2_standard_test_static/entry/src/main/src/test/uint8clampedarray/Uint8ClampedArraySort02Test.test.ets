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

export default function uint8ClampedArraySortTwoTest(): void {
  describe('Uint8ClampedArraySortTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_0100
     * @tc.name testUint8ClampedArraySortTwo001
     * @tc.desc Verify sort [10,20,30] with arr[1]=-1 clamped to 0: sorted [0,10,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr[1] = -1;
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(10);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_0200
     * @tc.name testUint8ClampedArraySortTwo002
     * @tc.desc Verify sort [10,20,30] with arr[1]=NaN clamped to 0: sorted [0,10,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr[1] = Number.NaN;
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(10);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_0300
     * @tc.name testUint8ClampedArraySortTwo003
     * @tc.desc Verify sort [10,20,30] with arr[0]=Infinity clamped to 255: sorted [20,30,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr[0] = Number.POSITIVE_INFINITY;
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(30);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_0400
     * @tc.name testUint8ClampedArraySortTwo004
     * @tc.desc Verify sort [10,20] with arr[0]=0.4 clamped to 0 returns [0,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = 0.4;
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_0500
     * @tc.name testUint8ClampedArraySortTwo005
     * @tc.desc Verify sort [10,20] with arr[0]=1e9 clamped to 255 returns [20,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = 1e9;
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_0600
     * @tc.name testUint8ClampedArraySortTwo006
     * @tc.desc Verify sort [10,20] with arr[0]=-1e9 clamped to 0 returns [0,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = -1e9;
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_0700
     * @tc.name testUint8ClampedArraySortTwo007
     * @tc.desc Verify sort [10,20] with arr[0]=Number.MAX_VALUE clamped to 255 returns [20,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = Number.MAX_VALUE;
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_0800
     * @tc.name testUint8ClampedArraySortTwo008
     * @tc.desc Verify sort [10,20] with arr[0]=Number.MIN_VALUE clamped to 0 returns [0,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = Number.MIN_VALUE;
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_0900
     * @tc.name testUint8ClampedArraySortTwo009
     * @tc.desc Verify sort [10,20] with arr[0]=-0 clamped to 0 returns [0,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = -0;
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_1000
     * @tc.name testUint8ClampedArraySortTwo010
     * @tc.desc Verify sort [10,20] with arr[0]=2147483648 clamped to 255 returns [20,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = 2147483648;
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_1100
     * @tc.name testUint8ClampedArraySortTwo011
     * @tc.desc Verify compareFn (a-b) ascending r[0]=1 [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1]);
      const r = arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_1200
     * @tc.name testUint8ClampedArraySortTwo012
     * @tc.desc Verify compareFn (b-a) descending r[0]=2 [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r = arr.sort((a: number, b: number): int => { return (b - a).toInt(); });
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_1300
     * @tc.name testUint8ClampedArraySortTwo013
     * @tc.desc Verify compareFn desc r[0]=3 [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort((a: number, b: number): int => { return (b - a).toInt(); });
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_1400
     * @tc.name testUint8ClampedArraySortTwo014
     * @tc.desc Verify compareFn return constant 1 keeps order on [1,3,2] → [1,3,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 3, 2]);
      const r = arr.sort((_a: number, _b: number): int => { return 1; });
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_1500
     * @tc.name testUint8ClampedArraySortTwo015
     * @tc.desc Verify compareFn return constant -1 reverses on [3,1,2] → [2,1,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort((_a: number, _b: number): int => { return -1; });
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_1600
     * @tc.name testUint8ClampedArraySortTwo016
     * @tc.desc Verify compareFn return constant 1 stable on [10,20,30] → [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.sort((_a: number, _b: number): int => { return 1; });
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_1700
     * @tc.name testUint8ClampedArraySortTwo017
     * @tc.desc Verify compareFn return constant -1 reverses on [10,20,30] → [30,20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.sort((_a: number, _b: number): int => { return -1; });
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(30);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_1800
     * @tc.name testUint8ClampedArraySortTwo018
     * @tc.desc Verify compareFn return constant 0 stable on [1,2,3] → [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.sort((_a: number, _b: number): int => { return 0; });
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_1900
     * @tc.name testUint8ClampedArraySortTwo019
     * @tc.desc Verify sort [0,10,20] with arr[0]=256 clamped to 255 returns [10,20,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 10, 20]);
      arr[0] = 256;
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_2000
     * @tc.name testUint8ClampedArraySortTwo020
     * @tc.desc Verify sort [10,20,30] with arr[0]=127.5 clamped to 128 returns [20,30,128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr[0] = 127.5;
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(30);
      expect(r[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_2100
     * @tc.name testUint8ClampedArraySortTwo021
     * @tc.desc Verify sort [10,20,30] with arr[0]=128.5 clamped to 128 returns [20,30,128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr[0] = 128.5;
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(30);
      expect(r[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_2200
     * @tc.name testUint8ClampedArraySortTwo022
     * @tc.desc Verify sort [10,20] with arr[0]=0.5 clamped to 0 returns [0,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = 0.5;
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_2300
     * @tc.name testUint8ClampedArraySortTwo023
     * @tc.desc Verify sort [10,20] with arr[0]=0.9 clamped to 1 returns [1,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = 0.9;
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_2400
     * @tc.name testUint8ClampedArraySortTwo024
     * @tc.desc Verify construct NaN clamp then sort r[0]=0 [NaN,10,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN, 10, 50]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(10);
      expect(r[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_2500
     * @tc.name testUint8ClampedArraySortTwo025
     * @tc.desc Verify sort [9,2] returns [2,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 2]);
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[1]).assertEqual(9);
      expect(r[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_2600
     * @tc.name testUint8ClampedArraySortTwo026
     * @tc.desc Verify 256 elem sort r[255]=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const arr = new Uint8ClampedArray(buf);
      for (let i = 0; i < 256; i++) {
        arr[i] = 255 - i;
      }
      const r = arr.sort();
      expect(r.length).assertEqual(256);
      expect(r[0]).assertEqual(0);
      expect(r[128]).assertEqual(128);
      expect(r[255]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_2700
     * @tc.name testUint8ClampedArraySortTwo027
     * @tc.desc Verify 1024 elem sort r[0]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      for (let i = 0; i < 1024; i++) {
        arr[i] = i % 256;
      }
      const r = arr.sort();
      expect(r.length).assertEqual(1024);
      expect(r[0]).assertEqual(0);
      expect(r[512]).assertEqual(128);
      expect(r[1023]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_2800
     * @tc.name testUint8ClampedArraySortTwo028
     * @tc.desc Verify 0o200 octal 128 middle sort r[1]=128 [200,0o200,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([200, 0o200, 5]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(128);
      expect(r[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_2900
     * @tc.name testUint8ClampedArraySortTwo029
     * @tc.desc Verify 0b10000000 binary 128 middle sort r[1]=128 [200,0b10000000,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([200, 0b10000000, 5]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(128);
      expect(r[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_3000
     * @tc.name testUint8ClampedArraySortTwo030
     * @tc.desc Verify sort cmp typeof object [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
      const t: string = typeof r;
      expect(t).assertEqual('object');
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_3100
     * @tc.name testUint8ClampedArraySortTwo031
     * @tc.desc Verify single element sort typeof object [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.sort();
      const t: string = typeof r;
      expect(t).assertEqual('object');
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_3200
     * @tc.name testUint8ClampedArraySortTwo032
     * @tc.desc Verify sort result typeof is not 'number' on [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1]);
      const r = arr.sort();
      expect(typeof r).not().assertEqual('number');
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_3300
     * @tc.name testUint8ClampedArraySortTwo033
     * @tc.desc Verify sort result typeof is not 'string' on [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1]);
      const r = arr.sort();
      expect(typeof r).not().assertEqual('string');
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_3400
     * @tc.name testUint8ClampedArraySortTwo034
     * @tc.desc Verify sort result typeof is not 'boolean' on [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1]);
      const r = arr.sort();
      expect(typeof r).not().assertEqual('boolean');
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_3500
     * @tc.name testUint8ClampedArraySortTwo035
     * @tc.desc Verify sort with cmp (a-b) sorts [3,1,2] to [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_3600
     * @tc.name testUint8ClampedArraySortTwo036
     * @tc.desc Verify empty sort result length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.sort();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_3700
     * @tc.name testUint8ClampedArraySortTwo037
     * @tc.desc Verify sort [100] returns [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const r = arr.sort();
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_3800
     * @tc.name testUint8ClampedArraySortTwo038
     * @tc.desc Verify sort result not null [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort();
      expect(r).not().assertNull();
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_3900
     * @tc.name testUint8ClampedArraySortTwo039
     * @tc.desc Verify empty sort result not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.sort();
      expect(r).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_4000
     * @tc.name testUint8ClampedArraySortTwo040
     * @tc.desc Verify single element sort result not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const r = arr.sort();
      expect(r).not().assertNull();
      expect(r[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_4100
     * @tc.name testUint8ClampedArraySortTwo041
     * @tc.desc Verify sort cmp length unchanged 5 [5,4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 4, 3, 2, 1]);
      const r = arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
      expect(r[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_4200
     * @tc.name testUint8ClampedArraySortTwo042
     * @tc.desc Verify empty sort cmp length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_4300
     * @tc.name testUint8ClampedArraySortTwo043
     * @tc.desc Verify sort cmp byteLength unchanged 3 [5,4,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 4, 3]);
      const r = arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
      expect(r.byteLength).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(4);
      expect(r[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_4400
     * @tc.name testUint8ClampedArraySortTwo044
     * @tc.desc Verify sort result BYTES_PER_ELEMENT 1 empty arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.sort();
      expect(r.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_4500
     * @tc.name testUint8ClampedArraySortTwo045
     * @tc.desc Verify sort result byteOffset 0 empty arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.sort();
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_4600
     * @tc.name testUint8ClampedArraySortTwo046
     * @tc.desc Verify sort [99] returns [99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const r = arr.sort();
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_4700
     * @tc.name testUint8ClampedArraySortTwo047
     * @tc.desc Verify single element sort ref equal arr [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.sort();
      expect(r).assertEqual(arr);
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_4800
     * @tc.name testUint8ClampedArraySortTwo048
     * @tc.desc Verify all-same sort ref equal arr [7,7,7,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7, 7]);
      const r = arr.sort();
      expect(r).assertEqual(arr);
      expect(r[0]).assertEqual(7);
      expect(r[1]).assertEqual(7);
      expect(r[2]).assertEqual(7);
      expect(r[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_4900
     * @tc.name testUint8ClampedArraySortTwo049
     * @tc.desc Verify already-sorted sort ref equal arr [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.sort();
      expect(r).assertEqual(arr);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
      expect(r[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_5000
     * @tc.name testUint8ClampedArraySortTwo050
     * @tc.desc Verify sort cmp buffer equal arr.buffer [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
      expect(r.buffer).assertEqual(arr.buffer);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_5100
     * @tc.name testUint8ClampedArraySortTwo051
     * @tc.desc Verify empty sort buffer equal arr.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.sort();
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_5200
     * @tc.name testUint8ClampedArraySortTwo052
     * @tc.desc Verify sort [3,1,2] shared buffer mutation: r[1]=150 reflects in arr[1]=150
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort();
      r[1] = 150;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(150);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_5300
     * @tc.name testUint8ClampedArraySortTwo053
     * @tc.desc Verify r.length equals arr.length after sort [4,2,3,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([4, 2, 3, 1]);
      const r = arr.sort();
      expect(r.length).assertEqual(arr.length);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_5400
     * @tc.name testUint8ClampedArraySortTwo054
     * @tc.desc Verify r.byteLength equals arr.byteLength after sort [4,2,3,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([4, 2, 3, 1]);
      const r = arr.sort();
      expect(r.byteLength).assertEqual(arr.byteLength);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_5500
     * @tc.name testUint8ClampedArraySortTwo055
     * @tc.desc Verify r.byteOffset equals arr.byteOffset after sort view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      arr[0] = 4;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 1;
      const r = arr.sort();
      expect(r.byteOffset).assertEqual(arr.byteOffset);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_5600
     * @tc.name testUint8ClampedArraySortTwo056
     * @tc.desc Verify double sort cmp r1 equals r2 [5,3,1,4,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 3, 1, 4, 2]);
      const r1 = arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
      const r2 = arr.sort((a: number, b: number): int => { return (b - a).toInt(); });
      expect(r1).assertEqual(r2);
      expect(r1[0]).assertEqual(5);
      expect(r1[1]).assertEqual(4);
      expect(r1[2]).assertEqual(3);
      expect(r1[3]).assertEqual(2);
      expect(r1[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_5700
     * @tc.name testUint8ClampedArraySortTwo057
     * @tc.desc Verify no-arg and cmp both return same ref arr [5,3,1,4,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 3, 1, 4, 2]);
      const r1 = arr.sort();
      const r2 = arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
      expect(r1).assertEqual(arr);
      expect(r2).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_5800
     * @tc.name testUint8ClampedArraySortTwo058
     * @tc.desc Verify length consistent across sorts [5,3,1,4,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 3, 1, 4, 2]);
      arr.sort();
      const len1: int = arr.length;
      arr.sort();
      const len2: int = arr.length;
      expect(len1).assertEqual(len2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_5900
     * @tc.name testUint8ClampedArraySortTwo059
     * @tc.desc Verify byteLength consistent across sorts [5,3,1,4,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 3, 1, 4, 2]);
      arr.sort();
      const bl1: int = arr.byteLength;
      arr.sort();
      const bl2: int = arr.byteLength;
      expect(bl1).assertEqual(bl2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_6000
     * @tc.name testUint8ClampedArraySortTwo060
     * @tc.desc Verify buffer ref same across sorts [5,3,1,4,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 3, 1, 4, 2]);
      const buf1 = arr.sort().buffer;
      const buf2 = arr.sort().buffer;
      expect(buf1).assertEqual(buf2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_6100
     * @tc.name testUint8ClampedArraySortTwo061
     * @tc.desc Verify sort cmp return 0 length unchanged [5,5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5]);
      const r = arr.sort((_a: number, _b: number): int => { return 0; });
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(5);
      expect(r[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_6200
     * @tc.name testUint8ClampedArraySortTwo062
     * @tc.desc Verify sort no-arg r[0]=1 [0x02, 0x01]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x02, 0x01]);
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_6300
     * @tc.name testUint8ClampedArraySortTwo063
     * @tc.desc Verify sort no-arg r[0]=1 [0o2, 0o1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o2, 0o1]);
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_6400
     * @tc.name testUint8ClampedArraySortTwo064
     * @tc.desc Verify sort no-arg r[0]=1 [0b10, 0b01]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b10, 0b01]);
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_6500
     * @tc.name testUint8ClampedArraySortTwo065
     * @tc.desc Verify sort [255,0] returns [0,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0]);
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_6600
     * @tc.name testUint8ClampedArraySortTwo066
     * @tc.desc Verify sort [255,255,255] returns [255,255,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(255);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_6700
     * @tc.name testUint8ClampedArraySortTwo067
     * @tc.desc Verify 0x80 hex 128 middle sort r[1]=128 [200,0x80,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([200, 0x80, 5]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(128);
      expect(r[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_6800
     * @tc.name testUint8ClampedArraySortTwo068
     * @tc.desc Verify sort cmp single element r[0]=99 [99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const r = arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
      expect(r[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_6900
     * @tc.name testUint8ClampedArraySortTwo069
     * @tc.desc Verify sort return value byteLength 0 empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.sort();
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_7000
     * @tc.name testUint8ClampedArraySortTwo070
     * @tc.desc Verify sort empty after sort length still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      arr.sort();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_7100
     * @tc.name testUint8ClampedArraySortTwo071
     * @tc.desc Verify sort cmp empty after sort length still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_7200
     * @tc.name testUint8ClampedArraySortTwo072
     * @tc.desc Verify sort undefined returns this [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1]);
      const r = arr.sort(undefined);
      expect(r).assertEqual(arr);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_7300
     * @tc.name testUint8ClampedArraySortTwo073
     * @tc.desc Verify sort return byteLength 1 single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.sort();
      expect(r.byteLength).assertEqual(1);
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_7400
     * @tc.name testUint8ClampedArraySortTwo074
     * @tc.desc Verify compareFn throw Error propagation arr=[2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1]);
      try {
        arr.sort((_a: number, _b: number): int => { throw new Error('test error'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_7500
     * @tc.name testUint8ClampedArraySortTwo075
     * @tc.desc Verify sort no-arg r[1]=100 [0xFF,1,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 1, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(100);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_7600
     * @tc.name testUint8ClampedArraySortTwo076
     * @tc.desc Verify sort no-arg r[1]=100 [0o377,1,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o377, 1, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(100);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_7700
     * @tc.name testUint8ClampedArraySortTwo077
     * @tc.desc Verify sort no-arg r[1]=100 [0b11111111,1,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b11111111, 1, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(100);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_7800
     * @tc.name testUint8ClampedArraySortTwo078
     * @tc.desc Verify sort [5,9,1,7,3,8,2,6,4,0] returns [0,1,2,3,4,5,6,7,8,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 9, 1, 7, 3, 8, 2, 6, 4, 0]);
      const r = arr.sort();
      expect(r.length).assertEqual(10);
      expect(r[4]).assertEqual(4);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(2);
      expect(r[3]).assertEqual(3);
      expect(r[5]).assertEqual(5);
      expect(r[6]).assertEqual(6);
      expect(r[7]).assertEqual(7);
      expect(r[8]).assertEqual(8);
      expect(r[9]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_7900
     * @tc.name testUint8ClampedArraySortTwo079
     * @tc.desc Verify sort no-arg 1024 elements r.length=1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      for (let i = 0; i < 1024; i++) {
        arr[i] = i % 256;
      }
      const r = arr.sort();
      expect(r.length).assertEqual(1024);
      expect(r[0]).assertEqual(0);
      expect(r[512]).assertEqual(128);
      expect(r[1023]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_8000
     * @tc.name testUint8ClampedArraySortTwo080
     * @tc.desc Verify sort of clamped values [256,-1,NaN,Infinity,100] r[4]=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, -1, Number.NaN, Number.POSITIVE_INFINITY, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(100);
      expect(r[3]).assertEqual(255);
      expect(r[4]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_8100
     * @tc.name testUint8ClampedArraySortTwo081
     * @tc.desc Verify compareFn desc r[0]=3 cmp(b-a) [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.sort((a: number, b: number): int => { return (b - a).toInt(); });
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_TWO_8200
     * @tc.name testUint8ClampedArraySortTwo082
     * @tc.desc Verify sort buffer.byteLength unchanged after sort [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const bl: int = arr.buffer.byteLength;
      arr.sort();
      expect(arr.buffer.byteLength).assertEqual(bl);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });
  });
}
