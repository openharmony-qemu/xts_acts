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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class Item025 {
  id: int = 0;

  constructor(id: int) {
    this.id = id;
  }
}

export default function SetEntriesTest(): void {
  describe('SetEntriesTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.name testSetEntries001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_0100
     * @tc.desc Verify entries() with no parameters returns IterableIterator<[K,K]>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      const iter = set.entries();
      const r1 = iter.next();
      let v = r1.value as [long, long];
      expect(v[0]).assertEqual(1);
    });

    /**
     * @tc.name testSetEntries002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_0200
     * @tc.desc Verify entries() returns iterator with correct value via as cast
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.entries();
      const r1 = iter.next();
      let v = r1.value as [int, int];
      expect(v[0]).assertEqual(1);
    });

    /**
     * @tc.name testSetEntries003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_0300
     * @tc.desc Verify entries() next() returns value and done properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const iter = set.entries();
      const result = iter.next();
      expect(result.done).assertFalse();
      let entry = result.value as [int, int];
      expect(entry[0]).assertEqual(1);
    });

    /**
     * @tc.name testSetEntries004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_0400
     * @tc.desc Verify entries() returns iterator accessed via next() to get key-value pairs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.entries();
      const r1 = iter.next();
      let v1 = r1.value as [int, int];
      expect(v1[0]).assertEqual(1);
      expect(v1[1]).assertEqual(1);
      const r2 = iter.next();
      let v2 = r2.value as [int, int];
      expect(v2[0]).assertEqual(2);
      expect(v2[1]).assertEqual(2);
      const r3 = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.name testSetEntries005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_0500
     * @tc.desc Verify iterator returns entries in Set insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(10);
      set.add(20);
      set.add(30);
      const iter = set.entries();
      let v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(10);
      v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(20);
      v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(30);
    });

    /**
     * @tc.name testSetEntries006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_0600
     * @tc.desc Verify for-of syntax traverses entries() iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      let count = 0;
      for (const entry of set.entries()) {
        expect(entry[0]).assertEqual(entry[1]);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testSetEntries007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_0700
     * @tc.desc Verify empty Set entries() returns iterator with first next() done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      const iter = set.entries();
      const result = iter.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.name testSetEntries008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_0800
     * @tc.desc Verify empty Set entries() for-of loop body does not execute
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      let count = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testSetEntries009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_0900
     * @tc.desc Verify single-element Set entries() returns one entry then done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([42.0]);
      const iter = set.entries();
      const r = iter.next();
      let v = r.value as [double, double];
      expect(v[0]).assertEqual(42.0);
      expect(v[1]).assertEqual(42.0);
      expect(r.done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_1000
     * @tc.desc Verify entries() return value has next() method of IterableIterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const iter = set.entries();
      let typeNext: string = typeof iter.next;
      expect(typeNext).assertEqual("function");
    });

    /**
     * @tc.name testSetEntries011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_1100
     * @tc.desc Verify next() return value is a two-element tuple with equal key and value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["hello"]);
      const iter = set.entries();
      const r = iter.next();
      let v = r.value as [string, string];
      expect(v.length).assertEqual(2);
      expect(v[0]).assertEqual("hello");
      expect(v[1]).assertEqual("hello");
    });

    /**
     * @tc.name testSetEntries012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_1200
     * @tc.desc Verify next() return object contains value and done properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const iter = set.entries();
      const r = iter.next();
      expect(r.done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_1300
     * @tc.desc Verify Set entries key and value are always equal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      for (const entry of set.entries()) {
        expect(entry[0]).assertEqual(entry[1]);
      }
    });

    /**
     * @tc.name testSetEntries014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_1400
     * @tc.desc Verify numeric type Set entries key and value strictly equal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1.5, 2.7, 3.14]);
      const iter = set.entries();
      let r = iter.next();
      while (!r.done) {
        let v = r.value as [number, number];
        expect(v[0]).assertEqual(v[1]);
        r = iter.next();
      }
    });

    /**
     * @tc.name testSetEntries015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_1500
     * @tc.desc Verify large Set entries() correctly traverses all key-value pairs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }
      const iter = set.entries();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        let v = r.value as [int, int];
        expect(v[0]).assertEqual(v[1]);
        expect(v[0]).assertEqual(count);
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.name testSetEntries016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_1600
     * @tc.desc Verify Set<string> entries() returns string key-value pair iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["foo", "bar"]);
      const iter = set.entries();
      let v = iter.next().value as [string, string];
      expect(v[0]).assertEqual("foo");
      v = iter.next().value as [string, string];
      expect(v[0]).assertEqual("bar");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_1700
     * @tc.desc Verify Set<number> entries() returns numeric key-value pair iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([0, -1, 1.5, Number.MAX_VALUE]);
      const iter = set.entries();
      let v = iter.next().value as [number, number];
      expect(v[0]).assertEqual(0);
      v = iter.next().value as [number, number];
      expect(v[0]).assertEqual(-1);
      v = iter.next().value as [number, number];
      expect(v[0]).assertEqual(1.5);
      v = iter.next().value as [number, number];
      expect(v[0]).assertEqual(Number.MAX_VALUE);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_1800
     * @tc.desc Verify Set<boolean> entries() returns boolean key-value pair iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      const iter = set.entries();
      let v = iter.next().value as [boolean, boolean];
      expect(v[0]).assertTrue();
      v = iter.next().value as [boolean, boolean];
      expect(v[0]).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_1900
     * @tc.desc Verify Set<Object> entries() returns object reference entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new Item025(1);
      const item2 = new Item025(2);
      const set = new Set<Item025>([item1, item2]);
      const iter = set.entries();
      let v = iter.next().value as [Item025, Item025];
      expect(v[0]).assertEqual(item1);
      v = iter.next().value as [Item025, Item025];
      expect(v[0]).assertEqual(item2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_2000
     * @tc.desc Verify each entries() call returns new independent iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter1 = set.entries();
      const iter2 = set.entries();
      expect(iter1 !== iter2).assertTrue();
      iter1.next();
      iter1.next();
      let v = iter2.next().value as [int, int];
      expect(v[0]).assertEqual(1);
    });

    /**
     * @tc.name testSetEntries021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_2100
     * @tc.desc Verify same iterator sequentially calls next() to return all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const iter = set.entries();
      let v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(10);
      v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(20);
      v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(30);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_2200
     * @tc.desc Verify exhausted iterator next() always returns done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const iter = set.entries();
      iter.next();
      const exhausted = iter.next();
      expect(exhausted.done).assertTrue();
      const again = iter.next();
      expect(again.done).assertTrue();
      expect(again.value).assertUndefined();
    });

    /**
     * @tc.name testSetEntries023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_2300
     * @tc.desc Verify existing iterator unaffected by add after obtaining iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.entries();
      set.add(3);
      let v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(1);
      v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(2);
      v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(3);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_2400
     * @tc.desc Verify deleting element during iteration, iterator behavior validated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.entries();
      iter.next();
      set.delete(2);
      const r = iter.next();
      expect(r.done).assertFalse();
      let v = r.value as [int, int];
      expect(v[0]).assertEqual(3);
    });

    /**
     * @tc.name testSetEntries025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_2500
     * @tc.desc Verify calling clear() after obtaining iterator, subsequent next() returns done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.entries();
      let v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(1);
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_2600
     * @tc.desc Verify adding new element during iteration, existing iterator visibility
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.entries();
      let v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(1);
      set.add(3);
      v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(2);
      v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(3);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_2700
     * @tc.desc Verify try-catch wraps entries() iteration, exception stops iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const visitedValues: int[] = [];
      try {
        for (const entry of set.entries()) {
          visitedValues.push(entry[0]);
          if (entry[0] === 2) {
            throw new Error("stop");
          }
        }
      } catch (e) {
        expect(e.message).assertEqual("stop");
      }
      expect(visitedValues.length).assertEqual(2);
      expect(visitedValues[0]).assertEqual(1);
      expect(visitedValues[1]).assertEqual(2);
    });

    /**
     * @tc.name testSetEntries028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_2800
     * @tc.desc Verify entries() iterates Set<Object | null> with null element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | null>(["a", null, "b"]);
      const iter = set.entries();
      let r1 = iter.next();
      let v1 = r1.value as [string | null, string | null];
      expect(v1[0]).assertEqual("a");
      let r2 = iter.next();
      let v2 = r2.value as [string | null, string | null];
      expect(v2[0]).assertNull();
      let r3 = iter.next();
      let v3 = r3.value as [string | null, string | null];
      expect(v3[0]).assertEqual("b");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_2900
     * @tc.desc Verify entries() iterates Set<string | undefined> with undefined element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | undefined>(["a", undefined]);
      const iter = set.entries();
      let r1 = iter.next();
      let v1 = r1.value as [string | undefined, string | undefined];
      expect(v1[0]).assertEqual("a");
      let r2 = iter.next();
      let v2 = r2.value as [string | undefined, string | undefined];
      expect(v2[0]).assertUndefined();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_3000
     * @tc.desc Verify entries() iterates Set<number> with NaN element correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([Number.NaN, 42]);
      const iter = set.entries();
      let r1 = iter.next();
      let v1 = r1.value as [number, number];
      expect(Number.isNaN(v1[0])).assertTrue();
      expect(Number.isNaN(v1[1])).assertTrue();
      let r2 = iter.next();
      let v2 = r2.value as [number, number];
      expect(v2[0]).assertEqual(42);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_3100
     * @tc.desc Verify entries() iterates Set<number> with Infinity values correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      const iter = set.entries();
      let r1 = iter.next();
      let v1 = r1.value as [number, number];
      expect(v1[0]).assertEqual(Number.POSITIVE_INFINITY);
      let r2 = iter.next();
      let v2 = r2.value as [number, number];
      expect(v2[0]).assertEqual(Number.NEGATIVE_INFINITY);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetEntries032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_3200
     * @tc.desc Verify Set<string | number> entries() iterates union type key-value pairs of both types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number>(["a", 1, "b"]);
      const iter = set.entries();
      let numCount: int = 0;
      let strCount: int = 0;
      let r = iter.next();
      while (!r.done) {
        let v = r.value as [string | number, string | number];
        expect(v[0]).assertEqual(v[1]);
        let t: string = typeof v[0];
        if (t === "number") {
          numCount++;
        }
        if (t === "string") {
          strCount++;
        }
        r = iter.next();
      }
      expect(numCount).assertEqual(1);
      expect(strCount).assertEqual(2);
    });

    /**
     * @tc.name testSetEntries033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_3300
     * @tc.desc Verify break in for-of entries() exits traversal early
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const result: int[] = [];
      for (const entry of set.entries()) {
        result.push(entry[0]);
        if (entry[0] === 20) {
          break;
        }
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
    });

    /**
     * @tc.name testSetEntries034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_3400
     * @tc.desc Verify continue in for-of entries() skips specific elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const result: int[] = [];
      for (const entry of set.entries()) {
        if (entry[0] % 2 === 0) {
          continue;
        }
        result.push(entry[0]);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });
  });
}
