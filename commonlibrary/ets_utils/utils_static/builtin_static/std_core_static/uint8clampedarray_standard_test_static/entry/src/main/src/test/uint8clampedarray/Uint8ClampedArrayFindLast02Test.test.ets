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

export default function uint8ClampedArrayFindLast02Test(): void {
  describe('uint8ClampedArrayFindLast02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_0100
     * @tc.name testUint8ClampedArrayFindLastTwo001
     * @tc.desc Verify findLast buffer reference matches for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const b1 = arr.buffer;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(r).assertEqual(3);
      expect(arr.buffer).assertEqual(b1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_0200
     * @tc.name testUint8ClampedArrayFindLastTwo002
     * @tc.desc Verify findLast yields byteOffset 2 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_0300
     * @tc.name testUint8ClampedArrayFindLastTwo003
     * @tc.desc Verify predicate throws Error is caught with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_0400
     * @tc.name testUint8ClampedArrayFindLastTwo004
     * @tc.desc Verify findLast propagates Error on the second reverse callback invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let calls = 0;
      try {
        arr.findLast((v: number, i: int, a: Uint8ClampedArray) => {
          calls++;
          if (i === 2) throw new Error('x');
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_0500
     * @tc.name testUint8ClampedArrayFindLastTwo005
     * @tc.desc Verify findLast propagates Error on the first reverse callback invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let calls = 0;
      try {
        arr.findLast((v: number, i: int, a: Uint8ClampedArray) => {
          calls++;
          throw new Error('imm');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_0600
     * @tc.name testUint8ClampedArrayFindLastTwo006
     * @tc.desc Verify findLast preserves the first element when its callback throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      try {
        arr.findLast((v: number, i: int, a: Uint8ClampedArray) => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_0700
     * @tc.name testUint8ClampedArrayFindLastTwo007
     * @tc.desc Verify findLast propagates Error thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { throw new Error('str-err'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_0800
     * @tc.name testUint8ClampedArrayFindLastTwo008
     * @tc.desc Verify findLast exposes the original array length before callback failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let seenLen = 0;
      try {
        arr.findLast((v: number, i: int, a: Uint8ClampedArray) => {
          seenLen = a.length;
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(seenLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_0900
     * @tc.name testUint8ClampedArrayFindLastTwo009
     * @tc.desc Verify findLast calls equals 1 for array [1, 2, 3, 99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 99]);
      let calls = 0;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return v === 99; });
      expect(r).assertEqual(99);
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_1000
     * @tc.name testUint8ClampedArrayFindLastTwo010
     * @tc.desc Verify findLast calls equals 2 for array [1, 2, 99, 100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 99, 100]);
      let calls = 0;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return v === 99; });
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_1100
     * @tc.name testUint8ClampedArrayFindLastTwo011
     * @tc.desc Verify findLast calls equals 3 for array [1, 99, 100, 101]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 99, 100, 101]);
      let calls = 0;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return v === 99; });
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_1200
     * @tc.name testUint8ClampedArrayFindLastTwo012
     * @tc.desc Verify findLast calls equals 4 for array [99, 1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 1, 2, 3]);
      let calls = 0;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return v === 99; });
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_1300
     * @tc.name testUint8ClampedArrayFindLastTwo013
     * @tc.desc Verify findLast last key equals 1 for array [7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7]);
      let lastIdx = -1;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { if (v === 7) { lastIdx = i; return true; } return false; });
      expect(lastIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_1400
     * @tc.name testUint8ClampedArrayFindLastTwo014
     * @tc.desc Verify findLast last key equals 2 for array [7, 7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7]);
      let lastIdx = -1;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { if (v === 7) { lastIdx = i; return true; } return false; });
      expect(lastIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_1500
     * @tc.name testUint8ClampedArrayFindLastTwo015
     * @tc.desc Verify findLast calls equals 5 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let calls = 0;
      arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { calls++; return i === 0; });
      expect(calls).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_1600
     * @tc.name testUint8ClampedArrayFindLastTwo016
     * @tc.desc Verify subarray element at parent[1] equals 20 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = parent.subarray(1, 3);
      const r = sub.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 20);
      expect(r).assertEqual(20);
      expect(parent[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_1700
     * @tc.name testUint8ClampedArrayFindLastTwo017
     * @tc.desc Verify subarray findLast parent length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = parent.subarray(1, 3);
      const r = sub.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 20);
      expect(r).assertEqual(20);
      expect(parent.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_1800
     * @tc.name testUint8ClampedArrayFindLastTwo018
     * @tc.desc Verify slice element at arr[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const cp = arr.slice();
      const r = cp.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 1);
      expect(r).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_1900
     * @tc.name testUint8ClampedArrayFindLastTwo019
     * @tc.desc Verify findLast element at b[0] equals 10 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      a[0] = 10; a[1] = 20;
      const r = a.findLast((v: number, i: int, arr: Uint8ClampedArray) => i === 0);
      expect(r).assertEqual(10);
      expect(b[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_2000
     * @tc.name testUint8ClampedArrayFindLastTwo020
     * @tc.desc Verify findLast returns 3 after a nested find returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => {
        const inner = a.find((vv: number, ii: int, aa: Uint8ClampedArray) => vv === 1);
        return v === 3 && inner === 1;
      });
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_2100
     * @tc.name testUint8ClampedArrayFindLastTwo021
     * @tc.desc Verify findLast r1 equals 2 and r2 equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r1 = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      const r2 = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(r1).assertEqual(2);
      expect(r2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_2200
     * @tc.name testUint8ClampedArrayFindLastTwo022
     * @tc.desc Verify toReversed r1 equals r2 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const reversed = arr.toReversed();
      const r1 = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => v === 1);
      const r2 = reversed.find((v: number, i: int, a: Uint8ClampedArray) => v === 1);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_TWO_2300
     * @tc.name testUint8ClampedArrayFindLastTwo023
     * @tc.desc Verify findLast returns 0 and predicate is invoked for array [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      let matched = false;
      const r = arr.findLast((v: number, i: int, a: Uint8ClampedArray) => { if (v === 0) { matched = true; return true; } return false; });
      expect(matched).assertTrue();
      expect(r).assertEqual(0);
    });
  });
}
