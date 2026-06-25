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

export default function SetIteratorDollarIteratorTest(): void {
  describe('SetIteratorDollarIteratorTest', (): void => {
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
     * @tc.name testSetIteratorDollarIterator001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0100
     * @tc.desc Verify dollar_iterator() with no parameters returns IterableIterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      const result = iter.$_iterator();
      expect(result.next().value).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0200
     * @tc.desc Verify dollar_iterator() returns iterator with correct first element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      expect(iter.$_iterator().next().value).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0300
     * @tc.desc Verify dollar_iterator() returns different iterator object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.values();
      const self = iter.$_iterator();
      expect(self !== iter).assertTrue();
      expect(self.next().value).assertEqual(1);
      expect(self.next().value).assertEqual(2);
      expect(self.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0400
     * @tc.desc Verify dollar_iterator for-of traverses all elements in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b"]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: string[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("a");
    });

    /**
     * @tc.name testSetIteratorDollarIterator005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0500
     * @tc.desc Verify SetIterator $_iterator() from values() on single-element Set returns one value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["only"]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: string[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("only");
    });

    /**
     * @tc.name testSetIteratorDollarIterator006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0600
     * @tc.desc Verify Set<string> dollar_iterator returns string type iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["hello", "world", "arkts"]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: string[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("hello");
    });

    /**
     * @tc.name testSetIteratorDollarIterator007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0700
     * @tc.desc Verify Set with special strings dollar_iterator traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["", " "]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: string[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("");
    });

    /**
     * @tc.name testSetIteratorDollarIterator008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0800
     * @tc.desc Verify Set with special numeric values dollar_iterator traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([0, -1, 3.14]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: number[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(-1);
      expect(result[2]).assertEqual(3.14);
    });

    /**
     * @tc.name testSetIteratorDollarIterator009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0900
     * @tc.desc Verify dollar_iterator return value has IterableIterator next() method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorDollarIterator010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1000
     * @tc.desc Verify Symbol.iterator after exhaustion behavior consistency not supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const iter = set.values();
      const s1 = iter.$_iterator();
      const s2 = iter.$_iterator();
      expect(s1 === s2).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1100
     * @tc.desc Verify dollar_iterator restarts from current position not beginning
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      expect(inner.next().done).assertTrue();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1200
     * @tc.desc Verify dollar_iterator continues incomplete traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: int[] = [];
      for (const v of inner) {
        result.push(v);
        if (v === 20) {
          break;
        }
      }
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorDollarIterator013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1300
     * @tc.desc Verify continue in for-of dollar_iterator traversal skips elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: int[] = [];
      for (const v of inner) {
        if (v % 2 === 0) {
          continue;
        }
        result.push(v);
      }
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorDollarIterator014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1400
     * @tc.desc Verify shared dollar_iterator reference reflects progress across all holders
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      //   inner1.next()两次后位置在3，inner2.next()返回3
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      const inner1 = iter.$_iterator();
      const inner2 = iter.$_iterator();
      expect(inner1 === inner2).assertTrue();
      inner1.next();
      inner1.next();
      expect(inner2.next().value).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorDollarIterator015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1500
     * @tc.desc Verify multiple dollar_iterator calls return shared iterator reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      const inner1 = iter.$_iterator();
      const inner2 = iter.$_iterator();
      expect(inner1 === inner2).assertTrue();
      inner1.next();
      expect(inner2.next().value).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorDollarIterator016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1600
     * @tc.desc Verify dollar_iterator reflects newly added elements after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.add(4);
      let count: int = 1;
      while (!inner.next().done) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name testSetIteratorDollarIterator017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1700
     * @tc.desc Verify dollar_iterator reflects deleted elements after delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.clear();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1800
     * @tc.desc Verify Error thrown in for-of dollar_iterator is caught by external try-catch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      let caught = false;
      try {
        const inner = iter.$_iterator();
        for (const v of inner) {
          if (v === 2) {
            throw new Error("stop");
          }
        }
      } catch (e) {
        caught = true;
        expect(e.message).assertEqual("stop");
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1900
     * @tc.desc Verify exhausted dollar_iterator next() safe destructuring
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      expect(inner.next().done).assertFalse();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_2000
     * @tc.desc Verify SetIterator $_iterator from keys() iterator returns valid iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.keys();
      const inner = iter.$_iterator();
      expect(inner.next().value).assertEqual(1);
      expect(inner.next().value).assertEqual(2);
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_2100
     * @tc.desc Verify SetIterator $_iterator from entries() iterator returns [k,k] pairs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20]);
      const iter = set.entries();
      const inner = iter.$_iterator();
      let v = inner.next().value as [int, int];
      expect(v[0]).assertEqual(10);
      expect(v[1]).assertEqual(10);
      v = inner.next().value as [int, int];
      expect(v[0]).assertEqual(20);
      expect(inner.next().done).assertTrue();
    });
  });
}
