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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Uint8ArrayEntriesTest(): void {
  describe('Uint8ArrayEntriesTest', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_0100
     * @tc.name testUint8ArrayEntries001
     * @tc.desc Verify entries() with zero parameters for normal call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(5, 10);
      const iter = arr.entries();
      expect(iter).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_0200
     * @tc.name testUint8ArrayEntries002
     * @tc.desc Verify entries() returns non-null object
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      const iter = arr.entries();
      expect(iter).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_0300
     * @tc.name testUint8ArrayEntries003
     * @tc.desc Verify entries() returns object with next method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      const iter = arr.entries();
      expect(iter.next).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_0400
     * @tc.name testUint8ArrayEntries004
     * @tc.desc Verify entries() returns object with Symbol.iterator returning self
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      const iter = arr.entries();
      const same = iter.$_iterator();
      expect(same).assertEqual(iter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_0500
     * @tc.name testUint8ArrayEntries005
     * @tc.desc Verify multiple calls to entries() return different iterator instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      const iter1 = arr.entries();
      const iter2 = arr.entries();
      expect(iter1).not().assertEqual(iter2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_0600
     * @tc.name testUint8ArrayEntries006
     * @tc.desc Verify empty array entries().next().done is true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      const iter = arr.entries();
      const e = iter.next();
      expect(e.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_0700
     * @tc.name testUint8ArrayEntries007
     * @tc.desc Verify empty array for..of loop iterates 0 times
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      let count = 0;
      const iter = arr.entries();
      let e = iter.next();
      while (!e.done) {
        count++;
        e = iter.next();
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_0800
     * @tc.name testUint8ArrayEntries008
     * @tc.desc Verify empty array consecutive next() calls return done true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      const iter = arr.entries();
      const e1 = iter.next();
      const e2 = iter.next();
      expect(e1.done).assertTrue();
      expect(e2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_0900
     * @tc.name testUint8ArrayEntries009
     * @tc.desc Verify empty array new iterator after consuming next() is still done
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      const iter1 = arr.entries();
      iter1.next();
      const iter2 = arr.entries();
      const e = iter2.next();
      expect(e.done).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_1000
     * @tc.name testUint8ArrayEntries010
     * @tc.desc Verify single element entries first entry index is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(42);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.done).assertFalse();
      expect(e.value![0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_1100
     * @tc.name testUint8ArrayEntries011
     * @tc.desc Verify single element entries first entry value matches element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(42);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_1200
     * @tc.name testUint8ArrayEntries012
     * @tc.desc Verify single element entries next().done is true after consumption
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(99);
      const iter = arr.entries();
      iter.next();
      const e = iter.next();
      expect(e.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_1300
     * @tc.name testUint8ArrayEntries013
     * @tc.desc Verify single element value 255 (MAX) entries value correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(255);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_1400
     * @tc.name testUint8ArrayEntries014
     * @tc.desc Verify three element array entries traversal count is 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const iter = arr.entries();
      let count = 0;
      let e = iter.next();
      while (!e.done) {
        count++;
        e = iter.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_1500
     * @tc.name testUint8ArrayEntries015
     * @tc.desc Verify three element array entries first entry index is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_1600
     * @tc.name testUint8ArrayEntries016
     * @tc.desc Verify three element array entries first entry value is 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_1700
     * @tc.name testUint8ArrayEntries017
     * @tc.desc Verify three element array entries second entry index is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const iter = arr.entries();
      iter.next();
      const e = iter.next();
      expect(e.value![0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_1800
     * @tc.name testUint8ArrayEntries018
     * @tc.desc Verify three element array entries second entry value is 20
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const iter = arr.entries();
      iter.next();
      const e = iter.next();
      expect(e.value![1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_1900
     * @tc.name testUint8ArrayEntries019
     * @tc.desc Verify three element array entries third entry index is 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const iter = arr.entries();
      iter.next();
      iter.next();
      const e = iter.next();
      expect(e.value![0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_2000
     * @tc.name testUint8ArrayEntries020
     * @tc.desc Verify three element array entries third entry value is 30
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const iter = arr.entries();
      iter.next();
      iter.next();
      const e = iter.next();
      expect(e.value![1]).assertEqual(30);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_2100
     * @tc.name testUint8ArrayEntries021
     * @tc.desc Verify five element array entries traversal count is 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      const iter = arr.entries();
      let count = 0;
      let e = iter.next();
      while (!e.done) {
        count++;
        e = iter.next();
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_2200
     * @tc.name testUint8ArrayEntries022
     * @tc.desc Verify 100 element array entries traversal count is 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      const iter = arr.entries();
      let count = 0;
      let e = iter.next();
      while (!e.done) {
        count++;
        e = iter.next();
      }
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_2300
     * @tc.name testUint8ArrayEntries023
     * @tc.desc Verify 100 element array entries 61st entry index is 60
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      const iter = arr.entries();
      for (let i = 0; i < 60; i++) {
        iter.next();
      }
      const e = iter.next();
      expect(e.value![0]).assertEqual(60);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_2400
     * @tc.name testUint8ArrayEntries024
     * @tc.desc Verify element value 0 (MIN) entries value correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_2500
     * @tc.name testUint8ArrayEntries025
     * @tc.desc Verify element value 256 (overflow truncated to 0) entries value is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(256);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_2600
     * @tc.name testUint8ArrayEntries026
     * @tc.desc Verify element value -1 (wrapped to 255) entries value is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(-1);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_2700
     * @tc.name testUint8ArrayEntries027
     * @tc.desc Verify element value 127 (midpoint) entries value correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(127);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_2800
     * @tc.name testUint8ArrayEntries028
     * @tc.desc Verify element value 128 (midpoint+1) entries value correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(128);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_2900
     * @tc.name testUint8ArrayEntries029
     * @tc.desc Verify element value 0x80 (128 hexadecimal) entries value correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0x80);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_3000
     * @tc.name testUint8ArrayEntries030
     * @tc.desc Verify element value 0xFF (255 hexadecimal) entries value correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0xFF);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(255);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_3100
     * @tc.name testUint8ArrayEntries031
     * @tc.desc Verify Uint8Array constructed from ArrayBuffer entries normal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![0]).assertEqual(0);
      expect(e.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_3200
     * @tc.name testUint8ArrayEntries032
     * @tc.desc Verify subarray view entries first entry index starts from 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      const sub = arr.subarray(2, 4);
      const iter = sub.entries();
      const e = iter.next();
      expect(e.value![0]).assertEqual(0);
      expect(e.value![1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_3300
     * @tc.name testUint8ArrayEntries033
     * @tc.desc Verify subarray view entries traversal count is view length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      const sub = arr.subarray(1, 4);
      const iter = sub.entries();
      let count = 0;
      let e = iter.next();
      while (!e.done) {
        count++;
        e = iter.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_3400
     * @tc.name testUint8ArrayEntries034
     * @tc.desc Verify shared buffer view entries reflects buffer modification
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const sub = arr.subarray(0, 2);
      arr.$_set(1, 200);
      const iter = sub.entries();
      iter.next();
      const e = iter.next();
      expect(e.value![1]).assertEqual(200);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_3500
     * @tc.name testUint8ArrayEntries035
     * @tc.desc Verify Uint8Array constructed from FixedArray<int> entries normal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const arr = new Uint8Array(source);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_3600
     * @tc.name testUint8ArrayEntries036
     * @tc.desc Verify Uint8Array constructed from FixedArray<number> entries normal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<number> = [1.0, 2.0, 3.0];
      const arr = new Uint8Array(source);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_3700
     * @tc.name testUint8ArrayEntries037
     * @tc.desc Verify for...of traversal entries index increments in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(5, 10, 15);
      let idx = 0;
      const iter = arr.entries();
      let e = iter.next();
      while (!e.done) {
        const entry = e.value;
        expect(entry![0]).assertEqual(idx);
        idx++;
        e = iter.next();
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_3800
     * @tc.name testUint8ArrayEntries038
     * @tc.desc Verify for...of traversal entries values match array elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(5, 10, 15);
      const expected = Uint8Array.of(5, 10, 15);
      let idx = 0;
      const iter = arr.entries();
      let e = iter.next();
      while (!e.done) {
        const entry = e.value;
        expect(entry![1]).assertEqual(expected.at(idx));
        idx++;
        e = iter.next();
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_3900
     * @tc.name testUint8ArrayEntries039
     * @tc.desc Verify complete traversal next().done is true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      const iter = arr.entries();
      iter.next();
      iter.next();
      const e = iter.next();
      expect(e.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_4000
     * @tc.name testUint8ArrayEntries040
     * @tc.desc Verify exhausted iterator consecutive next() calls return done
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      const iter = arr.entries();
      iter.next();
      const e1 = iter.next();
      const e2 = iter.next();
      const e3 = iter.next();
      expect(e1.done).assertTrue();
      expect(e2.done).assertTrue();
      expect(e3.done).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_4100
     * @tc.name testUint8ArrayEntries041
     * @tc.desc Verify modifying untraversed element during entries traversal reflects new value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      const iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      arr.$_set(3, 99);
      const e = iter.next();
      expect(e.value![1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_4200
     * @tc.name testUint8ArrayEntries042
     * @tc.desc Verify modifying traversed element does not affect subsequent entry
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const iter = arr.entries();
      iter.next();
      arr.$_set(0, 100);
      const e = iter.next();
      expect(e.value![1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_4300
     * @tc.name testUint8ArrayEntries043
     * @tc.desc Verify fill during entries traversal fills untraversed region with new value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      const iter = arr.entries();
      iter.next();
      iter.next();
      arr.fill(255, 2);
      const e = iter.next();
      expect(e.value![1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_4400
     * @tc.name testUint8ArrayEntries044
     * @tc.desc Verify set during entries traversal writes to untraversed position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      const iter = arr.entries();
      iter.next();
      iter.next();
      arr.set(Uint8Array.of(99), 3);
      const e = iter.next();
      expect(e.value![0]).assertEqual(2);
      const e2 = iter.next();
      expect(e2.value![1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_4500
     * @tc.name testUint8ArrayEntries045
     * @tc.desc Verify new entries iterator after array modification sees latest values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      arr.entries();
      arr.$_set(0, 100);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_4600
     * @tc.name testUint8ArrayEntries046
     * @tc.desc Verify modification via $_set during entries traversal correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      const iter = arr.entries();
      iter.next();
      arr.$_set(2, 88);
      const e2 = iter.next();
      const e3 = iter.next();
      expect(e3.value![0]).assertEqual(2);
      expect(e3.value![1]).assertEqual(88);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_4700
     * @tc.name testUint8ArrayEntries047
     * @tc.desc Verify two entries iterators from same array step independently
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      const iter1 = arr.entries();
      const iter2 = arr.entries();
      iter1.next();
      iter1.next();
      const e = iter2.next();
      expect(e.value![0]).assertEqual(0);
      expect(e.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_4800
     * @tc.name testUint8ArrayEntries048
     * @tc.desc Verify two entries iterators interleaved stepping do not affect each other
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const iter1 = arr.entries();
      const iter2 = arr.entries();
      const a = iter1.next();
      const b = iter2.next();
      const c = iter1.next();
      const d = iter2.next();
      expect(a.value![0]).assertEqual(0);
      expect(b.value![0]).assertEqual(0);
      expect(c.value![0]).assertEqual(1);
      expect(d.value![0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_4900
     * @tc.name testUint8ArrayEntries049
     * @tc.desc Verify one iterator exhausted does not affect another iterator
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const iter1 = arr.entries();
      const iter2 = arr.entries();
      let e = iter1.next();
      while (!e.done) {
        e = iter1.next();
      }
      const e2 = iter2.next();
      expect(e2.value![0]).assertEqual(0);
      expect(e2.value![1]).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_5000
     * @tc.name testUint8ArrayEntries050
     * @tc.desc Verify empty array entries does not throw exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      let threw = false;
      try {
        const iter = arr.entries();
        iter.next();
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('Error');
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_5100
     * @tc.name testUint8ArrayEntries051
     * @tc.desc Verify non-empty array entries does not throw exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let threw = false;
      try {
        const iter = arr.entries();
        iter.next();
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('Error');
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_5200
     * @tc.name testUint8ArrayEntries052
     * @tc.desc Verify for...of traversal entries with throw does not affect array structure
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let threw = false;
      try {
        const iter = arr.entries();
        let e = iter.next();
        while (!e.done) {
          throw new Error();
        }
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('Error');
      }
      expect(threw).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_5300
     * @tc.name testUint8ArrayEntries053
     * @tc.desc Verify Uint8Array with byteOffset constructed entries index starts from 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Uint8Array(buf, 2, 3);
      arr.$_set(0, 100);
      arr.$_set(1, 200);
      const iter = arr.entries();
      const e = iter.next();
      expect(e.value![0]).assertEqual(0);
      expect(e.value![1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_ENTRIES_5400
     * @tc.name testUint8ArrayEntries054
     * @tc.desc Verify array with all equal elements (128) entries index correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEntries054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(4);
      arr.fill(128);
      const iter = arr.entries();
      const e1 = iter.next();
      const e2 = iter.next();
      expect(e1.value![1]).assertEqual(128);
      expect(e2.value![0]).assertEqual(1);
    });
  });
}
