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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_3500
     * @tc.name testTypedUArraysEntriesPart1_035
     * @tc.desc Verify new Uint8Array([1,2,3]) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_3600
     * @tc.name testTypedUArraysEntriesPart1_036
     * @tc.desc Verify new Uint16Array(3) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_3700
     * @tc.name testTypedUArraysEntriesPart1_037
     * @tc.desc Verify new Uint16Array([1,2,3]) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_3800
     * @tc.name testTypedUArraysEntriesPart1_038
     * @tc.desc Verify new Uint32Array(3) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_3900
     * @tc.name testTypedUArraysEntriesPart1_039
     * @tc.desc Verify new Uint32Array([1,2,3]) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_4000
     * @tc.name testTypedUArraysEntriesPart1_040
     * @tc.desc Verify new BigUint64Array(3) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_4100
     * @tc.name testTypedUArraysEntriesPart1_041
     * @tc.desc Verify new BigUint64Array([1n,2n,3n]) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_4200
     * @tc.name testTypedUArraysEntriesPart1_042
     * @tc.desc Verify Uint8Array entries next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      let result = iter.next();
      expect(!result.done).assertTrue();
      expect(typeof result.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_4300
     * @tc.name testTypedUArraysEntriesPart1_043
     * @tc.desc Verify Uint16Array entries next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      let result = iter.next();
      expect(!result.done).assertTrue();
      expect(typeof result.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_4400
     * @tc.name testTypedUArraysEntriesPart1_044
     * @tc.desc Verify Uint32Array entries next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      let result = iter.next();
      expect(!result.done).assertTrue();
      expect(typeof result.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_4500
     * @tc.name testTypedUArraysEntriesPart1_045
     * @tc.desc Verify BigUint64Array entries next value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      let result = iter.next();
      expect(!result.done).assertTrue();
      expect(typeof result.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_4600
     * @tc.name testTypedUArraysEntriesPart1_046
     * @tc.desc Verify Uint8Array entries value [index, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      const entry = iter.next().value!;
      expect(entry.length === 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_4700
     * @tc.name testTypedUArraysEntriesPart1_047
     * @tc.desc Verify Uint16Array entries value [index, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      const entry = iter.next().value!;
      expect(entry.length === 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_4800
     * @tc.name testTypedUArraysEntriesPart1_048
     * @tc.desc Verify Uint32Array entries value [index, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      const entry = iter.next().value!;
      expect(entry.length === 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_4900
     * @tc.name testTypedUArraysEntriesPart1_049
     * @tc.desc Verify BigUint64Array entries value [index, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      const entryResult = iter.next();
      expect(entryResult.value![0]).assertEqual(0);
      expect(entryResult.value![1]).assertEqual(10n);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_5000
     * @tc.name testTypedUArraysEntriesPart1_050
     * @tc.desc Verify Uint8Array entries index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_5100
     * @tc.name testTypedUArraysEntriesPart1_051
     * @tc.desc Verify Uint16Array entries index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_5200
     * @tc.name testTypedUArraysEntriesPart1_052
     * @tc.desc Verify Uint32Array entries index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_5300
     * @tc.name testTypedUArraysEntriesPart1_053
     * @tc.desc Verify BigUint64Array entries index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      const iter = arr.entries();
      const entry053 = iter.next().value!;
      expect(entry053[0]).assertEqual(0);
      expect(entry053[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_5400
     * @tc.name testTypedUArraysEntriesPart1_054
     * @tc.desc Verify Uint8Array entries done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_5500
     * @tc.name testTypedUArraysEntriesPart1_055
     * @tc.desc Verify Uint16Array entries done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_5600
     * @tc.name testTypedUArraysEntriesPart1_056
     * @tc.desc Verify Uint32Array entries done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_5700
     * @tc.name testTypedUArraysEntriesPart1_057
     * @tc.desc Verify BigUint64Array entries done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_5800
     * @tc.name testTypedUArraysEntriesPart1_058
     * @tc.desc Verify Uint8Array entries value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      const entryVal058 = iter.next().value!;
      expect(entryVal058[0]).assertEqual(0);
      expect(entryVal058[1]).assertEqual(10);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_5900
     * @tc.name testTypedUArraysEntriesPart1_059
     * @tc.desc Verify Uint8ClampedArray entries value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.entries();
      const entryVal059 = iter.next().value!;
      expect(entryVal059[0]).assertEqual(0);
      expect(entryVal059[1]).assertEqual(10);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_6000
     * @tc.name testTypedUArraysEntriesPart1_060
     * @tc.desc Verify Uint16Array entries value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      const entryVal060 = iter.next().value!;
      expect(entryVal060[0]).assertEqual(0);
      expect(entryVal060[1]).assertEqual(100);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_6100
     * @tc.name testTypedUArraysEntriesPart1_061
     * @tc.desc Verify Uint32Array entries value Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_6500
     * @tc.name testTypedUArraysEntriesPart1_065
     * @tc.desc Verify Uint8Array entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      expect(entry.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_6600
     * @tc.name testTypedUArraysEntriesPart1_066
     * @tc.desc Verify Uint16Array entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      expect(entry.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_6700
     * @tc.name testTypedUArraysEntriesPart1_067
     * @tc.desc Verify Uint32Array entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.entries();
      let entry = iter.next();
      while (!entry.done) {
        entry = iter.next();
      }
      expect(entry.done).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART4_6800
     * @tc.name testTypedUArraysEntriesPart1_068
     * @tc.desc Verify BigUint64Array entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
