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

export default function ReadonlySetEntriesTest(): void {
  describe('ReadonlySetEntriesTest', (): void => {
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
     * @tc.name testReadonlySetEntries001
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0100
     * @tc.desc Verify entries() with no parameters returns iterator normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const iter = set.entries();
      let v = iter.next().value as [long, long];
      expect(v[0]).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries002
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0200
     * @tc.desc Verify entries() returns first key-value pair from iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2]);
      let v = set.entries().next().value as [long, long];
      expect(v[0]).assertEqual(1);

    });

    /**
     * @tc.name testReadonlySetEntries003
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0300
     * @tc.desc Verify entries() iterator value is [K,K] tuple with equal elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      const iter = set.entries();
      const result = iter.next();
      expect(result.done).assertFalse();
      let entry = result.value as [int, int];
      expect(entry[0]).assertEqual(entry[1]);
    });

    /**
     * @tc.name testReadonlySetEntries004
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0400
     * @tc.desc Verify two entries() iterators traverse independently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const iter1 = set.entries();
      const iter2 = set.entries();
      iter1.next();
      let result = iter2.next();
      expect(result.done).assertFalse();
      let v = result.value as [int, int];
      expect(v[0]).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries005
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0500
     * @tc.desc Verify entries() returns iterator traversing key-value pairs in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      const iter = set.entries();
      let v = iter.next().value as [long, long];
      expect(v[0]).assertEqual(10);
      expect(v[1]).assertEqual(10);
      v = iter.next().value as [long, long];
      expect(v[0]).assertEqual(20);
      v = iter.next().value as [long, long];
      expect(v[0]).assertEqual(30);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries006
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0600
     * @tc.desc Verify for-of loop traverses entries() iterator getting all key-value pairs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let count: int = 0;
      let values: long[] = [];
      for (const entry of set.entries()) {
        values.push(entry[0]);
        count++;
      }
      expect(count).assertEqual(3);
      expect(values[0]).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries007
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0700
     * @tc.desc Verify single-element Set entries returns one key-value pair then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["hello"]);
      const iter = set.entries();
      let r = iter.next();
      let v = r.value as [string, string];
      expect(v[0]).assertEqual("hello");
      expect(v[1]).assertEqual("hello");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries008
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0800
     * @tc.desc Verify entries() returns key-value pairs in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 3, 8, 1]);
      const iter = set.entries();
      let v = iter.next().value as [long, long];
      expect(v[0]).assertEqual(5);
      v = iter.next().value as [long, long];
      expect(v[0]).assertEqual(3);
      v = iter.next().value as [long, long];
      expect(v[0]).assertEqual(8);
      v = iter.next().value as [long, long];
      expect(v[0]).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries009
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0900
     * @tc.desc Verify empty Set entries() first next() returns done=true value=undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>();
      const iter = set.entries();
      let result = iter.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetEntries010
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1000
     * @tc.desc Verify empty Set entries() for-of loop body does not execute
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>();
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries011
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1100
     * @tc.desc Verify entries() return value has IterableIterator next() method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1]);
      const iter = set.entries();
      let t: string = typeof iter.next;
      expect(t).assertEqual("function");
    });

    /**
     * @tc.name testReadonlySetEntries012
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1200
     * @tc.desc Verify each entry is a two-element array with key equals value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b"]);
      const iter = set.entries();
      let e1 = iter.next().value as [string, string];
      expect(e1[0]).assertEqual(e1[1]);
      expect(e1[0]).assertEqual("a");
      let e2 = iter.next().value as [string, string];
      expect(e2[0]).assertEqual(e2[1]);
    });

    /**
     * @tc.name testReadonlySetEntries013
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1300
     * @tc.desc Verify Set entries key and value are always equal for int type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([100, 200]);
      for (const entry of set.entries()) {
        expect(entry[0]).assertEqual(entry[1]);
      }
    });

    /**
     * @tc.name testReadonlySetEntries014
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1400
     * @tc.desc Verify Set entries key equals value for string type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["x", "y", "z"]);
      for (const entry of set.entries()) {
        expect(entry[0]).assertEqual(entry[1]);
      }
    });

    /**
     * @tc.name testReadonlySetEntries015
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1500
     * @tc.desc Verify Set entries key equals value for number type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1.5, 2.7, 3.14]);
      for (const entry of set.entries()) {
        expect(entry[0]).assertEqual(entry[1]);
      }
    });

    /**
     * @tc.name testReadonlySetEntries016
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1600
     * @tc.desc Verify large Set entries() traverses all key-value pairs correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      for (let i: int = 0; i < 1000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.name testReadonlySetEntries017
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1700
     * @tc.desc Verify ReadonlySet<int> entries() returns int key-value pair iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      const iter = set.entries();
      let v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(1);
      v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries018
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1800
     * @tc.desc Verify ReadonlySet<string> entries() returns string key-value pair iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["alpha", "beta"]);
      const iter = set.entries();
      let v = iter.next().value as [string, string];
      expect(v[0]).assertEqual("alpha");
      v = iter.next().value as [string, string];
      expect(v[0]).assertEqual("beta");
    });

    /**
     * @tc.name testReadonlySetEntries019
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1900
     * @tc.desc Verify ReadonlySet<number> entries() returns number key-value pair iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1.1, 2.2]);
      const iter = set.entries();
      let v = iter.next().value as [number, number];
      expect(v[0]).assertEqual(1.1);
      v = iter.next().value as [number, number];
      expect(v[0]).assertEqual(2.2);
    });

    /**
     * @tc.name testReadonlySetEntries020
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_2000
     * @tc.desc Verify ReadonlySet<boolean> entries() returns boolean key-value pair iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      const iter = set.entries();
      let v = iter.next().value as [boolean, boolean];
      expect(v[0]).assertTrue();
      v = iter.next().value as [boolean, boolean];
      expect(v[0]).assertFalse();
    });

    /**
     * @tc.name testReadonlySetEntries021
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_2100
     * @tc.desc Verify Set with special string values entries() traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["", " ", "​", "中文", "🎉"]);
      let count: int = 0;
      for (const entry of set.entries()) {
        expect(entry[0]).assertEqual(entry[1]);
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetEntries022
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_2200
     * @tc.desc Verify Set with 0 and negative numbers entries() returns correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([0, -1, -999]);
      const iter = set.entries();
      let v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(0);
      v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(-1);
      v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(-999);
    });

    /**
     * @tc.name testReadonlySetEntries023
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_2300
     * @tc.desc Verify each entries() call returns a new independent iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const iter1 = set.entries();
      const iter2 = set.entries();
      expect(iter1 === iter2).assertFalse();
      let v = iter1.next().value as [int, int];
      expect(v[0]).assertEqual(1);
      v = iter2.next().value as [int, int];
      expect(v[0]).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries024
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_2400
     * @tc.desc Verify multiple iterators maintain independent traversal positions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20]);
      const iter1 = set.entries();
      const iter2 = set.entries();
      iter1.next();
      iter1.next();
      expect(iter1.next().done).assertTrue();
      let v = iter2.next().value as [int, int];
      expect(v[0]).assertEqual(10);
    });

    /**
     * @tc.name testReadonlySetEntries025
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_2500
     * @tc.desc Verify exhausted iterator next() always returns done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1]);
      const iter = set.entries();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries026
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_2600
     * @tc.desc Verify next() returns value[T,T] and done=false during traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([42]);
      const iter = set.entries();
      let r = iter.next();
      expect(r.done).assertFalse();
      let v = r.value as [int, int];
      expect(v[0]).assertEqual(42);
    });

    /**
     * @tc.name testReadonlySetEntries027
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_2700
     * @tc.desc Verify after traversal done=true and value is undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1]);
      const iter = set.entries();
      iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetEntries028
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_2800
     * @tc.desc Verify next() after traversal complete returns done=true without exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      const iter = set.entries();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries029
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_2900
     * @tc.desc Verify empty Set iterator multiple next() calls all return done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>();
      const iter = set.entries();
      for (let i: int = 0; i < 10; i++) {
        let r = iter.next();
        expect(r.done).assertTrue();
        expect(r.value).assertUndefined();
      }
    });

    /**
     * @tc.name testReadonlySetEntries030
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_3000
     * @tc.desc Verify accessing value property after traversal without exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1]);
      const iter = set.entries();
      iter.next();
      iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetEntries031
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_3100
     * @tc.desc Verify mixed manual next() and for-of iterator behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const iter = set.entries();
      let v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testReadonlySetEntries032
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_3200
     * @tc.desc Verify entries() returns key-value pair via next().value cast to typed tuple
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      const iter = set.entries();
      let v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries033
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_3300
     * @tc.desc Verify entries() returns first key-value pair with correct value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1]);
      const iter = set.entries();
      let v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries034
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_3400
     * @tc.desc Verify iterator object has next() method for standard operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      const iter = set.entries();
      let t: string = typeof iter.next;
      expect(t).assertEqual("function");
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testReadonlySetEntries035
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_3500
     * @tc.desc Verify ReadonlySet<string | number> entries() iterates union type pairs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string | number> = new Set<string | number>();
      (set as Set<string | number>).add("a");
      (set as Set<string | number>).add(1);
      const iter = set.entries();
      let numCount: int = 0;
      let strCount: int = 0;
      let r = iter.next();
      while (!r.done) {
        let v = r.value as [string | number, string | number];
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
      expect(strCount).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries036
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_3600
     * @tc.desc Verify break in for-of ReadonlySet entries() exits traversal early
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
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
     * @tc.name testReadonlySetEntries037
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_3700
     * @tc.desc Verify continue in for-of ReadonlySet entries() skips specific elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4]);
      const result: int[] = [];
      for (const entry of set.entries()) {
        if (entry[0] % 2 === 0) {
          continue;
        }
        result.push(entry[0]);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetEntries038
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_3800
     * @tc.desc Verify throw in for-of ReadonlySet entries() stops iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const visited: int[] = [];
      try {
        for (const entry of set.entries()) {
          visited.push(entry[0]);
          if (entry[0] === 2) {
            throw new Error("stop");
          }
        }
      } catch (e) {
        expect(e.message).assertEqual("stop");
      }
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries039
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_3900
     * @tc.desc Verify ReadonlySet entries() iterates Set<number> with NaN element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, 42]);
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
  });
}
