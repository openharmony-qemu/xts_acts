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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5000
     * @tc.name testTypedUArraysEntriesPart2_050
     * @tc.desc Verify Uint8Array entries 0o177
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0o177]);
      const iter = arr.entries();
      const entry050 = iter.next().value!;
      expect(entry050[0]).assertEqual(0);
      expect(entry050[1]).assertEqual(0o177);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5001
     * @tc.name testTypedUArraysEntriesPart2_051
     * @tc.desc Verify Uint8Array entries 0b11111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0b11111111]);
      const iter = arr.entries();
      const entry051 = iter.next().value!;
      expect(entry051[0]).assertEqual(0);
      expect(entry051[1]).assertEqual(0b11111111);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5002
     * @tc.name testTypedUArraysEntriesPart2_052
     * @tc.desc Verify Uint8ClampedArray entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-10]);
      const iter = arr.entries();
      const entry052 = iter.next().value!;
      expect(entry052[0]).assertEqual(0);
      expect(entry052[1]).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5003
     * @tc.name testTypedUArraysEntriesPart2_053
     * @tc.desc Verify Uint8ClampedArray entries 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([300]);
      const iter = arr.entries();
      const entry053 = iter.next().value!;
      expect(entry053[0]).assertEqual(0);
      expect(entry053[1]).assertEqual(255);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5004
     * @tc.name testTypedUArraysEntriesPart2_054
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      const iter = arr.entries();
      const entry054 = iter.next().value!;
      expect(entry054[0]).assertEqual(0);
      expect(entry054[1]).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5005
     * @tc.name testTypedUArraysEntriesPart2_055
     * @tc.desc Verify BigUint64Array entries 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      const iter = arr.entries();
      const entryResult055 = iter.next();
      expect(entryResult055.value![0]).assertEqual(0);
      expect(entryResult055.value![1]).assertEqual(0n);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5006
     * @tc.name testTypedUArraysEntriesPart2_056
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5007
     * @tc.name testTypedUArraysEntriesPart2_057
     * @tc.desc Verify Uint8ClampedArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5008
     * @tc.name testTypedUArraysEntriesPart2_058
     * @tc.desc Verify Uint16Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5009
     * @tc.name testTypedUArraysEntriesPart2_059
     * @tc.desc Verify Uint32Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5010
     * @tc.name testTypedUArraysEntriesPart2_060
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5011
     * @tc.name testTypedUArraysEntriesPart2_061
     * @tc.desc Verify Uint8Array entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5012
     * @tc.name testTypedUArraysEntriesPart2_062
     * @tc.desc Verify BigUint64Array entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5013
     * @tc.name testTypedUArraysEntriesPart2_063
     * @tc.desc Verify Uint8Array entries 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1000);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5014
     * @tc.name testTypedUArraysEntriesPart2_064
     * @tc.desc Verify BigUint64Array entries 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(1000);
      const iter = arr.entries();
      let count = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5015
     * @tc.name testTypedUArraysEntriesPart2_065
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const entries = Array.from(arr.entries());
      expect(entries.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5016
     * @tc.name testTypedUArraysEntriesPart2_066
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const entries = Array.from(arr.entries());
      expect(entries.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5017
     * @tc.name testTypedUArraysEntriesPart2_067
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      Array.from(iter);
      const val15 = arr[0];
      const val16 = arr[1];
      const val17 = arr[2];
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5018
     * @tc.name testTypedUArraysEntriesPart2_068
     * @tc.desc Verify Uint8ClampedArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.entries();
      Array.from(iter);
      const val18 = arr[0];
      const val19 = arr[1];
      const val20 = arr[2];
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5019
     * @tc.name testTypedUArraysEntriesPart2_069
     * @tc.desc Verify Uint16Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      Array.from(iter);
      const val21 = arr[0];
      const val22 = arr[1];
      const val23 = arr[2];
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5020
     * @tc.name testTypedUArraysEntriesPart2_070
     * @tc.desc Verify Uint32Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      Array.from(iter);
      const val24 = arr[0];
      const val25 = arr[1];
      const val26 = arr[2];
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5021
     * @tc.name testTypedUArraysEntriesPart2_071
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      Array.from(iter);
      const val27 = arr[0];
      const val28 = arr[1];
      const val29 = arr[2];
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5022
     * @tc.name testTypedUArraysEntriesPart2_072
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const originalLength = arr.length;
      const iter = arr.entries();
      Array.from(iter);
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5023
     * @tc.name testTypedUArraysEntriesPart2_073
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const originalLength = arr.length;
      const iter = arr.entries();
      Array.from(iter);
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5024
     * @tc.name testTypedUArraysEntriesPart2_074
     * @tc.desc Verify Uint8Array entries buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5025
     * @tc.name testTypedUArraysEntriesPart2_075
     * @tc.desc Verify BigUint64Array entries buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5026
     * @tc.name testTypedUArraysEntriesPart2_076
     * @tc.desc Verify Uint8Array entries for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let sum = 0;
      for (let i: number = 0; i < arr.length; i++) {
        sum += arr[i.toInt()];
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5027
     * @tc.name testTypedUArraysEntriesPart2_077
     * @tc.desc Verify BigUint64Array entries for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let sum = 0n;
      for (let i: number = 0; i < arr.length; i++) {
        sum += arr[i.toInt()];
      }
      expect(sum).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5028
     * @tc.name testTypedUArraysEntriesPart2_078
     * @tc.desc Verify Uint8Array entries for-of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5029
     * @tc.name testTypedUArraysEntriesPart2_079
     * @tc.desc Verify BigUint64Array entries for-of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5030
     * @tc.name testTypedUArraysEntriesPart2_080
     * @tc.desc Verify Uint8Array entries for-of continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5031
     * @tc.name testTypedUArraysEntriesPart2_081
     * @tc.desc Verify BigUint64Array entries for-of continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5032
     * @tc.name testTypedUArraysEntriesPart2_082
     * @tc.desc Verify Uint8Array entries for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5033
     * @tc.name testTypedUArraysEntriesPart2_083
     * @tc.desc Verify BigUint64Array entries for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5034
     * @tc.name testTypedUArraysEntriesPart2_084
     * @tc.desc Verify Uint8Array ArrayBuffer entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysEntriesPart2_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const buf = new ArrayBuffer(8);
    //   const arr = new Uint8Array(buf, 0, 4);
    //   throw new Error('ArkTS limitation')
    //   throw new Error('ArkTS limitation')
    //   throw new Error('ArkTS limitation')
    //   throw new Error('ArkTS limitation')
    //   const iter = arr.entries();
    //   expect(iter.next().value).assertEqual([0, 10]);
    //   expect(iter.next().value).assertEqual([3, 40]);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5035
     * @tc.name testTypedUArraysEntriesPart2_085
     * @tc.desc Verify BigUint64Array ArrayBuffer entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysEntriesPart2_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const buf = new ArrayBuffer(32);
    //   const arr = new BigUint64Array(buf, 0, 2);
    //   throw new Error('ArkTS limitation')
    //   throw new Error('ArkTS limitation')
    //   const iter = arr.entries();
    //   expect(iter.next().value).assertEqual([0, 10n]);
    //   expect(iter.next().value).assertEqual([1, 20n]);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5036
     * @tc.name testTypedUArraysEntriesPart2_086
     * @tc.desc Verify Uint8Array subarray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const view = arr.subarray(1, 4);
      const iter = view.entries();
      const entry086_0 = iter.next().value!;
      expect(entry086_0[0]).assertEqual(0);
      expect(entry086_0[1]).assertEqual(20);
      const entry086_1 = iter.next().value!;
      expect(entry086_1[0]).assertEqual(1);
      expect(entry086_1[1]).assertEqual(30);
      const entry086_2 = iter.next().value!;
      expect(entry086_2[0]).assertEqual(2);
      expect(entry086_2[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5037
     * @tc.name testTypedUArraysEntriesPart2_087
     * @tc.desc Verify BigUint64Array subarray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const view = arr.subarray(1, 4);
      const iter = view.entries();
      const entry087_0 = iter.next();
      const entry087_1 = iter.next();
      const entry087_2 = iter.next();
      expect(entry087_0.value![0]).assertEqual(0);
      expect(entry087_0.value![1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5038
     * @tc.name testTypedUArraysEntriesPart2_088
     * @tc.desc Verify Uint8Array entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const view = arr.subarray(2);
      const iter = view.entries();
      const firstResult088 = iter.next();
      expect(firstResult088.value![0]).assertEqual(0);
      expect(firstResult088.value![1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5039
     * @tc.name testTypedUArraysEntriesPart2_089
     * @tc.desc Verify BigUint64Array entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const view = arr.subarray(2);
      const iter = view.entries();
      const firstResult089 = iter.next();
      expect(firstResult089.value![0]).assertEqual(0);
      expect(firstResult089.value![1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5040
     * @tc.name testTypedUArraysEntriesPart2_090
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5041
     * @tc.name testTypedUArraysEntriesPart2_091
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5042
     * @tc.name testTypedUArraysEntriesPart2_092
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysEntriesPart2_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new Uint8Array([10, 20, 30]);
    //   const view = arr.subarray(0, 2);
    //   throw new Error('ArkTS limitation')
    //   const iter = arr.entries();
    //   const first = iter.next().value!;
    //   const val40 = first[1];
    //   expect(val40).assertEqual(99);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5043
     * @tc.name testTypedUArraysEntriesPart2_093
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysEntriesPart2_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new BigUint64Array([10n, 20n, 30n]);
    //   const view = arr.subarray(0, 2);
    //   throw new Error('ArkTS limitation')
    //   const iter = arr.entries();
    //   const first = iter.next().value!;
    //   const val41 = first[1];
    //   expect(val41).assertEqual(99n);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5044
     * @tc.name testTypedUArraysEntriesPart2_094
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysEntriesPart2_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new Uint8Array([10, 20, 30]);
    //   const view = arr.subarray(0, 2);
    //   throw new Error('ArkTS limitation')
    //   const iter = view.entries();
    //   const first = iter.next().value!;
    //   const val42 = first[1];
    //   expect(val42).assertEqual(77);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5045
     * @tc.name testTypedUArraysEntriesPart2_095
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysEntriesPart2_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new BigUint64Array([10n, 20n, 30n]);
    //   const view = arr.subarray(0, 2);
    //   throw new Error('ArkTS limitation')
    //   const iter = view.entries();
    //   const first = iter.next().value!;
    //   const val43 = first[1];
    //   expect(val43).assertEqual(77n);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5046
     * @tc.name testTypedUArraysEntriesPart2_096
     * @tc.desc Verify Uint8Array entries keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const entries = Array.from(arr.entries());
      const keys = Array.from(arr.keys());
      for (let i = 0; i < entries.length; i++) {
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5047
     * @tc.name testTypedUArraysEntriesPart2_097
     * @tc.desc Verify BigUint64Array entries keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const entries = Array.from(arr.entries());
      const keys = Array.from(arr.keys());
      for (let i = 0; i < entries.length; i++) {
        expect(entries[i][0]).assertEqual(keys[i]);
      }
      expect(entries.length).assertEqual(keys.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5048
     * @tc.name testTypedUArraysEntriesPart2_098
     * @tc.desc Verify Uint8Array entries values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const entries = Array.from(arr.entries());
      const values = Array.from(arr.values());
      for (let i = 0; i < entries.length; i++) {
        expect(entries[i][1]).assertEqual(values[i]);
      }
      expect(entries.length).assertEqual(values.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART3_5049
     * @tc.name testTypedUArraysEntriesPart2_099
     * @tc.desc Verify BigUint64Array entries values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
