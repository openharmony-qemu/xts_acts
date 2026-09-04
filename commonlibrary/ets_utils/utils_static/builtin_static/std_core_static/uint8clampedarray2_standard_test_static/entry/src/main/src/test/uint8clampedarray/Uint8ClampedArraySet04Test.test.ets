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

export default function uint8ClampedArraySetFourTest(): void {
  describe('Uint8ClampedArraySetFourTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_0100
     * @tc.name testUint8ClampedArraySetFour001
     * @tc.desc Verify set(0, -1000) clamps to 0 on [99,99,99]: result [0,99,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      arr.set(0, -1000);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_0200
     * @tc.name testUint8ClampedArraySetFour002
     * @tc.desc Verify set(0, 1e9) clamps to 255 on [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 1e9);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_0300
     * @tc.name testUint8ClampedArraySetFour003
     * @tc.desc Verify set(0, -1e9) clamps to 0 on [99,99,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      arr.set(0, -1e9);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_0400
     * @tc.name testUint8ClampedArraySetFour004
     * @tc.desc Verify set(0, 2147483648) clamps to 255 on [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 2147483648);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_0500
     * @tc.name testUint8ClampedArraySetFour005
     * @tc.desc Verify set(0, Number.MAX_VALUE) clamps to 255 on [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, Number.MAX_VALUE);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_0600
     * @tc.name testUint8ClampedArraySetFour006
     * @tc.desc Verify set(0, 0xFF) writes 255 on [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 0xFF);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_0700
     * @tc.name testUint8ClampedArraySetFour007
     * @tc.desc Verify set(0, 0o377) writes 255 on [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 0o377);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_0800
     * @tc.name testUint8ClampedArraySetFour008
     * @tc.desc Verify set(0, 0b11111111) writes 255 on [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 0b11111111);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_0900
     * @tc.name testUint8ClampedArraySetFour009
     * @tc.desc Verify set(0, 1e2) writes 100 on [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 1e2);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_1000
     * @tc.name testUint8ClampedArraySetFour010
     * @tc.desc Verify set(0, 257) clamps to 255 on [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.set(0, 257);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_1100
     * @tc.name testUint8ClampedArraySetFour011
     * @tc.desc Verify set(0, -2) clamps to 0 on [99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      arr.set(0, -2);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_1200
     * @tc.name testUint8ClampedArraySetFour012
     * @tc.desc Verify FixedArray [-100.0, 50.0] clamps to [0, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99]);
      const src: Array<number> = [-100.0, 50.0];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_1300
     * @tc.name testUint8ClampedArraySetFour013
     * @tc.desc Verify FixedArray [1e9, -1e9] clamps to [255, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 99]);
      const src: Array<number> = [1e9, -1e9];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_1400
     * @tc.name testUint8ClampedArraySetFour014
     * @tc.desc Verify FixedArray [0xFF, 0o377] both clamp to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [0xFF, 0o377];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_1500
     * @tc.name testUint8ClampedArraySetFour015
     * @tc.desc Verify FixedArray [Number.MAX_VALUE, Number.MIN_VALUE] clamps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 99]);
      const src: Array<number> = [Number.MAX_VALUE, Number.MIN_VALUE];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_1600
     * @tc.name testUint8ClampedArraySetFour016
     * @tc.desc Verify set(Uint8ClampedArray[99,88], 1) on [10,20,30,40] keeps length and writes [10,99,88,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const src = new Uint8ClampedArray([99, 88]);
      const before: int = arr.length;
      arr.set(src, 1);
      expect(arr.length).assertEqual(before);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(88);
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_1700
     * @tc.name testUint8ClampedArraySetFour017
     * @tc.desc Verify set(Uint8ClampedArray[99,88], 1) on [10,20,30,40] keeps byteLength and writes [10,99,88,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const src = new Uint8ClampedArray([99, 88]);
      const before: int = arr.byteLength;
      arr.set(src, 1);
      expect(arr.byteLength).assertEqual(before);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(88);
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_1800
     * @tc.name testUint8ClampedArraySetFour018
     * @tc.desc Verify set([99], 1) on [10,20,30] writes [10,99,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.set([99], 1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_1900
     * @tc.name testUint8ClampedArraySetFour019
     * @tc.desc Verify set(0, 99) on [1,2,3] returns undefined and writes [99,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.set(0, 99);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(99);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_2000
     * @tc.name testUint8ClampedArraySetFour020
     * @tc.desc Verify set(Array<number>[10,20], 0) on [1,2,3] returns undefined and writes [10,20,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const src: Array<number> = [10, 20];
      const r = arr.set(src, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(3);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_2100
     * @tc.name testUint8ClampedArraySetFour021
     * @tc.desc Verify set(Uint8ClampedArray[10], 0) on [1,2,3] returns undefined and writes [10,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const src = new Uint8ClampedArray([10]);
      const r = arr.set(src, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_2200
     * @tc.name testUint8ClampedArraySetFour022
     * @tc.desc Verify toString unchanged after empty set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8]);
      const before: string = arr.toString();
      const empty: Array<number> = [];
      arr.set(empty, 0);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_2300
     * @tc.name testUint8ClampedArraySetFour023
     * @tc.desc Verify set(0,1) then set([5,6],1) on [0,0,0] keeps length and writes [1,5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 1);
      arr.set([5, 6], 1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_2400
     * @tc.name testUint8ClampedArraySetFour024
     * @tc.desc Verify set(0,1) then set([5,6],1) on [0,0,0] keeps byteLength and writes [1,5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 1);
      arr.set([5, 6], 1);
      expect(arr.byteLength).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_2500
     * @tc.name testUint8ClampedArraySetFour025
     * @tc.desc Verify set(0,11) then set([22,33],0) on [0,0,0] overwrites to [22,33,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 11);
      arr.set([22, 33], 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(22);
      expect(arr[1]).assertEqual(33);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_2600
     * @tc.name testUint8ClampedArraySetFour026
     * @tc.desc Verify set([22,33],0) then set(0,99) on [0,0,0] overwrites to [99,33,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set([22, 33], 0);
      arr.set(0, 99);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(99);
      expect(arr[1]).assertEqual(33);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_2700
     * @tc.name testUint8ClampedArraySetFour027
     * @tc.desc Verify set(Array<number>[10,20,30], 0) on [0,0,0] writes [10,20,30] and source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [10, 20, 30];
      arr.set(src, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(src[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_2800
     * @tc.name testUint8ClampedArraySetFour028
     * @tc.desc Verify set(Uint8ClampedArray[100,200], 0) on [0,0,0] writes [100,200,0] and source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([100, 200]);
      arr.set(src, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(0);
      expect(src[0]).assertEqual(100);
      expect(src[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_2900
     * @tc.name testUint8ClampedArraySetFour029
     * @tc.desc Verify self-copy head to tail r[3]=20 on [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const parent = new Uint8ClampedArray(buf);
      parent[0] = 10;
      parent[1] = 20;
      parent[2] = 30;
      parent[3] = 40;
      const head = new Uint8ClampedArray(buf, 0, 2);
      parent.set(head, 2);
      expect(parent.length).assertEqual(4);
      expect(parent[0]).assertEqual(10);
      expect(parent[1]).assertEqual(20);
      expect(parent[2]).assertEqual(10);
      expect(parent[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_3000
     * @tc.name testUint8ClampedArraySetFour030
     * @tc.desc Verify FixedArray [NaN, NaN, NaN] all clamp to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9, 9]);
      const src: Array<number> = [Number.NaN, Number.NaN, Number.NaN];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_3100
     * @tc.name testUint8ClampedArraySetFour031
     * @tc.desc Verify FixedArray [Infinity, -Infinity] clamp [255, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 99]);
      const src: Array<number> = [Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_3200
     * @tc.name testUint8ClampedArraySetFour032
     * @tc.desc Verify FixedArray [257.0, 300.0, 9999.0] all clamp to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [257.0, 300.0, 9999.0];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_3300
     * @tc.name testUint8ClampedArraySetFour033
     * @tc.desc Verify FixedArray [-1.0, -100.0, -9999.0] all clamp to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9, 9]);
      const src: Array<number> = [-1.0, -100.0, -9999.0];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_3400
     * @tc.name testUint8ClampedArraySetFour034
     * @tc.desc Verify set with offset 0x7FFFFFFF throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [1];
      try {
        arr.set(src, 0x7FFFFFFF);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_3500
     * @tc.name testUint8ClampedArraySetFour035
     * @tc.desc Verify set with offset -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [1];
      try {
        arr.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_3600
     * @tc.name testUint8ClampedArraySetFour036
     * @tc.desc Verify set with offset -100 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [1, 2];
      try {
        arr.set(src, -100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_3700
     * @tc.name testUint8ClampedArraySetFour037
     * @tc.desc Verify set with offset length+1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [5];
      try {
        arr.set(src, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_3800
     * @tc.name testUint8ClampedArraySetFour038
     * @tc.desc Verify set(Uint8ClampedArray[99,88]) default offset equals offset 0 at index 0: result [99,88,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray([0, 0, 0]);
      const a2 = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([99, 88]);
      a1.set(src);
      a2.set(src, 0);
      expect(a1.length).assertEqual(3);
      expect(a2.length).assertEqual(3);
      expect(a1[0]).assertEqual(a2[0]);
      expect(a1[1]).assertEqual(88);
      expect(a2[1]).assertEqual(88);
      expect(a1[2]).assertEqual(0);
      expect(a2[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_3900
     * @tc.name testUint8ClampedArraySetFour039
     * @tc.desc Verify set(Uint8ClampedArray[99,88]) default offset equals offset 0 at index 1: result [99,88,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray([0, 0, 0]);
      const a2 = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([99, 88]);
      a1.set(src);
      a2.set(src, 0);
      expect(a1.length).assertEqual(3);
      expect(a2.length).assertEqual(3);
      expect(a1[1]).assertEqual(a2[1]);
      expect(a1[0]).assertEqual(99);
      expect(a2[0]).assertEqual(99);
      expect(a1[2]).assertEqual(0);
      expect(a2[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_4000
     * @tc.name testUint8ClampedArraySetFour040
     * @tc.desc Verify FixedArray [0x1FF] clamps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [0x1FF];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_4100
     * @tc.name testUint8ClampedArraySetFour041
     * @tc.desc Verify FixedArray [-1e10] clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9]);
      const src: Array<number> = [-1e10];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_4200
     * @tc.name testUint8ClampedArraySetFour042
     * @tc.desc Verify FixedArray [0x100] clamps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [0x100];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_4300
     * @tc.name testUint8ClampedArraySetFour043
     * @tc.desc Verify set(Array<number>[10,20], 0) on [1,2,3] keeps byteLength and writes [10,20,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const before: int = arr.byteLength;
      const src: Array<number> = [10, 20];
      arr.set(src, 0);
      expect(arr.byteLength).assertEqual(before);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_4400
     * @tc.name testUint8ClampedArraySetFour044
     * @tc.desc Verify set(Array<number>[10,20], 0) on [1,2,3] keeps length and writes [10,20,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const before: int = arr.length;
      const src: Array<number> = [10, 20];
      arr.set(src, 0);
      expect(arr.length).assertEqual(before);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_4500
     * @tc.name testUint8ClampedArraySetFour045
     * @tc.desc Verify set source length 6 on len2 target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [1, 2, 3, 4, 5, 6];
      try {
        arr.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_FOUR_4600
     * @tc.name testUint8ClampedArraySetFour046
     * @tc.desc Verify set empty target non-empty source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const src: Array<number> = [1];
      try {
        arr.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
