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

export default function typedUArraysEntriesTest02(): void {
  describe('TypedUArraysEntriesTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_0100
     * @tc.name testTypedUArraysEntriesPart2_001
     * @tc.desc Verify Uint8Array entries object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_0200
     * @tc.name testTypedUArraysEntriesPart2_002
     * @tc.desc Verify Uint8ClampedArray entries object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.entries();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_0300
     * @tc.name testTypedUArraysEntriesPart2_003
     * @tc.desc Verify Uint16Array entries object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_0400
     * @tc.name testTypedUArraysEntriesPart2_004
     * @tc.desc Verify Uint32Array entries object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_0500
     * @tc.name testTypedUArraysEntriesPart2_005
     * @tc.desc Verify BigUint64Array entries object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_0600
     * @tc.name testTypedUArraysEntriesPart2_006
     * @tc.desc Verify Uint8Array entries Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysEntriesPart2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new Uint8Array([10, 20, 30]);
    //   const iter = arr.entries();
    //   expect(typeof (iter as Record<string, unknown>)[Symbol.iterator]).assertEqual('function');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_0700
     * @tc.name testTypedUArraysEntriesPart2_007
     * @tc.desc Verify BigUint64Array entries Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testTypedUArraysEntriesPart2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const arr = new BigUint64Array([10n, 20n, 30n]);
    //   const iter = arr.entries();
    //   expect(typeof (iter as Record<string, unknown>)[Symbol.iterator]).assertEqual('function');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_0800
     * @tc.name testTypedUArraysEntriesPart2_008
     * @tc.desc Verify Uint8Array entries next function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      expect(typeof iter.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_0900
     * @tc.name testTypedUArraysEntriesPart2_009
     * @tc.desc Verify BigUint64Array entries next function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      expect(typeof iter.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_1000
     * @tc.name testTypedUArraysEntriesPart2_010
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      expect(iter != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_1100
     * @tc.name testTypedUArraysEntriesPart2_011
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      expect(iter != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_1200
     * @tc.name testTypedUArraysEntriesPart2_012
     * @tc.desc Verify Uint8Array entries values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const entriesIter = arr.entries();
      const valuesIter = arr.values();
      expect(entriesIter != valuesIter).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_1300
     * @tc.name testTypedUArraysEntriesPart2_013
     * @tc.desc Verify BigUint64Array entries values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const entriesIter = arr.entries();
      const valuesIter = arr.values();
      expect(entriesIter != valuesIter).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_1400
     * @tc.name testTypedUArraysEntriesPart2_014
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter1 = arr.entries();
      const iter2 = arr.entries();
      expect(iter1 != iter2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_1500
     * @tc.name testTypedUArraysEntriesPart2_015
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter1 = arr.entries();
      const iter2 = arr.entries();
      expect(iter1 != iter2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_1600
     * @tc.name testTypedUArraysEntriesPart2_016
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter1 = arr.entries();
      const iter2 = arr.entries();
      const entry016_a = iter1.next().value!;
      expect(entry016_a[0]).assertEqual(0);
      expect(entry016_a[1]).assertEqual(10);
      const entry016_b = iter2.next().value!;
      expect(entry016_b[0]).assertEqual(0);
      expect(entry016_b[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_1700
     * @tc.name testTypedUArraysEntriesPart2_017
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter1 = arr.entries();
      const iter2 = arr.entries();
      const entry017_a = iter1.next();
      const entry017_b = iter2.next();
      expect(entry017_a.value![0]).assertEqual(0);
      expect(entry017_a.value![1]).assertEqual(10n);
      expect(entry017_b.value![0]).assertEqual(0);
      expect(entry017_b.value![1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_1800
     * @tc.name testTypedUArraysEntriesPart2_018
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter1 = arr.entries();
      iter1.next();
      const iter2 = arr.entries();
      const entry018 = iter2.next().value!;
      expect(entry018[0]).assertEqual(0);
      expect(entry018[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_1900
     * @tc.name testTypedUArraysEntriesPart2_019
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter1 = arr.entries();
      iter1.next();
      const iter2 = arr.entries();
      const entry019 = iter2.next();
      expect(entry019.value![0]).assertEqual(0);
      expect(entry019.value![1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_2000
     * @tc.name testTypedUArraysEntriesPart2_020
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter1 = arr.entries();
      while (!iter1.next().done) {}
      const iter2 = arr.entries();
      const entry020 = iter2.next().value!;
      expect(entry020[0]).assertEqual(0);
      expect(entry020[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_2100
     * @tc.name testTypedUArraysEntriesPart2_021
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter1 = arr.entries();
      while (!iter1.next().done) {}
      const iter2 = arr.entries();
      const entry021 = iter2.next();
      expect(entry021.value![0]).assertEqual(0);
      expect(entry021.value![1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_2200
     * @tc.name testTypedUArraysEntriesPart2_022
     * @tc.desc Verify Uint8Array entries index Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      const entry022 = iter.next().value!;
      expect(entry022[0]).assertEqual(0);
      expect(entry022[1]).assertEqual(10);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_2300
     * @tc.name testTypedUArraysEntriesPart2_023
     * @tc.desc Verify Uint8ClampedArray entries index Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.entries();
      const entry023 = iter.next().value!;
      expect(entry023[0]).assertEqual(0);
      expect(entry023[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_2400
     * @tc.name testTypedUArraysEntriesPart2_024
     * @tc.desc Verify Uint16Array entries index Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      const entry024 = iter.next().value!;
      expect(entry024[0]).assertEqual(0);
      expect(entry024[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_2500
     * @tc.name testTypedUArraysEntriesPart2_025
     * @tc.desc Verify Uint32Array entries index Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      const entry025 = iter.next().value!;
      expect(entry025[0]).assertEqual(0);
      expect(entry025[1]).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_2600
     * @tc.name testTypedUArraysEntriesPart2_026
     * @tc.desc Verify BigUint64Array entries index Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      const entryResult026 = iter.next();
      expect(entryResult026.value![0]).assertEqual(0);
      expect(entryResult026.value![1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_2700
     * @tc.name testTypedUArraysEntriesPart2_027
     * @tc.desc Verify Uint8Array entries value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      const entry027 = iter.next().value!;
      expect(entry027[0]).assertEqual(0);
      expect(entry027[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_2800
     * @tc.name testTypedUArraysEntriesPart2_028
     * @tc.desc Verify Uint8ClampedArray entries value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.entries();
      const entry028 = iter.next().value!;
      expect(entry028[0]).assertEqual(0);
      expect(entry028[1]).assertEqual(10);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_2900
     * @tc.name testTypedUArraysEntriesPart2_029
     * @tc.desc Verify Uint16Array entries value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      const entry029 = iter.next().value!;
      expect(entry029[0]).assertEqual(0);
      expect(entry029[1]).assertEqual(100);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_3000
     * @tc.name testTypedUArraysEntriesPart2_030
     * @tc.desc Verify Uint32Array entries value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      const entry030 = iter.next().value!;
      expect(entry030[0]).assertEqual(0);
      expect(entry030[1]).assertEqual(1000);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_3100
     * @tc.name testTypedUArraysEntriesPart2_031
     * @tc.desc Verify BigUint64Array entries value BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      const entryResult031 = iter.next();
      expect(entryResult031.value![0]).assertEqual(0);
      expect(entryResult031.value![1]).assertEqual(10n);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_3200
     * @tc.name testTypedUArraysEntriesPart2_032
     * @tc.desc Verify Uint8Array entries 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      const entry032 = iter.next().value!;
      expect(entry032.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_3300
     * @tc.name testTypedUArraysEntriesPart2_033
     * @tc.desc Verify BigUint64Array entries 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      const entryResult033 = iter.next();
      const entryLen033: number = entryResult033.value!.length;
      expect(entryLen033).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_3400
     * @tc.name testTypedUArraysEntriesPart2_034
     * @tc.desc Verify Uint8Array entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      const entry034 = iter.next().value!;
      expect(entry034[0]).assertEqual(0);
      expect(entry034[1]).assertEqual(10);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_3500
     * @tc.name testTypedUArraysEntriesPart2_035
     * @tc.desc Verify BigUint64Array entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      const entryResult035 = iter.next();
      expect(entryResult035.value![0]).assertEqual(0);
      expect(entryResult035.value![1]).assertEqual(10n);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_3600
     * @tc.name testTypedUArraysEntriesPart2_036
     * @tc.desc Verify Uint8Array entries 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        const entryVal036 = entry.value!;
        expect(entryVal036.length).assertEqual(2);
        entry = iter.next();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_3700
     * @tc.name testTypedUArraysEntriesPart2_037
     * @tc.desc Verify BigUint64Array entries 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        const entryLen037: number = entry.value!.length;
        expect(entryLen037).assertEqual(2);
        entry = iter.next();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_3800
     * @tc.name testTypedUArraysEntriesPart2_038
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      expect(entry.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_3900
     * @tc.name testTypedUArraysEntriesPart2_039
     * @tc.desc Verify Uint8ClampedArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      expect(entry.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_4000
     * @tc.name testTypedUArraysEntriesPart2_040
     * @tc.desc Verify Uint16Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      expect(entry.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_4100
     * @tc.name testTypedUArraysEntriesPart2_041
     * @tc.desc Verify Uint32Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      expect(entry.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_4200
     * @tc.name testTypedUArraysEntriesPart2_042
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      expect(entry.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_4300
     * @tc.name testTypedUArraysEntriesPart2_043
     * @tc.desc Verify Uint8Array entries 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255]);
      const iter = arr.entries();
      const entry043 = iter.next().value!;
      expect(entry043[0]).assertEqual(0);
      expect(entry043[1]).assertEqual(255);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_4400
     * @tc.name testTypedUArraysEntriesPart2_044
     * @tc.desc Verify Uint16Array entries 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535]);
      const iter = arr.entries();
      const entry044 = iter.next().value!;
      expect(entry044[0]).assertEqual(0);
      expect(entry044[1]).assertEqual(65535);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_4500
     * @tc.name testTypedUArraysEntriesPart2_045
     * @tc.desc Verify Uint32Array entries 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295]);
      const iter = arr.entries();
      const entry045 = iter.next().value!;
      expect(entry045[0]).assertEqual(0);
      expect(entry045[1]).assertEqual(4294967295);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_4600
     * @tc.name testTypedUArraysEntriesPart2_046
     * @tc.desc Verify BigUint64Array entries BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')]);
      const iter = arr.entries();
      const entryResult046 = iter.next();
      expect(entryResult046.value![0]).assertEqual(0);
      expect(entryResult046.value![1]).assertEqual(BigInt('18446744073709551615'));

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_4700

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_4800
     * @tc.name testTypedUArraysEntriesPart2_048
     * @tc.desc Verify Uint16Array entries 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF]);
      const iter = arr.entries();
      const entry048 = iter.next().value!;
      expect(entry048[0]).assertEqual(0);
      expect(entry048[1]).assertEqual(0xFFFF);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_4900
     * @tc.name testTypedUArraysEntriesPart2_049
     * @tc.desc Verify Uint32Array entries 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF]);
      const iter = arr.entries();
      const entry049 = iter.next().value!;
      expect(entry049[0]).assertEqual(0);
      expect(entry049[1]).assertEqual(0xFFFFFFFF);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART2_5000
     * @tc.name testTypedUArraysEntriesPart2_050
     * @tc.desc Verify Uint8Array entries 0o177
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
  });
}
