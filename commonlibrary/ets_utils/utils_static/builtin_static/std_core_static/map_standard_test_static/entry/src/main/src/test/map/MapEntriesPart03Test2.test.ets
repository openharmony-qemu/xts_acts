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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from "../Util.test";
interface Point { x: double; y: double; }

export default function MapEntriesPart03Test(): void {
  describe('MapEntriesPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_0100
     * @tc.name mapEntriesPart03Test001
     * @tc.desc Verify next() on the entries() iterator of an empty map returns done=true with an undefined value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_0200
     * @tc.name mapEntriesPart03Test002
     * @tc.desc Verify next() on an empty map stays done after repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      let it: IterableIterator<[string, int]> = map.entries();
      it.next();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_0300
     * @tc.name mapEntriesPart03Test003
     * @tc.desc Verify ten consecutive next() calls on an empty map each return done=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      let it: IterableIterator<[string, int]> = map.entries();
      let allDone: boolean = true;
      for (let i = 0; i < 10; i++) {
        let r: IteratorResult<[string, int]> = it.next();
        if (!r.done) { allDone = false; }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_0400
     * @tc.name mapEntriesPart03Test004
     * @tc.desc Verify next() reports done=true after two preceding calls exhaust the map's only entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let it: IterableIterator<[string, int]> = map.entries();
      it.next();
      it.next();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_0500
     * @tc.name mapEntriesPart03Test005
     * @tc.desc Verify next() reports done=true with an undefined value once the single entry of a one-entry map is consumed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let it: IterableIterator<[string, int]> = map.entries();
      it.next();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_0600
     * @tc.name mapEntriesPart03Test006
     * @tc.desc Verify next() reports done after all two entries are consumed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('first', 1);
      map.set('second', 2);
      let it: IterableIterator<[string, int]> = map.entries();
      it.next();
      it.next();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_0700
     * @tc.name mapEntriesPart03Test007
     * @tc.desc Verify next() remains done across ten extra calls after exhaustion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      let it: IterableIterator<[string, int]> = map.entries();
      for (let i = 0; i < 2; i++) { it.next(); }
      let allDone: boolean = true;
      for (let i = 0; i < 10; i++) {
        let r: IteratorResult<[string, int]> = it.next();
        if (!r.done) { allDone = false; }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_0800
     * @tc.name mapEntriesPart03Test008
     * @tc.desc Verify entries() next() yields both key and value per entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('alpha', 1);
      map.set('beta', 2);
      map.set('gamma', 3);
      let it: IterableIterator<[string, int]> = map.entries();
      let r0: IteratorResult<[string, int]> = it.next();
      let r1: IteratorResult<[string, int]> = it.next();
      let r2: IteratorResult<[string, int]> = it.next();
      expect(r0.value![0]).assertEqual('alpha');
      expect(r1.value![0]).assertEqual('beta');
      expect(r2.value![0]).assertEqual('gamma');
      expect(r0.value![1]).assertEqual(1);
      expect(r1.value![1]).assertEqual(2);
      expect(r2.value![1]).assertEqual(3);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_0900
     * @tc.name mapEntriesPart03Test009
     * @tc.desc Verify next() reports done once all three entries are consumed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      let it: IterableIterator<[string, int]> = map.entries();
      it.next();
      it.next();
      it.next();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_1000
     * @tc.name mapEntriesPart03Test010
     * @tc.desc Verify next() reports done=true on every call once a two-entry map is fully consumed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<int, string> = new Map<int, string>();
      map.set(1, 'one');
      map.set(2, 'two');
      let it: IterableIterator<[int, string]> = map.entries();
      it.next();
      it.next();
      let r1: IteratorResult<[int, string]> = it.next();
      let r2: IteratorResult<[int, string]> = it.next();
      let r3: IteratorResult<[int, string]> = it.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_1100
     * @tc.name mapEntriesPart03Test011
     * @tc.desc Verify the first next() on an empty map reports done=true and a for...of loop over the same iterator then yields nothing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      let iterCount: int = 0;
      for (let e of it) { iterCount++; }
      expect(r.done).assertTrue();
      expect(iterCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_1200
     * @tc.name mapEntriesPart03Test012
     * @tc.desc Verify next() returns an undefined value on repeated calls after the only entry of a single-entry map is exhausted
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('k', 1);
      let it: IterableIterator<[string, int]> = map.entries();
      it.next();
      let r1: IteratorResult<[string, int]> = it.next();
      let r2: IteratorResult<[string, int]> = it.next();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_1300
     * @tc.name mapEntriesPart03Test013
     * @tc.desc Verify entries() yields the overwritten value 100 for the re-set key "a" followed by the untouched "b" entry in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('a', 100);
      let it: IterableIterator<[string, int]> = map.entries();
      let r0: IteratorResult<[string, int]> = it.next();
      let r1: IteratorResult<[string, int]> = it.next();
      expect(r0.value![0]).assertEqual('a');
      expect(r0.value![1]).assertEqual(100);
      expect(r1.value![0]).assertEqual('b');
      expect(r1.value![1]).assertEqual(2);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_1400
     * @tc.name mapEntriesPart03Test014
     * @tc.desc Verify deleting a non-existent key leaves entries() iteration unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.delete('nonexistent');
      let it: IterableIterator<[string, int]> = map.entries();
      let keys: string[] = [];
      for (let e of it) { keys.push(e[0]); }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_1500
     * @tc.name mapEntriesPart03Test015
     * @tc.desc Verify entries() only yields keys that remain after deletion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      map.delete('a');
      map.delete('c');
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.value![0]).assertEqual('b');
      expect(r.value![1]).assertEqual(2);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_1600
     * @tc.name mapEntriesPart03Test016
     * @tc.desc Verify entries() is done when all keys have been deleted
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.delete('a');
      map.delete('b');
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_1700
     * @tc.name mapEntriesPart03Test017
     * @tc.desc Verify entries() reports done on the first next() after the map is cleared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('x', 10);
      map.set('y', 20);
      map.clear();
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_1800
     * @tc.name mapEntriesPart03Test018
     * @tc.desc Verify entries() is done on a map already empty before clear
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.clear();
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_1900
     * @tc.name mapEntriesPart03Test019
     * @tc.desc Verify re-inserting a deleted key moves that entry to the end of the entries() iteration order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      map.delete('a');
      map.set('a', 99);
      let it: IterableIterator<[string, int]> = map.entries();
      let r0: IteratorResult<[string, int]> = it.next();
      let r1: IteratorResult<[string, int]> = it.next();
      let r2: IteratorResult<[string, int]> = it.next();
      expect(r0.value![0]).assertEqual('b');
      expect(r1.value![0]).assertEqual('c');
      expect(r2.value![0]).assertEqual('a');
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_2000
     * @tc.name mapEntriesPart03Test020
     * @tc.desc Verify entries() yields the overwritten value of a duplicated key followed by the other entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>([['dup', 1], ['dup', 2], ['other', 3]]);
      let it: IterableIterator<[string, int]> = map.entries();
      let r0: IteratorResult<[string, int]> = it.next();
      let r1: IteratorResult<[string, int]> = it.next();
      expect(r0.value![0]).assertEqual('dup');
      expect(r0.value![1]).assertEqual(2);
      expect(r1.value![0]).assertEqual('other');
      expect(r1.value![1]).assertEqual(3);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_2100
     * @tc.name mapEntriesPart03Test021
     * @tc.desc Verify setting the same key twice leaves a single entry with the last value and entries() reports done after it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('k', 5);
      map.set('k', 6);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.value![0]).assertEqual('k');
      expect(r.value![1]).assertEqual(6);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_2200
     * @tc.name mapEntriesPart03Test022
     * @tc.desc Verify repeated set updates the value seen through entries()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('x', 0);
      map.set('x', 1);
      map.set('x', 2);
      map.set('x', 3);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.value![0]).assertEqual('x');
      expect(r.value![1]).assertEqual(3);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_2300
     * @tc.name mapEntriesPart03Test023
     * @tc.desc Verify entries() reports done on the first next() for a map constructed with a null entries argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>(null);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_2400
     * @tc.name mapEntriesPart03Test024
     * @tc.desc Verify entries() is done for a map built from empty entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [];
      let map: Map<string, int> = new Map<string, int>(entries);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_2500
     * @tc.name mapEntriesPart03Test025
     * @tc.desc Verify overwriting an existing key keeps its original position in the entries() iteration order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('first', 1);
      map.set('second', 2);
      map.set('third', 3);
      map.set('second', 200);
      let keys: string[] = [];
      let it: IterableIterator<[string, int]> = map.entries();
      for (let e of it) { keys.push(e[0]); }
      expect(keys[0]).assertEqual('first');
      expect(keys[1]).assertEqual('second');
      expect(keys[2]).assertEqual('third');
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_2600
     * @tc.name mapEntriesPart03Test026
     * @tc.desc Verify entries() yields the null key entry with value 2 after the preceding string key "normal" in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string | null, int> = new Map<string | null, int>();
      map.set('normal', 1);
      map.set(null, 2);
      let it: IterableIterator<[(string | null), int]> = map.entries();
      let r0: IteratorResult<[(string | null), int]> = it.next();
      let r1: IteratorResult<[(string | null), int]> = it.next();
      expect(r0.value![0]).assertEqual('normal');
      expect(r1.value![0]).assertNull();
      expect(r1.value![1]).assertEqual(2);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_2700
     * @tc.name mapEntriesPart03Test027
     * @tc.desc Verify entries() yields the undefined key entry after the preceding string key "a" in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string | undefined, int> = new Map<string | undefined, int>();
      map.set('a', 10);
      map.set(undefined, 20);
      let it: IterableIterator<[(string | undefined), int]> = map.entries();
      let r0: IteratorResult<[(string | undefined), int]> = it.next();
      let r1: IteratorResult<[(string | undefined), int]> = it.next();
      expect(r0.value![0]).assertEqual('a');
      expect(r0.value![1]).assertEqual(10);
      expect(r1.value![0]).assertUndefined();
      expect(r1.value![1]).assertEqual(20);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_2800
     * @tc.name mapEntriesPart03Test028
     * @tc.desc Verify entries() yields the null value for key "k2" after the numeric value 42 of key "k1" in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int | null> = new Map<string, int | null>();
      map.set('k1', 42);
      map.set('k2', null);
      let it: IterableIterator<[string, (int | null)]> = map.entries();
      let r0: IteratorResult<[string, (int | null)]> = it.next();
      let r1: IteratorResult<[string, (int | null)]> = it.next();
      expect(r0.value![1]).assertEqual(42);
      expect(r1.value![1]).assertNull();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_2900
     * @tc.name mapEntriesPart03Test029
     * @tc.desc Verify entries() yields the undefined value for key "k2" after the numeric value 7 of key "k1" in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int | undefined> = new Map<string, int | undefined>();
      map.set('k1', 7);
      map.set('k2', undefined);
      let it: IterableIterator<[string, (int | undefined)]> = map.entries();
      let r0: IteratorResult<[string, (int | undefined)]> = it.next();
      let r1: IteratorResult<[string, (int | undefined)]> = it.next();
      expect(r0.value![1]).assertEqual(7);
      expect(r1.value![1]).assertUndefined();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_3000
     * @tc.name mapEntriesPart03Test030
     * @tc.desc Verify entries() yields the string key "null" and the null key as distinct entries in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string | null, int> = new Map<string | null, int>();
      map.set('null', 1);
      map.set(null, 2);
      let it: IterableIterator<[(string | null), int]> = map.entries();
      let r0: IteratorResult<[(string | null), int]> = it.next();
      let r1: IteratorResult<[(string | null), int]> = it.next();
      expect(r0.value![0]).assertEqual('null');
      expect(r1.value![0]).assertNull();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_3100
     * @tc.name mapEntriesPart03Test031
     * @tc.desc Verify deleting the null key removes its entry so entries() yields only the remaining key and then reports done
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string | null, int> = new Map<string | null, int>();
      map.set('a', 1);
      map.set(null, 99);
      map.delete(null);
      let it: IterableIterator<[(string | null), int]> = map.entries();
      let r: IteratorResult<[(string | null), int]> = it.next();
      expect(r.value![0]).assertEqual('a');
      expect(map.size).assertEqual(1);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_3200
     * @tc.name mapEntriesPart03Test032
     * @tc.desc Verify entries() yields the non-null overwritten value after a null value for the same key is replaced
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int | null> = new Map<string, int | null>();
      map.set('k', null);
      map.set('k', 100);
      let it: IterableIterator<[string, (int | null)]> = map.entries();
      let r: IteratorResult<[string, (int | null)]> = it.next();
      expect(r.value![1]).assertEqual(100);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_3300
     * @tc.name mapEntriesPart03Test033
     * @tc.desc Verify for...of iterates zero entries when the map is empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      let count: int = 0;
      for (let e of map.entries()) { count++; }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_3400
     * @tc.name mapEntriesPart03Test034
     * @tc.desc Verify for...of visits the single entry of a one-entry map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('solo', 1);
      let count: int = 0;
      let foundKey: string = '';
      for (let e of map.entries()) {
        count++;
        foundKey = e[0];
      }
      expect(count).assertEqual(1);
      expect(foundKey).assertEqual('solo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_3500
     * @tc.name mapEntriesPart03Test035
     * @tc.desc Verify for...of iterates entries in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('one', 1);
      map.set('two', 2);
      map.set('three', 3);
      let result: string[] = [];
      for (let e of map.entries()) {
        result.push(e[0]);
      }
      expect(result[0]).assertEqual('one');
      expect(result[1]).assertEqual('two');
      expect(result[2]).assertEqual('three');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_3600
     * @tc.name mapEntriesPart03Test036
     * @tc.desc Verify break inside a for...of loop over entries() stops iteration after the first entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      let firstOnly: string = '';
      for (let e of map.entries()) {
        firstOnly = e[0];
        break;
      }
      expect(firstOnly).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_3700
     * @tc.name mapEntriesPart03Test037
     * @tc.desc Verify break in for...of leaves the iterator at the next entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      let it: IterableIterator<[string, int]> = map.entries();
      let first: string = '';
      for (let e of it) {
        first = e[0];
        break;
      }
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.value![0]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_3800
     * @tc.name mapEntriesPart03Test038
     * @tc.desc Verify for...of over entries() visits the duplicate-keyed entry exactly once and yields its latest value 999
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('k', 1);
      map.set('k', 999);
      let foundVal: int = 0;
      let count: int = 0;
      for (let e of map.entries()) {
        count = count + 1;
        foundVal = e[1];
      }
      expect(foundVal).assertEqual(999);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_3900
     * @tc.name mapEntriesPart03Test039
     * @tc.desc Verify for...of over entries() yields only the keys remaining after a deletion, in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      map.delete('b');
      let keys: string[] = [];
      for (let e of map.entries()) { keys.push(e[0]); }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_4000
     * @tc.name mapEntriesPart03Test040
     * @tc.desc Verify for...of over entries() visits nothing after the map is cleared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('x', 1);
      map.clear();
      let count: int = 0;
      for (let e of map.entries()) { count++; }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_4100
     * @tc.name mapEntriesPart03Test041
     * @tc.desc Verify for...of over entries() yields the null key entry after the preceding string key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string | null, int> = new Map<string | null, int>();
      map.set('first', 10);
      map.set(null, 20);
      let allKeys: (string | null)[] = [];
      let it: IterableIterator<[string | null, int]> = map.entries();
      for (let e of it) { allKeys.push(e[0]); }
      expect(allKeys[0]).assertEqual('first');
      expect(allKeys[1]).assertNull();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_4200
     * @tc.name mapEntriesPart03Test042
     * @tc.desc Verify for...of over entries() exposes both the key and the value of each entry in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('keyA', 100);
      map.set('keyB', 200);
      let k0: string = '';
      let firstVal: int = 0;
      let k1: string = '';
      let secondVal: int = 0;
      let idx: int = 0;
      let it: IterableIterator<[string, int]> = map.entries();
      for (let e of it) {
        if (idx === 0) { k0 = e[0]; firstVal = e[1]; }
        if (idx === 1) { k1 = e[0]; secondVal = e[1]; }
        idx++;
      }
      expect(k0).assertEqual('keyA');
      expect(firstVal).assertEqual(100);
      expect(k1).assertEqual('keyB');
      expect(secondVal).assertEqual(200);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_4300
     * @tc.name mapEntriesPart03Test043
     * @tc.desc Verify for...of over entries() yields an undefined value for the second entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int | undefined> = new Map<string, int | undefined>();
      map.set('a', 1);
      map.set('b', undefined);
      let vals: (int | undefined)[] = [];
      let it: IterableIterator<[string, int | undefined]> = map.entries();
      for (let e of it) { vals.push(e[1]); }
      expect(vals[0]).assertEqual(1);
      expect(vals[1]).assertUndefined();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_4400
     * @tc.name mapEntriesPart03Test044
     * @tc.desc Verify for...of over entries() visits Date-keyed entries in insertion order, as identified by their time values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<Date, string> = new Map<Date, string>();
      let d1: Date = new Date(1000, 0, 1);
      let d2: Date = new Date(2000, 0, 1);
      map.set(d1, 'early');
      map.set(d2, 'late');
      let times: double[] = [];
      let it: IterableIterator<[Date, string]> = map.entries();
      for (let e of it) { times.push(e[0].getTime()); }
      expect(times[0]).assertEqual(d1.getTime());
      expect(times[1]).assertEqual(d2.getTime());
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_4500
     * @tc.name mapEntriesPart03Test045
     * @tc.desc Verify two independent entries() iterators each start at the first entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      let itA: IterableIterator<[string, int]> = map.entries();
      let itB: IterableIterator<[string, int]> = map.entries();
      let rA0: IteratorResult<[string, int]> = itA.next();
      let rB0: IteratorResult<[string, int]> = itB.next();
      expect(rA0.value![0]).assertEqual('a');
      expect(rB0.value![0]).assertEqual('a');
      expect(itA.next().done).assertFalse();
      expect(itA.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_4600
     * @tc.name mapEntriesPart03Test046
     * @tc.desc Verify an exhausted iterator does not affect a newly created one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('m', 1);
      let it1: IterableIterator<[string, int]> = map.entries();
      it1.next();
      it1.next();
      let it2: IterableIterator<[string, int]> = map.entries();
      let r2: IteratorResult<[string, int]> = it2.next();
      expect(r2.done).assertFalse();
      expect(r2.value![0]).assertEqual('m');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_4700
     * @tc.name mapEntriesPart03Test047
     * @tc.desc Verify for...of can iterate the map multiple times
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('p', 1);
      map.set('q', 2);
      let count1: int = 0;
      let count2: int = 0;
      for (let e of map.entries()) { count1++; }
      for (let e of map.entries()) { count2++; }
      expect(count1).assertEqual(2);
      expect(count2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_4800
     * @tc.name mapEntriesPart03Test048
     * @tc.desc Verify each entries() call returns a distinct iterator instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let it1: IterableIterator<[string, int]> = map.entries();
      let it2: IterableIterator<[string, int]> = map.entries();
      let it3: IterableIterator<[string, int]> = map.entries();
      it1.next();
      expect(it2.next().value![0]).assertEqual('a');
      it2.next();
      expect(it3.next().value![0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_4900
     * @tc.name mapEntriesPart03Test049
     * @tc.desc Verify next() on a single-entry map returns done=false with the key-value pair ["k", 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('k', 1);
      let iter: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('k');
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_5000
     * @tc.name mapEntriesPart03Test050
     * @tc.desc Verify for...of over the entries() iterator yields the single entry with key "x" and value 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('x', 1);
      let it: IterableIterator<[string, int]> = map.entries();
      for (let e of it) {
        expect(e[0]).assertEqual('x');
        expect(e[1]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_5100
     * @tc.name mapEntriesPart03Test051
     * @tc.desc Verify next() on a non-empty map returns done=false and a value that is a two-element [key, value] tuple
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('hello', 42);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      expect(r.done).assertFalse();
      expect(r.value!.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_5200
     * @tc.name mapEntriesPart03Test052
     * @tc.desc Verify entries() iterators of separate maps are independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map1: Map<string, int> = new Map<string, int>();
      map1.set('a', 1);
      let map2: Map<string, int> = new Map<string, int>();
      map2.set('b', 2);
      let it1: IterableIterator<[string, int]> = map1.entries();
      let it2: IterableIterator<[string, int]> = map2.entries();
      let r1: IteratorResult<[string, int]> = it1.next();
      let r2: IteratorResult<[string, int]> = it2.next();
      expect(r1.value![0]).assertEqual('a');
      expect(r2.value![0]).assertEqual('b');
      expect(it1.next().done).assertTrue();
      expect(it2.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_5300
     * @tc.name mapEntriesPart03Test053
     * @tc.desc Verify entries() preserves insertion order for int keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<int, string> = new Map<int, string>();
      map.set(5, 'e');
      map.set(4, 'd');
      map.set(3, 'c');
      map.set(2, 'b');
      map.set(1, 'a');
      let order: int[] = [];
      for (let e of map.entries()) { order.push(e[0]); }
      expect(order[0]).assertEqual(5);
      expect(order[1]).assertEqual(4);
      expect(order[2]).assertEqual(3);
      expect(order[3]).assertEqual(2);
      expect(order[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_5400
     * @tc.name mapEntriesPart03Test054
     * @tc.desc Verify entries() yields the false key before the true key in insertion order for a boolean-keyed map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<boolean, string> = new Map<boolean, string>();
      map.set(false, 'no');
      map.set(true, 'yes');
      let it: IterableIterator<[boolean, string]> = map.entries();
      let r0: IteratorResult<[boolean, string]> = it.next();
      let r1: IteratorResult<[boolean, string]> = it.next();
      expect(r0.value![0]).assertFalse();
      expect(r1.value![0]).assertTrue();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_5500
     * @tc.name mapEntriesPart03Test055
     * @tc.desc Verify entries() iterates keys in insertion order and preserves an empty-string key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('visible', 1);
      map.set('', 0);
      map.set('also', 2);
      let keys: string[] = [];
      let it: IterableIterator<[string, int]> = map.entries();
      for (let e of it) { keys.push(e[0]); }
      expect(keys[0]).assertEqual('visible');
      expect(keys[1]).assertEqual('');
      expect(keys[2]).assertEqual('also');
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_5600
     * @tc.name mapEntriesPart03Test056
     * @tc.desc Verify entries() yields the two RegExp keys in insertion order and each source matches its inserted pattern
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<RegExp, int> = new Map<RegExp, int>();
      let re1: RegExp = new RegExp('foo', 'g');
      let re2: RegExp = new RegExp('bar', 'i');
      map.set(re1, 10);
      map.set(re2, 20);
      let it: IterableIterator<[RegExp, int]> = map.entries();
      let r0: IteratorResult<[RegExp, int]> = it.next();
      let r1: IteratorResult<[RegExp, int]> = it.next();
      expect(r0.value![0].source).assertEqual('foo');
      expect(r1.value![0].source).assertEqual('bar');
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_5700
     * @tc.name mapEntriesPart03Test057
     * @tc.desc Verify adding a new key between next() calls does not change the entry the iterator returns next
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      let it: IterableIterator<[string, int]> = map.entries();
      it.next();
      map.set('c', 3);
      let rNext: IteratorResult<[string, int]> = it.next();
      expect(rNext.value![0]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_5800
     * @tc.name mapEntriesPart03Test058
     * @tc.desc Verify entries() next() yields the single entry and then reports done
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>([['single', 99]]);
      let it: IterableIterator<[string, int]> = map.entries();
      let r0: IteratorResult<[string, int]> = it.next();
      let r1: IteratorResult<[string, int]> = it.next();
      expect(r0.value![0]).assertEqual('single');
      expect(r0.value![1]).assertEqual(99);
      expect(r1.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_5900
     * @tc.name mapEntriesPart03Test059
     * @tc.desc Verify entries() yields two distinct Date keys with the same time value as separate entries in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<Date, string> = new Map<Date, string>();
      let d1: Date = new Date(5000, 0, 1);
      let d2: Date = new Date(5000, 0, 1);
      map.set(d1, 'first');
      map.set(d2, 'second');
      let it: IterableIterator<[Date, string]> = map.entries();
      let r0: IteratorResult<[Date, string]> = it.next();
      let r1: IteratorResult<[Date, string]> = it.next();
      expect(r0.value![0]).assertEqual(d1);
      expect(r0.value![1]).assertEqual('first');
      expect(r1.value![0]).assertEqual(d2);
      expect(r1.value![1]).assertEqual('second');
      expect(map.size).assertEqual(2);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART03_TEST_6000
     * @tc.name mapEntriesPart03Test060
     * @tc.desc Verify entries() yields two structurally identical object keys as distinct entries in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapEntriesPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<Point, string> = new Map<Point, string>();
      let p1: Point = { x: 1, y: 2 } as Point;
      let p2: Point = { x: 1, y: 2 } as Point;
      map.set(p1, 'A');
      map.set(p2, 'B');
      let it: IterableIterator<[Point, string]> = map.entries();
      let r0: IteratorResult<[Point, string]> = it.next();
      let r1: IteratorResult<[Point, string]> = it.next();
      expect(r0.value![0]).assertEqual(p1);
      expect(r0.value![1]).assertEqual('A');
      expect(r1.value![0]).assertEqual(p2);
      expect(r1.value![1]).assertEqual('B');
      expect(map.size).assertEqual(2);
      expect(it.next().done).assertTrue();
    });

  });
}