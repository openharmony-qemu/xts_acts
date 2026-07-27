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

export default function uint8ClampedArrayEntriesTest(): void {
  describe('Uint8ClampedArrayEntriesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_0100
     * @tc.name testUint8ClampedArrayEntries001
     * @tc.desc Verify entries() iteration count equals 3 for array [5, 6, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      let count: int = 0;
      for (const pair of arr.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_0200
     * @tc.name testUint8ClampedArrayEntries002
     * @tc.desc Verify entries() is exhausted for an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value).assertEqual(undefined);
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_0300
     * @tc.name testUint8ClampedArrayEntries003
     * @tc.desc Verify entries() entered equals false for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      let entered: boolean = false;
      for (const pair of arr.entries()) {
        entered = true;
      }
      expect(entered).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_0400
     * @tc.name testUint8ClampedArrayEntries004
     * @tc.desc Verify entries() iterator is exhausted for array [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const it = arr.entries();
      it.next();
      const r = it.next();
      expect(r.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_0500
     * @tc.name testUint8ClampedArrayEntries005
     * @tc.desc Verify entries() next().value [0, 42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![0]).assertEqual(0);
      expect(r.value![1]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_0600
     * @tc.name testUint8ClampedArrayEntries006
     * @tc.desc Verify entries() iteration count equals 2 for array [11, 22]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([11, 22]);
      let count: int = 0;
      for (const pair of arr.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_0700
     * @tc.name testUint8ClampedArrayEntries007
     * @tc.desc Verify entries() iteration count equals 10 for array [1, 2, 3, 4, 5, 6, 7, 8, 9, 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let count: int = 0;
      for (const pair of arr.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_0800
     * @tc.name testUint8ClampedArrayEntries008
     * @tc.desc Verify entries() iteration count equals 255 for array(new ArrayBuffer(255)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(255));
      let count: int = 0;
      for (const pair of arr.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_0900
     * @tc.name testUint8ClampedArrayEntries009
     * @tc.desc Verify entries() iteration count equals 256 for array(new ArrayBuffer(256)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(256));
      let count: int = 0;
      for (const pair of arr.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_1000
     * @tc.name testUint8ClampedArrayEntries010
     * @tc.desc Verify entries() iteration count equals 1024 for array(new ArrayBuffer(1024)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(1024));
      let count: int = 0;
      for (const pair of arr.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_1100
     * @tc.name testUint8ClampedArrayEntries011
     * @tc.desc Verify entries() iterator value is 0 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_1200
     * @tc.name testUint8ClampedArrayEntries012
     * @tc.desc Verify entries() [index, 255] clamp max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_1300
     * @tc.name testUint8ClampedArrayEntries013
     * @tc.desc Verify entries() iterator value is 127 for array [127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_1400
     * @tc.name testUint8ClampedArrayEntries014
     * @tc.desc Verify entries() iterator value is 128 for array [128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_1500
     * @tc.name testUint8ClampedArrayEntries015
     * @tc.desc Verify entries() iterator value is 255 for array [256]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_1600
     * @tc.name testUint8ClampedArrayEntries016
     * @tc.desc Verify entries() iterator value is 0 for array [-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_1700
     * @tc.name testUint8ClampedArrayEntries017
     * @tc.desc Verify entries() iterator value is 0 for array [Number.NaN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_1800
     * @tc.name testUint8ClampedArrayEntries018
     * @tc.desc Verify Infinity clamp 255 entries() 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_1900
     * @tc.name testUint8ClampedArrayEntries019
     * @tc.desc Verify -Infinity clamp 0 entries() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_2000
     * @tc.name testUint8ClampedArrayEntries020
     * @tc.desc Verify entries() iterator value is 0 for array [0.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_2100
     * @tc.name testUint8ClampedArrayEntries021
     * @tc.desc Verify 127.5 half-even 128 entries() 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_2200
     * @tc.name testUint8ClampedArrayEntries022
     * @tc.desc Verify entries() iterator value is 255 for array [1e9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e9]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_2300
     * @tc.name testUint8ClampedArrayEntries023
     * @tc.desc Verify entries() iteration count equals 4 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      let count: int = 0;
      for (const pair of arr.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_2400
     * @tc.name testUint8ClampedArrayEntries024
     * @tc.desc Verify ArrayBuffer + byteOffset entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      let count: int = 0;
      for (const pair of arr.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_2500
     * @tc.name testUint8ClampedArrayEntries025
     * @tc.desc Verify Uint8ClampedArray.of() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_2600
     * @tc.name testUint8ClampedArrayEntries026
     * @tc.desc Verify subarray iteration count equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      let count: int = 0;
      for (const pair of sub.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_2700
     * @tc.name testUint8ClampedArrayEntries027
     * @tc.desc Verify entries() next().value [index, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200]);
      const it = arr.entries();
      const r = it.next();
      expect(r.value![0]).assertEqual(0);
      expect(r.value![1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_2800
     * @tc.name testUint8ClampedArrayEntries028
     * @tc.desc Verify entries() iterator value is 1 for array [100, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200]);
      const it = arr.entries();
      it.next();
      const r = it.next();
      expect(r.value![0]).assertEqual(1);
      expect(r.value![1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_2900
     * @tc.name testUint8ClampedArrayEntries029
     * @tc.desc Verify entries() element at pair[0] equals expectedIdx for array [7, 8, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      let expectedIdx: int = 0;
      for (const pair of arr.entries()) {
        expect(pair[0]).assertEqual(expectedIdx);
        expectedIdx = expectedIdx + 1;
      }
      expect(expectedIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_3000
     * @tc.name testUint8ClampedArrayEntries030
     * @tc.desc Verify entries() last key equals 3 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      let lastIdx: int = -1;
      for (const pair of arr.entries()) {
        lastIdx = pair[0];
      }
      expect(lastIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_3100
     * @tc.name testUint8ClampedArrayEntries031
     * @tc.desc Verify entries() next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const it = arr.entries();
      it.next();
      const r = it.next();
      expect(r.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_3200
     * @tc.name testUint8ClampedArrayEntries032
     * @tc.desc Verify entries() iterator is exhausted for array [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const it = arr.entries();
      it.next();
      it.next();
      const r = it.next();
      expect(r.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_3300
     * @tc.name testUint8ClampedArrayEntries033
     * @tc.desc Verify entries() v equals 99 for array [99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const it = arr.entries();
      const r = it.next();
      const v: Number = r.value![1];
      expect(v).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_3400
     * @tc.name testUint8ClampedArrayEntries034
     * @tc.desc Verify entries() i equals 0 for array [99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const it = arr.entries();
      const r = it.next();
      const i: int = r.value![0];
      expect(i).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_3500
     * @tc.name testUint8ClampedArrayEntries035
     * @tc.desc Verify entries() index matches array element access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42, 43]);
      const it = arr.entries();
      const r = it.next();
      const idx: int = r.value![0];
      expect(arr[idx]).assertEqual(r.value![1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_3600
     * @tc.name testUint8ClampedArrayEntries036
     * @tc.desc Verify entries() iteration does not mutate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const it = arr.entries();
      for (const pair of it) {
      }
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_3700
     * @tc.name testUint8ClampedArrayEntries037
     * @tc.desc Verify entries() iterators are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const it1 = arr.entries();
      const it2 = arr.entries();
      it1.next();
      const r2 = it2.next();
      expect(r2.value![0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_3800
     * @tc.name testUint8ClampedArrayEntries038
     * @tc.desc Verify entries() reflects mid-iteration array mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const it = arr.entries();
      it.next();
      arr[1] = 99;
      const r = it.next();
      expect(r.value![1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_3900
     * @tc.name testUint8ClampedArrayEntries039
     * @tc.desc Verify entries() reflects pre-iteration mutation at later index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const it = arr.entries();
      arr[2] = 77;
      it.next();
      it.next();
      const r = it.next();
      expect(r.value![1]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_4000
     * @tc.name testUint8ClampedArrayEntries040
     * @tc.desc Verify entries() next() value snapshot before mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6]);
      const it = arr.entries();
      const r1 = it.next();
      arr[0] = 99;
      expect(r1.value![1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_4100
     * @tc.name testUint8ClampedArrayEntries041
     * @tc.desc Verify entries() iterator value is 255 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const it = arr.entries();
      it.next();
      arr[1] = 256;
      const r = it.next();
      expect(r.value![1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_4200
     * @tc.name testUint8ClampedArrayEntries042
     * @tc.desc Verify entries() iterator value is 0 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const it = arr.entries();
      it.next();
      arr[1] = -1;
      const r = it.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_4300
     * @tc.name testUint8ClampedArrayEntries043
     * @tc.desc Verify entries() iterator value is 0 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const it = arr.entries();
      it.next();
      arr[1] = Number.NaN;
      const r = it.next();
      expect(r.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_4400
     * @tc.name testUint8ClampedArrayEntries044
     * @tc.desc Verify entries() iterator value is 50 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const it = arr.entries();
      it.next();
      arr.fill(50, 1);
      const r = it.next();
      expect(r.value![1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_4500
     * @tc.name testUint8ClampedArrayEntries045
     * @tc.desc Verify entries() iterator value is 80 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const it = arr.entries();
      it.next();
      const src: Array<number> = [80, 90];
      arr.set(src, 1);
      const r = it.next();
      expect(r.value![1]).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_4600
     * @tc.name testUint8ClampedArrayEntries046
     * @tc.desc Verify entries() iterator after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const it = arr.entries();
      it.next();
      arr.reverse();
      const r = it.next();
      expect(r.value![0]).assertEqual(1);
      expect(r.value![1]).assertEqual(2);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_4700
     * @tc.name testUint8ClampedArrayEntries047
     * @tc.desc Verify entries() iterator value is 88 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const it = arr.entries();
      it.next();
      const other = new Uint8ClampedArray(buf);
      other[1] = 88;
      const r = it.next();
      expect(r.value![1]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_4800
     * @tc.name testUint8ClampedArrayEntries048
     * @tc.desc Verify entries() iterator is exhausted for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const it = arr.entries();
      it.next();
      const r = it.next();
      expect(r.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_4900
     * @tc.name testUint8ClampedArrayEntries049
     * @tc.desc Verify entries() iteration count equals 2 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const it = arr.entries();
      let count: int = 0;
      for (const pair of it) {
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_5000
     * @tc.name testUint8ClampedArrayEntries050
     * @tc.desc Verify entries() iteration count equals 0 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const it = arr.entries();
      it.next();
      it.next();
      it.next();
      let count: int = 0;
      for (const pair of it) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_5100
     * @tc.name testUint8ClampedArrayEntries051
     * @tc.desc Verify entries() next() done=false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7]);
      const it = arr.entries();
      const r = it.next();
      expect(r.done).assertEqual(false);
      expect(r.value![0]).assertEqual(0);
      expect(r.value![1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_5200
     * @tc.name testUint8ClampedArrayEntries052
     * @tc.desc Verify keys() iterator value is k.value for array [10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      const entIt = arr.entries();
      const keyIt = arr.keys();
      const e = entIt.next();
      const k = keyIt.next();
      expect(e.value![0]).assertEqual(k.value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_5300
     * @tc.name testUint8ClampedArrayEntries053
     * @tc.desc Verify entries() iterator value is v.value for array [10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      const entIt = arr.entries();
      const valIt = arr.values();
      const e = entIt.next();
      const v = valIt.next();
      expect(e.value![1]).assertEqual(v.value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_5400
     * @tc.name testUint8ClampedArrayEntries054
     * @tc.desc Verify entries() iteration count equals 65535 for array(new ArrayBuffer(65535)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(65535));
      let count: int = 0;
      for (const pair of arr.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_5500
     * @tc.name testUint8ClampedArrayEntries055
     * @tc.desc Verify Uint8ClampedArray.from accumulated sum equals 66 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [11, 22, 33];
      const arr = Uint8ClampedArray.from(src);
      let sum: number = 0;
      for (const pair of arr.entries()) {
        sum = sum + pair[1];
      }
      expect(sum).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_ENTRIES_5600
     * @tc.name testUint8ClampedArrayEntries056
     * @tc.desc Verify slice iteration count equals 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEntries056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = parent.slice(1, 3);
      let count: int = 0;
      for (const pair of s.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });
  });
}
