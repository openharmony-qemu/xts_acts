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

export default function uint8ClampedArrayToLocaleStringTwoTest(): void {
  describe('Uint8ClampedArrayToLocaleStringTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_0100
     * @tc.name testUint8ClampedArrayToLocaleStringTwo001
     * @tc.desc Verify toLocaleString en-US [1,2,3,4] byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const blBefore = arr.byteLength;
      arr.toLocaleString('en-US');
      expect(arr.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_0200
     * @tc.name testUint8ClampedArrayToLocaleStringTwo002
     * @tc.desc Verify toLocaleString zh-CN [1,2,3,4] byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const offBefore = arr.byteOffset;
      arr.toLocaleString('zh-CN');
      expect(arr.byteOffset).assertEqual(offBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_0300
     * @tc.name testUint8ClampedArrayToLocaleStringTwo003
     * @tc.desc Verify toLocaleString [1,2,3] buffer ref unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const bufBefore = arr.buffer;
      arr.toLocaleString();
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_0400
     * @tc.name testUint8ClampedArrayToLocaleStringTwo004
     * @tc.desc Verify toLocaleString multiple calls [50,100,150] arr[1]=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      arr.toLocaleString();
      arr.toLocaleString('en-US');
      arr.toLocaleString('zh-CN');
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(100);
      expect(arr[0]).assertEqual(50);
      expect(arr[2]).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_0500
     * @tc.name testUint8ClampedArrayToLocaleStringTwo005
     * @tc.desc Verify toLocaleString [1,2] BYTES_PER_ELEMENT=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      arr.toLocaleString();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_0600
     * @tc.name testUint8ClampedArrayToLocaleStringTwo006
     * @tc.desc Verify toLocaleString empty array length still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      arr.toLocaleString();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_0700
     * @tc.name testUint8ClampedArrayToLocaleStringTwo007
     * @tc.desc Verify toLocaleString [1,2,3,4,5] buffer.byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const blBefore = arr.buffer.byteLength;
      arr.toLocaleString();
      expect(arr.buffer.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_0800
     * @tc.name testUint8ClampedArrayToLocaleStringTwo008
     * @tc.desc Verify toLocaleString [88,99] at(0)=88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([88, 99]);
      arr.toLocaleString();
      expect(arr.at(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_0900
     * @tc.name testUint8ClampedArrayToLocaleStringTwo009
     * @tc.desc Verify toLocaleString [11,22,33] arr[1]=22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([11, 22, 33]);
      arr.toLocaleString();
      expect(arr[1]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_1000
     * @tc.name testUint8ClampedArrayToLocaleStringTwo010
     * @tc.desc Verify toLocaleString [11,22,33] arr[2]=33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([11, 22, 33]);
      arr.toLocaleString();
      expect(arr[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_1100
     * @tc.name testUint8ClampedArrayToLocaleStringTwo011
     * @tc.desc Verify toLocaleString en-US [99] length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const r = arr.toLocaleString('en-US');
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_1200
     * @tc.name testUint8ClampedArrayToLocaleStringTwo012
     * @tc.desc Verify toLocaleString [1,2,3,4,5] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.toLocaleString();
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_1300
     * @tc.name testUint8ClampedArrayToLocaleStringTwo013
     * @tc.desc Verify toLocaleString 10 elements length >= 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const r = arr.toLocaleString();
      expect(r.length).assertLargerOrEqual(10);
      expect(arr.length).assertEqual(10);
      expect(arr[0]).assertEqual(1);
      expect(arr[9]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_1400
     * @tc.name testUint8ClampedArrayToLocaleStringTwo014
     * @tc.desc Verify toLocaleString en-US [255,255,255] length >= 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const r = arr.toLocaleString('en-US');
      expect(r.length).assertLargerOrEqual(9);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_1500
     * @tc.name testUint8ClampedArrayToLocaleStringTwo015
     * @tc.desc Verify toLocaleString('en-US') on [100] result contains '100' and arr unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const r = arr.toLocaleString('en-US');
      expect(arr.length).assertEqual(1);
      expect(r.indexOf('100')).assertLargerOrEqual(0);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_1600
     * @tc.name testUint8ClampedArrayToLocaleStringTwo016
     * @tc.desc Verify toLocaleString('en-US') on [1] result contains '1' and arr unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.toLocaleString('en-US');
      expect(arr.length).assertEqual(1);
      expect(r.indexOf('1')).assertLargerOrEqual(0);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_1700
     * @tc.name testUint8ClampedArrayToLocaleStringTwo017
     * @tc.desc Verify toLocaleString on subarray(2,4) of [1,2,3,4] parent and sub elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(2, 4);
      const offBefore = sub.byteOffset;
      sub.toLocaleString();
      expect(parent.length).assertEqual(4);
      expect(sub.length).assertEqual(2);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(sub[0]).assertEqual(3);
      expect(sub[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_1800
     * @tc.name testUint8ClampedArrayToLocaleStringTwo018
     * @tc.desc Verify toLocaleString on parent [100,200,250] with subarray(0,2) elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([100, 200, 250]);
      const sub = parent.subarray(0, 2);
      parent.toLocaleString();
      expect(parent.length).assertEqual(3);
      expect(sub.length).assertEqual(2);
      expect(parent[0]).assertEqual(100);
      expect(parent[1]).assertEqual(200);
      expect(parent[2]).assertEqual(250);
      expect(sub[0]).assertEqual(100);
      expect(sub[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_1900
     * @tc.name testUint8ClampedArrayToLocaleStringTwo019
     * @tc.desc Verify toLocaleString zh-CN empty array returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.toLocaleString('zh-CN');
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_2000
     * @tc.name testUint8ClampedArrayToLocaleStringTwo020
     * @tc.desc Verify toLocaleString invalid locale does not throw length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.toLocaleString('xx-INVALID');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_2100
     * @tc.name testUint8ClampedArrayToLocaleStringTwo021
     * @tc.desc Verify toLocaleString en-US [5,10,15] two calls equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15]);
      const r1 = arr.toLocaleString('en-US');
      const r2 = arr.toLocaleString('en-US');
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_2200
     * @tc.name testUint8ClampedArrayToLocaleStringTwo022
     * @tc.desc Verify toLocaleString ar [0] length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const r = arr.toLocaleString('ar');
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_2300
     * @tc.name testUint8ClampedArrayToLocaleStringTwo023
     * @tc.desc Verify toLocaleString empty equals toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.toLocaleString()).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_2400
     * @tc.name testUint8ClampedArrayToLocaleStringTwo024
     * @tc.desc Verify toLocaleString return typeof string [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.toLocaleString();
      const t: string = typeof r;
      expect(t).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_2500
     * @tc.name testUint8ClampedArrayToLocaleStringTwo025
     * @tc.desc Verify toLocaleString return not null [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.toLocaleString();
      expect(r).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_2600
     * @tc.name testUint8ClampedArrayToLocaleStringTwo026
     * @tc.desc Verify toLocaleString return not undefined [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.toLocaleString();
      expect(r).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_2700
     * @tc.name testUint8ClampedArrayToLocaleStringTwo027
     * @tc.desc Verify toLocaleString on [0] result length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_2800
     * @tc.name testUint8ClampedArrayToLocaleStringTwo028
     * @tc.desc Verify toLocaleString [255] result length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_2900
     * @tc.name testUint8ClampedArrayToLocaleStringTwo029
     * @tc.desc Verify toLocaleString [127] result length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127]);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_3000
     * @tc.name testUint8ClampedArrayToLocaleStringTwo030
     * @tc.desc Verify toLocaleString [128] result length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128]);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_3100
     * @tc.name testUint8ClampedArrayToLocaleStringTwo031
     * @tc.desc Verify toLocaleString after set [1,2,3]->[99,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.set(0, 99);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(6);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(99);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_3200
     * @tc.name testUint8ClampedArrayToLocaleStringTwo032
     * @tc.desc Verify toLocaleString after fill [1,2,3]->[0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(0);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(0);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_3300
     * @tc.name testUint8ClampedArrayToLocaleStringTwo033
     * @tc.desc Verify toLocaleString after reverse [1,2,3]->[3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_3400
     * @tc.name testUint8ClampedArrayToLocaleStringTwo034
     * @tc.desc Verify toLocaleString byteOffset view length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const parent = new Uint8ClampedArray(buf);
      parent[2] = 10;
      parent[3] = 20;
      const view = new Uint8ClampedArray(buf, 2, 2);
      const r: string = view.toLocaleString();
      expect(r.length).assertEqual(5);
      expect(view.length).assertEqual(2);
      expect(view[0]).assertEqual(10);
      expect(view[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_3500
     * @tc.name testUint8ClampedArrayToLocaleStringTwo035
     * @tc.desc Verify toLocaleString large array length 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      for (let i = 0; i < 256; i++) {
        arr[i] = i;
      }
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(913);
      expect(arr.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_3600
     * @tc.name testUint8ClampedArrayToLocaleStringTwo036
     * @tc.desc Verify toLocaleString of() result [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_3700
     * @tc.name testUint8ClampedArrayToLocaleStringTwo037
     * @tc.desc Verify toLocaleString from() result [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8ClampedArray.from(src);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_3800
     * @tc.name testUint8ClampedArrayToLocaleStringTwo038
     * @tc.desc Verify toLocaleString [0,0,0] all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_3900
     * @tc.name testUint8ClampedArrayToLocaleStringTwo039
     * @tc.desc Verify toLocaleString [255,255,255] all max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(11);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_4000
     * @tc.name testUint8ClampedArrayToLocaleStringTwo040
     * @tc.desc Verify toLocaleString after $_set [1,2,3]->[99,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.$_set(0, 99);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(6);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(99);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_4100
     * @tc.name testUint8ClampedArrayToLocaleStringTwo041
     * @tc.desc Verify toLocaleString [0,255,127,128] mixed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 127, 128]);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(13);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(127);
      expect(arr[3]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_4200
     * @tc.name testUint8ClampedArrayToLocaleStringTwo042
     * @tc.desc Verify toLocaleString [1] single element result length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_4300
     * @tc.name testUint8ClampedArrayToLocaleStringTwo043
     * @tc.desc Verify toLocaleString empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_4400
     * @tc.name testUint8ClampedArrayToLocaleStringTwo044
     * @tc.desc Verify toLocaleString [100] length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_4500
     * @tc.name testUint8ClampedArrayToLocaleStringTwo045
     * @tc.desc Verify toLocaleString('en-US') on [1000] result length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1000]);
      const r: string = arr.toLocaleString('en-US');
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_4600
     * @tc.name testUint8ClampedArrayToLocaleStringTwo046
     * @tc.desc Verify toLocaleString [5,10] length matches toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10]);
      const r1: string = arr.toLocaleString();
      const r2: string = arr.toString();
      expect(r1.length).assertEqual(r2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_4700
     * @tc.name testUint8ClampedArrayToLocaleStringTwo047
     * @tc.desc Verify toLocaleString after copyWithin [1,2,3,4]->[3,4,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.copyWithin(0, 2);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(7);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_4800
     * @tc.name testUint8ClampedArrayToLocaleStringTwo048
     * @tc.desc Verify toLocaleString [1,2,3,4,5,6,7,8,9,10] 10 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const r: string = arr.toLocaleString();
      expect(r.length).assertEqual(20);
      expect(arr.length).assertEqual(10);
      expect(arr[0]).assertEqual(1);
      expect(arr[9]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_4900
     * @tc.name testUint8ClampedArrayToLocaleStringTwo049
     * @tc.desc Verify toLocaleString en-US options {} [3,6,9] arr unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 6, 9]);
      const r: string = arr.toLocaleString('en-US', {});
      expect(r.length).assertEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(6);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_5000
     * @tc.name testUint8ClampedArrayToLocaleStringTwo050
     * @tc.desc Verify toLocaleString length unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const before: int = arr.length;
      arr.toLocaleString();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_5100
     * @tc.name testUint8ClampedArrayToLocaleStringTwo051
     * @tc.desc Verify toLocaleString byteLength unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const before: int = arr.byteLength;
      arr.toLocaleString();
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_5200
     * @tc.name testUint8ClampedArrayToLocaleStringTwo052
     * @tc.desc Verify toLocaleString on subarray(1,4) of [10..50] parent and sub elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(1, 4);
      const before: int = sub.length;
      sub.toLocaleString();
      expect(arr.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
      expect(sub[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_5300
     * @tc.name testUint8ClampedArrayToLocaleStringTwo053
     * @tc.desc Verify toLocaleString name unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const before: string = arr.name;
      arr.toLocaleString();
      expect(arr.name).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_5400
     * @tc.name testUint8ClampedArrayToLocaleStringTwo054
     * @tc.desc Verify toLocaleString BYTES_PER_ELEMENT unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const before: int = arr.BYTES_PER_ELEMENT;
      arr.toLocaleString();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_5500
     * @tc.name testUint8ClampedArrayToLocaleStringTwo055
     * @tc.desc Verify toLocaleString on [5,10,15] result contains '5' at index >= 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15]);
      const r: string = arr.toLocaleString();
      const idx: int = r.indexOf(c'5');
      expect(arr.length).assertEqual(3);
      expect(idx).assertLargerOrEqual(0);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_TWO_5600
     * @tc.name testUint8ClampedArrayToLocaleStringTwo056
     * @tc.desc Verify toLocaleString [255,0,128] three elements with comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 128]);
      const r: string = arr.toLocaleString();
      const commaCount: int = r.split(',').length - 1;
      expect(commaCount).assertEqual(2);
    });
  });
}
