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

export default function uint8ClampedArrayToReversedTest(): void {
  describe('Uint8ClampedArrayToReversedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_0100
     * @tc.name testUint8ClampedArrayToReversed001
     * @tc.desc Verify toReversed [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_0200
     * @tc.name testUint8ClampedArrayToReversed002
     * @tc.desc Verify toReversed on empty Uint8ClampedArray returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.toReversed();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_0300
     * @tc.name testUint8ClampedArrayToReversed003
     * @tc.desc Verify toReversed [42] returns [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_0400
     * @tc.name testUint8ClampedArrayToReversed004
     * @tc.desc Verify toReversed [1,2,3,4,5,6,7,8,9,10] returns [10,9,8,7,6,5,4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(10);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(9);
      expect(r[2]).assertEqual(8);
      expect(r[3]).assertEqual(7);
      expect(r[4]).assertEqual(6);
      expect(r[5]).assertEqual(5);
      expect(r[6]).assertEqual(4);
      expect(r[7]).assertEqual(3);
      expect(r[8]).assertEqual(2);
      expect(r[9]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_0500
     * @tc.name testUint8ClampedArrayToReversed005
     * @tc.desc Verify =255 toReversed 254
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(255);
      for (let i = 0; i < 255; i++) { arr[i] = i; }
      const r = arr.toReversed();
      expect(r.length).assertEqual(255);
      expect(r[0]).assertEqual(254);
      expect(r[127]).assertEqual(127);
      expect(r[254]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_0600
     * @tc.name testUint8ClampedArrayToReversed006
     * @tc.desc Verify =1024 toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      for (let i = 0; i < 1024; i++) { arr[i] = i & 0xFF; }
      const r = arr.toReversed();
      expect(r.length).assertEqual(1024);
      expect(r[0]).assertEqual(arr[1023]);
      expect(r[512]).assertEqual(arr[511]);
      expect(r[1023]).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_0700
     * @tc.name testUint8ClampedArrayToReversed007
     * @tc.desc Verify toReversed [0,0,0,0] returns [0,0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(0);
      expect(r[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_0800
     * @tc.name testUint8ClampedArrayToReversed008
     * @tc.desc Verify toReversed [256,1,2] with 256 clamped to 255 returns [2,1,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_0900
     * @tc.name testUint8ClampedArrayToReversed009
     * @tc.desc Verify toReversed [-1,1,2] with -1 clamped to 0 returns [2,1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(0);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_1000
     * @tc.name testUint8ClampedArrayToReversed010
     * @tc.desc Verify 127.5 half-even clamp 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_1100
     * @tc.name testUint8ClampedArrayToReversed011
     * @tc.desc Verify 128.5 half-even clamp 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_1200
     * @tc.name testUint8ClampedArrayToReversed012
     * @tc.desc Verify NaN clamp 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_1300
     * @tc.name testUint8ClampedArrayToReversed013
     * @tc.desc Verify toReversed clamps Infinity to 255 at last position after reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_1400
     * @tc.name testUint8ClampedArrayToReversed014
     * @tc.desc Verify toReversed clamps negative Infinity to 0 at last position after reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_1500
     * @tc.name testUint8ClampedArrayToReversed015
     * @tc.desc Verify 0.9 round 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.9, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_1600
     * @tc.name testUint8ClampedArrayToReversed016
     * @tc.desc Verify 0.4 round 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.4, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_1700
     * @tc.name testUint8ClampedArrayToReversed017
     * @tc.desc Verify 0.5 half-even round 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_1800
     * @tc.name testUint8ClampedArrayToReversed018
     * @tc.desc Verify toReversed [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_1900
     * @tc.name testUint8ClampedArrayToReversed019
     * @tc.desc Verify toReversed returns a new array distinct from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed();
      expect(r).not().assertEqual(arr);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_2000
     * @tc.name testUint8ClampedArrayToReversed020
     * @tc.desc Verify toReversed called twice returns two distinct arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r1 = arr.toReversed();
      const r2 = arr.toReversed();
      expect(r1).not().assertEqual(r2);
      expect(r1[0]).assertEqual(3);
      expect(r1[1]).assertEqual(2);
      expect(r1[2]).assertEqual(1);
      expect(r2[0]).assertEqual(3);
      expect(r2[1]).assertEqual(2);
      expect(r2[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_2100
     * @tc.name testUint8ClampedArrayToReversed021
     * @tc.desc Verify toReversed [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed();
      r[0] = 99;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(r[0]).assertEqual(99);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_2200
     * @tc.name testUint8ClampedArrayToReversed022
     * @tc.desc Verify toReversed [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed();
      arr[0] = 200;
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(1);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_2300
     * @tc.name testUint8ClampedArrayToReversed023
     * @tc.desc Verify toReversed result buffer is distinct from source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.toReversed();
      expect(r.buffer).not().assertEqual(arr.buffer);
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_2400
     * @tc.name testUint8ClampedArrayToReversed024
     * @tc.desc Verify toReversed [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed();
      r[0] = 99;
      const view = new Uint8ClampedArray(arr.buffer);
      expect(view.length).assertEqual(3);
      expect(view[0]).assertEqual(1);
      expect(view[1]).assertEqual(2);
      expect(view[2]).assertEqual(3);
      expect(r[0]).assertEqual(99);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_2500
     * @tc.name testUint8ClampedArrayToReversed025
     * @tc.desc Verify toReversed buffer independence result.buffer != arr.buffer [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4;
      const r = arr.toReversed();
      expect(r.buffer).not().assertEqual(buf);
      expect(r[0]).assertEqual(4);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(2);
      expect(r[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_2600
     * @tc.name testUint8ClampedArrayToReversed026
     * @tc.desc Verify toReversed buffer independence result.buffer != arr.buffer [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 40;
      const r = arr.toReversed();
      expect(r.buffer).not().assertEqual(buf);
      expect(r[0]).assertEqual(40);
      expect(r[1]).assertEqual(30);
      expect(r[2]).assertEqual(20);
      expect(r[3]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_2700
     * @tc.name testUint8ClampedArrayToReversed027
     * @tc.desc Verify toReversed [1,2,3,4] returns [4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.toReversed().toReversed();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_2800
     * @tc.name testUint8ClampedArrayToReversed028
     * @tc.desc Verify toReversed [5,10,15,20] returns [20,15,10,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      const r = arr.toReversed().toReversed().toReversed();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(15);
      expect(r[2]).assertEqual(10);
      expect(r[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_2900
     * @tc.name testUint8ClampedArrayToReversed029
     * @tc.desc Verify Uint8ClampedArray.of toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(30);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_3000
     * @tc.name testUint8ClampedArrayToReversed030
     * @tc.desc Verify toReversed on zero-filled array by length returns 0 at first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      const r = arr.toReversed();
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(0);
      expect(r[3]).assertEqual(0);
      expect(r[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_3100
     * @tc.name testUint8ClampedArrayToReversed031
     * @tc.desc Verify ArrayBuffer toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 1; arr[1] = 2; arr[2] = 3;
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_3200
     * @tc.name testUint8ClampedArrayToReversed032
     * @tc.desc Verify ArrayBuffer byteOffset toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 40;
      const r = arr.toReversed();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(40);
      expect(r[1]).assertEqual(30);
      expect(r[2]).assertEqual(20);
      expect(r[3]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_3300
     * @tc.name testUint8ClampedArrayToReversed033
     * @tc.desc Verify toReversed result byteOffset is 0 when source uses byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const r = arr.toReversed();
      expect(r.byteOffset).assertEqual(0);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(0);
      expect(r[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_3400
     * @tc.name testUint8ClampedArrayToReversed034
     * @tc.desc Verify toReversed [7,8,9] returns [9,8,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([7, 8, 9]);
      const arr = new Uint8ClampedArray(src);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(9);
      expect(r[1]).assertEqual(8);
      expect(r[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_3500
     * @tc.name testUint8ClampedArrayToReversed035
     * @tc.desc Verify fill toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      arr.fill(7);
      const r = arr.toReversed();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(7);
      expect(r[1]).assertEqual(7);
      expect(r[2]).assertEqual(7);
      expect(r[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_3600
     * @tc.name testUint8ClampedArrayToReversed036
     * @tc.desc Verify toReversed [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr[0] = 99;
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_3700
     * @tc.name testUint8ClampedArrayToReversed037
     * @tc.desc Verify subarray [1,2,3,4,5] subarray(1,4)=[2,3,4] toReversed returns [4,3,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      const r = sub.toReversed();
      expect(arr.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
      expect(r[0]).assertEqual(4);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_3800
     * @tc.name testUint8ClampedArrayToReversed038
     * @tc.desc Verify toReversed on subarray returns distinct buffer, subarray(1,4)=[2,3,4] toReversed returns [4,3,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      const r = sub.toReversed();
      expect(arr.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
      expect(r[0]).assertEqual(4);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_3900
     * @tc.name testUint8ClampedArrayToReversed039
     * @tc.desc Verify slice [1,2,3,4,5] slice(0,3)=[1,2,3] toReversed returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sl = arr.slice(0, 3);
      const r = sl.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_4000
     * @tc.name testUint8ClampedArrayToReversed040
     * @tc.desc Verify toReversed [1,2] returns [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_4100
     * @tc.name testUint8ClampedArrayToReversed041
     * @tc.desc Verify len 255 toReversed length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(255);
      for (let i = 0; i < 255; i++) { arr[i] = i; }
      const r = arr.toReversed();
      expect(r.length).assertEqual(255);
      expect(r[0]).assertEqual(254);
      expect(r[127]).assertEqual(127);
      expect(r[254]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_4200
     * @tc.name testUint8ClampedArrayToReversed042
     * @tc.desc Verify len 256 toReversed length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      const r = arr.toReversed();
      expect(r.length).assertEqual(256);
      expect(r[0]).assertEqual(0);
      expect(r[128]).assertEqual(0);
      expect(r[255]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_4300
     * @tc.name testUint8ClampedArrayToReversed043
     * @tc.desc Verify len 1024 toReversed length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      const r = arr.toReversed();
      expect(r.length).assertEqual(1024);
      expect(r[0]).assertEqual(0);
      expect(r[512]).assertEqual(0);
      expect(r[1023]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_4400
     * @tc.name testUint8ClampedArrayToReversed044
     * @tc.desc Verify toReversed [255,255,255] returns [255,255,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(255);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_4500
     * @tc.name testUint8ClampedArrayToReversed045
     * @tc.desc Verify toReversed [255,1,2] returns [2,1,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(255);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_4600
     * @tc.name testUint8ClampedArrayToReversed046
     * @tc.desc Verify toReversed [127,1,2] returns [2,1,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(127);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_4700
     * @tc.name testUint8ClampedArrayToReversed047
     * @tc.desc Verify toReversed [128,1,2] returns [2,1,128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(128);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_4800
     * @tc.name testUint8ClampedArrayToReversed048
     * @tc.desc Verify 1e9 clamp toReversed 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e9, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_4900
     * @tc.name testUint8ClampedArrayToReversed049
     * @tc.desc Verify -1e9 clamp toReversed 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1e9, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_5000
     * @tc.name testUint8ClampedArrayToReversed050
     * @tc.desc Verify toReversed first element is last source element when source uses hex literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 0x00, 0x10]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0x10);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_5100
     * @tc.name testUint8ClampedArrayToReversed051
     * @tc.desc Verify 0o17 toReversed last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o17, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_5200
     * @tc.name testUint8ClampedArrayToReversed052
     * @tc.desc Verify 0b1010 toReversed last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b1010, 1, 2]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_5300
     * @tc.name testUint8ClampedArrayToReversed053
     * @tc.desc Verify toReversed byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.toReversed();
      expect(r.byteLength).assertEqual(arr.byteLength);
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(4);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(2);
      expect(r[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_5400
     * @tc.name testUint8ClampedArrayToReversed054
     * @tc.desc Verify toReversed BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed();
      expect(r.BYTES_PER_ELEMENT).assertEqual(1);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_5500
     * @tc.name testUint8ClampedArrayToReversed055
     * @tc.desc Verify empty toReversed source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      arr.toReversed();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_5600
     * @tc.name testUint8ClampedArrayToReversed056
     * @tc.desc Verify toReversed [99] returns [99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const r = arr.toReversed();
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(99);
      expect(r[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_5700
     * @tc.name testUint8ClampedArrayToReversed057
     * @tc.desc Verify empty toReversed not ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.toReversed();
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_5800
     * @tc.name testUint8ClampedArrayToReversed058
     * @tc.desc Verify single toReversed not ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.toReversed();
      expect(r).not().assertEqual(arr);
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_5900
     * @tc.name testUint8ClampedArrayToReversed059
     * @tc.desc Verify toReversed [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed();
      r[0] = 100;
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(r[0]).assertEqual(100);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_6000
     * @tc.name testUint8ClampedArrayToReversed060
     * @tc.desc Verify empty toReversed buffer not shared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.toReversed();
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_6100
     * @tc.name testUint8ClampedArrayToReversed061
     * @tc.desc Verify toReversed [10,20,30,40] returns [40,30,20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(arr[3]);
      expect(r[0]).assertEqual(40);
      expect(r[1]).assertEqual(arr[2]);
      expect(r[1]).assertEqual(30);
      expect(r[2]).assertEqual(arr[1]);
      expect(r[2]).assertEqual(20);
      expect(r[3]).assertEqual(arr[0]);
      expect(r[3]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_6200
     * @tc.name testUint8ClampedArrayToReversed062
     * @tc.desc Verify len 5 toReversed length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      const r = arr.toReversed();
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(0);
      expect(r[3]).assertEqual(0);
      expect(r[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_6300
     * @tc.name testUint8ClampedArrayToReversed063
     * @tc.desc Verify byteOffset toReversed length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const r = arr.toReversed();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(0);
      expect(r[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_6400
     * @tc.name testUint8ClampedArrayToReversed064
     * @tc.desc Verify fill toReversed last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      arr.fill(7);
      const r = arr.toReversed();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(7);
      expect(r[1]).assertEqual(7);
      expect(r[2]).assertEqual(7);
      expect(r[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_6500
     * @tc.name testUint8ClampedArrayToReversed065
     * @tc.desc Verify subarray [1,2,3,4,5] subarray(1,4)=[2,3,4] toReversed returns [4,3,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      const r = sub.toReversed();
      expect(arr.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
      expect(r[0]).assertEqual(4);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_6600
     * @tc.name testUint8ClampedArrayToReversed066
     * @tc.desc Verify toReversed slice length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.toReversed();
      r.slice(0, 2);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(4);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(2);
      expect(r[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_6700
     * @tc.name testUint8ClampedArrayToReversed067
     * @tc.desc Verify toReversed clamps Number.MAX_VALUE to 255 at last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.MAX_VALUE, 50]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(50);
      expect(r[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_6800
     * @tc.name testUint8ClampedArrayToReversed068
     * @tc.desc Verify toReversed clamps Number.MIN_VALUE to 0 at last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.MIN_VALUE, 50]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(50);
      expect(r[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_6900
     * @tc.name testUint8ClampedArrayToReversed069
     * @tc.desc Verify toReversed [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed();
      r[0] = 256;
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOREVERSED_7000
     * @tc.name testUint8ClampedArrayToReversed070
     * @tc.desc Verify toReversed [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToReversed070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed();
      r[0] = -1;
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });
  });
}
