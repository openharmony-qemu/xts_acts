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

export default function uint8ClampedArrayFull10Test(): void {
  describe('uint8ClampedArrayFull10Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_0100
     * @tc.name testUint8ClampedArrayFullTen001
     * @tc.desc Verify toLocaleString returns expected string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2]);
      const r = a.toLocaleString();
      expect(r).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_0200
     * @tc.name testUint8ClampedArrayFullTen002
     * @tc.desc Verify a full slice remains unchanged after the source is mutated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const s = a.slice();
      a[0] = 9;
      expect(s[0]).assertEqual(1);
      expect(s[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_0300
     * @tc.name testUint8ClampedArrayFullTen003
     * @tc.desc Verify fill r equals a for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3);
      const r = a.fill(5);
      expect(r).assertEqual(a);
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(5);
      expect(r[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_0400
     * @tc.name testUint8ClampedArrayFullTen004
     * @tc.desc Verify reverse r equals a for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const r = a.reverse();
      expect(r).assertEqual(a);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_0500
     * @tc.name testUint8ClampedArrayFullTen005
     * @tc.desc Verify sort r equals a for array [3, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([3, 1, 2]);
      const r = a.sort();
      expect(r).assertEqual(a);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_0600
     * @tc.name testUint8ClampedArrayFullTen006
     * @tc.desc Verify copyWithin r equals a for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const r = a.copyWithin(0, 1);
      expect(r).assertEqual(a);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_0700
     * @tc.name testUint8ClampedArrayFullTen007
     * @tc.desc Verify constructor r equals a for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const b = a;
      const r = a.valueOf();
      expect(r).assertEqual(a);
      expect(b).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_0800
     * @tc.name testUint8ClampedArrayFullTen008
     * @tc.desc Verify constructing length-4 array yields BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(4);
      expect(a.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_0900
     * @tc.name testUint8ClampedArrayFullTen009
     * @tc.desc Verify constructing 7-element array yields byteLength 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(7);
      expect(a.byteLength).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_1000
     * @tc.name testUint8ClampedArrayFullTen010
     * @tc.desc Verify constructing length-4 array yields byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(4);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_1100
     * @tc.name testUint8ClampedArrayFullTen011
     * @tc.desc Verify subarray yields byteOffset 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = a.subarray(2, 4);
      expect(s.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_1200
     * @tc.name testUint8ClampedArrayFullTen012
     * @tc.desc Verify includes result is true for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      expect(a.includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_1300
     * @tc.name testUint8ClampedArrayFullTen013
     * @tc.desc Verify some behavior for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(0);
      expect(a.some((_v: number, _i: int, _a: Uint8ClampedArray): boolean => true)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_1400
     * @tc.name testUint8ClampedArrayFullTen014
     * @tc.desc Verify find behavior for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(0);
      expect(a.find((_v: number, _i: int, _a: Uint8ClampedArray): boolean => true)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_1500
     * @tc.name testUint8ClampedArrayFullTen015
     * @tc.desc Verify findIndex behavior for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(0);
      expect(a.findIndex((_v: number, _i: int, _a: Uint8ClampedArray): boolean => true)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_1600
     * @tc.name testUint8ClampedArrayFullTen016
     * @tc.desc Verify includes result is false for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(0);
      expect(a.includes(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_1700
     * @tc.name testUint8ClampedArrayFullTen017
     * @tc.desc Verify join a.join(',') equals '' for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(0);
      expect(a.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_1800
     * @tc.name testUint8ClampedArrayFullTen018
     * @tc.desc Verify toString a.toString() equals '' for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(0);
      expect(a.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_1900
     * @tc.name testUint8ClampedArrayFullTen019
     * @tc.desc Verify reduce initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(0);
      try {
        a.reduce((acc: number, cur: number): number => acc + cur);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_2000
     * @tc.name testUint8ClampedArrayFullTen020
     * @tc.desc Verify reduceRight initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(0);
      try {
        a.reduceRight((acc: number, cur: number): number => acc + cur);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_2100
     * @tc.name testUint8ClampedArrayFullTen021
     * @tc.desc Verify set offset+length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3);
      const src: Array<number> = [1, 2, 3];
      try {
        a.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_2200
     * @tc.name testUint8ClampedArrayFullTen022
     * @tc.desc Verify forEach propagates Error thrown by its callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      try {
        a.forEach((_v: number, _i: int, _a: Uint8ClampedArray): void => { throw new Error('fe'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_2300
     * @tc.name testUint8ClampedArrayFullTen023
     * @tc.desc Verify copyWithin element at a[2] equals 255 for length-4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(4);
      a[0] = 1000;
      a[1] = -5;
      a.copyWithin(2, 0, 2);
      expect(a[2]).assertEqual(255);
      expect(a[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_2400
     * @tc.name testUint8ClampedArrayFullTen024
     * @tc.desc Verify sort element at a[0] equals 0 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3);
      a[0] = 300;
      a[1] = 100;
      a[2] = -10;
      a.sort();
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_2500
     * @tc.name testUint8ClampedArrayFullTen025
     * @tc.desc Verify subarray buffer reference matches for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s1 = a.subarray(1, 5);
      const s2 = s1.subarray(0, 2);
      expect(s2.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_2600
     * @tc.name testUint8ClampedArrayFullTen026
     * @tc.desc Verify subarray element at a[1] equals 99 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s1 = a.subarray(1, 5);
      const s2 = s1.subarray(0, 2);
      s2[0] = 99;
      expect(a[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_2700
     * @tc.name testUint8ClampedArrayFullTen027
     * @tc.desc Verify subarray element at a[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = a.subarray(0, 2);
      const sli = sub.slice();
      sli[0] = 88;
      expect(a[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_2800
     * @tc.name testUint8ClampedArrayFullTen028
     * @tc.desc Verify constructor element [0] equals 11 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const firstView = new Uint8ClampedArray(buf, 0, 2);
      const secondView = new Uint8ClampedArray(buf, 2, 2);
      firstView[0] = 11;
      secondView[1] = 44;
      const all = new Uint8ClampedArray(buf);
      expect(all[0]).assertEqual(11);
      expect(all[3]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_2900
     * @tc.name testUint8ClampedArrayFullTen029
     * @tc.desc Verify subarray.byteOffset parent.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Uint8ClampedArray(buf, 2, 6);
      const s = a.subarray(1, 4);
      expect(s.byteOffset).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_3000
     * @tc.name testUint8ClampedArrayFullTen030
     * @tc.desc Verify constructing ArrayBuffer-backed array yields byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8ClampedArray(buf, 2, 4);
      expect(a.buffer.byteLength).assertEqual(16);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_3100
     * @tc.name testUint8ClampedArrayFullTen031
     * @tc.desc Verify of(127.5) half-even rounding 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(127.5);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_3200
     * @tc.name testUint8ClampedArrayFullTen032
     * @tc.desc Verify of(128.5) half-even rounding 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(128.5);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_3300
     * @tc.name testUint8ClampedArrayFullTen033
     * @tc.desc Verify of(0.5) half-even rounding 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(0.5);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_3400
     * @tc.name testUint8ClampedArrayFullTen034
     * @tc.desc Verify of(0.9) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(0.9);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_3500
     * @tc.name testUint8ClampedArrayFullTen035
     * @tc.desc Verify of(0.4) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(0.4);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_3600
     * @tc.name testUint8ClampedArrayFullTen036
     * @tc.desc Verify of(1e9) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1e9);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_3700
     * @tc.name testUint8ClampedArrayFullTen037
     * @tc.desc Verify of(-1e9) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(-1e9);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_3800
     * @tc.name testUint8ClampedArrayFullTen038
     * @tc.desc Verify of(Number.MAX_VALUE) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(Number.MAX_VALUE);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_TEN_3900
     * @tc.name testUint8ClampedArrayFullTen039
     * @tc.desc Verify of(-Infinity) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullTen039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(-Number.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(0);
    });
  });
}
