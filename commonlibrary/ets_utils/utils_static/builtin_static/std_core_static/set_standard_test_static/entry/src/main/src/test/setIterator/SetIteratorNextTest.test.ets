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
} from '../../../../hypium/index';
import Utils from './../Util.test';

class Obj038 {
  id: int = 0;

  constructor(id: int) {
    this.id = id;
  }
}

export default function SetIteratorNextTest(): void {
  describe('SetIteratorNextTest', (): void => {
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
     * @tc.name testSetIteratorNext001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0100
     * @tc.desc Verify next() with no parameters returns IteratorResult<T>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2]);
      const iter = set.values();
      const result = iter.next();
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorNext002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0200
     * @tc.desc Verify next() returns correct first value from values iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(1);

    });

    /**
     * @tc.name testSetIteratorNext003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0300
     * @tc.desc Verify next() returns object with value and done properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([100]);
      const iter = set.values();
      const result = iter.next();
      expect(result.value).assertEqual(100);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0400
     * @tc.desc Verify consecutive next() calls traverse all elements in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([10, 20, 30]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(10);
      expect(iter.next().value).assertEqual(20);
      expect(iter.next().value).assertEqual(30);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0500
     * @tc.desc Verify values() iterator next() returns element values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      const iter = set.values();
      expect(iter.next().value).assertEqual("a");
      expect(iter.next().value).assertEqual("b");
      expect(iter.next().value).assertEqual("c");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0600
     * @tc.desc Verify keys() iterator next() returns key values same as elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([5.0, 10.0, 15.0]);
      const iter = set.keys();
      expect(iter.next().value).assertEqual(5.0);
      expect(iter.next().value).assertEqual(10.0);
      expect(iter.next().value).assertEqual(15.0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0700
     * @tc.desc Verify entries() iterator next() returns [key,key] array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.entries();
      const r1 = iter.next();
      let v = r1.value as [int, int];
      expect(v[0]).assertEqual(1);
      expect(v[1]).assertEqual(1);
      const r2 = iter.next();
      v = r2.value as [int, int];
      expect(v[0]).assertEqual(2);
      expect(v[1]).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0800
     * @tc.desc Verify empty Set iterator first next() returns done=true value=undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<float>();
      const iter = set.values();
      const result = iter.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.name testSetIteratorNext009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0900
     * @tc.desc Verify single-element Set next() returns element then done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["only"]);
      const iter = set.values();
      expect(iter.next().value).assertEqual("only");
      expect(iter.next().done).assertTrue();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.name testSetIteratorNext010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1000
     * @tc.desc Verify Set with 0 value next() correctly returns value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([0]);
      const iter = set.values();
      const result = iter.next();
      expect(result.value).assertEqual(0);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1100
     * @tc.desc Verify Set with empty string next() correctly returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>([""]);
      const iter = set.values();
      const result = iter.next();
      expect(result.value).assertEqual("");
      expect(result.done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1200
     * @tc.desc Verify Set with false value next() correctly returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([false, true]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(false);
      expect(iter.next().value).assertEqual(true);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1300
     * @tc.desc Verify Set with null value next() correctly returns null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object | null>([null, new Object()]);
      const iter = set.values();
      const r1 = iter.next();
      expect(r1.value).assertNull();
      expect(r1.done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1400
     * @tc.desc Verify next() return value includes value and done as boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([42]);
      const iter = set.values();
      const result = iter.next();
      let t: string = typeof result.done;
      expect(t).assertEqual("boolean");
      expect(result.value).assertEqual(42);
    });

    /**
     * @tc.name testSetIteratorNext015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1500
     * @tc.desc Verify Set<int> iterator next() returns int type value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      const r = iter.next();
      let v: int = r.value as int;
      let sum: int = v + 10;
      expect(sum).assertEqual(11);
    });

    /**
     * @tc.name testSetIteratorNext016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1600
     * @tc.desc Verify next() done property is always boolean type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const iter = set.values();
      let r1 = iter.next();
      let doneType: string = typeof r1.done;
      expect(doneType).assertEqual("boolean");
      let r2 = iter.next();
      doneType = typeof r2.done;
      expect(doneType).assertEqual("boolean");
    });

    /**
     * @tc.name testSetIteratorNext017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1700
     * @tc.desc Verify entries() iterator next() returns two-element array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["x"]);
      const iter = set.entries();
      const result = iter.next();
      let v = result.value as [string, string];
      expect(v.length).assertEqual(2);
      expect(v[0]).assertEqual("x");
      expect(v[1]).assertEqual("x");
    });

    /**
     * @tc.name testSetIteratorNext018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1800
     * @tc.desc Verify exhausted iterator next() returns done=true value=undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.values();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.name testSetIteratorNext019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1900
     * @tc.desc Verify after exhaustion multiple next() calls return done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([99]);
      const iter = set.values();
      iter.next();
      const r1 = iter.next();
      expect(r1.done).assertTrue();
      expect(r1.value).assertUndefined();
      const r2 = iter.next();
      expect(r2.done).assertTrue();
      expect(r2.value).assertUndefined();

    });

    /**
     * @tc.name testSetIteratorNext020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2000
     * @tc.desc Verify large Set next() correctly traverses all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      const iter = set.values();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.name testSetIteratorNext021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2100
     * @tc.desc Verify Set<string> iterator next() returns string type value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["hello", "world"]);
      const iter = set.values();
      expect(iter.next().value).assertEqual("hello");
      expect(iter.next().value).assertEqual("world");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2200
     * @tc.desc Verify Set<number> iterator next() returns numeric value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1.5, 2.7, 3.9]);
      const iter = set.values();
      let v1: number = iter.next().value as number;
      expect(v1 > 1.4).assertTrue();
      let v2: number = iter.next().value as number;
      expect(v2 > 2.6).assertTrue();
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2300
     * @tc.desc Verify Set<Object> iterator next() returns object reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new Obj038(1);
      const obj2 = new Obj038(2);
      const set = new Set<Object>([obj1, obj2]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(obj1);
      expect(iter.next().value).assertEqual(obj2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2400
     * @tc.desc Verify Set<boolean> iterator next() returns boolean type value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(true);
      expect(iter.next().value).assertEqual(false);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2500
     * @tc.desc Verify deduplicated Set next() returns only unique values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 2, 3, 3, 3]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2600
     * @tc.desc Verify multiple values() iterators next() perform independently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const iter1 = set.values();
      const iter2 = set.values();
      expect(iter1.next().value).assertEqual(10);
      expect(iter2.next().value).assertEqual(10);
      expect(iter1.next().value).assertEqual(20);
      expect(iter2.next().value).assertEqual(20);
    });

    /**
     * @tc.name testSetIteratorNext027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2700
     * @tc.desc Verify one iterator traversal does not affect another start position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter1 = set.values();
      const iter2 = set.values();
      iter1.next();
      iter1.next();
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorNext028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2800
     * @tc.desc Verify exhausted iterator subsequent next() always returns done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const iter = set.values();
      iter.next();
      const r1 = iter.next();
      expect(r1.done).assertTrue();
      const r2 = iter.next();
      expect(r2.done).assertTrue();

      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.name testSetIteratorNext029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2900
     * @tc.desc Verify keys() and values() iterators next() values are identical
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([5, 10, 15]);
      const ki = set.keys();
      const vi = set.values();
      expect(ki.next().value).assertEqual(vi.next().value);
      expect(ki.next().value).assertEqual(vi.next().value);
    });

    /**
     * @tc.name testSetIteratorNext030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3000
     * @tc.desc Verify next() returns in insertion order not value order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(30);
      set.add(10);
      set.add(20);
      const iter = set.values();
      expect(iter.next().value).assertEqual(30);
      expect(iter.next().value).assertEqual(10);
    });

    /**
     * @tc.name testSetIteratorNext031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3100
     * @tc.desc Verify next() traversal does not modify original Set content or size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const sizeBefore = set.size;
      const iter = set.values();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      expect(set.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.name testSetIteratorNext032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3200
     * @tc.desc Verify exhausted iterator next() safely returns done without exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const iter = set.values();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.name testSetIteratorNext033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3300
     * @tc.desc Verify empty Set iterator next() safely returns done without exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      const iter = set.values();
      const r = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.name testSetIteratorNext034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3400
     * @tc.desc Verify empty Set iterator multiple next() safely returns done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      const iter = set.values();
      for (let i = 0; i < 10; i++) {
        const r = iter.next();
        expect(r.done).assertTrue();
        expect(r.value).assertUndefined();
      }
    });

    /**
     * @tc.name testSetIteratorNext035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3500
     * @tc.desc Verify adding element during iteration iterator behavior validated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(1);
      set.add(4);
      const r2 = iter.next();
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3600
     * @tc.desc Verify deleting unvisited element during iteration next() skips it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(1);
      set.delete(2);
      const r = iter.next();
      expect(r.value).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorNext037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3700
     * @tc.desc Verify deleting visited element during iteration next() unaffected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 2.0, 3.0]);
      const iter = set.values();
      iter.next();
      set.delete(1.0);
      expect(iter.next().value).assertEqual(2.0);
      expect(iter.next().value).assertEqual(3.0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3800
     * @tc.desc Verify clearing Set during iteration next() behavior validated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<float>([1.0, 2.0, 3.0]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(1.0);
      set.clear();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3900
     * @tc.desc Verify after exhaustion value is undefined accessed without exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const iter = set.values();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.name testSetIteratorNext040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4000
     * @tc.desc Verify typeof next() result done property is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([42]);
      const iter = set.values();
      const result = iter.next();
      let t: string = typeof result.done;
      expect(t).assertEqual("boolean");
    });

    /**
     * @tc.name testSetIteratorNext041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4100
     * @tc.desc Verify next() returns non-null IteratorResult with valid done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.values();
      const result = iter.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4200
     * @tc.desc Verify next() on values iterator returns NaN element correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([Number.NaN, 42]);
      const iter = set.values();
      const r1 = iter.next();
      expect(Number.isNaN(r1.value as number)).assertTrue();
      expect(r1.done).assertFalse();
      const r2 = iter.next();
      expect(r2.value as number).assertEqual(42);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4300
     * @tc.desc Verify next() on values iterator returns Infinity elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      const iter = set.values();
      const r1 = iter.next();
      expect(r1.value as number).assertEqual(Number.POSITIVE_INFINITY);
      const r2 = iter.next();
      expect(r2.value as number).assertEqual(Number.NEGATIVE_INFINITY);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4400
     * @tc.desc Verify next() on union type Set values iterator returns both types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number>(["a", 1, "b"]);
      const iter = set.values();
      expect(iter.next().value as string).assertEqual("a");
      expect(iter.next().value as number).assertEqual(1);
      expect(iter.next().value as string).assertEqual("b");
      expect(iter.next().done).assertTrue();
    });
  });
}
