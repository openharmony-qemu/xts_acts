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

export default function uint8ClampedArrayMapOneTest(): void {
  describe('Uint8ClampedArrayMapOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_0100
     * @tc.name testUint8ClampedArrayMapOne001
     * @tc.desc Verify map with undefined callback on [1,2,3] throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        const mapFn = (arr as Object as Record<string, (fn: object) => Uint8ClampedArray>)['map'] as (fn: object) => Uint8ClampedArray;
        mapFn(undefined as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_0200
     * @tc.name testUint8ClampedArrayMapOne002
     * @tc.desc Verify map [1,2,3] returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_0300
     * @tc.name testUint8ClampedArrayMapOne003
     * @tc.desc Verify map [10,20,30] returns [10,21,32]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v + i);
      expect(r.length).assertEqual(3);
      expect(r[1]).assertEqual(21);
      expect(r[0]).assertEqual(10);
      expect(r[2]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_0400
     * @tc.name testUint8ClampedArrayMapOne004
     * @tc.desc Verify map v+a.length on [10,20,30] returns r[0]=13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v + a.length);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(13);
      expect(r[1]).assertEqual(23);
      expect(r[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_0500
     * @tc.name testUint8ClampedArrayMapOne005
     * @tc.desc Verify map [0] returns [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_0600
     * @tc.name testUint8ClampedArrayMapOne006
     * @tc.desc Verify map [255] returns [255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_0700
     * @tc.name testUint8ClampedArrayMapOne007
     * @tc.desc Verify map [256] clamped to [255] on construction, identity map returns [255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_0800
     * @tc.name testUint8ClampedArrayMapOne008
     * @tc.desc Verify map [-1] clamped to [0] on construction, identity map returns [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_0900
     * @tc.name testUint8ClampedArrayMapOne009
     * @tc.desc Verify source element NaN clamped on construction, identity map preserves r[0]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_1000
     * @tc.name testUint8ClampedArrayMapOne010
     * @tc.desc Verify source element Infinity clamped on construction, identity map preserves r[0]=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_1100
     * @tc.name testUint8ClampedArrayMapOne011
     * @tc.desc Verify source element -Infinity clamped on construction, identity map preserves r[0]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_1200
     * @tc.name testUint8ClampedArrayMapOne012
     * @tc.desc Verify source element 0.5 half-even clamped on construction, identity map preserves r[0]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_1300
     * @tc.name testUint8ClampedArrayMapOne013
     * @tc.desc Verify source element 127.5 half-even on construction, identity map preserves r[0]=128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_1400
     * @tc.name testUint8ClampedArrayMapOne014
     * @tc.desc Verify source element 128.5 half-even on construction, identity map preserves r[0]=128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_1500
     * @tc.name testUint8ClampedArrayMapOne015
     * @tc.desc Verify source element 0.9 rounded on construction, identity map preserves r[0]=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.9]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_1600
     * @tc.name testUint8ClampedArrayMapOne016
     * @tc.desc Verify callback index increments sequentially 0,1,2 for 3-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let last: int = -1;
      let ok: boolean = true;
      arr.map((v: number, i: int, a: Uint8ClampedArray) => {
        if (i !== last + 1) { ok = false; }
        last = i;
        return v;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_1700
     * @tc.name testUint8ClampedArrayMapOne017
     * @tc.desc Verify callback index sum 0..9 = 45 for 10-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let sum: int = 0;
      arr.map((v: number, i: int, a: Uint8ClampedArray) => { sum += i; return v; });
      expect(sum).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_1800
     * @tc.name testUint8ClampedArrayMapOne018
     * @tc.desc Verify callback third arg a is source array reference a===arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let same: boolean = true;
      arr.map((v: number, i: int, a: Uint8ClampedArray) => {
        if (a !== arr) { same = false; }
        return v;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_1900
     * @tc.name testUint8ClampedArrayMapOne019
     * @tc.desc Verify callback can read sibling element a[2] via third arg, r[0]=30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => i === 0 ? a[2] : v);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(30);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_2000
     * @tc.name testUint8ClampedArrayMapOne020
     * @tc.desc Verify map callback always returns 0 on [100] results in [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 0);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_2100
     * @tc.name testUint8ClampedArrayMapOne021
     * @tc.desc Verify map callback returns literal 255 on [1] results in [255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 255);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_2200
     * @tc.name testUint8ClampedArrayMapOne022
     * @tc.desc Verify map callback returns 256 on [1], clamps to 255 in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 256);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_2300
     * @tc.name testUint8ClampedArrayMapOne023
     * @tc.desc Verify map callback returns -1 on [1], clamps to 0 in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => -1);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_2400
     * @tc.name testUint8ClampedArrayMapOne024
     * @tc.desc Verify callback returns NaN clamped to 0 in map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => Number.NaN);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_2500
     * @tc.name testUint8ClampedArrayMapOne025
     * @tc.desc Verify callback returns Infinity clamped to 255 in map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => Number.POSITIVE_INFINITY);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_2600
     * @tc.name testUint8ClampedArrayMapOne026
     * @tc.desc Verify callback returns -Infinity clamped to 0 in map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => -Number.POSITIVE_INFINITY);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_2700
     * @tc.name testUint8ClampedArrayMapOne027
     * @tc.desc Verify callback returns 0.5 half-even clamped to 0 in map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 0.5);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_2800
     * @tc.name testUint8ClampedArrayMapOne028
     * @tc.desc Verify callback returns 1.5 half-even rounded to 2 in map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 1.5);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_2900
     * @tc.name testUint8ClampedArrayMapOne029
     * @tc.desc Verify callback returns 2.5 half-even clamped to 2 in map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 2.5);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_3000
     * @tc.name testUint8ClampedArrayMapOne030
     * @tc.desc Verify callback returns 127.5 half-even rounded to 128 in map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 127.5);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_3100
     * @tc.name testUint8ClampedArrayMapOne031
     * @tc.desc Verify callback returns 128.5 half-even rounded to 128 in map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 128.5);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_3200
     * @tc.name testUint8ClampedArrayMapOne032
     * @tc.desc Verify callback returns 254.5 half-even rounded to 254 in map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 254.5);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_3300
     * @tc.name testUint8ClampedArrayMapOne033
     * @tc.desc Verify callback returns 255.5 clamped to 255 in map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 255.5);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_3400
     * @tc.name testUint8ClampedArrayMapOne034
     * @tc.desc Verify empty array map callback not called, called=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let called: int = 0;
      arr.map((v: number, i: int, a: Uint8ClampedArray) => { called += 1; return v; });
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_3500
     * @tc.name testUint8ClampedArrayMapOne035
     * @tc.desc Verify zero-length ArrayBuffer view map returns r.length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 4, 0);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 99);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_3600
     * @tc.name testUint8ClampedArrayMapOne036
     * @tc.desc Verify offset ArrayBuffer view identity map preserves r.length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(0);
      expect(r[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_3700
     * @tc.name testUint8ClampedArrayMapOne037
     * @tc.desc Verify map [0,1,127,128,254,255] returns [0,1,127,128,254,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 127, 128, 254, 255]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(6);
      expect(r[5]).assertEqual(255);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(127);
      expect(r[3]).assertEqual(128);
      expect(r[4]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_3800
     * @tc.name testUint8ClampedArrayMapOne038
     * @tc.desc Verify of [10,20,30] returns [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_3900
     * @tc.name testUint8ClampedArrayMapOne039
     * @tc.desc Verify identity map preserves all elements [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray): number => v);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_4000
     * @tc.name testUint8ClampedArrayMapOne040
     * @tc.desc Verify map result buffer is independent from source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray): number => v);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_4100
     * @tc.name testUint8ClampedArrayMapOne041
     * @tc.desc Verify offset view map result buffer independent from source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray): number => v);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_4200
     * @tc.name testUint8ClampedArrayMapOne042
     * @tc.desc Verify map result independent: mutating result does not affect source arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray): number => v);
      r[0] = 200;
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_4300
     * @tc.name testUint8ClampedArrayMapOne043
     * @tc.desc Verify map result independent: mutating source does not affect result r[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray): number => v);
      arr[0] = 200;
      expect(r[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_4400
     * @tc.name testUint8ClampedArrayMapOne044
     * @tc.desc Verify map returns new array reference distinct from source r!==arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray): number => v);
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_4500
     * @tc.name testUint8ClampedArrayMapOne045
     * @tc.desc Verify chain map returns new array reference each time r1!==r2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r1 = arr.map((v: number, i: int, a: Uint8ClampedArray): number => v);
      const r2 = r1.map((v: number, i: int, a: Uint8ClampedArray): number => v);
      expect(r1).not().assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_4600
     * @tc.name testUint8ClampedArrayMapOne046
     * @tc.desc Verify double map chain (x+1 twice) results in r[0]=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray): number => v + 1).map((v: number, i: int, a: Uint8ClampedArray): number => v + 1);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(4);
      expect(r[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_4700
     * @tc.name testUint8ClampedArrayMapOne047
     * @tc.desc Verify map does not mutate source array elements arr[0] unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.map((v: number, i: int, a: Uint8ClampedArray): number => v + 100);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_4800
     * @tc.name testUint8ClampedArrayMapOne048
     * @tc.desc Verify map result out-of-bounds index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray): number => v);
      try {
        r.$_get(r.length);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_4900
     * @tc.name testUint8ClampedArrayMapOne049
     * @tc.desc Verify map [1] returns [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_5000
     * @tc.name testUint8ClampedArrayMapOne050
     * @tc.desc Verify map [127] returns [127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_5100
     * @tc.name testUint8ClampedArrayMapOne051
     * @tc.desc Verify map [128] returns [128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_5200
     * @tc.name testUint8ClampedArrayMapOne052
     * @tc.desc Verify map [254] returns [254]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([254]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_5300
     * @tc.name testUint8ClampedArrayMapOne053
     * @tc.desc Verify fn receives val 0.4 clamp 0 r[0]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.4]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_5400
     * @tc.name testUint8ClampedArrayMapOne054
     * @tc.desc Verify fn index 0 maps first element r[0]=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => i === 0 ? 100 : v);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(100);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_5500
     * @tc.name testUint8ClampedArrayMapOne055
     * @tc.desc Verify fn index length-1 maps last element r[2]=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => i === 2 ? 99 : v);
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(99);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_5600
     * @tc.name testUint8ClampedArrayMapOne056
     * @tc.desc Verify fn single element index 0 seen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      let seen: int = -1;
      arr.map((v: number, i: int, a: Uint8ClampedArray) => { seen = i; return v; });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_5700
     * @tc.name testUint8ClampedArrayMapOne057
     * @tc.desc Verify fn length 2 index sum 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10]);
      let sum: int = 0;
      arr.map((v: number, i: int, a: Uint8ClampedArray) => { sum += i; return v; });
      expect(sum).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_5800
     * @tc.name testUint8ClampedArrayMapOne058
     * @tc.desc Verify fn array param length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let seenLen: number = 0;
      arr.map((v: number, i: int, a: Uint8ClampedArray) => { seenLen = a.length; return v; });
      expect(seenLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_5900
     * @tc.name testUint8ClampedArrayMapOne059
     * @tc.desc Verify map callback returns 1000 on [1], clamps to 255 in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 1000);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_6000
     * @tc.name testUint8ClampedArrayMapOne060
     * @tc.desc Verify map callback returns -1000 on [1], clamps to 0 in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => -1000);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_6100
     * @tc.name testUint8ClampedArrayMapOne061
     * @tc.desc Verify fn return 1e9 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 1e9);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_6200
     * @tc.name testUint8ClampedArrayMapOne062
     * @tc.desc Verify fn return -1e9 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => -1e9);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_6300
     * @tc.name testUint8ClampedArrayMapOne063
     * @tc.desc Verify map callback returns 2147483648 on [1], clamps to 255 in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 2147483648);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_6400
     * @tc.name testUint8ClampedArrayMapOne064
     * @tc.desc Verify fn return Number.MAX_VALUE clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => Number.MAX_VALUE);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_6500
     * @tc.name testUint8ClampedArrayMapOne065
     * @tc.desc Verify fn return Number.MIN_VALUE clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => Number.MIN_VALUE);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_6600
     * @tc.name testUint8ClampedArrayMapOne066
     * @tc.desc Verify map callback returns -0 on [1], result is [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => -0);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_6700
     * @tc.name testUint8ClampedArrayMapOne067
     * @tc.desc Verify fn return 0.4 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 0.4);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_6800
     * @tc.name testUint8ClampedArrayMapOne068
     * @tc.desc Verify fn return 0.6 clamp 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 0.6);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_6900
     * @tc.name testUint8ClampedArrayMapOne069
     * @tc.desc Verify map callback returns literal 127 on [1] results in [127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 127);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_7000
     * @tc.name testUint8ClampedArrayMapOne070
     * @tc.desc Verify map callback returns literal 128 on [1] results in [128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 128);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_7100
     * @tc.name testUint8ClampedArrayMapOne071
     * @tc.desc Verify map callback returns literal 254 on [1] results in [254]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 254);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_7200
     * @tc.name testUint8ClampedArrayMapOne072
     * @tc.desc Verify fn return 0xFF 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 0xFF);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_7300
     * @tc.name testUint8ClampedArrayMapOne073
     * @tc.desc Verify fn return 0x100 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 0x100);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_7400
     * @tc.name testUint8ClampedArrayMapOne074
     * @tc.desc Verify fn return 0b11111111 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 0b11111111);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_MAP_ONE_7500
     * @tc.name testUint8ClampedArrayMapOne075
     * @tc.desc Verify fn return 0b100000000 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayMapOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.map((v: number, i: int, a: Uint8ClampedArray) => 0b100000000);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });
  });
}
