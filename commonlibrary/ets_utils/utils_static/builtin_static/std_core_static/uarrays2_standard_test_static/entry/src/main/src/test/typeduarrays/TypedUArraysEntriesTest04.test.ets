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

export default function typedUArraysEntriesTest04(): void {
  describe('TypedUArraysEntriesTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_0100
     * @tc.name testTypedUArraysEntriesTestFileD001
     * @tc.desc Verify new Uint8Array([1,2,3]) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_0200
     * @tc.name testTypedUArraysEntriesTestFileD002
     * @tc.desc Verify new Uint16Array(3) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_0300
     * @tc.name testTypedUArraysEntriesTestFileD003
     * @tc.desc Verify new Uint16Array([1,2,3]) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_0400
     * @tc.name testTypedUArraysEntriesTestFileD004
     * @tc.desc Verify new Uint32Array(3) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_0500
     * @tc.name testTypedUArraysEntriesTestFileD005
     * @tc.desc Verify new Uint32Array([1,2,3]) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_0600
     * @tc.name testTypedUArraysEntriesTestFileD006
     * @tc.desc Verify new BigUint64Array(3) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(3);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_0700
     * @tc.name testTypedUArraysEntriesTestFileD007
     * @tc.desc Verify new BigUint64Array([1n,2n,3n]) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const iter = arr.entries();
      const entry1 = iter.next().value!;
      expect(entry1[0]).assertEqual(0);
      expect(entry1[1]).assertEqual(1n);
      const entry2 = iter.next().value!;
      expect(entry2[0]).assertEqual(1);
      expect(entry2[1]).assertEqual(2n);
      const entry3 = iter.next().value!;
      expect(entry3[0]).assertEqual(2);
      expect(entry3[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_0800
     * @tc.name testTypedUArraysEntriesTestFileD008
     * @tc.desc Verify Uint8Array entries next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      let result = iter.next();
      expect(!result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_0900
     * @tc.name testTypedUArraysEntriesTestFileD009
     * @tc.desc Verify Uint16Array entries next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      let result = iter.next();
      expect(!result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_1000
     * @tc.name testTypedUArraysEntriesTestFileD010
     * @tc.desc Verify Uint32Array entries next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      let result = iter.next();
      expect(!result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_1100
     * @tc.name testTypedUArraysEntriesTestFileD011
     * @tc.desc Verify BigUint64Array entries next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      let result = iter.next();
      expect(!result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_1200
     * @tc.name testTypedUArraysEntriesTestFileD012
     * @tc.desc Verify Uint8Array entries value [index, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      const entry = iter.next().value!;
      expect(entry.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_1300
     * @tc.name testTypedUArraysEntriesTestFileD013
     * @tc.desc Verify Uint16Array entries value [index, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      const entry = iter.next().value!;
      expect(entry.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_1400
     * @tc.name testTypedUArraysEntriesTestFileD014
     * @tc.desc Verify Uint32Array entries value [index, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      const entry = iter.next().value!;
      expect(entry.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_1500
     * @tc.name testTypedUArraysEntriesTestFileD015
     * @tc.desc Verify BigUint64Array entries value [index, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      const entryResult = iter.next();
      expect(entryResult.value![0]).assertEqual(0);
      expect(entryResult.value![1]).assertEqual(10n);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_1600
     * @tc.name testTypedUArraysEntriesTestFileD016
     * @tc.desc Verify Uint8Array entries index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      const iter = arr.entries();
      const e0 = iter.next().value!;
      const e1 = iter.next().value!;
      const e2 = iter.next().value!;
      const e3 = iter.next().value!;
      expect(e0[0]).assertEqual(0);
      expect(e0[1]).assertEqual(10);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_1700
     * @tc.name testTypedUArraysEntriesTestFileD017
     * @tc.desc Verify Uint16Array entries index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300, 400]);
      const iter = arr.entries();
      const e0 = iter.next().value!;
      const e1 = iter.next().value!;
      const e2 = iter.next().value!;
      const e3 = iter.next().value!;
      expect(e0[0]).assertEqual(0);
      expect(e0[1]).assertEqual(100);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_1800
     * @tc.name testTypedUArraysEntriesTestFileD018
     * @tc.desc Verify Uint32Array entries index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000, 4000]);
      const iter = arr.entries();
      const e0 = iter.next().value!;
      const e1 = iter.next().value!;
      const e2 = iter.next().value!;
      const e3 = iter.next().value!;
      expect(e0[0]).assertEqual(0);
      expect(e0[1]).assertEqual(1000);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_1900
     * @tc.name testTypedUArraysEntriesTestFileD019
     * @tc.desc Verify BigUint64Array entries index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      const iter = arr.entries();
      const entry053 = iter.next().value!;
      expect(entry053[0]).assertEqual(0);
      expect(entry053[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_2000
     * @tc.name testTypedUArraysEntriesTestFileD020
     * @tc.desc Verify Uint8Array entries done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_2100
     * @tc.name testTypedUArraysEntriesTestFileD021
     * @tc.desc Verify Uint16Array entries done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_2200
     * @tc.name testTypedUArraysEntriesTestFileD022
     * @tc.desc Verify Uint32Array entries done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_2300
     * @tc.name testTypedUArraysEntriesTestFileD023
     * @tc.desc Verify BigUint64Array entries done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_2400
     * @tc.name testTypedUArraysEntriesTestFileD024
     * @tc.desc Verify Uint8Array entries value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      const entryVal058 = iter.next().value!;
      expect(entryVal058[0]).assertEqual(0);
      expect(entryVal058[1]).assertEqual(10);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_2500
     * @tc.name testTypedUArraysEntriesTestFileD025
     * @tc.desc Verify Uint8ClampedArray entries value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.entries();
      const entryVal059 = iter.next().value!;
      expect(entryVal059[0]).assertEqual(0);
      expect(entryVal059[1]).assertEqual(10);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_2600
     * @tc.name testTypedUArraysEntriesTestFileD026
     * @tc.desc Verify Uint16Array entries value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      const entryVal060 = iter.next().value!;
      expect(entryVal060[0]).assertEqual(0);
      expect(entryVal060[1]).assertEqual(100);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_2700
     * @tc.name testTypedUArraysEntriesTestFileD027
     * @tc.desc Verify Uint32Array entries value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      const entryVal061 = iter.next().value!;
      expect(entryVal061[0]).assertEqual(0);
      expect(entryVal061[1]).assertEqual(1000);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_6200

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_6300

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_6400

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_2800
     * @tc.name testTypedUArraysEntriesTestFileD028
     * @tc.desc Verify Uint8Array entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      expect(entry.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_2900
     * @tc.name testTypedUArraysEntriesTestFileD029
     * @tc.desc Verify Uint16Array entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      expect(entry.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_3000
     * @tc.name testTypedUArraysEntriesTestFileD030
     * @tc.desc Verify Uint32Array entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      expect(entry.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_3100
     * @tc.name testTypedUArraysEntriesTestFileD031
     * @tc.desc Verify BigUint64Array entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesTestFileD031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      expect(entry.done).assertTrue();

    });

  });
}
