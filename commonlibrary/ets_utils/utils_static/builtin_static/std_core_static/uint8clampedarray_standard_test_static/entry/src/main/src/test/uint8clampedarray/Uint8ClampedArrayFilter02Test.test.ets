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

export default function uint8ClampedArrayFilter02Test(): void {
  describe('uint8ClampedArrayFilter02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_0100
     * @tc.name testUint8ClampedArrayFilterTwo001
     * @tc.desc Verify filter propagates TypeError thrown by the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.filter((v: number, i: int, a: Uint8ClampedArray) => { throw new TypeError('bad type'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_0200
     * @tc.name testUint8ClampedArrayFilterTwo002
     * @tc.desc Verify filter propagates RangeError thrown by the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.filter((v: number, i: int, a: Uint8ClampedArray) => { throw new RangeError('oor'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_0300
     * @tc.name testUint8ClampedArrayFilterTwo003
     * @tc.desc Verify filter yields length 3 for array [0, 1, 2, 0, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2, 0, 3]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v > 0);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_0400
     * @tc.name testUint8ClampedArrayFilterTwo004
     * @tc.desc Verify filter reads mutated value when callback modifies source array mid-iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => { if (i === 0) a[1] = 99; return v >= 50; });
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_0500
     * @tc.name testUint8ClampedArrayFilterTwo005
     * @tc.desc Verify filter yields length 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v > 1)
                  .filter((v: number, i: int, a: Uint8ClampedArray) => v < 5);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_0600
     * @tc.name testUint8ClampedArrayFilterTwo006
     * @tc.desc Verify filter yields length 0 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v > 1)
                  .filter((v: number, i: int, a: Uint8ClampedArray) => v > 10);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_0700
     * @tc.name testUint8ClampedArrayFilterTwo007
     * @tc.desc Verify filter map() adds 10 to first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      const mapped = r.map((v: number, i: int, a: Uint8ClampedArray) => v + 10);
      expect(mapped[0]).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_0800
     * @tc.name testUint8ClampedArrayFilterTwo008
     * @tc.desc Verify filter accumulated sum equals 12 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 3);
      const sum = r.reduce((acc: number, v: number) => acc + v, 0);
      expect(sum).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_0900
     * @tc.name testUint8ClampedArrayFilterTwo009
     * @tc.desc Verify filter accumulated sum equals 50 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 20);
      let sum = 0;
      r.forEach((v: number) => { sum += v; });
      expect(sum).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_1000
     * @tc.name testUint8ClampedArrayFilterTwo010
     * @tc.desc Verify filter r.join(',') equals '2,3,4' for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      expect(r.join(',')).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_1100
     * @tc.name testUint8ClampedArrayFilterTwo011
     * @tc.desc Verify filter r.join(',') equals '' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => false);
      expect(r.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_1200
     * @tc.name testUint8ClampedArrayFilterTwo012
     * @tc.desc Verify subarray(0, 2) on filter result yields length 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      const sub = r.subarray(0, 2);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_1300
     * @tc.name testUint8ClampedArrayFilterTwo013
     * @tc.desc Verify filter iterator value is 20 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 20);
      const it = r.values();
      const first = it.next();
      expect(first.value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_1400
     * @tc.name testUint8ClampedArrayFilterTwo014
     * @tc.desc Verify filter iterator is done after consuming last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 5);
      const it = r.values();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_1500
     * @tc.name testUint8ClampedArrayFilterTwo015
     * @tc.desc Verify filter accumulated sum equals 9 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      let sum = 0;
      for (const v of r) { sum += v; }
      expect(sum).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_1600
     * @tc.name testUint8ClampedArrayFilterTwo016
     * @tc.desc Verify filter r.indexOf(3) equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      expect(r.indexOf(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_1700
     * @tc.name testUint8ClampedArrayFilterTwo017
     * @tc.desc Verify filter returns correct length and elements for predicate v >= 2 on [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_1800
     * @tc.name testUint8ClampedArrayFilterTwo018
     * @tc.desc Verify chained filter produces independent backing buffer for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r1 = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      const r2 = r1.filter((v: number, i: int, a: Uint8ClampedArray) => v <= 3);
      expect(r2.buffer).not().assertEqual(r1.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_1900
     * @tc.name testUint8ClampedArrayFilterTwo019
     * @tc.desc Verify some finds value 3 in the filtered result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      expect(r.some((v: number) => v === 3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_2000
     * @tc.name testUint8ClampedArrayFilterTwo020
     * @tc.desc Verify every confirms all filtered values are at least 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      expect(r.every((v: number) => v >= 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_2100
     * @tc.name testUint8ClampedArrayFilterTwo021
     * @tc.desc Verify find returns value 4 from the filtered result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      expect(r.find((v: number) => v === 4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_2200
     * @tc.name testUint8ClampedArrayFilterTwo022
     * @tc.desc Verify find returns undefined when filter rejects every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => false);
      expect(r.find((v: number) => v > 0)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_2300
     * @tc.name testUint8ClampedArrayFilterTwo023
     * @tc.desc Verify filter r.at(0) equals 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      expect(r.at(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_2400
     * @tc.name testUint8ClampedArrayFilterTwo024
     * @tc.desc Verify filter r.at(-1) equals 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      expect(r.at(-1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_2500
     * @tc.name testUint8ClampedArrayFilterTwo025
     * @tc.desc Verify filter then slice produces independent backing buffer for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, a: Uint8ClampedArray) => v >= 2);
      const s = r.slice(0);
      expect(s.buffer).not().assertEqual(r.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILTER_TWO_2600
     * @tc.name testUint8ClampedArrayFilterTwo026
     * @tc.desc Verify filter predicate v % 20 === 0 first value 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFilterTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const fn = (v: number, i: int, a: Uint8ClampedArray): boolean => v % 20 === 0;
      const r = arr.filter(fn);
      expect(r[0]).assertEqual(20);
    });
  });
}
