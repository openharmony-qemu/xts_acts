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

export default function uint8ClampedArrayToSortedTest(): void {
  describe('Uint8ClampedArrayToSortedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_0100
     * @tc.name testUint8ClampedArrayToSorted001
     * @tc.desc Verify toSorted [3,1,2] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_0200
     * @tc.name testUint8ClampedArrayToSorted002
     * @tc.desc Verify toSorted [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_0300
     * @tc.name testUint8ClampedArrayToSorted003
     * @tc.desc Verify toSorted [42] returns [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(1);
      expect(sorted[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_0400
     * @tc.name testUint8ClampedArrayToSorted004
     * @tc.desc Verify toSorted empty array length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_0500
     * @tc.name testUint8ClampedArrayToSorted005
     * @tc.desc Verify toSorted [0,0,0,0] returns [0,0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(4);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[1]).assertEqual(0);
      expect(sorted[2]).assertEqual(0);
      expect(sorted[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_0600
     * @tc.name testUint8ClampedArrayToSorted006
     * @tc.desc Verify toSorted [255,255,255] returns [255,255,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(255);
      expect(sorted[1]).assertEqual(255);
      expect(sorted[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_0700
     * @tc.name testUint8ClampedArrayToSorted007
     * @tc.desc Verify toSorted [5,0,3] returns [0,3,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 0, 3]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[1]).assertEqual(3);
      expect(sorted[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_0800
     * @tc.name testUint8ClampedArrayToSorted008
     * @tc.desc Verify toSorted [5,255,3] returns [3,5,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 255, 3]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[2]).assertEqual(255);
      expect(sorted[0]).assertEqual(3);
      expect(sorted[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_0900
     * @tc.name testUint8ClampedArrayToSorted009
     * @tc.desc Verify toSorted [255,0,128] returns [0,128,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 128]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[1]).assertEqual(128);
      expect(sorted[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_1000
     * @tc.name testUint8ClampedArrayToSorted010
     * @tc.desc Verify toSorted [127,1,200] returns [1,127,200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 1, 200]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[1]).assertEqual(127);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_1100
     * @tc.name testUint8ClampedArrayToSorted011
     * @tc.desc Verify toSorted [128,1,200] returns [1,128,200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128, 1, 200]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[1]).assertEqual(128);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_1200
     * @tc.name testUint8ClampedArrayToSorted012
     * @tc.desc Verify toSorted [1,255,128] returns [1,128,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 255, 128]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(128);
      expect(sorted[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_1300
     * @tc.name testUint8ClampedArrayToSorted013
     * @tc.desc Verify toSorted [254,1,100] returns [1,100,254]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([254, 1, 100]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[2]).assertEqual(254);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_1400
     * @tc.name testUint8ClampedArrayToSorted014
     * @tc.desc Verify toSorted [2,1,2] returns [1,2,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_1500
     * @tc.name testUint8ClampedArrayToSorted015
     * @tc.desc Verify toSorted [5,3,8,1,9,2,7,4,6,0] returns [0,1,2,3,4,5,6,7,8,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 3, 8, 1, 9, 2, 7, 4, 6, 0]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(10);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[1]).assertEqual(1);
      expect(sorted[2]).assertEqual(2);
      expect(sorted[3]).assertEqual(3);
      expect(sorted[4]).assertEqual(4);
      expect(sorted[5]).assertEqual(5);
      expect(sorted[6]).assertEqual(6);
      expect(sorted[7]).assertEqual(7);
      expect(sorted[8]).assertEqual(8);
      expect(sorted[9]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_1600
     * @tc.name testUint8ClampedArrayToSorted016
     * @tc.desc Verify toSorted 256-element reverse-sorted array first element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [...new Uint8ClampedArray(256)].map((v, i) => 255.0 - i);
      const arr = new Uint8ClampedArray(src);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(256);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[128]).assertEqual(128);
      expect(sorted[255]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_1700
     * @tc.name testUint8ClampedArrayToSorted017
     * @tc.desc Verify 1024 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [...new Uint8ClampedArray(1024)].map((v, i) => (1023.0 - i) % 256.0);
      const arr = new Uint8ClampedArray(src);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(1024);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[512]).assertEqual(128);
      expect(sorted[1023]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_1800
     * @tc.name testUint8ClampedArrayToSorted018
     * @tc.desc Verify toSorted [5,-1,3] with -1 clamped to 0 returns [0,3,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, -1, 3]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[1]).assertEqual(3);
      expect(sorted[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_1900
     * @tc.name testUint8ClampedArrayToSorted019
     * @tc.desc Verify toSorted [5,256,3] with 256 clamped to 255 returns [3,5,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 256, 3]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(3);
      expect(sorted[1]).assertEqual(5);
      expect(sorted[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_2000
     * @tc.name testUint8ClampedArrayToSorted020
     * @tc.desc Verify NaN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, Number.NaN, 3]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[1]).assertEqual(3);
      expect(sorted[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_2100
     * @tc.name testUint8ClampedArrayToSorted021
     * @tc.desc Verify Infinity clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, Number.POSITIVE_INFINITY, 3]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[2]).assertEqual(255);
      expect(sorted[0]).assertEqual(3);
      expect(sorted[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_2200
     * @tc.name testUint8ClampedArrayToSorted022
     * @tc.desc Verify -Infinity clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, -Number.POSITIVE_INFINITY, 3]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[1]).assertEqual(3);
      expect(sorted[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_2300
     * @tc.name testUint8ClampedArrayToSorted023
     * @tc.desc Verify 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[1]).assertEqual(1);
      expect(sorted[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_2400
     * @tc.name testUint8ClampedArrayToSorted024
     * @tc.desc Verify 127.5 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5, 5, 10]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[2]).assertEqual(128);
      expect(sorted[0]).assertEqual(5);
      expect(sorted[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_2500
     * @tc.name testUint8ClampedArrayToSorted025
     * @tc.desc Verify toSorted [0,5,1] returns [0,1,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-0, 5, 1]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[1]).assertEqual(1);
      expect(sorted[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_2600
     * @tc.name testUint8ClampedArrayToSorted026
     * @tc.desc Verify toSorted hex [0xFF,0x01,0x80] first element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 0x01, 0x80]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_2700
     * @tc.name testUint8ClampedArrayToSorted027
     * @tc.desc Verify toSorted octal [0o77,0o10,0o1] first element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o77, 0o10, 0o1]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_2800
     * @tc.name testUint8ClampedArrayToSorted028
     * @tc.desc Verify toSorted binary [0b11111111,0b00000001,0b10000000] mid element 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b11111111, 0b00000001, 0b10000000]);
      const sorted = arr.toSorted();
      expect(sorted[1]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_2900
     * @tc.name testUint8ClampedArrayToSorted029
     * @tc.desc Verify toSorted [1e2,1,50] sorted[2]=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e2, 1, 50]);
      const sorted = arr.toSorted();
      expect(sorted[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_3000
     * @tc.name testUint8ClampedArrayToSorted030
     * @tc.desc Verify toSorted result buffer different from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.buffer).not().assertEqual(arr.buffer);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_3100
     * @tc.name testUint8ClampedArrayToSorted031
     * @tc.desc Verify toSorted [100,50,200,25,150] returns [25,50,100,150,200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 50, 200, 25, 150]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(5);
      expect(sorted[0]).assertEqual(25);
      expect(sorted[1]).assertEqual(50);
      expect(sorted[2]).assertEqual(100);
      expect(sorted[3]).assertEqual(150);
      expect(sorted[4]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_3200
     * @tc.name testUint8ClampedArrayToSorted032
     * @tc.desc Verify toSorted [3,1,4,1,5] returns [1,1,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 4, 1, 5]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(5);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(1);
      expect(sorted[2]).assertEqual(3);
      expect(sorted[3]).assertEqual(4);
      expect(sorted[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_3300
     * @tc.name testUint8ClampedArrayToSorted033
     * @tc.desc Verify toSorted [3,1,2] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      sorted[0] = 99;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(2);
      expect(sorted[0]).assertEqual(99);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_3400
     * @tc.name testUint8ClampedArrayToSorted034
     * @tc.desc Verify toSorted [3,1,2] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      arr[0] = 99;
      expect(sorted.length).assertEqual(3);
      expect(sorted[2]).assertEqual(3);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_3500
     * @tc.name testUint8ClampedArrayToSorted035
     * @tc.desc Verify toSorted on ArrayBuffer view sorts correctly sorted[0]=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 5; arr[1] = 2; arr[2] = 9; arr[3] = 1;
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(4);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(5);
      expect(sorted[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_3600
     * @tc.name testUint8ClampedArrayToSorted036
     * @tc.desc Verify toSorted on ArrayBuffer view does not mutate source arr[0]=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 5; arr[1] = 2; arr[2] = 9; arr[3] = 1;
      const sorted = arr.toSorted();
      expect(arr[0]).assertEqual(5);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(5);
      expect(sorted[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_3700
     * @tc.name testUint8ClampedArrayToSorted037
     * @tc.desc Verify toSorted on ArrayBuffer with byteOffset=2 length=3 sorted[0]=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 3);
      arr[0] = 30; arr[1] = 10; arr[2] = 20;
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(10);
      expect(sorted[1]).assertEqual(20);
      expect(sorted[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_3800
     * @tc.name testUint8ClampedArrayToSorted038
     * @tc.desc Verify subarray [9,5,3,8,1] subarray(1,4)=[5,3,8] toSorted returns [3,5,8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([9, 5, 3, 8, 1]);
      const sub = parent.subarray(1, 4);
      const sorted = sub.toSorted();
      expect(parent.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(parent[0]).assertEqual(9);
      expect(parent[1]).assertEqual(5);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(8);
      expect(parent[4]).assertEqual(1);
      expect(sub[0]).assertEqual(5);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(8);
      expect(sorted[0]).assertEqual(3);
      expect(sorted[1]).assertEqual(5);
      expect(sorted[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_3900
     * @tc.name testUint8ClampedArrayToSorted039
     * @tc.desc Verify toSorted [0,0,0,0] returns [0,0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(4);
      expect(sorted[3]).assertEqual(0);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[1]).assertEqual(0);
      expect(sorted[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_4000
     * @tc.name testUint8ClampedArrayToSorted040
     * @tc.desc Verify toSorted [7,7,7,7,7] returns [7,7,7,7,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7, 7, 7]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(5);
      expect(sorted[2]).assertEqual(7);
      expect(sorted[0]).assertEqual(7);
      expect(sorted[1]).assertEqual(7);
      expect(sorted[3]).assertEqual(7);
      expect(sorted[4]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_4100
     * @tc.name testUint8ClampedArrayToSorted041
     * @tc.desc Verify toSorted [255,0,128] returns [0,128,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 128]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[1]).assertEqual(128);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_4200
     * @tc.name testUint8ClampedArrayToSorted042
     * @tc.desc Verify toSorted [2,1] returns [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(2);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_4300
     * @tc.name testUint8ClampedArrayToSorted043
     * @tc.desc Verify toSorted [5,5] returns [5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(2);
      expect(sorted[0]).assertEqual(5);
      expect(sorted[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_4400
     * @tc.name testUint8ClampedArrayToSorted044
     * @tc.desc Verify toSorted [3,1,2] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_4500
     * @tc.name testUint8ClampedArrayToSorted045
     * @tc.desc Verify toSorted [2,1,2] returns [1,2,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_4600
     * @tc.name testUint8ClampedArrayToSorted046
     * @tc.desc Verify len 256 toSorted last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      for (let i = 0; i < 256; i++) { arr[i] = i; }
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(256);
      expect(sorted[255]).assertEqual(255);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[128]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_4700
     * @tc.name testUint8ClampedArrayToSorted047
     * @tc.desc Verify 0xFF toSorted last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 0x01, 0x80]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[2]).assertEqual(255);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_4800
     * @tc.name testUint8ClampedArrayToSorted048
     * @tc.desc Verify toSorted [255,1,255] returns [1,255,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 1, 255]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[1]).assertEqual(255);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_4900
     * @tc.name testUint8ClampedArrayToSorted049
     * @tc.desc Verify toSorted [0,1,0] returns [0,0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 0]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[1]).assertEqual(0);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_5000
     * @tc.name testUint8ClampedArrayToSorted050
     * @tc.desc Verify toSorted length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(100);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(100);
      expect(sorted[0]).assertEqual(0);
      expect(sorted[50]).assertEqual(0);
      expect(sorted[99]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_5100
     * @tc.name testUint8ClampedArrayToSorted051
     * @tc.desc Verify toSorted byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.byteLength).assertEqual(3);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_5200
     * @tc.name testUint8ClampedArrayToSorted052
     * @tc.desc Verify toSorted BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.BYTES_PER_ELEMENT).assertEqual(1);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_5300
     * @tc.name testUint8ClampedArrayToSorted053
     * @tc.desc Verify toSorted not ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted).not().assertEqual(arr);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_5400
     * @tc.name testUint8ClampedArrayToSorted054
     * @tc.desc Verify toSorted byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.byteOffset).assertEqual(0);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_5500
     * @tc.name testUint8ClampedArrayToSorted055
     * @tc.desc Verify toSorted buffer byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2, 4]);
      const sorted = arr.toSorted();
      expect(sorted.buffer.byteLength).assertEqual(4);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
      expect(sorted[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_5600
     * @tc.name testUint8ClampedArrayToSorted056
     * @tc.desc Verify toSorted ascend 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 4, 7, 2, 8]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertLessOrEqual(sorted[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_5700
     * @tc.name testUint8ClampedArrayToSorted057
     * @tc.desc Verify toSorted ascend 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 4, 7, 2, 8]);
      const sorted = arr.toSorted();
      expect(sorted[1]).assertLessOrEqual(sorted[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_5800
     * @tc.name testUint8ClampedArrayToSorted058
     * @tc.desc Verify toSorted ascend 2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 4, 7, 2, 8]);
      const sorted = arr.toSorted();
      expect(sorted[2]).assertLessOrEqual(sorted[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_5900
     * @tc.name testUint8ClampedArrayToSorted059
     * @tc.desc Verify toSorted ascend 3 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 4, 7, 2, 8]);
      const sorted = arr.toSorted();
      expect(sorted[3]).assertLessOrEqual(sorted[4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_6000
     * @tc.name testUint8ClampedArrayToSorted060
     * @tc.desc Verify toSorted $_get 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_6100
     * @tc.name testUint8ClampedArrayToSorted061
     * @tc.desc Verify toSorted [3,1,2] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(2);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_6200
     * @tc.name testUint8ClampedArrayToSorted062
     * @tc.desc Verify toSorted [3,1,2] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(1);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_6300
     * @tc.name testUint8ClampedArrayToSorted063
     * @tc.desc Verify toSorted source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 4, 3, 2, 1]);
      const sorted = arr.toSorted();
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(1);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
      expect(sorted[3]).assertEqual(4);
      expect(sorted[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_6400
     * @tc.name testUint8ClampedArrayToSorted064
     * @tc.desc Verify toSorted [5,4,3] returns [3,4,5] and source byteLength preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 4, 3]);
      const sorted = arr.toSorted();
      expect(arr.byteLength).assertEqual(3);
      expect(sorted[0]).assertEqual(3);
      expect(sorted[1]).assertEqual(4);
      expect(sorted[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_6500
     * @tc.name testUint8ClampedArrayToSorted065
     * @tc.desc Verify toSorted source buffer ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const bufBefore = arr.buffer;
      const sorted = arr.toSorted();
      expect(arr.buffer).assertEqual(bufBefore);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_6600
     * @tc.name testUint8ClampedArrayToSorted066
     * @tc.desc Verify toSorted [5,4,3,2,1] returns [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 4, 3, 2, 1]);
      const sorted = arr.toSorted();
      expect(arr.length).assertEqual(5);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(1);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
      expect(sorted[3]).assertEqual(4);
      expect(sorted[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_6700
     * @tc.name testUint8ClampedArrayToSorted067
     * @tc.desc Verify toSorted [5,4,3,2,1] returns [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 4, 3, 2, 1]);
      const sorted = arr.toSorted();
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(2);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
      expect(sorted[3]).assertEqual(4);
      expect(sorted[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_6800
     * @tc.name testUint8ClampedArrayToSorted068
     * @tc.desc Verify toSorted [3,1,2] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      arr[0] = 99;
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_6900
     * @tc.name testUint8ClampedArrayToSorted069
     * @tc.desc Verify toSorted [3,1,2] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const s2 = arr.toSorted().toSorted();
      expect(s2.length).assertEqual(3);
      expect(s2[0]).assertEqual(1);
      expect(s2[1]).assertEqual(2);
      expect(s2[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_7000
     * @tc.name testUint8ClampedArrayToSorted070
     * @tc.desc Verify toSorted [5,3,1,4,2] returns [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 3, 1, 4, 2]);
      const s1 = arr.toSorted();
      const s2 = arr.toSorted().toSorted();
      expect(s1.length).assertEqual(5);
      expect(s1[4]).assertEqual(5);
      expect(s2[4]).assertEqual(5);
      expect(s1[0]).assertEqual(1);
      expect(s1[1]).assertEqual(2);
      expect(s1[2]).assertEqual(3);
      expect(s1[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_7100
     * @tc.name testUint8ClampedArrayToSorted071
     * @tc.desc Verify chain toSorted not ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const s1 = arr.toSorted();
      const s2 = arr.toSorted();
      expect(s1).not().assertEqual(s2);
      expect(s1[0]).assertEqual(1);
      expect(s1[1]).assertEqual(2);
      expect(s1[2]).assertEqual(3);
      expect(s2[0]).assertEqual(1);
      expect(s2[1]).assertEqual(2);
      expect(s2[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_7200
     * @tc.name testUint8ClampedArrayToSorted072
     * @tc.desc Verify toSorted [5,3,1,4,2] returns [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 3, 1, 4, 2]);
      const sorted = arr.toSorted();
      const b = arr.sort();
      expect(sorted.length).assertEqual(5);
      expect(sorted[0]).assertEqual(1);
      expect(b[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
      expect(sorted[3]).assertEqual(4);
      expect(sorted[4]).assertEqual(5);
      expect(b[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_7300
     * @tc.name testUint8ClampedArrayToSorted073
     * @tc.desc Verify toSorted [5,3,1,4,2] returns [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 3, 1, 4, 2]);
      const sorted = arr.toSorted();
      expect(arr.length).assertEqual(5);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(2);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
      expect(sorted[3]).assertEqual(4);
      expect(sorted[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_7400
     * @tc.name testUint8ClampedArrayToSorted074
     * @tc.desc Verify toSorted sum 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      let sum: number = 0;
      for (const v of sorted) {
        sum += v;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_7500
     * @tc.name testUint8ClampedArrayToSorted075
     * @tc.desc Verify toSorted join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_7600
     * @tc.name testUint8ClampedArrayToSorted076
     * @tc.desc Verify indexOf on [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(arr.length).assertEqual(3);
      expect(sorted.indexOf(2)).assertEqual(1);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(sorted[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_7700
     * @tc.name testUint8ClampedArrayToSorted077
     * @tc.desc Verify toSorted includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSORTED_7800
     * @tc.name testUint8ClampedArrayToSorted078
     * @tc.desc Verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToSorted078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [...new Uint8ClampedArray(500)].map((v, i) => (i * 13.0) % 256.0);
      const arr = new Uint8ClampedArray(src);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(500);
      expect(sorted[0]).assertLessOrEqual(sorted[250]);
      expect(sorted[250]).assertLessOrEqual(sorted[499]);
    });
  });
}
