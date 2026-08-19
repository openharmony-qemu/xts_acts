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

export default function typedUArraysEntriesTest03(): void {
  describe('TypedUArraysEntriesTest03', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_0100
     * @tc.name testTypedUArraysEntriesTestFileC001
     * @tc.desc Verify Uint8Array entries 0o177
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0o177]);
      const iter = arr.entries();
      const entry050 = iter.next().value!;
      expect(entry050[0]).assertEqual(0);
      expect(entry050[1]).assertEqual(0o177);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_0200
     * @tc.name testTypedUArraysEntriesTestFileC002
     * @tc.desc Verify Uint8Array entries 0b11111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0b11111111]);
      const iter = arr.entries();
      const entry051 = iter.next().value!;
      expect(entry051[0]).assertEqual(0);
      expect(entry051[1]).assertEqual(0b11111111);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_0300
     * @tc.name testTypedUArraysEntriesTestFileC003
     * @tc.desc Verify Uint8ClampedArray entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-10]);
      const iter = arr.entries();
      const entry052 = iter.next().value!;
      expect(entry052[0]).assertEqual(0);
      expect(entry052[1]).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_0400
     * @tc.name testTypedUArraysEntriesTestFileC004
     * @tc.desc Verify Uint8ClampedArray entries 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([300]);
      const iter = arr.entries();
      const entry053 = iter.next().value!;
      expect(entry053[0]).assertEqual(0);
      expect(entry053[1]).assertEqual(255);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_0500
     * @tc.name testTypedUArraysEntriesTestFileC005
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      const iter = arr.entries();
      const entry054 = iter.next().value!;
      expect(entry054[0]).assertEqual(0);
      expect(entry054[1]).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_0600
     * @tc.name testTypedUArraysEntriesTestFileC006
     * @tc.desc Verify BigUint64Array entries 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      const iter = arr.entries();
      const entryResult055 = iter.next();
      expect(entryResult055.value![0]).assertEqual(0);
      expect(entryResult055.value![1]).assertEqual(0n);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_0700
     * @tc.name testTypedUArraysEntriesTestFileC007
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_0800
     * @tc.name testTypedUArraysEntriesTestFileC008
     * @tc.desc Verify Uint8ClampedArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_0900
     * @tc.name testTypedUArraysEntriesTestFileC009
     * @tc.desc Verify Uint16Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_1000
     * @tc.name testTypedUArraysEntriesTestFileC010
     * @tc.desc Verify Uint32Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_1100
     * @tc.name testTypedUArraysEntriesTestFileC011
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_1200
     * @tc.name testTypedUArraysEntriesTestFileC012
     * @tc.desc Verify Uint8Array entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_1300
     * @tc.name testTypedUArraysEntriesTestFileC013
     * @tc.desc Verify BigUint64Array entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_1400
     * @tc.name testTypedUArraysEntriesTestFileC014
     * @tc.desc Verify Uint8Array entries 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1000);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_1500
     * @tc.name testTypedUArraysEntriesTestFileC015
     * @tc.desc Verify BigUint64Array entries 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(1000);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_1600
     * @tc.name testTypedUArraysEntriesTestFileC016
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const entries = Array.from(arr.entries());
      expect(entries.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_1700
     * @tc.name testTypedUArraysEntriesTestFileC017
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const entries = Array.from(arr.entries());
      expect(entries.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_1800
     * @tc.name testTypedUArraysEntriesTestFileC018
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      Array.from(iter);
      const val15 = arr[0];
      expect(val15).assertEqual(10);
      const val16 = arr[1];
      expect(val16).assertEqual(20);
      const val17 = arr[2];
      expect(val17).assertEqual(30);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_1900
     * @tc.name testTypedUArraysEntriesTestFileC019
     * @tc.desc Verify Uint8ClampedArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.entries();
      Array.from(iter);
      const val18 = arr[0];
      expect(val18).assertEqual(10);
      const val19 = arr[1];
      expect(val19).assertEqual(20);
      const val20 = arr[2];
      expect(val20).assertEqual(30);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_2000
     * @tc.name testTypedUArraysEntriesTestFileC020
     * @tc.desc Verify Uint16Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      Array.from(iter);
      const val21 = arr[0];
      expect(val21).assertEqual(100);
      const val22 = arr[1];
      expect(val22).assertEqual(200);
      const val23 = arr[2];
      expect(val23).assertEqual(300);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_2100
     * @tc.name testTypedUArraysEntriesTestFileC021
     * @tc.desc Verify Uint32Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      Array.from(iter);
      const val24 = arr[0];
      expect(val24).assertEqual(1000);
      const val25 = arr[1];
      expect(val25).assertEqual(2000);
      const val26 = arr[2];
      expect(val26).assertEqual(3000);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_2200
     * @tc.name testTypedUArraysEntriesTestFileC022
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      Array.from(iter);
      const val27 = arr[0];
      expect(val27).assertEqual(10n);
      const val28 = arr[1];
      expect(val28).assertEqual(20n);
      const val29 = arr[2];
      expect(val29).assertEqual(30n);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_2300
     * @tc.name testTypedUArraysEntriesTestFileC023
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const originalLength = arr.length;
      const iter = arr.entries();
      Array.from(iter);
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_2400
     * @tc.name testTypedUArraysEntriesTestFileC024
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const originalLength = arr.length;
      const iter = arr.entries();
      Array.from(iter);
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_2500
     * @tc.name testTypedUArraysEntriesTestFileC025
     * @tc.desc Verify Uint8Array entries buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const buf = arr.buffer;
      const iter = arr.entries();
      Array.from(iter);
      const after = new Uint8Array(buf);
      const val30 = after[0];
      const val31 = after[1];
      const val32 = after[2];
      expect(val30).assertEqual(10);
      expect(val31).assertEqual(20);
      expect(val32).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_2600
     * @tc.name testTypedUArraysEntriesTestFileC026
     * @tc.desc Verify BigUint64Array entries buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const buf = arr.buffer;
      const iter = arr.entries();
      Array.from(iter);
      const after = new BigUint64Array(buf);
      const val33 = after[0];
      const val34 = after[1];
      const val35 = after[2];
      expect(val33).assertEqual(10n);
      expect(val34).assertEqual(20n);
      expect(val35).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_2700
     * @tc.name testTypedUArraysEntriesTestFileC027
     * @tc.desc Verify Uint8Array entries for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let sum = 0;
      for (let i: number = 0; i < arr.length; i++) {
        sum += arr[i.toInt()];
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_2800
     * @tc.name testTypedUArraysEntriesTestFileC028
     * @tc.desc Verify BigUint64Array entries for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let sum = 0n;
      for (let i: number = 0; i < arr.length; i++) {
        sum += arr[i.toInt()];
      }
      expect(sum).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_2900
     * @tc.name testTypedUArraysEntriesTestFileC029
     * @tc.desc Verify Uint8Array entries for-of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      let count = 0;
      for (let i: number = 0; i < arr.length; i++) {
        count++;
        if (arr[i.toInt()] === 30) {
          break;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_3000
     * @tc.name testTypedUArraysEntriesTestFileC030
     * @tc.desc Verify BigUint64Array entries for-of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let count = 0;
      for (let i: number = 0; i < arr.length; i++) {
        count++;
        if (arr[i.toInt()] === 30n) {
          break;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_3100
     * @tc.name testTypedUArraysEntriesTestFileC031
     * @tc.desc Verify Uint8Array entries for-of continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      let sum = 0;
      for (let i: number = 0; i < arr.length; i++) {
        if (i === 1) {
          continue;
        }
        sum += arr[i.toInt()];
      }
      expect(sum).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_3200
     * @tc.name testTypedUArraysEntriesTestFileC032
     * @tc.desc Verify BigUint64Array entries for-of continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let sum = 0n;
      for (let i: number = 0; i < arr.length; i++) {
        if (i === 1) {
          continue;
        }
        sum += arr[i.toInt()];
      }
      expect(sum).assertEqual(130n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_3300
     * @tc.name testTypedUArraysEntriesTestFileC033
     * @tc.desc Verify Uint8Array entries for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let sumIdx = 0;
      let sumVal = 0;
      for (let i: number = 0; i < arr.length; i++) {
        sumIdx += i;
        sumVal += arr[i.toInt()];
      }
      expect(sumIdx).assertEqual(3);
      expect(sumVal).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_3400
     * @tc.name testTypedUArraysEntriesTestFileC034
     * @tc.desc Verify BigUint64Array entries for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let sumIdx = 0;
      let sumVal = 0n;
      for (let i: number = 0; i < arr.length; i++) {
        sumIdx += i;
        sumVal += arr[i.toInt()];
      }
      expect(sumIdx).assertEqual(3);
      expect(sumVal).assertEqual(60n);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_3500
     * @tc.name testTypedUArraysEntriesTestFileC035
     * @tc.desc Verify Uint8Array subarray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const view = arr.subarray(1, 4);
      const iter = view.entries();
      const entry0860 = iter.next().value!;
      expect(entry0860[0]).assertEqual(0);
      expect(entry0860[1]).assertEqual(20);
      const entry0861 = iter.next().value!;
      expect(entry0861[0]).assertEqual(1);
      expect(entry0861[1]).assertEqual(30);
      const entry0862 = iter.next().value!;
      expect(entry0862[0]).assertEqual(2);
      expect(entry0862[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_3600
     * @tc.name testTypedUArraysEntriesTestFileC036
     * @tc.desc Verify BigUint64Array subarray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const view = arr.subarray(1, 4);
      const iter = view.entries();
      const entry0870 = iter.next();
      const entry0871 = iter.next();
      const entry0872 = iter.next();
      expect(entry0871.value![0]).assertEqual(1);
      expect(entry0871.value![1]).assertEqual(30n);
      expect(entry0872.value![0]).assertEqual(2);
      expect(entry0872.value![1]).assertEqual(40n);
      expect(entry0870.value![0]).assertEqual(0);
      expect(entry0870.value![1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_3700
     * @tc.name testTypedUArraysEntriesTestFileC037
     * @tc.desc Verify Uint8Array entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const view = arr.subarray(2);
      const iter = view.entries();
      const firstResult088 = iter.next();
      expect(firstResult088.value![0]).assertEqual(0);
      expect(firstResult088.value![1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_3800
     * @tc.name testTypedUArraysEntriesTestFileC038
     * @tc.desc Verify BigUint64Array entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const view = arr.subarray(2);
      const iter = view.entries();
      const firstResult089 = iter.next();
      expect(firstResult089.value![0]).assertEqual(0);
      expect(firstResult089.value![1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_3900
     * @tc.name testTypedUArraysEntriesTestFileC039
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const view = arr.subarray(1, 4);
      const iter = view.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(view.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_4000
     * @tc.name testTypedUArraysEntriesTestFileC040
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const view = arr.subarray(1, 4);
      const iter = view.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(view.length);
    });





    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_4100
     * @tc.name testTypedUArraysEntriesTestFileC041
     * @tc.desc Verify Uint8Array entries keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const entries = Array.from(arr.entries());
      const keys = Array.from(arr.keys());
      expect(entries.length).assertEqual(arr.length);
      for (let i = 0; i < entries.length; i++) {
        expect(entries[i][0]).assertEqual(keys[i]);
        expect(entries[i][1]).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_4200
     * @tc.name testTypedUArraysEntriesTestFileC042
     * @tc.desc Verify BigUint64Array entries keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const entries = Array.from(arr.entries());
      const keys = Array.from(arr.keys());
      for (let i = 0; i < entries.length; i++) {
        expect(entries[i][0]).assertEqual(keys[i]);
      }
      expect(entries.length).assertEqual(keys.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_4300
     * @tc.name testTypedUArraysEntriesTestFileC043
     * @tc.desc Verify Uint8Array entries values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const entries = Array.from(arr.entries());
      const values = Array.from(arr.values());
      for (let i = 0; i < entries.length; i++) {
        expect(entries[i][1]).assertEqual(values[i]);
      }
      expect(entries.length).assertEqual(values.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIESTEST03_4400
     * @tc.name testTypedUArraysEntriesTestFileC044
     * @tc.desc Verify BigUint64Array entries values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileC044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const entries = Array.from(arr.entries());
      const values = Array.from(arr.values());
      for (let i = 0; i < entries.length; i++) {
        expect(entries[i][1]).assertEqual(values[i]);
      }
      expect(entries.length).assertEqual(values.length);
    });

  });
}
