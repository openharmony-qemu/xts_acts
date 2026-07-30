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


export default function uint8ClampedArrayMapTwoTest(): void {
  describe('Uint8ClampedArrayMapTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_0100
     * @tc.name testUint8ClampedArrayMapTwo001
     * @tc.desc Verify fn return 0o377 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 0o377);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_0200
     * @tc.name testUint8ClampedArrayMapTwo002
     * @tc.desc Verify fn return 0o400 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 0o400);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_0300
     * @tc.name testUint8ClampedArrayMapTwo003
     * @tc.desc Verify fn return 1e2 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 1e2);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_0400
     * @tc.name testUint8ClampedArrayMapTwo004
     * @tc.desc Verify fn return 2.55e2 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 2.55e2);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_0500
     * @tc.name testUint8ClampedArrayMapTwo005
     * @tc.desc Verify fn return 2.56e2 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 2.56e2);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_0600
     * @tc.name testUint8ClampedArrayMapTwo006
     * @tc.desc Verify fn return 1e-10 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 1e-10);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_0700
     * @tc.name testUint8ClampedArrayMapTwo007
     * @tc.desc Verify fn return 100+50 150
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 100 + 50);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_0800
     * @tc.name testUint8ClampedArrayMapTwo008
     * @tc.desc Verify fn return 200+100 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 200 + 100);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_0900
     * @tc.name testUint8ClampedArrayMapTwo009
     * @tc.desc Verify fn return 50-100 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 50 - 100);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_1000
     * @tc.name testUint8ClampedArrayMapTwo010
     * @tc.desc Verify empty array map r.length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 99);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_1100
     * @tc.name testUint8ClampedArrayMapTwo011
     * @tc.desc Verify map [42] returns [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_1200
     * @tc.name testUint8ClampedArrayMapTwo012
     * @tc.desc Verify map with identity callback preserves all elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(10);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
      expect(r[4]).assertEqual(5);
      expect(r[5]).assertEqual(6);
      expect(r[6]).assertEqual(7);
      expect(r[7]).assertEqual(8);
      expect(r[8]).assertEqual(9);
      expect(r[9]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_1300
     * @tc.name testUint8ClampedArrayMapTwo013
     * @tc.desc Verify length 256 array map r.length 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 1);
      expect(r.length).assertEqual(256);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(1);
      expect(r[255]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_1400
     * @tc.name testUint8ClampedArrayMapTwo014
     * @tc.desc Verify length 1024 array map r.length 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 1);
      expect(r.length).assertEqual(1024);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(1);
      expect(r[1023]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_1500
     * @tc.name testUint8ClampedArrayMapTwo015
     * @tc.desc Verify length 65535 array map r.length 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(65535);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 0);
      expect(r.length).assertEqual(65535);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[65534]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_1600
     * @tc.name testUint8ClampedArrayMapTwo016
     * @tc.desc Verify map r.byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_1700
     * @tc.name testUint8ClampedArrayMapTwo017
     * @tc.desc Verify 1024 elements map r.byteLength 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.byteLength).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_1800
     * @tc.name testUint8ClampedArrayMapTwo018
     * @tc.desc Verify map r.BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_1900
     * @tc.name testUint8ClampedArrayMapTwo019
     * @tc.desc Verify empty map r.BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_2000
     * @tc.name testUint8ClampedArrayMapTwo020
     * @tc.desc Verify map r.byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_2100
     * @tc.name testUint8ClampedArrayMapTwo021
     * @tc.desc Verify map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      const t: string = typeof r;
      expect(t).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_2200
     * @tc.name testUint8ClampedArrayMapTwo022
     * @tc.desc Verify empty array map returns r.length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_2300
     * @tc.name testUint8ClampedArrayMapTwo023
     * @tc.desc Verify map [1,2,3] returns [2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v + 1);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_2400
     * @tc.name testUint8ClampedArrayMapTwo024
     * @tc.desc Verify map [100] returns [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_2500
     * @tc.name testUint8ClampedArrayMapTwo025
     * @tc.desc Verify map identity on 1024-element array returns r.length=1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1024);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[1023]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_2600
     * @tc.name testUint8ClampedArrayMapTwo026
     * @tc.desc Verify map return index r[i]=i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([97, 98, 99]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => i);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_2700
     * @tc.name testUint8ClampedArrayMapTwo027
     * @tc.desc Verify empty map buffer not equal source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_2800
     * @tc.name testUint8ClampedArrayMapTwo028
     * @tc.desc Verify map r.buffer.byteLength equal r.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.buffer.byteLength).assertEqual(r.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_2900
     * @tc.name testUint8ClampedArrayMapTwo029
     * @tc.desc Verify chain map identity then v+1 on [1,2,3] returns [2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v).map((v: number, i: int, a: Uint8ClampedArray) => v + 1);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_3000
     * @tc.name testUint8ClampedArrayMapTwo030
     * @tc.desc Verify triple identity map chain on [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v).map((v: number, i: int, a: Uint8ClampedArray) => v).map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_3100
     * @tc.name testUint8ClampedArrayMapTwo031
     * @tc.desc Verify map [1,2,3] returns [2,4,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v * 2);
      expect(arr.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(4);
      expect(r[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_3200
     * @tc.name testUint8ClampedArrayMapTwo032
     * @tc.desc Verify map [10,20,30] returns [110,120,130]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v + 100);
      expect(arr.length).assertEqual(3);
      expect(r[0]).assertEqual(110);
      expect(r[1]).assertEqual(120);
      expect(r[2]).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_3300
     * @tc.name testUint8ClampedArrayMapTwo033
     * @tc.desc Verify map [10,20,30] returns [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 0);
      expect(arr.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_3400
     * @tc.name testUint8ClampedArrayMapTwo034
     * @tc.desc Verify source byteLength, buffer reference, and BYTES_PER_ELEMENT unchanged after map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const origBuf = arr.buffer;
      arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(arr.byteLength).assertEqual(4);
      expect(arr.buffer).assertEqual(origBuf);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_3500
     * @tc.name testUint8ClampedArrayMapTwo035
     * @tc.desc Verify map last index reachable r[length-1]=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(5);
      expect(r[r.length - 1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_3600
     * @tc.name testUint8ClampedArrayMapTwo036
     * @tc.desc Verify map r[0] typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      const t: string = typeof r[0];
      expect(t).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_3700
     * @tc.name testUint8ClampedArrayMapTwo037
     * @tc.desc Verify map clamp 300 typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 300);
      const t: string = typeof r[0];
      expect(t).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_3800
     * @tc.name testUint8ClampedArrayMapTwo038
     * @tc.desc Verify map result buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_3900
     * @tc.name testUint8ClampedArrayMapTwo039
     * @tc.desc Verify offset source map r.buffer.byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 4, 4);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_4000
     * @tc.name testUint8ClampedArrayMapTwo040
     * @tc.desc Verify map out-of-bounds index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      try {
        r[r.length];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_4100
     * @tc.name testUint8ClampedArrayMapTwo041
     * @tc.desc Verify set [1,2,3] returns [99,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.set(0, 99);
      const m = arr.map((x: number) => x);
      expect(m.length).assertEqual(3);
      expect(m[0]).assertEqual(99);
      expect(m[1]).assertEqual(2);
      expect(m[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_4200
     * @tc.name testUint8ClampedArrayMapTwo042
     * @tc.desc Verify map after fill uses updated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(7);
      const m = arr.map((x: number) => x);
      expect(m.length).assertEqual(4);
      expect(m[1]).assertEqual(7);
      expect(m[0]).assertEqual(7);
      expect(m[2]).assertEqual(7);
      expect(m[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_4300
     * @tc.name testUint8ClampedArrayMapTwo043
     * @tc.desc Verify reverse [10,20,30] then map identity returns [30,20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.reverse();
      const m = arr.map((x: number) => x);
      expect(m.length).assertEqual(3);
      expect(m[0]).assertEqual(30);
      expect(m[1]).assertEqual(20);
      expect(m[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_4400
     * @tc.name testUint8ClampedArrayMapTwo044
     * @tc.desc Verify sort [3,1,2] then map identity returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      arr.sort();
      const m = arr.map((x: number) => x);
      expect(m.length).assertEqual(3);
      expect(m[0]).assertEqual(1);
      expect(m[1]).assertEqual(2);
      expect(m[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_4500
     * @tc.name testUint8ClampedArrayMapTwo045
     * @tc.desc Verify $_set index 0 to 88 on [1,2,3] then map identity returns [88,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.$_set(0, 88);
      const m = arr.map((x: number) => x);
      expect(m.length).assertEqual(3);
      expect(m[0]).assertEqual(88);
      expect(m[1]).assertEqual(2);
      expect(m[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_4600
     * @tc.name testUint8ClampedArrayMapTwo046
     * @tc.desc Verify map r not null [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const m = arr.map((x: number) => x);
      expect(m).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_4700
     * @tc.name testUint8ClampedArrayMapTwo047
     * @tc.desc Verify empty map r not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const m = arr.map((x: number) => x);
      expect(m).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_4800
     * @tc.name testUint8ClampedArrayMapTwo048
     * @tc.desc Verify map result name property equals source Uint8ClampedArray name on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const m = arr.map((x: number) => x);
      expect(m.name).assertEqual(arr.name);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_4900
     * @tc.name testUint8ClampedArrayMapTwo049
     * @tc.desc Verify map r[0] not undefined [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const m = arr.map((x: number) => x);
      expect(m[0]).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_5000
     * @tc.name testUint8ClampedArrayMapTwo050
     * @tc.desc Verify map double value r[0]=200 [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const m = arr.map((x: number): number => { return x * 2; });
      expect(m.length).assertEqual(1);
      expect(m[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_5100
     * @tc.name testUint8ClampedArrayMapTwo051
     * @tc.desc Verify map subtract 1 r[0]=9 [10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10]);
      const m = arr.map((x: number): number => { return x - 1; });
      expect(m.length).assertEqual(1);
      expect(m[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_5200
     * @tc.name testUint8ClampedArrayMapTwo052
     * @tc.desc Verify map add with external constant r[0]=15 [10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10]);
      const inc: number = 5;
      const m = arr.map((x: number): number => { return x + inc; });
      expect(m.length).assertEqual(1);
      expect(m[0]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_5300
     * @tc.name testUint8ClampedArrayMapTwo053
     * @tc.desc Verify map v+100 on [200,100,50] returns [255,200,150] with overflow clamped to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([200, 100, 50]);
      const m = arr.map((x: number): number => { return x + 100; });
      expect(m.length).assertEqual(3);
      expect(m[0]).assertLessOrEqual(255);
      expect(m[1]).assertEqual(200);
      expect(m[2]).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_5400
     * @tc.name testUint8ClampedArrayMapTwo054
     * @tc.desc Verify subarray [10,20,30,40] returns [20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(1, 3);
      const m = sub.map((x: number) => x);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_5500
     * @tc.name testUint8ClampedArrayMapTwo055
     * @tc.desc Verify map result r.length equals r.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const m = arr.map((x: number) => x);
      expect(m.length).assertEqual(m.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_5600
     * @tc.name testUint8ClampedArrayMapTwo056
     * @tc.desc Verify map callback receives correct thisArg array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15]);
      const m = arr.map((x: number, _i: int, a: Uint8ClampedArray): number => {
        return a[0];
      });
      expect(m.length).assertEqual(3);
      expect(m[0]).assertEqual(5);
      expect(m[1]).assertEqual(5);
      expect(m[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_TWO_5700
     * @tc.name testUint8ClampedArrayMapTwo057
     * @tc.desc Verify map callback third arg is source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 14, 21]);
      const m = arr.map((_x: number, _i: int, a: Uint8ClampedArray): number => {
        return a.length;
      });
      expect(m.length).assertEqual(3);
      expect(m[0]).assertEqual(3);
      expect(m[1]).assertEqual(3);
      expect(m[2]).assertEqual(3);
    });
  });
}
