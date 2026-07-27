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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint8ClampedArrayFilter01Test(): void {
  describe('uint8ClampedArrayFilter01Test', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        },50);
      });
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_0100
     * @tc.name testUint8ClampedArrayFilterOne001
     * @tc.desc Verify filter() predicate v > 2 returns 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v > 2);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_0200
     * @tc.name testUint8ClampedArrayFilterOne002
     * @tc.desc Verify filter yields length 2 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 20);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_0300
     * @tc.name testUint8ClampedArrayFilterOne003
     * @tc.desc Verify filter yields length 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => i % 2 === 0);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_0400
     * @tc.name testUint8ClampedArrayFilterOne004
     * @tc.desc Verify filter yields length arr.length for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => true);
      expect(r.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_0500
     * @tc.name testUint8ClampedArrayFilterOne005
     * @tc.desc Verify filter element at r[0] equals 7 for array [7, 8, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => true);
      expect(r[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_0600
     * @tc.name testUint8ClampedArrayFilterOne006
     * @tc.desc Verify filter element at r[2] equals 9 for array [7, 8, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => true);
      expect(r[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_0700
     * @tc.name testUint8ClampedArrayFilterOne007
     * @tc.desc Verify filter yields length 0 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => false);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_0800
     * @tc.name testUint8ClampedArrayFilterOne008
     * @tc.desc Verify rejecting all elements returns independent empty storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => false);
      expect(r.length).assertEqual(0);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_0900
     * @tc.name testUint8ClampedArrayFilterOne009
     * @tc.desc Verify filter() predicate v % 2 === 0 returns 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v % 2 === 0);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_1000
     * @tc.name testUint8ClampedArrayFilterOne010
     * @tc.desc Verify filter() predicate v % 2 === 1 returns 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v % 2 === 1);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_1100
     * @tc.name testUint8ClampedArrayFilterOne011
     * @tc.desc Verify filter() predicate v > 100 returns 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 50, 100, 150, 200]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v > 100);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_1200
     * @tc.name testUint8ClampedArrayFilterOne012
     * @tc.desc Verify filter() predicate v < 100 returns 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 50, 100, 150, 200]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v < 100);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_1300
     * @tc.name testUint8ClampedArrayFilterOne013
     * @tc.desc Verify filter() predicate v === 5 returns 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 5, 5, 5, 9]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 5);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_1400
     * @tc.name testUint8ClampedArrayFilterOne014
     * @tc.desc Verify filter() predicate v === 0 returns 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 0, 2, 0]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_1500
     * @tc.name testUint8ClampedArrayFilterOne015
     * @tc.desc Verify filter() predicate v === 255 returns 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 255, 0, 255]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_1600
     * @tc.name testUint8ClampedArrayFilterOne016
     * @tc.desc Verify filter yields length 2 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => i >= 2);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_1700
     * @tc.name testUint8ClampedArrayFilterOne017
     * @tc.desc Verify filter element at r[0] equals 10 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => i === 0);
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_1800
     * @tc.name testUint8ClampedArrayFilterOne018
     * @tc.desc Verify filter element at r[0] equals 30 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => i === a.length - 1);
      expect(r[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_1900
     * @tc.name testUint8ClampedArrayFilterOne019
     * @tc.desc Verify filter yields length 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === a.length);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_2000
     * @tc.name testUint8ClampedArrayFilterOne020
     * @tc.desc Verify filter yields length 3 for array [5, 5, 5, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5, 7]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === a[0]);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_2100
     * @tc.name testUint8ClampedArrayFilterOne021
     * @tc.desc Verify filter yields length 2 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v > 15 && i < 3);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_2200
     * @tc.name testUint8ClampedArrayFilterOne022
     * @tc.desc Verify filter yields length 0 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => true);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_2300
     * @tc.name testUint8ClampedArrayFilterOne023
     * @tc.desc Verify filter() on empty array does not call predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = 0;
      const arr = new Uint8ClampedArray([]);
      arr.filter((v: number, i: int, a: Uint8ClampedArray) => { called++; return true; });
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_2400
     * @tc.name testUint8ClampedArrayFilterOne024
     * @tc.desc Verify filter() predicate i === 0 returns r[0]=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => i === 0);
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_2500
     * @tc.name testUint8ClampedArrayFilterOne025
     * @tc.desc Verify filter() predicate i === 1 returns r[0]=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => i === 1);
      expect(r[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_2600
     * @tc.name testUint8ClampedArrayFilterOne026
     * @tc.desc Verify filter yields length 2 for array [0, 255, 0, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 0, 255]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_2700
     * @tc.name testUint8ClampedArrayFilterOne027
     * @tc.desc Verify filter() predicate v >= 128 returns 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 128, 129]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 128);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_2800
     * @tc.name testUint8ClampedArrayFilterOne028
     * @tc.desc Verify filter() predicate v >= 128 on 256-length array returns 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const arr = new Uint8ClampedArray(buf);
      for (let i = 0; i < 256; i++) { arr[i] = i; }
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 128);
      expect(r.length).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_2900
     * @tc.name testUint8ClampedArrayFilterOne029
     * @tc.desc Verify filter() predicate i % 2 === 0 on 1024-length array returns 512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      for (let i = 0; i < 1024; i++) { arr[i] = i % 256; }
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => i % 2 === 0);
      expect(r.length).assertEqual(512);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_3000
     * @tc.name testUint8ClampedArrayFilterOne030
     * @tc.desc Verify filter yields length 4 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf);
      for (let i = 0; i < 8; i++) { arr[i] = i * 30; }
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v > 100);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(120);
      expect(r[3]).assertEqual(210);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_3100
     * @tc.name testUint8ClampedArrayFilterOne031
     * @tc.desc Verify filter yields length 3 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 40;
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 20);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_3200
     * @tc.name testUint8ClampedArrayFilterOne032
     * @tc.desc Verify Uint8ClampedArray.of yields length 2 for of(5, 10, 15, 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(5, 10, 15, 20);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v > 10);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_3300
     * @tc.name testUint8ClampedArrayFilterOne033
     * @tc.desc Verify filter yields length 2 for array [256, 10, 256]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, 10, 256]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_3400
     * @tc.name testUint8ClampedArrayFilterOne034
     * @tc.desc Verify filter yields length 2 for array [-1, 50, -1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, 50, -1]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_3500
     * @tc.name testUint8ClampedArrayFilterOne035
     * @tc.desc Verify filter yields length 2 for array [Number.NaN, 100, Number.NaN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN, 100, Number.NaN]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_3600
     * @tc.name testUint8ClampedArrayFilterOne036
     * @tc.desc Verify filter yields length 2 for array [Number.POSITIVE_INFINITY, 100, Number.POSITIVE_INFINITY]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY, 100, Number.POSITIVE_INFINITY]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_3700
     * @tc.name testUint8ClampedArrayFilterOne037
     * @tc.desc Verify filter yields length 2 for array [-Number.POSITIVE_INFINITY, 100, -Number.POSITIVE_INFINITY]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY, 100, -Number.POSITIVE_INFINITY]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_3800
     * @tc.name testUint8ClampedArrayFilterOne038
     * @tc.desc Verify filter yields length 2 for array [127.5, 1, 127.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5, 1, 127.5]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 128);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_3900
     * @tc.name testUint8ClampedArrayFilterOne039
     * @tc.desc Verify filter yields length 2 for array [128.5, 1, 128.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5, 1, 128.5]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 128);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_4000
     * @tc.name testUint8ClampedArrayFilterOne040
     * @tc.desc Verify filter yields length 3 for array [0.4, 0.4, 0.4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.4, 0.4, 0.4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_4100
     * @tc.name testUint8ClampedArrayFilterOne041
     * @tc.desc Verify filter yields length 3 for array [0.9, 0.9, 0.9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.9, 0.9, 0.9]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 1);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_4200
     * @tc.name testUint8ClampedArrayFilterOne042
     * @tc.desc Verify filter yields length 2 for array [1e2, 1, 1e2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e2, 1, 1e2]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 100);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_4300
     * @tc.name testUint8ClampedArrayFilterOne043
     * @tc.desc Verify filter yields BYTES_PER_ELEMENT 1 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => true);
      expect(r.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_4400
     * @tc.name testUint8ClampedArrayFilterOne044
     * @tc.desc Verify filter yields byteLength r.length for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      expect(r.byteLength).assertEqual(r.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_4500
     * @tc.name testUint8ClampedArrayFilterOne045
     * @tc.desc Verify filter yields byteOffset 0 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v > 0);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_4600
     * @tc.name testUint8ClampedArrayFilterOne046
     * @tc.desc Verify filter element at r[0] equals 3 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 3);
      expect(r[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_4700
     * @tc.name testUint8ClampedArrayFilterOne047
     * @tc.desc Verify filter element at r[1] equals 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 3);
      expect(r[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_4800
     * @tc.name testUint8ClampedArrayFilterOne048
     * @tc.desc Verify filter element at r[1] equals 30 for array [10, 20, 30, 40, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 20);
      expect(r[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_4900
     * @tc.name testUint8ClampedArrayFilterOne049
     * @tc.desc Verify filter element at r[0] equals 5 for array [5, 1, 6, 2, 7, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 1, 6, 2, 7, 3]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 5);
      expect(r[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_5000
     * @tc.name testUint8ClampedArrayFilterOne050
     * @tc.desc Verify filter element at r[1] equals 6 for array [5, 1, 6, 2, 7, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 1, 6, 2, 7, 3]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 5);
      expect(r[1]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_5100
     * @tc.name testUint8ClampedArrayFilterOne051
     * @tc.desc Verify filter element at r[2] equals 7 for array [5, 1, 6, 2, 7, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 1, 6, 2, 7, 3]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 5);
      expect(r[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_5200
     * @tc.name testUint8ClampedArrayFilterOne052
     * @tc.desc Verify filter v===2 returns single element [2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_5300
     * @tc.name testUint8ClampedArrayFilterOne053
     * @tc.desc Verify filter callback returns elements with values greater than or equal to threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 20);
      expect(r[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_5400
     * @tc.name testUint8ClampedArrayFilterOne054
     * @tc.desc Verify filter yields length 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.filter((v: number, i: int, a: Uint8ClampedArray) => v > 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_5500
     * @tc.name testUint8ClampedArrayFilterOne055
     * @tc.desc Verify filter element at arr[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.filter((v: number, i: int, a: Uint8ClampedArray) => v > 2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_5600
     * @tc.name testUint8ClampedArrayFilterOne056
     * @tc.desc Verify filter result shares no buffer with source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => true);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_5700
     * @tc.name testUint8ClampedArrayFilterOne057
     * @tc.desc Verify filter element at arr[0] equals 10 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => true);
      r[0] = 99;
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_5800
     * @tc.name testUint8ClampedArrayFilterOne058
     * @tc.desc Verify filter element at r[0] equals 10 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => true);
      arr[0] = 99;
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_5900
     * @tc.name testUint8ClampedArrayFilterOne059
     * @tc.desc Verify filter() calls predicate 4 times on length-4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = 0;
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.filter((v: number, i: int, a: Uint8ClampedArray) => { called++; return true; });
      expect(called).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_6000
     * @tc.name testUint8ClampedArrayFilterOne060
     * @tc.desc Verify filter firstIndex equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstIndex = -1;
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.filter((v: number, i: int, a: Uint8ClampedArray) => { if (firstIndex === -1) firstIndex = i; return true; });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_6100
     * @tc.name testUint8ClampedArrayFilterOne061
     * @tc.desc Verify filter last key equals 2 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIndex = -1;
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.filter((v: number, i: int, a: Uint8ClampedArray) => { lastIndex = i; return true; });
      expect(lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_6200
     * @tc.name testUint8ClampedArrayFilterOne062
     * @tc.desc Verify filter captured equals 42 for array [42, 1, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let captured: number = -1;
      const arr = new Uint8ClampedArray([42, 1, 1]);
      arr.filter((v: number, i: int, a: Uint8ClampedArray) => { if (i === 0) captured = v; return true; });
      expect(captured).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_6300
     * @tc.name testUint8ClampedArrayFilterOne063
     * @tc.desc Verify filter captured equals arr for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let captured: Uint8ClampedArray | null = null;
      const arr = new Uint8ClampedArray([1, 2]);
      arr.filter((v: number, i: int, a: Uint8ClampedArray) => { captured = a; return true; });
      expect(captured).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_ONE_6400
     * @tc.name testUint8ClampedArrayFilterOne064
     * @tc.desc Verify filter propagates Error thrown by the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.filter((v: number, i: int, a: Uint8ClampedArray) => { throw new Error('cb-fail'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });
  });
}
