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

export default function uint8ClampedArrayReduceTwoTest(): void {
  describe('Uint8ClampedArrayReduceTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_0100
     * @tc.name testUint8ClampedArrayReduceTwo001
     * @tc.desc Verify reduce on [1,2,3] does not mutate array length or elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_0200
     * @tc.name testUint8ClampedArrayReduceTwo002
     * @tc.desc Verify reduce [0.5] clamps to 0 then sum initialValue=0 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_0300
     * @tc.name testUint8ClampedArrayReduceTwo003
     * @tc.desc Verify reduce [0.9] clamps to 1 then sum initialValue=0 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.9]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_0400
     * @tc.name testUint8ClampedArrayReduceTwo004
     * @tc.desc Verify reduce [1.5] clamps to 2 then sum initialValue=0 returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1.5]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_0500
     * @tc.name testUint8ClampedArrayReduceTwo005
     * @tc.desc Verify reduce on single-element [42] without initialValue returns 42 and callback not called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: int = 0;
      const arr = new Uint8ClampedArray([42]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => { called = called + 1; return p + c; });
      expect(r).assertEqual(42);
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_0600
     * @tc.name testUint8ClampedArrayReduceTwo006
     * @tc.desc Verify reduce on [10,20] without initialValue returns 30 and callback called once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: int = 0;
      const arr = new Uint8ClampedArray([10, 20]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => { called = called + 1; return p + c; });
      expect(r).assertEqual(30);
      expect(called).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_0700
     * @tc.name testUint8ClampedArrayReduceTwo007
     * @tc.desc Verify reduce sum [1,2,3,4,5] without initialValue returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_0800
     * @tc.name testUint8ClampedArrayReduceTwo008
     * @tc.desc Verify reduce max [10,200,50,255,30] without initialValue returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 200, 50, 255, 30]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p > c ? p : c);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_0900
     * @tc.name testUint8ClampedArrayReduceTwo009
     * @tc.desc Verify reduce min [10,5,200,1,30] without initialValue returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 5, 200, 1, 30]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p < c ? p : c);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_1000
     * @tc.name testUint8ClampedArrayReduceTwo010
     * @tc.desc Verify reduce [1,2,3,4] callback always returns 99 returns 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => 99);
      expect(r).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_1100
     * @tc.name testUint8ClampedArrayReduceTwo011
     * @tc.desc Verify reduce on [7,1,2,3] returning previousValue yields 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 1, 2, 3]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_1200
     * @tc.name testUint8ClampedArrayReduceTwo012
     * @tc.desc Verify reduce on [7,1,2,3] returning currentValue yields 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 1, 2, 3]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => c);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_1300
     * @tc.name testUint8ClampedArrayReduceTwo013
     * @tc.desc Verify reduce on [10,20,30,40] returning index yields 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => i );
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_1400
     * @tc.name testUint8ClampedArrayReduceTwo014
     * @tc.desc Verify reduce callback fourth argument is same reference as source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let sameRef: boolean = false;
      arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        if (a === arr) { sameRef = true; }
        return p + c;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_1500
     * @tc.name testUint8ClampedArrayReduceTwo015
     * @tc.desc Verify reduce callback receives array.length 4 for [5,10,15,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      let seenLen: int = -1;
      arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        seenLen = a.length;
        return p + c;
      });
      expect(seenLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_1600
     * @tc.name testUint8ClampedArrayReduceTwo016
     * @tc.desc Verify reduce on [1,2,3,4,5] callback receives indices [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const idxs: int[] = [];
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        idxs.push(i);
        return p + c;
      });
      expect(idxs.length).assertEqual(4);
      expect(idxs[0]).assertEqual(1);
      expect(idxs[3]).assertEqual(4);
      expect(idxs[1]).assertEqual(2);
      expect(idxs[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_1700
     * @tc.name testUint8ClampedArrayReduceTwo017
     * @tc.desc Verify reduce on [1,2,3,4] callback previousValues are [1,4,11]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const seenPrev: number[] = [];
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        seenPrev.push(p);
        return p * 2 + c;
      });
      expect(seenPrev[0]).assertEqual(1);
      expect(seenPrev[1]).assertEqual(4);
      expect(seenPrev[2]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_1800
     * @tc.name testUint8ClampedArrayReduceTwo018
     * @tc.desc Verify reduce multiply [2,3,4] returns 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 3, 4]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p * c);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_1900
     * @tc.name testUint8ClampedArrayReduceTwo019
     * @tc.desc Verify reduce subtract [100,10,20,30] returns 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 10, 20, 30]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p - c);
      expect(r).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_2000
     * @tc.name testUint8ClampedArrayReduceTwo020
     * @tc.desc Verify reduce [1,2,3] with captured variable factor=2 returns 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const factor: number = 2;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c * factor);
      expect(r).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_2100
     * @tc.name testUint8ClampedArrayReduceTwo021
     * @tc.desc Verify reduce [1,2,3,4] callback side-effect sums c values total 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let side: number = 0;
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        side = side + c;
        return p + c;
      });
      expect(side).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_2200
     * @tc.name testUint8ClampedArrayReduceTwo022
     * @tc.desc Verify reduce [10,20] with nested reduce subSum=6 in callback returns 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sub = new Uint8ClampedArray([1, 2, 3]);
      const subSum: number = sub.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      const arr = new Uint8ClampedArray([10, 20]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c + subSum);
      expect(r).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_2300
     * @tc.name testUint8ClampedArrayReduceTwo023
     * @tc.desc Verify reduce sum [0,128,255] without initialValue returns 383
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 128, 255]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_2400
     * @tc.name testUint8ClampedArrayReduceTwo024
     * @tc.desc Verify reduce sum [0..255] without initialValue returns 32640
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: number[] = [];
      for (let k: number = 0; k < 256; k = k + 1) { buf.push(k); }
      const arr = new Uint8ClampedArray(buf);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(32640);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_2500
     * @tc.name testUint8ClampedArrayReduceTwo025
     * @tc.desc Verify reduce sum 1024 elements of value 1 without initialValue returns 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: number[] = [];
      for (let k: number = 0; k < 1024; k = k + 1) { buf.push(1); }
      const arr = new Uint8ClampedArray(buf);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_2600
     * @tc.name testUint8ClampedArrayReduceTwo026
     * @tc.desc Verify reduce callback receives clamped value 255 for element stored as 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 256; arr[1] = 256; arr[2] = 256;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(765);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_2700
     * @tc.name testUint8ClampedArrayReduceTwo027
     * @tc.desc Verify reduce callback receives clamped value 0 for element stored as -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      arr[0] = -1; arr[1] = -100; arr[2] = -1e9; arr[3] = 5;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_2800
     * @tc.name testUint8ClampedArrayReduceTwo028
     * @tc.desc Verify reduce [NaN,10,NaN] clamps NaN to 0 then sum without initialValue returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = Number.NaN; arr[1] = 10; arr[2] = Number.NaN;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_2900
     * @tc.name testUint8ClampedArrayReduceTwo029
     * @tc.desc Verify reduce [Infinity,Infinity] clamps to 255 each then sum without initialValue returns 510
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = Number.POSITIVE_INFINITY; arr[1] = Number.POSITIVE_INFINITY;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(510);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_3000
     * @tc.name testUint8ClampedArrayReduceTwo030
     * @tc.desc Verify reduce [-Infinity,-Infinity,42] clamps -Infinity to 0 then sum without initialValue returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = -Number.POSITIVE_INFINITY; arr[1] = -Number.POSITIVE_INFINITY; arr[2] = 42;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_3100
     * @tc.name testUint8ClampedArrayReduceTwo031
     * @tc.desc Verify reduce [0.5,0.5] clamps to 0 each then sum without initialValue returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 0.5; arr[1] = 0.5;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_3200
     * @tc.name testUint8ClampedArrayReduceTwo032
     * @tc.desc Verify reduce [127.5,127.5] clamps to 128 each then sum without initialValue returns 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 127.5; arr[1] = 127.5;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_3300
     * @tc.name testUint8ClampedArrayReduceTwo033
     * @tc.desc Verify reduce sum hex literals [0xFF,0x10,0x01] returns 272
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 0x10, 0x01]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(272);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_3400
     * @tc.name testUint8ClampedArrayReduceTwo034
     * @tc.desc Verify reduce sum binary literals [0b1111,0b1010,0b0001] returns 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b1111, 0b1010, 0b0001]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(26);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_3500
     * @tc.name testUint8ClampedArrayReduceTwo035
     * @tc.desc Verify reduce sum octal literals [0o17,0o20,0o7] returns 38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o17, 0o20, 0o7]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_3600
     * @tc.name testUint8ClampedArrayReduceTwo036
     * @tc.desc Verify reduce sum scientific notation [1e2,1e1,1e0] returns 111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e2, 1e1, 1e0]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_3700
     * @tc.name testUint8ClampedArrayReduceTwo037
     * @tc.desc Verify reduce sum [10,20,30,40] on ArrayBuffer-backed array returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 40;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_3800
     * @tc.name testUint8ClampedArrayReduceTwo038
     * @tc.desc Verify reduce sum [3,4,5] on offset subarray returns 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const full = new Uint8ClampedArray(buf);
      full[0] = 1; full[1] = 2; full[2] = 3; full[3] = 4; full[4] = 5; full[5] = 6;
      const sub = new Uint8ClampedArray(buf, 2, 3);
      const r: number = sub.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_3900
     * @tc.name testUint8ClampedArrayReduceTwo039
     * @tc.desc Verify reduce sum Uint8ClampedArray.from([10,20,30]) returns 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const arr = Uint8ClampedArray.from(src);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_4000
     * @tc.name testUint8ClampedArrayReduceTwo040
     * @tc.desc Verify reduce sum Uint8ClampedArray.of(5,15,25,35) returns 80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(5, 15, 25, 35);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_4100
     * @tc.name testUint8ClampedArrayReduceTwo041
     * @tc.desc Verify reduce on [10,20,30,40,50] without initialValue, callback receives currentValues [20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: number[] = [20, 30, 40, 50];
      const seen: number[] = [];
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        seen.push(c);
        return p + c;
      });
      expect(seen.length).assertEqual(expected.length);
      for (let k: int = 0; k < expected.length; k = k + 1) {
        expect(seen[k]).assertEqual(expected[k]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_4200
     * @tc.name testUint8ClampedArrayReduceTwo042
     * @tc.desc Verify reduce on [66,77,88] without initialValue, first callback previousValue=66 currentValue=77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstP: number = -1;
      let firstC: number = -1;
      const arr = new Uint8ClampedArray([66, 77, 88]);
      arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        if (firstP === -1) { firstP = p; firstC = c; }
        return p + c;
      });
      expect(firstP).assertEqual(66);
      expect(firstC).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_4300
     * @tc.name testUint8ClampedArrayReduceTwo043
     * @tc.desc Verify reduce on [2,3,4] with callback p+c+0.5 returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 3, 4]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c + 0.5);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_4400
     * @tc.name testUint8ClampedArrayReduceTwo044
     * @tc.desc Verify reduce subtract [10,50,60] without initialValue returns -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 50, 60]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p - c);
      expect(r).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_4500
     * @tc.name testUint8ClampedArrayReduceTwo045
     * @tc.desc Verify reduce on [1,2,3] callback always returns 0 yields 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_4600
     * @tc.name testUint8ClampedArrayReduceTwo046
     * @tc.desc Verify reduce sum single element [0] without initialValue returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_4700
     * @tc.name testUint8ClampedArrayReduceTwo047
     * @tc.desc Verify reduce sum single element [255] without initialValue returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_4800
     * @tc.name testUint8ClampedArrayReduceTwo048
     * @tc.desc Verify reduce on single element [1e9] clamped to 255 returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 1e9;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_4900
     * @tc.name testUint8ClampedArrayReduceTwo049
     * @tc.desc Verify reduce on single element [-50] clamped to 0 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = -50;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_5000
     * @tc.name testUint8ClampedArrayReduceTwo050
     * @tc.desc Verify reduce single element [NaN] clamps to 0 then sum without initialValue returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = Number.NaN;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_5100
     * @tc.name testUint8ClampedArrayReduceTwo051
     * @tc.desc Verify reduce on [1,2,3] without initialValue, callback returns NaN each time, result isNaN true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => Number.NaN);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_5200
     * @tc.name testUint8ClampedArrayReduceTwo052
     * @tc.desc Verify reduce on [1,2,3] callback returns Infinity yields Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => Number.POSITIVE_INFINITY);
      expect(r).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_5300
     * @tc.name testUint8ClampedArrayReduceTwo053
     * @tc.desc Verify reduce on [1,2,3] callback returns -Infinity yields -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => -Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_5400
     * @tc.name testUint8ClampedArrayReduceTwo054
     * @tc.desc Verify reduce on ArrayBuffer-backed array does not change buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 40;
      arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_5500
     * @tc.name testUint8ClampedArrayReduceTwo055
     * @tc.desc Verify reduce on empty Uint8ClampedArray(0) without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      try {
        arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_5600
     * @tc.name testUint8ClampedArrayReduceTwo056
     * @tc.desc Verify reduce on empty ArrayBuffer without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Uint8ClampedArray(buf);
      try {
        arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_5700
     * @tc.name testUint8ClampedArrayReduceTwo057
     * @tc.desc Verify from([]) reduce init TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const arr = Uint8ClampedArray.from(src);
      try {
        arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_5800
     * @tc.name testUint8ClampedArrayReduceTwo058
     * @tc.desc Verify subarray reduce init TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const empty = parent.subarray(2, 2);
      try {
        empty.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(empty.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_5900
     * @tc.name testUint8ClampedArrayReduceTwo059
     * @tc.desc Verify reduce on zero-length ArrayBuffer view without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 0, 0);
      try {
        arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_6000
     * @tc.name testUint8ClampedArrayReduceTwo060
     * @tc.desc Verify reduce on [1,2,3] without initialValue, callback throws Error propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_6100
     * @tc.name testUint8ClampedArrayReduceTwo061
     * @tc.desc Verify reduce on [1,2] without initialValue, callback throws TypeError propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      try {
        arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
          throw new TypeError('type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_6200
     * @tc.name testUint8ClampedArrayReduceTwo062
     * @tc.desc Verify reduce on [1,2] without initialValue, callback throws RangeError propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      try {
        arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_6300
     * @tc.name testUint8ClampedArrayReduceTwo063
     * @tc.desc Verify reduce on [1,2,3,4,5] without initialValue, callback throws Error at index 2, count=2 before throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: int = 0;
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      try {
        arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
          cnt = cnt + 1;
          if (i === 2) { throw new Error('stop'); }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_6400
     * @tc.name testUint8ClampedArrayReduceTwo064
     * @tc.desc Verify reduce on [256,256] without initialValue, last currentValue clamped to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 256; arr[1] = 256;
      let seenC: number = -1;
      arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        seenC = c;
        return p + c;
      });
      expect(seenC).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_6500
     * @tc.name testUint8ClampedArrayReduceTwo065
     * @tc.desc Verify reduce on [-1,-1] without initialValue, first previousValue clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = -1; arr[1] = -1;
      let seenP: number = -999;
      arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        seenP = p;
        return p + c;
      });
      expect(seenP).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_6600
     * @tc.name testUint8ClampedArrayReduceTwo066
     * @tc.desc Verify reduce [10,NaN,20] clamps NaN to 0 then sum without initialValue returns 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 10; arr[1] = Number.NaN; arr[2] = 20;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_6700
     * @tc.name testUint8ClampedArrayReduceTwo067
     * @tc.desc Verify reduce [0.4,0.4,0.4] clamps to 0 each then sum without initialValue returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 0.4; arr[1] = 0.4; arr[2] = 0.4;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_6800
     * @tc.name testUint8ClampedArrayReduceTwo068
     * @tc.desc Verify reduce [0.9,0.9,0.9] clamps to 1 each then sum without initialValue returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 0.9; arr[1] = 0.9; arr[2] = 0.9;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_6900
     * @tc.name testUint8ClampedArrayReduceTwo069
     * @tc.desc Verify reduce [128.5,128.5] clamps to 128 each then sum without initialValue returns 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 128.5; arr[1] = 128.5;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_7000
     * @tc.name testUint8ClampedArrayReduceTwo070
     * @tc.desc Verify reduce [MAX_VALUE,MAX_VALUE] clamps to 255 each then sum without initialValue returns 510
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = Number.MAX_VALUE; arr[1] = Number.MAX_VALUE;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(510);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_7100
     * @tc.name testUint8ClampedArrayReduceTwo071
     * @tc.desc Verify reduce [MIN_VALUE,MIN_VALUE] clamps to 0 each then sum without initialValue returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = Number.MIN_VALUE; arr[1] = Number.MIN_VALUE;
      const r: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_7200
     * @tc.name testUint8ClampedArrayReduceTwo072
     * @tc.desc Verify reduce on [1,2,3,4] without initialValue does not change source array length, remains 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_7300
     * @tc.name testUint8ClampedArrayReduceTwo073
     * @tc.desc Verify reduce on [10,20,30] without initialValue does not mutate source elements, remains [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_7400
     * @tc.name testUint8ClampedArrayReduceTwo074
     * @tc.desc Verify reduce sum on [1,2,3,4] without initialValue returns 10 consistently on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r1: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      const r2: number = arr.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r1).assertEqual(10);
      expect(r2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_TWO_7500
     * @tc.name testUint8ClampedArrayReduceTwo075
     * @tc.desc Verify reduce empty subarray throw then parent usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      try {
        parent.subarray(0, 0).reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      const r: number = parent.reduce((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(6);
    });
  });
}
