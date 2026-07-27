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

export default function uint8ClampedArrayFindLast01Test(): void {
  describe('uint8ClampedArrayFindLast01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_0100
     * @tc.name testUint8ClampedArrayFindLastOne001
     * @tc.desc Verify findLast r equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v > 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_0200
     * @tc.name testUint8ClampedArrayFindLastOne002
     * @tc.desc Verify findLast r equals 20 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 20);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_0300
     * @tc.name testUint8ClampedArrayFindLastOne003
     * @tc.desc Verify predicate value + index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => i === 1);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_0400
     * @tc.name testUint8ClampedArrayFindLastOne004
     * @tc.desc Verify findLast r equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === a[i]);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_0500
     * @tc.name testUint8ClampedArrayFindLastOne005
     * @tc.desc Verify findLast r equals 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => true);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_0600
     * @tc.name testUint8ClampedArrayFindLastOne006
     * @tc.desc Verify predicate matches last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_0700
     * @tc.name testUint8ClampedArrayFindLastOne007
     * @tc.desc Verify predicate matches zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_0800
     * @tc.name testUint8ClampedArrayFindLastOne008
     * @tc.desc Verify findLast propagates Error thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { throw new Error('bad'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_0900
     * @tc.name testUint8ClampedArrayFindLastOne009
     * @tc.desc Verify findLast propagates RangeError thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { throw new RangeError('r'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_1000
     * @tc.name testUint8ClampedArrayFindLastOne010
     * @tc.desc Verify findLast propagates TypeError thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { throw new TypeError('t'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_1100
     * @tc.name testUint8ClampedArrayFindLastOne011
     * @tc.desc Verify predicate throws Error and is called only once before throw stops iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      let count = 0;
      try {
        arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { count++; throw new Error('x'); });
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('Error'); }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_1200
     * @tc.name testUint8ClampedArrayFindLastOne012
     * @tc.desc Verify findLast returns 7 when only index 2 matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => {
        if (i === 2) return v === 7;
        return false;
      });
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_1300
     * @tc.name testUint8ClampedArrayFindLastOne013
     * @tc.desc Verify findLast r equals 20 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => (v === 20));
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_1400
     * @tc.name testUint8ClampedArrayFindLastOne014
     * @tc.desc Verify findLast r equals 102 for array [100, 101, 102]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 101, 102]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => i === a.length - 1);
      expect(r).assertEqual(102);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_1500
     * @tc.name testUint8ClampedArrayFindLastOne015
     * @tc.desc Verify findLast r equals 100 for array [100, 101, 102]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 101, 102]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => i === 0);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_1600
     * @tc.name testUint8ClampedArrayFindLastOne016
     * @tc.desc Verify findLast r equals 101 for array [100, 101, 102]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 101, 102]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => i === 1);
      expect(r).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_1700
     * @tc.name testUint8ClampedArrayFindLastOne017
     * @tc.desc Verify findLast r equals 5 for array [5, 10, 5, 10, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 5, 10, 5]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 5);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_1800
     * @tc.name testUint8ClampedArrayFindLastOne018
     * @tc.desc Verify findLast records index 3 for the last matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 5, 10, 5]);
      let foundIdx = -1;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => {
        if (v === 10) { foundIdx = i; return true; }
        return false;
      });
      expect(foundIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_1900
     * @tc.name testUint8ClampedArrayFindLastOne019
     * @tc.desc Verify findLast r equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let same = false;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { same = (a === arr); return a === arr; });
      expect(r).assertEqual(3);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_2000
     * @tc.name testUint8ClampedArrayFindLastOne020
     * @tc.desc Verify findLast r equals 5 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let len = 0;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { len = a.length; return a.length === 5; });
      expect(r).assertEqual(5);
      expect(len).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_2100
     * @tc.name testUint8ClampedArrayFindLastOne021
     * @tc.desc Verify findLast r equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let outer = 100;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v < outer);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_2200
     * @tc.name testUint8ClampedArrayFindLastOne022
     * @tc.desc Verify findLast r equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let calls = 0;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return i === 0; });
      expect(r).assertEqual(1);
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_2300
     * @tc.name testUint8ClampedArrayFindLastOne023
     * @tc.desc Verify findLast calls equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let calls = 0;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return v === 4; });
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_2400
     * @tc.name testUint8ClampedArrayFindLastOne024
     * @tc.desc Verify predicate v % 2 === 0 returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 4, 6, 1]);
      let calls = 0;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return (v % 2) === 0; });
      expect(r).assertEqual(6);
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_2500
     * @tc.name testUint8ClampedArrayFindLastOne025
     * @tc.desc Verify predicate v % 2 === 0 calls 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 4, 6, 1]);
      let calls = 0;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return (v % 2) === 0; });
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_2600
     * @tc.name testUint8ClampedArrayFindLastOne026
     * @tc.desc Verify findLast r equals 30 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let firstIdx = -1;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { if (firstIdx === -1) firstIdx = i; return i === 2; });
      expect(r).assertEqual(30);
      expect(firstIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_2700
     * @tc.name testUint8ClampedArrayFindLastOne027
     * @tc.desc Verify findLast r equals 10 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let lastIdx = -1;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { lastIdx = i; return i === 0; });
      expect(r).assertEqual(10);
      expect(lastIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_2800
     * @tc.name testUint8ClampedArrayFindLastOne028
     * @tc.desc Verify findLast r equals 10 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const indexes: number[] = [];
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { indexes.push(i); return i === 0; });
      expect(r).assertEqual(10);
      expect(indexes.length).assertEqual(4);
      expect(indexes[0]).assertEqual(3);
      expect(indexes[1]).assertEqual(2);
      expect(indexes[2]).assertEqual(1);
      expect(indexes[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_2900
     * @tc.name testUint8ClampedArrayFindLastOne029
     * @tc.desc Verify findLast element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(r).assertEqual(2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_3000
     * @tc.name testUint8ClampedArrayFindLastOne030
     * @tc.desc Verify findLast element at arr[1] equals 2 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(r).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_3100
     * @tc.name testUint8ClampedArrayFindLastOne031
     * @tc.desc Verify findLast element at arr[2] equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(r).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_3200
     * @tc.name testUint8ClampedArrayFindLastOne032
     * @tc.desc Verify findLast idx equals 4 for array [0, 1, 0, 1, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 0, 1, 0]);
      let idx = -1;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { if (v === 0) { idx = i; return true; } return false; });
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_3300
     * @tc.name testUint8ClampedArrayFindLastOne033
     * @tc.desc Verify findLast r equals 2 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_3400
     * @tc.name testUint8ClampedArrayFindLastOne034
     * @tc.desc Verify findLast r equals 255 for array [100, 200, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 255]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v >= 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_3500
     * @tc.name testUint8ClampedArrayFindLastOne035
     * @tc.desc Verify findLast r equals 0 for array [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_3600
     * @tc.name testUint8ClampedArrayFindLastOne036
     * @tc.desc Verify findLast r equals 0 for array [3, 0, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 0, 5]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_3700
     * @tc.name testUint8ClampedArrayFindLastOne037
     * @tc.desc Verify findLast r equals 255 for array [1, 255, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 255, 2]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_3800
     * @tc.name testUint8ClampedArrayFindLastOne038
     * @tc.desc Verify findLast r equals 255 for array [1, 256, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 256, 2]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_3900
     * @tc.name testUint8ClampedArrayFindLastOne039
     * @tc.desc Verify findLast r equals 0 for array [5, -1, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, -1, 7]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_4000
     * @tc.name testUint8ClampedArrayFindLastOne040
     * @tc.desc Verify findLast r equals 0 for array [1, Number.NaN, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, Number.NaN, 2]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_4100
     * @tc.name testUint8ClampedArrayFindLastOne041
     * @tc.desc Verify findLast r equals 255 for array [1, Number.POSITIVE_INFINITY, 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, Number.POSITIVE_INFINITY, 2]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_4200
     * @tc.name testUint8ClampedArrayFindLastOne042
     * @tc.desc Verify findLast r equals 0 for array [1, -Number.POSITIVE_INFINITY,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, -Number.POSITIVE_INFINITY, 2]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_4300
     * @tc.name testUint8ClampedArrayFindLastOne043
     * @tc.desc Verify findLast r equals 127 for array [100, 127, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 127, 200]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 127);
      expect(r).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_4400
     * @tc.name testUint8ClampedArrayFindLastOne044
     * @tc.desc Verify findLast r equals 128 for array [100, 128, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 128, 200]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 128);
      expect(r).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_4500
     * @tc.name testUint8ClampedArrayFindLastOne045
     * @tc.desc Verify findLast r equals 128 for array [100, 127.5, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 127.5, 200]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 128);
      expect(r).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_4600
     * @tc.name testUint8ClampedArrayFindLastOne046
     * @tc.desc Verify findLast r equals 128 for array [100, 128.5, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 128.5, 200]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 128);
      expect(r).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_4700
     * @tc.name testUint8ClampedArrayFindLastOne047
     * @tc.desc Verify findLast r equals 0 for array [0.4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.4]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_4800
     * @tc.name testUint8ClampedArrayFindLastOne048
     * @tc.desc Verify findLast r equals 0 for array [0.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_4900
     * @tc.name testUint8ClampedArrayFindLastOne049
     * @tc.desc Verify findLast r equals 1 for array [0.9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.9]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_5000
     * @tc.name testUint8ClampedArrayFindLastOne050
     * @tc.desc Verify findLast r equals 255 for array [1, 1e9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 1e9]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_5100
     * @tc.name testUint8ClampedArrayFindLastOne051
     * @tc.desc Verify findLast r equals 0 for array [1, -1e9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, -1e9]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_5200
     * @tc.name testUint8ClampedArrayFindLastOne052
     * @tc.desc Verify findLast r equals 255 for array [1, 2147483648]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2147483648]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_5300
     * @tc.name testUint8ClampedArrayFindLastOne053
     * @tc.desc Verify findLast r equals 0 for array [1, -0, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, -0, 2]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_5400
     * @tc.name testUint8ClampedArrayFindLastOne054
     * @tc.desc Verify findLast r equals 0 for array [1, 0x00, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 0x00, 2]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_5500
     * @tc.name testUint8ClampedArrayFindLastOne055
     * @tc.desc Verify findLast r equals 255 for array [1, 0xFF, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 0xFF, 2]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_5600
     * @tc.name testUint8ClampedArrayFindLastOne056
     * @tc.desc Verify findLast r equals 255 for array [1, 0b11111111]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 0b11111111]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_5700
     * @tc.name testUint8ClampedArrayFindLastOne057
     * @tc.desc Verify findLast r equals 255 for array [1, 0o377]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 0o377]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_5800
     * @tc.name testUint8ClampedArrayFindLastOne058
     * @tc.desc Verify findLast r equals 100 for array [1, 1e2, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 1e2, 2]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 100);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_5900
     * @tc.name testUint8ClampedArrayFindLastOne059
     * @tc.desc Verify findLast predicate call on one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      let called = false;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { called = true; return v === 1; });
      expect(r).assertEqual(1);
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_6000
     * @tc.name testUint8ClampedArrayFindLastOne060
     * @tc.desc Verify findLast r equals 1 for array [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => true);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_6100
     * @tc.name testUint8ClampedArrayFindLastOne061
     * @tc.desc Verify findLast r equals 42 for array [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 42);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_6200
     * @tc.name testUint8ClampedArrayFindLastOne062
     * @tc.desc Verify findLast r equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(r).assertEqual(3);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_6300
     * @tc.name testUint8ClampedArrayFindLastOne063
     * @tc.desc Verify predicate v === 7 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7]);
      let idx = -1;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { if (v === 7) { idx = i; return true; } return false; });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_6400
     * @tc.name testUint8ClampedArrayFindLastOne064
     * @tc.desc Verify predicate v === 10 returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 10);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_6500
     * @tc.name testUint8ClampedArrayFindLastOne065
     * @tc.desc Verify 256-length array findLast v === 200 returns 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const arr = new Uint8ClampedArray(buf);
      arr[255] = 200;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 200);
      expect(r).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_6600
     * @tc.name testUint8ClampedArrayFindLastOne066
     * @tc.desc Verify 256 0 findLast predicate 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const arr = new Uint8ClampedArray(buf);
      let calls = 0;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return i === 0; });
      expect(r).assertEqual(0);
      expect(calls).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_6700
     * @tc.name testUint8ClampedArrayFindLastOne067
     * @tc.desc Verify 1024-length array findLast v === 9 calls 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      arr[1023] = 9;
      let calls = 0;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return v === 9; });
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_6800
     * @tc.name testUint8ClampedArrayFindLastOne068
     * @tc.desc Verify 1024-length array findLast v === 9 calls 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 9;
      let calls = 0;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return v === 9; });
      expect(calls).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_6900
     * @tc.name testUint8ClampedArrayFindLastOne069
     * @tc.desc Verify 65535-length array findLast v === 200 returns 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(65535);
      const arr = new Uint8ClampedArray(buf);
      arr[65534] = 200;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 200);
      expect(r).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_7000
     * @tc.name testUint8ClampedArrayFindLastOne070
     * @tc.desc Verify Uint8ClampedArray.of findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 20);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_7100
     * @tc.name testUint8ClampedArrayFindLastOne071
     * @tc.desc Verify findLast r equals 50 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 0, 4);
      arr[2] = 50;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 50);
      expect(r).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_7200
     * @tc.name testUint8ClampedArrayFindLastOne072
     * @tc.desc Verify subarray r equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      const r = sub.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_7300
     * @tc.name testUint8ClampedArrayFindLastOne073
     * @tc.desc Verify subarray element at parent[1] equals 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      sub.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(parent[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_7400
     * @tc.name testUint8ClampedArrayFindLastOne074
     * @tc.desc Verify findLast predicate array sub parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      let seenArr: Uint8ClampedArray | null = null;
      const r = sub.findLast((v: number, i: int, a: Uint8ClampedArray) => { seenArr = a; return a === sub; });
      expect(r).assertEqual(4);
      expect(seenArr).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_7500
     * @tc.name testUint8ClampedArrayFindLastOne075
     * @tc.desc Verify findLast r equals 9 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 3, 1);
      arr[0] = 9;
      let called = false;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { called = true; return v === 9; });
      expect(r).assertEqual(9);
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_7600
     * @tc.name testUint8ClampedArrayFindLastOne076
     * @tc.desc Verify Uint8ClampedArray.from r equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const dst = Uint8ClampedArray.from(src);
      const r = dst.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_7700
     * @tc.name testUint8ClampedArrayFindLastOne077
     * @tc.desc Verify findLast r equals 3 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v > 1 && i < 3);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_7800
     * @tc.name testUint8ClampedArrayFindLastOne078
     * @tc.desc Verify findLast r equals 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 1 || v === 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_7900
     * @tc.name testUint8ClampedArrayFindLastOne079
     * @tc.desc Verify findLast r equals 5 for array [2, 3, 4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 3, 4, 5, 6]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => (v % 2) === 1);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_8000
     * @tc.name testUint8ClampedArrayFindLastOne080
     * @tc.desc Verify findLast r equals 6 for array [2, 3, 4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 3, 4, 5, 6]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => (v % 2) === 0);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_8100
     * @tc.name testUint8ClampedArrayFindLastOne081
     * @tc.desc Verify findLast r equals 200 for array [50, 150, 60, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 150, 60, 200]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v > 100);
      expect(r).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_8200
     * @tc.name testUint8ClampedArrayFindLastOne082
     * @tc.desc Verify findLast r equals 8 for array [5, 100, 8, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 100, 8, 200]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v < 10);
      expect(r).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_8300
     * @tc.name testUint8ClampedArrayFindLastOne083
     * @tc.desc Verify findLast r equals 80 for array [10, 60, 200, 80]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 60, 200, 80]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v >= 50 && v <= 100);
      expect(r).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_8400
     * @tc.name testUint8ClampedArrayFindLastOne084
     * @tc.desc Verify findLast r equals 8 for array [1, 2, 4, 8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 4, 8]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => (v & 1) === 0);
      expect(r).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_8500
     * @tc.name testUint8ClampedArrayFindLastOne085
     * @tc.desc Verify findLast r equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let sumLen = 0;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { sumLen += a.length; return i === 0; });
      expect(r).assertEqual(1);
      expect(sumLen).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_8600
     * @tc.name testUint8ClampedArrayFindLastOne086
     * @tc.desc Verify findLast r equals 5 for array [5, 6, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      let lastRead: number = 0.0;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { lastRead = a[0] ?? 0.0; return i === 0; });
      expect(r).assertEqual(5);
      expect(lastRead).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_8700
     * @tc.name testUint8ClampedArrayFindLastOne087
     * @tc.desc Verify findLast observes a mutation to value 99 during reverse traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => {
        if (i === 3) arr[0] = 99;
        return v === 99;
      });
      expect(r).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_8800
     * @tc.name testUint8ClampedArrayFindLastOne088
     * @tc.desc Verify findLast r equals 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { if (i === 3) arr[3] = 99; return i === 3; });
      expect(r).assertEqual(4);
      expect(arr[3]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_8900
     * @tc.name testUint8ClampedArrayFindLastOne089
     * @tc.desc Verify findLast returns 2 when compared with a nested findLast result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => {
        const inner = a.findLast((vv: number, ii: int, aa: Uint8ClampedArray) => vv === 2);
        return v === inner;
      });
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_9000
     * @tc.name testUint8ClampedArrayFindLastOne090
     * @tc.desc Verify predicate v === 10 first element returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 10);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_9100
     * @tc.name testUint8ClampedArrayFindLastOne091
     * @tc.desc Verify findLast r equals 1 for array [1, 2, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 1, 2]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_9200
     * @tc.name testUint8ClampedArrayFindLastOne092
     * @tc.desc Verify findLast r equals 255 for array [255, 255, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_ONE_9300
     * @tc.name testUint8ClampedArrayFindLastOne093
     * @tc.desc Verify findLast yields length 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let calls: int = 0;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return v === 2; });
      expect(r).assertEqual(2);
      expect(calls).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });
  });
}
