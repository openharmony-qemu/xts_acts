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

export default function uint8ClampedArraySortOneTest(): void {
  describe('Uint8ClampedArraySortOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_0100
     * @tc.name testUint8ClampedArraySortOne001
     * @tc.desc Verify arity=1 compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort((a: number, b: number): int => Double.toInt(a - b));
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_0200
     * @tc.name testUint8ClampedArraySortOne002
     * @tc.desc Verify arity=1 compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 3, 2]);
      const r = arr.sort((a: number, b: number): int => Double.toInt(b - a));
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_0300
     * @tc.name testUint8ClampedArraySortOne003
     * @tc.desc Verify arity=1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort(undefined);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_0400
     * @tc.name testUint8ClampedArraySortOne004
     * @tc.desc Verify arity=1 sort(cmp)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let called: int = 0;
      const r = arr.sort((a: number, b: number): int => { called = called + 1; return 0; });
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_0500
     * @tc.name testUint8ClampedArraySortOne005
     * @tc.desc Verify arity=1 sort(cmp)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      let called: int = 0;
      arr.sort((a: number, b: number): int => { called = called + 1; return 0; });
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_0600
     * @tc.name testUint8ClampedArraySortOne006
     * @tc.desc Verify compareFn a number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      let observedA: number = -1;
      arr.sort((a: number, b: number): int => { observedA = a; return 0; });
      expect(observedA).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_0700
     * @tc.name testUint8ClampedArraySortOne007
     * @tc.desc Verify compareFn b number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      let observedB: number = -1;
      arr.sort((a: number, b: number): int => { observedB = b; return 0; });
      expect(observedB).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_0800
     * @tc.name testUint8ClampedArraySortOne008
     * @tc.desc Verify compareFn throws TypeError propagates with correct e.name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      try {
        arr.sort((a: number, b: number): int => { throw new TypeError('type'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_0900
     * @tc.name testUint8ClampedArraySortOne009
     * @tc.desc Verify compareFn throws RangeError propagates with correct e.name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      try {
        arr.sort((a: number, b: number): int => { throw new RangeError('range'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_1000
     * @tc.name testUint8ClampedArraySortOne010
     * @tc.desc Verify ArrayBuffer sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 5; arr[1] = 2; arr[2] = 9; arr[3] = 1;
      const r = arr.sort();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(5);
      expect(r[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_1100
     * @tc.name testUint8ClampedArraySortOne011
     * @tc.desc Verify ArrayBuffer offset/length sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      arr[0] = 8; arr[1] = 3; arr[2] = 5; arr[3] = 1;
      const r = arr.sort();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(5);
      expect(r[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_1200
     * @tc.name testUint8ClampedArraySortOne012
     * @tc.desc Verify Uint8ClampedArray.of sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(7, 2, 5);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(5);
      expect(r[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_1300
     * @tc.name testUint8ClampedArraySortOne013
     * @tc.desc Verify compareFn Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      try {
        arr.sort((a: number, b: number): int => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_1400
     * @tc.name testUint8ClampedArraySortOne014
     * @tc.desc Verify clamp NaN 0 sort 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN, 10, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(10);
      expect(r[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_1500
     * @tc.name testUint8ClampedArraySortOne015
     * @tc.desc Verify buffer sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      a[0] = 9; a[1] = 1; a[2] = 5; a[3] = 3;
      a.sort();
      expect(b[0]).assertEqual(1);
      expect(b[1]).assertEqual(3);
      expect(b[2]).assertEqual(5);
      expect(b[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_1600
     * @tc.name testUint8ClampedArraySortOne016
     * @tc.desc Verify from(buffer) sort Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 3; arr[1] = 1; arr[2] = 4; arr[3] = 2;
      const r = arr.sort();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_1700
     * @tc.name testUint8ClampedArraySortOne017
     * @tc.desc Verify Uint8ClampedArray.of sort Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(5, 3, 1, 4, 2);
      const r = arr.sort();
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
      expect(r[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_1800
     * @tc.name testUint8ClampedArraySortOne018
     * @tc.desc Verify subarray [5,3,1,4,2] subarray(1,4) sorted to [1,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([5, 3, 1, 4, 2]);
      const view = parent.subarray(1, 4);
      const r = view.sort();
      expect(view.length).assertEqual(3);
      expect(view[0]).assertEqual(1);
      expect(view[1]).assertEqual(3);
      expect(view[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_1900
     * @tc.name testUint8ClampedArraySortOne019
     * @tc.desc Verify sort [3,1,2] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_2000
     * @tc.name testUint8ClampedArraySortOne020
     * @tc.desc Verify subarray sort byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([5, 3, 1, 4, 2]);
      const view = parent.subarray(2, 5);
      const r = view.sort();
      expect(view.length).assertEqual(3);
      expect(view[0]).assertEqual(1);
      expect(view[1]).assertEqual(2);
      expect(view[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_2100
     * @tc.name testUint8ClampedArraySortOne021
     * @tc.desc Verify byteOffset sort byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 3, 4);
      arr[0] = 9; arr[1] = 7; arr[2] = 5; arr[3] = 3;
      const r = arr.sort();
      expect(r.byteOffset).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(5);
      expect(r[2]).assertEqual(7);
      expect(r[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_2200
     * @tc.name testUint8ClampedArraySortOne022
     * @tc.desc Verify subarray [5,3,1,4,2] subarray(1,4)=[3,1,4] sorted to [1,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([5, 3, 1, 4, 2]);
      const view = parent.subarray(1, 4);
      const r = view.sort();
      expect(view.length).assertEqual(3);
      expect(view[0]).assertEqual(1);
      expect(view[1]).assertEqual(3);
      expect(view[2]).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_2300
     * @tc.name testUint8ClampedArraySortOne023
     * @tc.desc Verify buffer sort buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 5; arr[1] = 3; arr[2] = 1; arr[3] = 4; arr[4] = 2;
      const r = arr.sort();
      expect(r.buffer).assertEqual(buf);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
      expect(r[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_2400
     * @tc.name testUint8ClampedArraySortOne024
     * @tc.desc Verify sort [10,20,30] with arr[1]=256 clamped to 255 returns [10,30,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr[1] = 256;
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(30);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_2500
     * @tc.name testUint8ClampedArraySortOne025
     * @tc.desc Verify sort [10,20,30] with arr[1]=-Infinity clamped to 0 returns [0,10,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr[1] = -Number.POSITIVE_INFINITY;
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(10);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_2600
     * @tc.name testUint8ClampedArraySortOne026
     * @tc.desc Verify sort [0,0,255] with arr[1]=127.5 clamped to 128 returns [0,128,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 255]);
      arr[1] = 127.5;
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(128);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_2700
     * @tc.name testUint8ClampedArraySortOne027
     * @tc.desc Verify sort [0,0,255] with arr[1]=128.5 clamped to 128 returns [0,128,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 255]);
      arr[1] = 128.5;
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(128);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_2800
     * @tc.name testUint8ClampedArraySortOne028
     * @tc.desc Verify sort [10,20,30] with arr[0]=0.5 clamped to 0 returns [0,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr[0] = 0.5;
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_2900
     * @tc.name testUint8ClampedArraySortOne029
     * @tc.desc Verify sort [10,20,30] with arr[0]=0.9 clamped to 1 returns [1,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr[0] = 0.9;
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_3000
     * @tc.name testUint8ClampedArraySortOne030
     * @tc.desc Verify sort [3,1,2] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_3100
     * @tc.name testUint8ClampedArraySortOne031
     * @tc.desc Verify sort no-arg length 0 empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.sort();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_3200
     * @tc.name testUint8ClampedArraySortOne032
     * @tc.desc Verify sort [42] returns [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.sort();
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_3300
     * @tc.name testUint8ClampedArraySortOne033
     * @tc.desc Verify sort [255,0] returns [0,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0]);
      const r = arr.sort();
      expect(r.length).assertEqual(2);
      expect(r[1]).assertEqual(255);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_3400
     * @tc.name testUint8ClampedArraySortOne034
     * @tc.desc Verify sort [0,0,0,0] returns [0,0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const r = arr.sort();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(0);
      expect(r[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_3500
     * @tc.name testUint8ClampedArraySortOne035
     * @tc.desc Verify sort [3,1,3,1,2] returns [1,1,2,3,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 3, 1, 2]);
      const r = arr.sort();
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(2);
      expect(r[3]).assertEqual(3);
      expect(r[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_3600
     * @tc.name testUint8ClampedArraySortOne036
     * @tc.desc Verify sort [5,9,1,7,3,8,2,6,4,0] returns [0,1,2,3,4,5,6,7,8,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 9, 1, 7, 3, 8, 2, 6, 4, 0]);
      const r = arr.sort();
      expect(r.length).assertEqual(10);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(2);
      expect(r[3]).assertEqual(3);
      expect(r[4]).assertEqual(4);
      expect(r[5]).assertEqual(5);
      expect(r[6]).assertEqual(6);
      expect(r[7]).assertEqual(7);
      expect(r[8]).assertEqual(8);
      expect(r[9]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_3700
     * @tc.name testUint8ClampedArraySortOne037
     * @tc.desc Verify sort no-arg r[0]=0 256 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const arr = new Uint8ClampedArray(buf);
      for (let i = 0; i < 256; i++) {
        arr[i] = 255 - i;
      }
      const r = arr.sort();
      expect(r[0]).assertEqual(0);
      expect(r[128]).assertEqual(128);
      expect(r[255]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_3800
     * @tc.name testUint8ClampedArraySortOne038
     * @tc.desc Verify sort no-arg length 1024 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_3900
     * @tc.name testUint8ClampedArraySortOne039
     * @tc.desc Verify sort cmp value 99 [99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const r = arr.sort((a: number, b: number): int => Double.toInt(a - b));
      expect(r[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_4000
     * @tc.name testUint8ClampedArraySortOne040
     * @tc.desc Verify sort cmp return 0 r[0]=5 [5,5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5]);
      const r = arr.sort((a: number, b: number): int => 0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(5);
      expect(r[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_4100
     * @tc.name testUint8ClampedArraySortOne041
     * @tc.desc Verify sort cmp return INT_MAX length 2 [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r = arr.sort((a: number, b: number): int => Double.toInt(2147483647));
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_4200
     * @tc.name testUint8ClampedArraySortOne042
     * @tc.desc Verify sort cmp return INT_MIN length 2 [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1]);
      const r = arr.sort((a: number, b: number): int => Double.toInt(-2147483648));
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_4300
     * @tc.name testUint8ClampedArraySortOne043
     * @tc.desc Verify sort cmp return 1000 length 2 [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1]);
      const r = arr.sort((a: number, b: number): int => 1000);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_4400
     * @tc.name testUint8ClampedArraySortOne044
     * @tc.desc Verify sort cmp return -1000 length 2 [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1]);
      const r = arr.sort((a: number, b: number): int => -1000);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_4500
     * @tc.name testUint8ClampedArraySortOne045
     * @tc.desc Verify sort cmp external var r[0]=1 [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const direction: number = 1;
      const r = arr.sort((a: number, b: number): int => Double.toInt((a - b) * direction));
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_4600
     * @tc.name testUint8ClampedArraySortOne046
     * @tc.desc Verify sort cmp nested call r[0]=1 [5,1,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 1, 3]);
      const diff = (a: number, b: number): number => a - b;
      const r = arr.sort((a: number, b: number): int => Double.toInt(diff(a, b)));
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_4700
     * @tc.name testUint8ClampedArraySortOne047
     * @tc.desc Verify sort cmp ref equal arr [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort((a: number, b: number): int => Double.toInt(a - b));
      expect(r).assertEqual(arr);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_4800
     * @tc.name testUint8ClampedArraySortOne048
     * @tc.desc Verify sort no-arg ref equal arr empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.sort();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_4900
     * @tc.name testUint8ClampedArraySortOne049
     * @tc.desc Verify sort undefined ref equal arr [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 1]);
      const r = arr.sort(undefined);
      expect(r).assertEqual(arr);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_5000
     * @tc.name testUint8ClampedArraySortOne050
     * @tc.desc Verify sort chained sort sort ref equal arr [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort().sort();
      expect(r).assertEqual(arr);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_5100
     * @tc.name testUint8ClampedArraySortOne051
     * @tc.desc Verify double sort r1 ref equal r2 [5,3,1,4,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 3, 1, 4, 2]);
      const r1 = arr.sort();
      const r2 = arr.sort();
      expect(r1).assertEqual(r2);
      expect(r1[0]).assertEqual(1);
      expect(r1[1]).assertEqual(2);
      expect(r1[2]).assertEqual(3);
      expect(r1[3]).assertEqual(4);
      expect(r1[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_5200
     * @tc.name testUint8ClampedArraySortOne052
     * @tc.desc Verify sort [3,1,2] shared buffer mutation: arr[0]=200 reflects in r[0]=200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort();
      arr[0] = 200;
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(200);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_5300
     * @tc.name testUint8ClampedArraySortOne053
     * @tc.desc Verify sort [3,1,2] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      arr.sort();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_5400
     * @tc.name testUint8ClampedArraySortOne054
     * @tc.desc Verify sort cmp in-place arr[0]=1 [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      arr.sort((a: number, b: number): int => Double.toInt(a - b));
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_5500
     * @tc.name testUint8ClampedArraySortOne055
     * @tc.desc Verify sort no-arg byteLength 3 [5,1,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 1, 3]);
      const r = arr.sort();
      expect(r.byteLength).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_5600
     * @tc.name testUint8ClampedArraySortOne056
     * @tc.desc Verify sort no-arg byteLength 0 empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.sort();
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_5700
     * @tc.name testUint8ClampedArraySortOne057
     * @tc.desc Verify sort no-arg byteLength 1 [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.sort();
      expect(r.byteLength).assertEqual(1);
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_5800
     * @tc.name testUint8ClampedArraySortOne058
     * @tc.desc Verify sort no-arg byteLength 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 8, 7, 6, 5, 4, 3, 2, 1, 0]);
      const r = arr.sort();
      expect(r.byteLength).assertEqual(10);
      expect(r[0]).assertEqual(0);
      expect(r[4]).assertEqual(4);
      expect(r[9]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_5900
     * @tc.name testUint8ClampedArraySortOne059
     * @tc.desc Verify sort no-arg BYTES_PER_ELEMENT 1 [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort();
      expect(r.BYTES_PER_ELEMENT).assertEqual(1);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_6000
     * @tc.name testUint8ClampedArraySortOne060
     * @tc.desc Verify sort no-arg byteOffset 0 [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort();
      expect(r.byteOffset).assertEqual(0);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_6100
     * @tc.name testUint8ClampedArraySortOne061
     * @tc.desc Verify sort no-arg byteOffset 2 view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      arr[0] = 8;
      arr[1] = 3;
      arr[2] = 5;
      arr[3] = 1;
      const r = arr.sort();
      expect(r.byteOffset).assertEqual(2);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(5);
      expect(r[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_6200
     * @tc.name testUint8ClampedArraySortOne062
     * @tc.desc Verify sort no-arg buffer equal arr.buffer [5,1,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 1, 3]);
      const r = arr.sort();
      expect(r.buffer).assertEqual(arr.buffer);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_6300
     * @tc.name testUint8ClampedArraySortOne063
     * @tc.desc Verify sort buffer ref unchanged [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const bufBefore = arr.buffer;
      arr.sort();
      expect(arr.buffer).assertEqual(bufBefore);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_6400
     * @tc.name testUint8ClampedArraySortOne064
     * @tc.desc Verify sort buffer byteLength unchanged [3,1,2,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2, 4, 5]);
      const blBefore = arr.buffer.byteLength;
      arr.sort();
      expect(arr.buffer.byteLength).assertEqual(blBefore);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_6500
     * @tc.name testUint8ClampedArraySortOne065
     * @tc.desc Verify sort no-arg typeof object [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.sort();
      const t: string = typeof r;
      expect(t).assertEqual('object');
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_6600
     * @tc.name testUint8ClampedArraySortOne066
     * @tc.desc Verify sort no-arg typeof object empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.sort();
      const t: string = typeof r;
      expect(t).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_6700
     * @tc.name testUint8ClampedArraySortOne067
     * @tc.desc Verify sort no-arg r[2]=255 [0xFF,1,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 1, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(255);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_6800
     * @tc.name testUint8ClampedArraySortOne068
     * @tc.desc Verify sort no-arg r[0]=0 [10,0x00,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 0x00, 50]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(10);
      expect(r[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_6900
     * @tc.name testUint8ClampedArraySortOne069
     * @tc.desc Verify sort no-arg r[2]=255 [0o377,1,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o377, 1, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(255);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_7000
     * @tc.name testUint8ClampedArraySortOne070
     * @tc.desc Verify sort no-arg r[2]=255 [0b11111111,1,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b11111111, 1, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(255);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_7100
     * @tc.name testUint8ClampedArraySortOne071
     * @tc.desc Verify sort no-arg r[1]=128 [200,0x80,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([200, 0x80, 5]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[1]).assertEqual(128);
      expect(r[0]).assertEqual(5);
      expect(r[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_7200
     * @tc.name testUint8ClampedArraySortOne072
     * @tc.desc Verify sort no-arg r[1]=100 [200,1e2,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([200, 1e2, 5]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[1]).assertEqual(100);
      expect(r[0]).assertEqual(5);
      expect(r[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_7300
     * @tc.name testUint8ClampedArraySortOne073
     * @tc.desc Verify sort no-arg r[2]=250 [2.5e2,1,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2.5e2, 1, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(250);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_7400
     * @tc.name testUint8ClampedArraySortOne074
     * @tc.desc Verify sort [256,1,100] with 256 clamped to 255 returns [1,100,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, 1, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(100);
      expect(r[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_7500
     * @tc.name testUint8ClampedArraySortOne075
     * @tc.desc Verify sort [-1,10,100] with -1 clamped to 0 returns [0,10,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, 10, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(10);
      expect(r[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_7600
     * @tc.name testUint8ClampedArraySortOne076
     * @tc.desc Verify sort construct Infinity clamp 255 r[2]=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY, 1, 50]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(255);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_7700
     * @tc.name testUint8ClampedArraySortOne077
     * @tc.desc Verify sort construct -Infinity clamp 0 r[0]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY, 10, 50]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(10);
      expect(r[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_7800
     * @tc.name testUint8ClampedArraySortOne078
     * @tc.desc Verify sort construct 127.5 clamp 128 r[1]=128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5, 10, 200]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[1]).assertEqual(128);
      expect(r[0]).assertEqual(10);
      expect(r[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_7900
     * @tc.name testUint8ClampedArraySortOne079
     * @tc.desc Verify sort construct 128.5 clamp 128 r[1]=128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5, 10, 200]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[1]).assertEqual(128);
      expect(r[0]).assertEqual(10);
      expect(r[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_8000
     * @tc.name testUint8ClampedArraySortOne080
     * @tc.desc Verify sort construct 0.5 clamp 0 r[0]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5, 5, 10]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(5);
      expect(r[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_8100
     * @tc.name testUint8ClampedArraySortOne081
     * @tc.desc Verify sort construct 1e9 clamp 255 r[2]=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e9, 1, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(255);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_8200
     * @tc.name testUint8ClampedArraySortOne082
     * @tc.desc Verify sort construct -1e9 clamp 0 r[0]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1e9, 10, 50]);
      const r = arr.sort();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(10);
      expect(r[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SORT_ONE_8300
     * @tc.name testUint8ClampedArraySortOne083
     * @tc.desc Verify sort construct mixed clamp length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySortOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, -1, Number.NaN, Number.POSITIVE_INFINITY, 100]);
      const r = arr.sort();
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(100);
      expect(r[3]).assertEqual(255);
      expect(r[4]).assertEqual(255);
    });
  });
}
