'use static'
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

export default function uint8ClampedArrayFrom02Test(): void {
  describe('uint8ClampedArrayFrom02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_0100
     * @tc.name testUint8ClampedArrayFromTwo001
     * @tc.desc Verify Uint8ClampedArray.from yields byteOffset 0 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_0200
     * @tc.name testUint8ClampedArrayFromTwo002
     * @tc.desc Verify Uint8ClampedArray.from yields byteLength 5 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4, 5];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_0300
     * @tc.name testUint8ClampedArrayFromTwo003
     * @tc.desc Verify Uint8ClampedArray.from([1,2,3]) produces correct length, byteLength and elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_0400
     * @tc.name testUint8ClampedArrayFromTwo004
     * @tc.desc Verify Uint8ClampedArray.from element at src[0] equals 1 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8ClampedArray.from(src);
      arr[0] = 99;
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_0500
     * @tc.name testUint8ClampedArrayFromTwo005
     * @tc.desc Verify Uint8ClampedArray.from element at src[0] equals 10.0 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10.0, 20.0];
      const arr = Uint8ClampedArray.from(src);
      arr[0] = 88;
      expect(src[0]).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_0600
     * @tc.name testUint8ClampedArrayFromTwo006
     * @tc.desc Verify Uint8ClampedArray.from yields length set.size for from(set)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0); set.add(2.0); set.add(3.0);
      const arr = Uint8ClampedArray.from(set);
      expect(arr.length).assertEqual(set.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_0700
     * @tc.name testUint8ClampedArrayFromTwo007
     * @tc.desc Verify two from(src) calls produce distinct array objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const a1 = Uint8ClampedArray.from(src);
      const a2 = Uint8ClampedArray.from(src);
      expect(a1).not().assertEqual(a2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_0800
     * @tc.name testUint8ClampedArrayFromTwo008
     * @tc.desc Verify Uint8ClampedArray.from element at a1[0] equals a2[0] for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const a1 = Uint8ClampedArray.from(src);
      const a2 = Uint8ClampedArray.from(src);
      expect(a1[0]).assertEqual(a2[0]);
      expect(a1[1]).assertEqual(a2[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_0900
     * @tc.name testUint8ClampedArrayFromTwo009
     * @tc.desc Verify Uint8ClampedArray.from propagates Error thrown by mapfn on second call for Set input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0); set.add(2.0);
      try {
        Uint8ClampedArray.from(set, (v: number, k: number): number => {
          if (k === 1) {
            throw new Error('second call');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_1000
     * @tc.name testUint8ClampedArrayFromTwo010
     * @tc.desc Verify Uint8ClampedArray.from propagates Error thrown by mapfn on first call for Set input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0); set.add(2.0); set.add(3.0);
      let called: int = 0;
      try {
        Uint8ClampedArray.from(set, (v: number, k: number): number => {
          called = called + 1;
          throw new Error('stop');
        });
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('Error'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_1100
     * @tc.name testUint8ClampedArrayFromTwo011
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [99999];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_1200
     * @tc.name testUint8ClampedArrayFromTwo012
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [300.7];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_1300
     * @tc.name testUint8ClampedArrayFromTwo013
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1000000];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_1400
     * @tc.name testUint8ClampedArrayFromTwo014
     * @tc.desc Verify Iterable<number> NaN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(Number.NaN);
      set.add(100.0);
      const arr = Uint8ClampedArray.from(set);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_1500
     * @tc.name testUint8ClampedArrayFromTwo015
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => 1e10);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_1600
     * @tc.name testUint8ClampedArrayFromTwo016
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => -1e10);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_1700
     * @tc.name testUint8ClampedArrayFromTwo017
     * @tc.desc Verify Uint8ClampedArray.from(Set{1,2}) produces correct length, byteLength and elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0); set.add(2.0);
      const arr = Uint8ClampedArray.from(set);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_1800
     * @tc.name testUint8ClampedArrayFromTwo018
     * @tc.desc Verify from(ArrayLike<number> [10,20]) produces correct length, byteLength and elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(2);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_1900
     * @tc.name testUint8ClampedArrayFromTwo019
     * @tc.desc Verify Uint8ClampedArray.from yields byteOffset 0 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const arr = Uint8ClampedArray.from(parent);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_2000
     * @tc.name testUint8ClampedArrayFromTwo020
     * @tc.desc Verify Uint8ClampedArray.from yields byteLength parent.byteLength for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const arr = Uint8ClampedArray.from(parent);
      expect(arr.byteLength).assertEqual(parent.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_2100
     * @tc.name testUint8ClampedArrayFromTwo021
     * @tc.desc Verify from(subarray) produces independent buffer from parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      const arr = Uint8ClampedArray.from(sub);
      expect(arr.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_TWO_2200
     * @tc.name testUint8ClampedArrayFromTwo022
     * @tc.desc Verify from Uint8ClampedArray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30]);
      const arr = Uint8ClampedArray.from(parent);
      parent[1] = 99;
      expect(arr[1]).assertEqual(20);
    });
  });
}
