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

export default function uint8ClampedArrayValueOfTest(): void {
  describe('Uint8ClampedArrayValueOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_0100
     * @tc.name testUint8ClampedArrayValueOf001
     * @tc.desc Verify valueOf on [10,20] returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      const val1 = arr.valueOf();
      const val2 = arr.valueOf();
      expect(val1).assertEqual(arr);
      expect(val2).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_0200
     * @tc.name testUint8ClampedArrayValueOf002
     * @tc.desc Verify valueOf on empty array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_0300
     * @tc.name testUint8ClampedArrayValueOf003
     * @tc.desc Verify ArrayBuffer+byteOffset+length valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 3);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_0400
     * @tc.name testUint8ClampedArrayValueOf004
     * @tc.desc Verify slice(1,3).valueOf() returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = parent.slice(1, 3);
      expect(s.valueOf()).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_0500
     * @tc.name testUint8ClampedArrayValueOf005
     * @tc.desc Verify slice(1,3).valueOf().buffer not equal to parent.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = parent.slice(1, 3);
      expect(s.valueOf().buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_0600
     * @tc.name testUint8ClampedArrayValueOf006
     * @tc.desc Verify two views on same ArrayBuffer have distinct valueOf references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const frontView = new Uint8ClampedArray(buf, 0, 4);
      const backView = new Uint8ClampedArray(buf, 4, 4);
      expect(frontView.valueOf()).assertEqual(frontView);
      expect(backView.valueOf()).assertEqual(backView);
      expect(frontView.valueOf()).not().assertEqual(backView.valueOf());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_0700
     * @tc.name testUint8ClampedArrayValueOf007
     * @tc.desc Verify overlapping views share same valueOf().buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const frontView = new Uint8ClampedArray(buf, 0, 6);
      const backView = new Uint8ClampedArray(buf, 2, 4);
      expect(frontView.valueOf().buffer).assertEqual(backView.valueOf().buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_0800
     * @tc.name testUint8ClampedArrayValueOf008
     * @tc.desc Verify clamp valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, -1, 300]);
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_0900
     * @tc.name testUint8ClampedArrayValueOf009
     * @tc.desc Verify NaN valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN, Number.NaN]);
      expect(arr.length).assertEqual(2);
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_1000
     * @tc.name testUint8ClampedArrayValueOf010
     * @tc.desc Verify Infinity valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY]);
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_1100
     * @tc.name testUint8ClampedArrayValueOf011
     * @tc.desc Verify valueOf clamp (0.5 0 half-even)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5]);
      expect(arr.valueOf()[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_1200
     * @tc.name testUint8ClampedArrayValueOf012
     * @tc.desc Verify valueOf clamp (127.5 128 half-even)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5]);
      expect(arr.valueOf()[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_1300
     * @tc.name testUint8ClampedArrayValueOf013
     * @tc.desc Verify valueOf clamp (128.5 128 half-even)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5]);
      expect(arr.valueOf()[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_1400
     * @tc.name testUint8ClampedArrayValueOf014
     * @tc.desc Verify valueOf returns same reference; mutation via result affects source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v = arr.valueOf();
      v[0] = 99;
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_1500
     * @tc.name testUint8ClampedArrayValueOf015
     * @tc.desc Verify valueOf mutation with 256 clamps to 255 on both v and arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v = arr.valueOf();
      v[0] = 256;
      expect(v[0]).assertEqual(255);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_1600
     * @tc.name testUint8ClampedArrayValueOf016
     * @tc.desc Verify valueOf mutation with -1 clamps to 0 on both v and arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v = arr.valueOf();
      v[1] = -1;
      expect(v[1]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_1700
     * @tc.name testUint8ClampedArrayValueOf017
     * @tc.desc Verify valueOf().valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      expect(arr.valueOf().valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_1800
     * @tc.name testUint8ClampedArrayValueOf018
     * @tc.desc Verify valueOf().subarray(1,3) on [1,2,3,4] returns [2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.valueOf().subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_1900
     * @tc.name testUint8ClampedArrayValueOf019
     * @tc.desc Verify valueOf().slice(1,3) on [1,2,3,4] returns [2,3] with independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = arr.valueOf().slice(1, 3);
      expect(s.length).assertEqual(2);
      expect(s[0]).assertEqual(2);
      expect(s[1]).assertEqual(3);
      expect(s.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_2000
     * @tc.name testUint8ClampedArrayValueOf020
     * @tc.desc Verify sub1.valueOf().subarray(0,2) on parent.subarray(1,4) yields [2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub1 = parent.subarray(1, 4);
      const sub2 = sub1.valueOf().subarray(0, 2);
      expect(parent.length).assertEqual(5);
      expect(sub1.length).assertEqual(3);
      expect(sub2.length).assertEqual(2);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(parent[4]).assertEqual(5);
      expect(sub1[0]).assertEqual(2);
      expect(sub1[1]).assertEqual(3);
      expect(sub1[2]).assertEqual(4);
      expect(sub2[0]).assertEqual(2);
      expect(sub2[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_2100
     * @tc.name testUint8ClampedArrayValueOf021
     * @tc.desc Verify toReversed valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed();
      expect(r.valueOf()).assertEqual(r);
      expect(r.valueOf()).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_2200
     * @tc.name testUint8ClampedArrayValueOf022
     * @tc.desc Verify toSorted valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const s = arr.toSorted();
      expect(s.valueOf()).assertEqual(s);
      expect(s.valueOf()).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_2300
     * @tc.name testUint8ClampedArrayValueOf023
     * @tc.desc Verify map valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const m = arr.map((x: number) => x * 2);
      expect(m.valueOf()).assertEqual(m);
      expect(m.valueOf()).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_2400
     * @tc.name testUint8ClampedArrayValueOf024
     * @tc.desc Verify filter valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const f = arr.filter((x: number) => x > 2);
      expect(f.valueOf()).assertEqual(f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_2500
     * @tc.name testUint8ClampedArrayValueOf025
     * @tc.desc Verify with valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const w = arr.with(0, 99);
      expect(w.valueOf()).assertEqual(w);
      expect(w.valueOf()).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_2600
     * @tc.name testUint8ClampedArrayValueOf026
     * @tc.desc Verify viewA.valueOf()[0]=88 affects viewB[0] on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const viewA = new Uint8ClampedArray(buf);
      const viewB = new Uint8ClampedArray(buf);
      viewA.valueOf()[0] = 88;
      expect(viewB[0]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_2700
     * @tc.name testUint8ClampedArrayValueOf027
     * @tc.desc Verify empty valueOf length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.valueOf().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_2800
     * @tc.name testUint8ClampedArrayValueOf028
     * @tc.desc Verify empty valueOf byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.valueOf().byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_2900
     * @tc.name testUint8ClampedArrayValueOf029
     * @tc.desc Verify empty valueOf byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.valueOf().byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_3000
     * @tc.name testUint8ClampedArrayValueOf030
     * @tc.desc Verify empty valueOf buffer shared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.valueOf().buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_3100
     * @tc.name testUint8ClampedArrayValueOf031
     * @tc.desc Verify subarray(0,3) on [1,2,3] returns full copy with same elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const sub = parent.subarray(0, 3);
      expect(parent.length).assertEqual(3);
      expect(sub.length).assertEqual(3);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_3200
     * @tc.name testUint8ClampedArrayValueOf032
     * @tc.desc Verify subarray(1,4) on [1,2,3,4] returns [2,3,4] with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 4);
      expect(parent.length).assertEqual(4);
      expect(sub.length).assertEqual(3);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_3300
     * @tc.name testUint8ClampedArrayValueOf033
     * @tc.desc Verify valueOf length equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v = arr.valueOf();
      expect(v.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_3400
     * @tc.name testUint8ClampedArrayValueOf034
     * @tc.desc Verify valueOf length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const v = arr.valueOf();
      expect(v.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_3500
     * @tc.name testUint8ClampedArrayValueOf035
     * @tc.desc Verify valueOf byteLength equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v = arr.valueOf();
      expect(v.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_3600
     * @tc.name testUint8ClampedArrayValueOf036
     * @tc.desc Verify valueOf byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v = arr.valueOf();
      expect(v.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_3700
     * @tc.name testUint8ClampedArrayValueOf037
     * @tc.desc Verify valueOf byteOffset equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 3, 4);
      const v = arr.valueOf();
      expect(v.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_3800
     * @tc.name testUint8ClampedArrayValueOf038
     * @tc.desc Verify valueOf byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const v = arr.valueOf();
      expect(v.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_3900
     * @tc.name testUint8ClampedArrayValueOf039
     * @tc.desc Verify valueOf byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const v = arr.valueOf();
      expect(v.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_4000
     * @tc.name testUint8ClampedArrayValueOf040
     * @tc.desc Verify valueOf BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v = arr.valueOf();
      expect(v.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_4100
     * @tc.name testUint8ClampedArrayValueOf041
     * @tc.desc Verify valueOf buffer equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v = arr.valueOf();
      expect(v.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_4200
     * @tc.name testUint8ClampedArrayValueOf042
     * @tc.desc Verify valueOf index 0 equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const v = arr.valueOf();
      expect(v[0]).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_4300
     * @tc.name testUint8ClampedArrayValueOf043
     * @tc.desc Verify valueOf index 0 value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const v = arr.valueOf();
      expect(v[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_4400
     * @tc.name testUint8ClampedArrayValueOf044
     * @tc.desc Verify valueOf last value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const v = arr.valueOf();
      expect(v[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_4500
     * @tc.name testUint8ClampedArrayValueOf045
     * @tc.desc Verify valueOf mid value 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const v = arr.valueOf();
      expect(v[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_4600
     * @tc.name testUint8ClampedArrayValueOf046
     * @tc.desc Verify valueOf clamp 256 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      const v = arr.valueOf();
      expect(v[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_4700
     * @tc.name testUint8ClampedArrayValueOf047
     * @tc.desc Verify valueOf clamp -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1]);
      const v = arr.valueOf();
      expect(v[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_4800
     * @tc.name testUint8ClampedArrayValueOf048
     * @tc.desc Verify valueOf clamp NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN]);
      const v = arr.valueOf();
      expect(v[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_4900
     * @tc.name testUint8ClampedArrayValueOf049
     * @tc.desc Verify valueOf source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.valueOf();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_5000
     * @tc.name testUint8ClampedArrayValueOf050
     * @tc.desc Verify arr.valueOf() does not mutate source arr[0]=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.valueOf();
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_5100
     * @tc.name testUint8ClampedArrayValueOf051
     * @tc.desc Verify arr.valueOf() does not mutate source arr[2]=30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.valueOf();
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_5200
     * @tc.name testUint8ClampedArrayValueOf052
     * @tc.desc Verify valueOf modify source sync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v = arr.valueOf();
      arr[0] = 88;
      expect(v[0]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_5300
     * @tc.name testUint8ClampedArrayValueOf053
     * @tc.desc Verify $_set(1, 77) on source reflects in valueOf result v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v = arr.valueOf();
      arr.$_set(1, 77);
      expect(v.length).assertEqual(3);
      expect(v[1]).assertEqual(77);
      expect(v[0]).assertEqual(1);
      expect(v[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_5400
     * @tc.name testUint8ClampedArrayValueOf054
     * @tc.desc Verify nested valueOf self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      expect(arr.valueOf().valueOf().valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_5500
     * @tc.name testUint8ClampedArrayValueOf055
     * @tc.desc Verify valueOf on [1,2,3,4] has length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v = arr.valueOf();
      expect(v.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_5600
     * @tc.name testUint8ClampedArrayValueOf056
     * @tc.desc Verify fill valueOf self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr.fill(5);
      const v = arr.valueOf();
      expect(v.length).assertEqual(3);
      expect(v).assertEqual(arr);
      expect(v[0]).assertEqual(5);
      expect(v[1]).assertEqual(5);
      expect(v[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_5700
     * @tc.name testUint8ClampedArrayValueOf057
     * @tc.desc Verify copyWithin valueOf self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.copyWithin(0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_5800
     * @tc.name testUint8ClampedArrayValueOf058
     * @tc.desc Verify reverse then valueOf on [1,2,3] yields [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      const v = arr.valueOf();
      expect(v.length).assertEqual(3);
      expect(v).assertEqual(arr);
      expect(v[0]).assertEqual(3);
      expect(v[1]).assertEqual(2);
      expect(v[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_5900
     * @tc.name testUint8ClampedArrayValueOf059
     * @tc.desc Verify sort then valueOf on [3,1,2] yields [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      arr.sort();
      const v = arr.valueOf();
      expect(v.length).assertEqual(3);
      expect(v).assertEqual(arr);
      expect(v[0]).assertEqual(1);
      expect(v[1]).assertEqual(2);
      expect(v[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_6000
     * @tc.name testUint8ClampedArrayValueOf060
     * @tc.desc Verify set valueOf self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.set(new Uint8ClampedArray([10, 20]), 1);
      const v = arr.valueOf();
      expect(v.length).assertEqual(3);
      expect(v).assertEqual(arr);
      expect(v[0]).assertEqual(1);
      expect(v[1]).assertEqual(10);
      expect(v[2]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_6100
     * @tc.name testUint8ClampedArrayValueOf061
     * @tc.desc Verify $_set(0, 99) then valueOf on [1,2,3] yields [99,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.$_set(0, 99);
      const v = arr.valueOf();
      expect(v.length).assertEqual(3);
      expect(v).assertEqual(arr);
      expect(v[0]).assertEqual(99);
      expect(v[1]).assertEqual(2);
      expect(v[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_6200
     * @tc.name testUint8ClampedArrayValueOf062
     * @tc.desc Verify assign valueOf self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr[0] = 50;
      const v = arr.valueOf();
      expect(v.length).assertEqual(3);
      expect(v).assertEqual(arr);
      expect(v[0]).assertEqual(50);
      expect(v[1]).assertEqual(2);
      expect(v[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_6300
     * @tc.name testUint8ClampedArrayValueOf063
     * @tc.desc Verify slice(1,3).valueOf() not equal to original arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = arr.slice(1, 3);
      expect(s.valueOf()).assertEqual(s);
      expect(s.valueOf()).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_6400
     * @tc.name testUint8ClampedArrayValueOf064
     * @tc.desc Verify cross buffer valueOf not shared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2]);
      const b = new Uint8ClampedArray([3, 4]);
      expect(a.valueOf().buffer).not().assertEqual(b.valueOf().buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_6500
     * @tc.name testUint8ClampedArrayValueOf065
     * @tc.desc Verify valueOf byteLength length product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v = arr.valueOf();
      expect(v.byteLength).assertEqual(v.length * v.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_6600
     * @tc.name testUint8ClampedArrayValueOf066
     * @tc.desc Verify subarray(3,6) on [1,2,3,4,5,6] returns [4,5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      const sub = parent.subarray(3, 6);
      expect(parent.length).assertEqual(6);
      expect(sub.length).assertEqual(3);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(parent[4]).assertEqual(5);
      expect(parent[5]).assertEqual(6);
      expect(sub[0]).assertEqual(4);
      expect(sub[1]).assertEqual(5);
      expect(sub[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_6700
     * @tc.name testUint8ClampedArrayValueOf067
     * @tc.desc Verify parent[1]=99 mutation reflects in subarray(1,3) sub[0]=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      parent[1] = 99;
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(99);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_VALUEOF_6800
     * @tc.name testUint8ClampedArrayValueOf068
     * @tc.desc Verify subarray valueOf mutation reflects in parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayValueOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      sub.valueOf()[0] = 77;
      expect(parent.length).assertEqual(4);
      expect(sub.length).assertEqual(2);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(77);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(sub[0]).assertEqual(77);
      expect(sub[1]).assertEqual(3);
    });
  });
}
