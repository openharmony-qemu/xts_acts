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

export default function typedUArraysEntriesTest01(): void {
  describe('TypedUArraysEntriesTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_0100
     * @tc.name testTypedUArraysEntriesTestFileA001
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      const firstEntry = iter.next().value!;
      expect(firstEntry[0]).assertEqual(0);
      expect(firstEntry[1]).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_0200
     * @tc.name testTypedUArraysEntriesTestFileA002
     * @tc.desc Verify Uint8ClampedArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.entries();
      const firstEntry = iter.next().value!;
      expect(firstEntry[0]).assertEqual(0);
      expect(firstEntry[1]).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_0300
     * @tc.name testTypedUArraysEntriesTestFileA003
     * @tc.desc Verify Uint16Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      const firstEntry = iter.next().value!;
      expect(firstEntry[0]).assertEqual(0);
      expect(firstEntry[1]).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_0400
     * @tc.name testTypedUArraysEntriesTestFileA004
     * @tc.desc Verify Uint32Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      const firstEntry = iter.next().value!;
      expect(firstEntry[0]).assertEqual(0);
      expect(firstEntry[1]).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_0500
     * @tc.name testTypedUArraysEntriesTestFileA005
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      const firstEntry = iter.next().value!;
      expect(firstEntry[0]).assertEqual(0);
      expect(firstEntry[1]).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_0600
     * @tc.name testTypedUArraysEntriesTestFileA006
     * @tc.desc Verify Uint8Array entries next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iter = arr.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_0700
     * @tc.name testTypedUArraysEntriesTestFileA007
     * @tc.desc Verify Uint8ClampedArray entries next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const iter = arr.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_0800
     * @tc.name testTypedUArraysEntriesTestFileA008
     * @tc.desc Verify Uint16Array entries next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      const iter = arr.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_0900
     * @tc.name testTypedUArraysEntriesTestFileA009
     * @tc.desc Verify Uint32Array entries next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const iter = arr.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_1000
     * @tc.name testTypedUArraysEntriesTestFileA010
     * @tc.desc Verify BigUint64Array entries next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const iter = arr.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_1100
     * @tc.name testTypedUArraysEntriesTestFileA011
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const iter = arr.entries();
      const firstResult = iter.next();
      expect(firstResult.done).assertFalse();
      const firstEntry = firstResult.value!;
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_1200
     * @tc.name testTypedUArraysEntriesTestFileA012
     * @tc.desc Verify Uint16Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      const iter = arr.entries();
      const firstResult = iter.next();
      expect(firstResult.done).assertFalse();
      const firstEntry = firstResult.value!;
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_1300
     * @tc.name testTypedUArraysEntriesTestFileA013
     * @tc.desc Verify Uint32Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      const iter = arr.entries();
      const firstResult = iter.next();
      expect(firstResult.done).assertFalse();
      const firstEntry = firstResult.value!;
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_1400
     * @tc.name testTypedUArraysEntriesTestFileA014
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      const iter = arr.entries();
      const firstResult = iter.next();
      expect(firstResult.done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_1500
     * @tc.name testTypedUArraysEntriesTestFileA015
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(10);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(20);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(30);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_1600
     * @tc.name testTypedUArraysEntriesTestFileA016
     * @tc.desc Verify Uint16Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(100);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(200);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(300);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_1700
     * @tc.name testTypedUArraysEntriesTestFileA017
     * @tc.desc Verify Uint32Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(1000);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(2000);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(3000);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_1800
     * @tc.name testTypedUArraysEntriesTestFileA018
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(10n);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(20n);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(30n);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_1900
     * @tc.name testTypedUArraysEntriesTestFileA019
     * @tc.desc Verify Uint8Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(0);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(0);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_2000
     * @tc.name testTypedUArraysEntriesTestFileA020
     * @tc.desc Verify Uint8Array 255 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 255, 255]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(255);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(255);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_2100
     * @tc.name testTypedUArraysEntriesTestFileA021
     * @tc.desc Verify Uint8Array 0xFF entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x80, 0x00]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(0xFF);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(0x80);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(0x00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_2200
     * @tc.name testTypedUArraysEntriesTestFileA022
     * @tc.desc Verify Uint16Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(0);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(0);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_2300
     * @tc.name testTypedUArraysEntriesTestFileA023
     * @tc.desc Verify Uint16Array 65535 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 65535, 65535]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(65535);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(65535);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_2400
     * @tc.name testTypedUArraysEntriesTestFileA024
     * @tc.desc Verify Uint16Array 0xFFFF entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0x8000, 0x0000]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(0xFFFF);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(0x8000);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(0x0000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_2500
     * @tc.name testTypedUArraysEntriesTestFileA025
     * @tc.desc Verify Uint32Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(0);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(0);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_2600
     * @tc.name testTypedUArraysEntriesTestFileA026
     * @tc.desc Verify Uint32Array 4294967295 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967295, 4294967295]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(4294967295);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(4294967295);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_2700
     * @tc.name testTypedUArraysEntriesTestFileA027
     * @tc.desc Verify Uint32Array 0xFFFFFFFF entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0x80000000, 0x00000000]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(0xFFFFFFFF);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(0x80000000);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(0x00000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_2800
     * @tc.name testTypedUArraysEntriesTestFileA028
     * @tc.desc Verify BigUint64Array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(0n);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(0n);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_2900
     * @tc.name testTypedUArraysEntriesTestFileA029
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615') entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(BigInt('18446744073709551615'));
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(BigInt('18446744073709551615'));
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_3000
     * @tc.name testTypedUArraysEntriesTestFileA030
     * @tc.desc Verify Uint8ClampedArray entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-10, -1, 0]);
      const iter = arr.entries();
      const e1 = iter.next().value!;
      expect(e1[0]).assertEqual(0);
      expect(e1[1]).assertEqual(0);
      const e2 = iter.next().value!;
      expect(e2[0]).assertEqual(1);
      expect(e2[1]).assertEqual(0);
      const e3 = iter.next().value!;
      expect(e3[0]).assertEqual(2);
      expect(e3[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_3100
     * @tc.name testTypedUArraysEntriesTestFileA031
     * @tc.desc Verify Uint8ClampedArray entries 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, 300, 1000]);
      const iter = arr.entries();
      const e1 = iter.next().value!;
      expect(e1[0]).assertEqual(0);
      expect(e1[1]).assertEqual(255);
      const e2 = iter.next().value!;
      expect(e2[0]).assertEqual(1);
      expect(e2[1]).assertEqual(255);
      const e3 = iter.next().value!;
      expect(e3[0]).assertEqual(2);
      expect(e3[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_3200
     * @tc.name testTypedUArraysEntriesTestFileA032
     * @tc.desc Verify Uint8ClampedArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 128, 255]);
      const iter = arr.entries();
      const e1 = iter.next().value!;
      expect(e1[0]).assertEqual(0);
      expect(e1[1]).assertEqual(10);
      const e2 = iter.next().value!;
      expect(e2[0]).assertEqual(1);
      expect(e2[1]).assertEqual(128);
      const e3 = iter.next().value!;
      expect(e3[0]).assertEqual(2);
      expect(e3[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_3300
     * @tc.name testTypedUArraysEntriesTestFileA033
     * @tc.desc Verify new Uint8Array(3) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      const iter = arr.entries();
      const e1 = iter.next().value!;
      expect(e1[0]).assertEqual(0);
      expect(e1[1]).assertEqual(0);
      const e2 = iter.next().value!;
      expect(e2[0]).assertEqual(1);
      expect(e2[1]).assertEqual(0);
      const e3 = iter.next().value!;
      expect(e3[0]).assertEqual(2);
      expect(e3[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART1_3400
     * @tc.name testTypedUArraysEntriesTestFileA034
     * @tc.desc Verify new Uint8Array([1,2,3]) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(1);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(2);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(3);
    });
  });
}
