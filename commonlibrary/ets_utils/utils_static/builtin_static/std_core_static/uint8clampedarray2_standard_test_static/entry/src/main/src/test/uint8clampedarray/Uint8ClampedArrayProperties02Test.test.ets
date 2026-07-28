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

export default function uint8ClampedArrayPropertiesTwoTest(): void {
  describe('Uint8ClampedArrayPropertiesTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_0100
     * @tc.name testUint8ClampedArrayPropertiesTwo001
     * @tc.desc Verify from(Array<number>) BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_0200
     * @tc.name testUint8ClampedArrayPropertiesTwo002
     * @tc.desc Verify from(Uint8ClampedArray) BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const arr = Uint8ClampedArray.from(src);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_0300
     * @tc.name testUint8ClampedArrayPropertiesTwo003
     * @tc.desc Verify slice [1,2,3,4,5] returns [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s = arr.slice(0, 2);
      expect(s.length).assertEqual(2);
      expect(s[0]).assertEqual(1);
      expect(s[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_0400
     * @tc.name testUint8ClampedArrayPropertiesTwo004
     * @tc.desc Verify slice(0, 2) byteLength 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s = arr.slice(0, 2);
      expect(s.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_0500
     * @tc.name testUint8ClampedArrayPropertiesTwo005
     * @tc.desc Verify slice byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = arr.slice(1, 3);
      expect(s.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_0600
     * @tc.name testUint8ClampedArrayPropertiesTwo006
     * @tc.desc Verify subarray [10,20,30,40,50] returns [20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.byteLength).assertEqual(2);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_0700
     * @tc.name testUint8ClampedArrayPropertiesTwo007
     * @tc.desc Verify subarray [10,20,30,40,50] returns [20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(1);
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
      expect(sub[2]).assertEqual(40);
      expect(sub[3]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_0800
     * @tc.name testUint8ClampedArrayPropertiesTwo008
     * @tc.desc Verify subarray [10,20,30,40,50] returns [10,20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray();
      expect(sub.length).assertEqual(5);
      expect(sub.byteLength).assertEqual(sub.length);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
      expect(sub[2]).assertEqual(30);
      expect(sub[3]).assertEqual(40);
      expect(sub[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_0900
     * @tc.name testUint8ClampedArrayPropertiesTwo009
     * @tc.desc Verify map result length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const m = arr.map((x: number) => x);
      expect(m.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_1000
     * @tc.name testUint8ClampedArrayPropertiesTwo010
     * @tc.desc Verify map result byteLength equals source byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const m = arr.map((x: number) => x);
      expect(m.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_1100
     * @tc.name testUint8ClampedArrayPropertiesTwo011
     * @tc.desc Verify map result byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const m = arr.map((x: number) => x);
      expect(m.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_1200
     * @tc.name testUint8ClampedArrayPropertiesTwo012
     * @tc.desc Verify filter result length <= source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const f = arr.filter((x: number) => x > 2);
      expect(f.length).assertLessOrEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_1300
     * @tc.name testUint8ClampedArrayPropertiesTwo013
     * @tc.desc Verify filter result byteLength equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const f = arr.filter((x: number) => x > 2);
      expect(f.byteLength).assertEqual(f.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_1400
     * @tc.name testUint8ClampedArrayPropertiesTwo014
     * @tc.desc Verify toReversed result length equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_1500
     * @tc.name testUint8ClampedArrayPropertiesTwo015
     * @tc.desc Verify toReversed result byteLength equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.toReversed();
      expect(r.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_1600
     * @tc.name testUint8ClampedArrayPropertiesTwo016
     * @tc.desc Verify toSorted result length equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 4, 2]);
      const s = arr.toSorted();
      expect(s.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_1700
     * @tc.name testUint8ClampedArrayPropertiesTwo017
     * @tc.desc Verify toSorted result byteLength equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 4, 2]);
      const s = arr.toSorted();
      expect(s.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_1800
     * @tc.name testUint8ClampedArrayPropertiesTwo018
     * @tc.desc Verify with(0, 99) result length equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const w = arr.with(0, 99);
      expect(w.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_1900
     * @tc.name testUint8ClampedArrayPropertiesTwo019
     * @tc.desc Verify with(0, 99) result byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const w = arr.with(0, 99);
      expect(w.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_2000
     * @tc.name testUint8ClampedArrayPropertiesTwo020
     * @tc.desc Verify length 0 array byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_2100
     * @tc.name testUint8ClampedArrayPropertiesTwo021
     * @tc.desc Verify length 0 array buffer not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.buffer).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_2200
     * @tc.name testUint8ClampedArrayPropertiesTwo022
     * @tc.desc Verify length 0 array name equals Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.name).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_2300
     * @tc.name testUint8ClampedArrayPropertiesTwo023
     * @tc.desc Verify byteLength of ArrayBuffer(buf, offset) view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 4);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_2400
     * @tc.name testUint8ClampedArrayPropertiesTwo024
     * @tc.desc Verify length of ArrayBuffer(buf, offset) view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 4);
      expect(arr.length).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_2500
     * @tc.name testUint8ClampedArrayPropertiesTwo025
     * @tc.desc Verify byteOffset of ArrayBuffer(buf, offset) view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_2600
     * @tc.name testUint8ClampedArrayPropertiesTwo026
     * @tc.desc Verify buffer of ArrayBuffer(buf, offset) equals buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 4);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_2700
     * @tc.name testUint8ClampedArrayPropertiesTwo027
     * @tc.desc Verify length 0 for ArrayBuffer(buf, offset, 0) view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 8, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_2800
     * @tc.name testUint8ClampedArrayPropertiesTwo028
     * @tc.desc Verify byteLength 0 for ArrayBuffer(buf, offset, 0) view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 8, 0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_2900
     * @tc.name testUint8ClampedArrayPropertiesTwo029
     * @tc.desc Verify byteOffset preserved for zero-length view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 12, 0);
      expect(arr.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_3000
     * @tc.name testUint8ClampedArrayPropertiesTwo030
     * @tc.desc Verify buffer preserved for zero-length view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 12, 0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_3100
     * @tc.name testUint8ClampedArrayPropertiesTwo031
     * @tc.desc Verify byteOffset + byteLength <= buffer.byteLength invariant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 4, 8);
      const sum: int = arr.byteOffset + arr.byteLength;
      expect(sum).assertLessOrEqual(buf.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_3200
     * @tc.name testUint8ClampedArrayPropertiesTwo032
     * @tc.desc Verify length <= buffer.byteLength invariant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      expect(arr.length).assertLessOrEqual(arr.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_3300
     * @tc.name testUint8ClampedArrayPropertiesTwo033
     * @tc.desc Verify name not equal to Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      expect(arr.name).not().assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_3400
     * @tc.name testUint8ClampedArrayPropertiesTwo034
     * @tc.desc Verify name not equal to Uint8ClampedArr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      expect(arr.name).not().assertEqual('Uint8ClampedArr');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_3500
     * @tc.name testUint8ClampedArrayPropertiesTwo035
     * @tc.desc Verify BYTES_PER_ELEMENT 1 for all construction methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray(4);
      const a2 = Uint8ClampedArray.of(1, 2);
      const a3 = Uint8ClampedArray.from([1, 2, 3]);
      const a4 = new Uint8ClampedArray(new ArrayBuffer(8));
      expect(a1.BYTES_PER_ELEMENT).assertEqual(1);
      expect(a2.BYTES_PER_ELEMENT).assertEqual(1);
      expect(a3.BYTES_PER_ELEMENT).assertEqual(1);
      expect(a4.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_3600
     * @tc.name testUint8ClampedArrayPropertiesTwo036
     * @tc.desc Verify length property is integer type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      const t: string = typeof arr.length;
      expect(t).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_3700
     * @tc.name testUint8ClampedArrayPropertiesTwo037
     * @tc.desc Verify byteLength property is integer type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      const t: string = typeof arr.byteLength;
      expect(t).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_3800
     * @tc.name testUint8ClampedArrayPropertiesTwo038
     * @tc.desc Verify byteOffset property is integer type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      const t: string = typeof arr.byteOffset;
      expect(t).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_3900
     * @tc.name testUint8ClampedArrayPropertiesTwo039
     * @tc.desc Verify BYTES_PER_ELEMENT property is integer type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      const t: string = typeof arr.BYTES_PER_ELEMENT;
      expect(t).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_4000
     * @tc.name testUint8ClampedArrayPropertiesTwo040
     * @tc.desc Verify name property is string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const t: string = typeof arr.name;
      expect(t).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_4100
     * @tc.name testUint8ClampedArrayPropertiesTwo041
     * @tc.desc Verify buffer property is object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const t: string = typeof arr.buffer;
      expect(t).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_4200
     * @tc.name testUint8ClampedArrayPropertiesTwo042
     * @tc.desc Verify properties unchanged after failed set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.set(10, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_4300
     * @tc.name testUint8ClampedArrayPropertiesTwo043
     * @tc.desc Verify properties unchanged after failed $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.$_set(10, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_4400
     * @tc.name testUint8ClampedArrayPropertiesTwo044
     * @tc.desc Verify subarray on byteOffset view preserves properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Uint8ClampedArray(buf, 4, 8);
      const sub = parent.subarray(2, 5);
      expect(sub.length).assertEqual(3);
      expect(sub.byteOffset).assertEqual(6);
      expect(sub.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_4500
     * @tc.name testUint8ClampedArrayPropertiesTwo045
     * @tc.desc Verify chained subarray byteOffset accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const baseView = new Uint8ClampedArray(buf, 2, 12);
      const firstSub = baseView.subarray(3, 9);
      const secondSub = firstSub.subarray(2, 5);
      expect(secondSub.length).assertEqual(3);
      expect(secondSub.byteOffset).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_4600
     * @tc.name testUint8ClampedArrayPropertiesTwo046
     * @tc.desc Verify empty subarray properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(2, 2);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_4700
     * @tc.name testUint8ClampedArrayPropertiesTwo047
     * @tc.desc Verify slice on byteOffset view has byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Uint8ClampedArray(buf, 4, 8);
      const s = parent.slice(2, 5);
      expect(s.length).assertEqual(3);
      expect(s.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_4800
     * @tc.name testUint8ClampedArrayPropertiesTwo048
     * @tc.desc Verify of result has byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30, 40);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_4900
     * @tc.name testUint8ClampedArrayPropertiesTwo049
     * @tc.desc Verify from result has byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.from([10, 20, 30]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_5000
     * @tc.name testUint8ClampedArrayPropertiesTwo050
     * @tc.desc Verify BYTES_PER_ELEMENT of subarray matches parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub.BYTES_PER_ELEMENT).assertEqual(arr.BYTES_PER_ELEMENT);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_5100
     * @tc.name testUint8ClampedArrayPropertiesTwo051
     * @tc.desc Verify BYTES_PER_ELEMENT of slice matches parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s = arr.slice(1, 4);
      expect(s.BYTES_PER_ELEMENT).assertEqual(arr.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_5200
     * @tc.name testUint8ClampedArrayPropertiesTwo052
     * @tc.desc Verify BYTES_PER_ELEMENT of map matches source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const m = arr.map((x: number) => x);
      expect(m.BYTES_PER_ELEMENT).assertEqual(arr.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_5300
     * @tc.name testUint8ClampedArrayPropertiesTwo053
     * @tc.desc Verify BYTES_PER_ELEMENT of filter matches source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const f = arr.filter((x: number) => x > 1);
      expect(f.BYTES_PER_ELEMENT).assertEqual(arr.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_5400
     * @tc.name testUint8ClampedArrayPropertiesTwo054
     * @tc.desc Verify buffer.byteLength >= byteLength + byteOffset invariant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint8ClampedArray(buf, 8, 16);
      expect(arr.buffer.byteLength).assertLargerOrEqual(arr.byteOffset + arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_5500
     * @tc.name testUint8ClampedArrayPropertiesTwo055
     * @tc.desc Verify name unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const before: string = arr.name;
      arr.set(0, 99);
      expect(arr.name).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_5600
     * @tc.name testUint8ClampedArrayPropertiesTwo056
     * @tc.desc Verify BYTES_PER_ELEMENT unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const before: int = arr.BYTES_PER_ELEMENT;
      arr.set(0, 99);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_5700
     * @tc.name testUint8ClampedArrayPropertiesTwo057
     * @tc.desc Verify name unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const before: string = arr.name;
      arr.fill(0);
      expect(arr.name).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_5800
     * @tc.name testUint8ClampedArrayPropertiesTwo058
     * @tc.desc Verify subarray name matches parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.name).assertEqual(arr.name);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_5900
     * @tc.name testUint8ClampedArrayPropertiesTwo059
     * @tc.desc Verify slice name matches source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = arr.slice(0, 2);
      expect(s.name).assertEqual(arr.name);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_6000
     * @tc.name testUint8ClampedArrayPropertiesTwo060
     * @tc.desc Verify length 0 subarray has byteOffset equal to start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(3, 3);
      expect(sub.length).assertEqual(0);
      expect(sub.byteOffset).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_6100
     * @tc.name testUint8ClampedArrayPropertiesTwo061
     * @tc.desc Verify buffer.byteLength for of result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      expect(arr.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_6200
     * @tc.name testUint8ClampedArrayPropertiesTwo062
     * @tc.desc Verify buffer.byteLength for from result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.from([1, 2, 3]);
      expect(arr.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_6300
     * @tc.name testUint8ClampedArrayPropertiesTwo063
     * @tc.desc Verify buffer.byteLength for subarray shares original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.buffer.byteLength).assertEqual(arr.buffer.byteLength);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_6400
     * @tc.name testUint8ClampedArrayPropertiesTwo064
     * @tc.desc Verify buffer.byteLength for slice result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = arr.slice(0, 2);
      expect(s.buffer.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_6500
     * @tc.name testUint8ClampedArrayPropertiesTwo065
     * @tc.desc Verify buffer.byteLength for map result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const m = arr.map((x: number) => x);
      expect(m.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_6600
     * @tc.name testUint8ClampedArrayPropertiesTwo066
     * @tc.desc Verify buffer.byteLength for filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const f = arr.filter((x: number) => x > 1);
      expect(f.buffer.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_6700
     * @tc.name testUint8ClampedArrayPropertiesTwo067
     * @tc.desc Verify BYTES_PER_ELEMENT on [1] typeof is 'int'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const t: string = typeof arr.BYTES_PER_ELEMENT;
      expect(t).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_6800
     * @tc.name testUint8ClampedArrayPropertiesTwo068
     * @tc.desc Verify BYTES_PER_ELEMENT on [1] value=1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const v: number = arr.BYTES_PER_ELEMENT;
      expect(v).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_6900
     * @tc.name testUint8ClampedArrayPropertiesTwo069
     * @tc.desc Verify buffer.byteLength for new Uint8ClampedArray(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_7000
     * @tc.name testUint8ClampedArrayPropertiesTwo070
     * @tc.desc Verify three views (full, offset, offset+length) from same ArrayBuffer(8) all share same buffer ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw = new ArrayBuffer(8);
      const fullView = new Uint8ClampedArray(raw);
      const viewWithOffset = new Uint8ClampedArray(raw, 2);
      const viewWithOffsetLength = new Uint8ClampedArray(raw, 4, 2);
      expect(fullView.buffer).assertEqual(raw);
      expect(viewWithOffset.buffer).assertEqual(raw);
      expect(viewWithOffsetLength.buffer).assertEqual(raw);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_7100
     * @tc.name testUint8ClampedArrayPropertiesTwo071
     * @tc.desc Verify subarray(1,3) on [1,2,3,4] shares buffer with parent, elements=[2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_7200
     * @tc.name testUint8ClampedArrayPropertiesTwo072
     * @tc.desc Verify nested subarray(1,3) of subarray(1,5) on [1..6] sub1 buffer=parent buffer, elements=[2..5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      const sub1 = arr.subarray(1, 5);
      const sub2 = sub1.subarray(1, 3);
      expect(sub1.length).assertEqual(4);
      expect(sub1.buffer).assertEqual(arr.buffer);
      expect(sub1[0]).assertEqual(2);
      expect(sub1[1]).assertEqual(3);
      expect(sub1[2]).assertEqual(4);
      expect(sub1[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_7300
     * @tc.name testUint8ClampedArrayPropertiesTwo073
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = arr.slice(0, 2);
      expect(s.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_7400
     * @tc.name testUint8ClampedArrayPropertiesTwo074
     * @tc.desc Verify from(Uint8ClampedArray) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const dup = Uint8ClampedArray.from(src);
      expect(dup.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_7500
     * @tc.name testUint8ClampedArrayPropertiesTwo075
     * @tc.desc Verify map buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const m = arr.map((x: number) => x);
      expect(m.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_7600
     * @tc.name testUint8ClampedArrayPropertiesTwo076
     * @tc.desc Verify filter buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const f = arr.filter((x: number) => x > 0);
      expect(f.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_7700
     * @tc.name testUint8ClampedArrayPropertiesTwo077
     * @tc.desc Verify toReversed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed();
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_7800
     * @tc.name testUint8ClampedArrayPropertiesTwo078
     * @tc.desc Verify toSorted buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const s = arr.toSorted();
      expect(s.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_7900
     * @tc.name testUint8ClampedArrayPropertiesTwo079
     * @tc.desc Verify subarray buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(16);
      const sub = arr.subarray(2, 6);
      expect(sub.buffer.byteLength).assertEqual(arr.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_8000
     * @tc.name testUint8ClampedArrayPropertiesTwo080
     * @tc.desc Verify Uint8ClampedArray.from([1..5]) buffer.byteLength=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4, 5];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.buffer.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_8100
     * @tc.name testUint8ClampedArrayPropertiesTwo081
     * @tc.desc Verify byteOffset on Uint8ClampedArray(4) typeof is 'int'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const t: string = typeof arr.byteOffset;
      expect(t).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_8200
     * @tc.name testUint8ClampedArrayPropertiesTwo082
     * @tc.desc Verify Uint8ClampedArray.from([1,2,3]) byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_8300
     * @tc.name testUint8ClampedArrayPropertiesTwo083
     * @tc.desc Verify subarray(2,5) on Uint8ClampedArray(8) byteOffset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      const sub = arr.subarray(2, 5);
      expect(sub.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_8400
     * @tc.name testUint8ClampedArrayPropertiesTwo084
     * @tc.desc Verify subarray(0,2) on view with parent offset=2 has subarray byteOffset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(8), 2, 4);
      const sub = arr.subarray(0, 2);
      expect(sub.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_8500
     * @tc.name testUint8ClampedArrayPropertiesTwo085
     * @tc.desc Verify nested subarray sub2=sub1.subarray(1,3) of subarray(2,6) on arr(8) byteOffset=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      const sub1 = arr.subarray(2, 6);
      const sub2 = sub1.subarray(1, 3);
      expect(sub2.byteOffset).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_8600
     * @tc.name testUint8ClampedArrayPropertiesTwo086
     * @tc.desc Verify slice byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(8), 2, 4);
      const s = arr.slice(1, 3);
      expect(s.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_8700
     * @tc.name testUint8ClampedArrayPropertiesTwo087
     * @tc.desc Verify byteLength on Uint8ClampedArray(4) typeof is 'int'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const t: string = typeof arr.byteLength;
      expect(t).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_8800
     * @tc.name testUint8ClampedArrayPropertiesTwo088
     * @tc.desc Verify new Uint8ClampedArray(buf, 4, 8) on ArrayBuffer(16) byteLength=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(16), 4, 8);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_8900
     * @tc.name testUint8ClampedArrayPropertiesTwo089
     * @tc.desc Verify new Uint8ClampedArray(buf, 4) on ArrayBuffer(16) byteLength derived as 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(16), 4);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_9000
     * @tc.name testUint8ClampedArrayPropertiesTwo090
     * @tc.desc Verify byteLength on new Uint8ClampedArray(ArrayBuffer(16)) equals 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(16));
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_9100
     * @tc.name testUint8ClampedArrayPropertiesTwo091
     * @tc.desc Verify byteLength subarray(2,5) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      const sub = arr.subarray(2, 5);
      expect(sub.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_9200
     * @tc.name testUint8ClampedArrayPropertiesTwo092
     * @tc.desc Verify byteLength subarray(0,0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      const sub = arr.subarray(0, 0);
      expect(sub.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_9300
     * @tc.name testUint8ClampedArrayPropertiesTwo093
     * @tc.desc Verify byteLength slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s = arr.slice(1, 4);
      expect(s.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_9400
     * @tc.name testUint8ClampedArrayPropertiesTwo094
     * @tc.desc Verify length on Uint8ClampedArray(4) typeof is 'int'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const t: string = typeof arr.length;
      expect(t).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_9500
     * @tc.name testUint8ClampedArrayPropertiesTwo095
     * @tc.desc Verify length byteLength (BYTES_PER_ELEMENT=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      expect(arr.length).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_9600
     * @tc.name testUint8ClampedArrayPropertiesTwo096
     * @tc.desc Verify new Uint8ClampedArray(buf, 4, 8) on ArrayBuffer(16) length=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(16), 4, 8);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_TWO_9700
     * @tc.name testUint8ClampedArrayPropertiesTwo097
     * @tc.desc Verify new Uint8ClampedArray(buf, 4) on ArrayBuffer(16) length derived as 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(16), 4);
      expect(arr.length).assertEqual(12);
    });
  });
}
