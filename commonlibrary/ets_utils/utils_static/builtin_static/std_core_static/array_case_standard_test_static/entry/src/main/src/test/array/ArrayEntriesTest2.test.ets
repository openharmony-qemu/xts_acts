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
import Utils from '../Util.test';

function testFn(): Array<[int, string]> {
  const arr = new Array<string>('a', 'b', 'c');
  const result: Array<[int, string]> = [];
  for (const e of arr.entries()) {
    if (e[0] === 1) {
      return result;
    }
    result.push(e);
  }
  return result;
}

function createIter(arr: Array<number>): IterableIterator<[int, number]> {
  return arr.entries();
}

interface ObjWithA {
  a: number;
}

interface HasNext {
  next: Function;
}

interface NodeWithRef {
  val: int;
  ref: NodeWithRef | null;
}

class ArrWithGetter {
  private inner: Array<int> = new Array<int>();

  push(v: int): int {
    return this.inner.push(v);
  }

  get(index: int): int {
    if (index === 1) {
      return 99;
    }
    return this.inner[index];
  }

  entries(): IterableIterator<[int, int]> {
    return this.inner.entries();
  }
}

export default function ArrayEntriesTest2(): void {
  describe('ArrayEntriesTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0100
     * @tc.name testArrayEntries001
     * @tc.desc Verify exhausted entry has done and value properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1);
      const iter = arr.entries();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0200
     * @tc.name testArrayEntries002
     * @tc.desc Verify exhausted iterator for-of does not execute
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1);
      const iter = arr.entries();
      iter.next();
      let count = 0;
      for (const e of iter) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0300
     * @tc.name testArrayEntries003
     * @tc.desc Verify spread operator is empty after exhaustion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1);
      const iter = arr.entries();
      iter.next();
      const rest = Array.from(iter, (x: [int, int], _i: int) => x);
      expect(rest.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0400
     * @tc.name testArrayEntries004
     * @tc.desc Verify Array.from is empty after exhaustion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const iter = arr.entries();
      iter.next();
      iter.next();
      const collected = Array.from(iter);
      expect(collected.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0500
     * @tc.name testArrayEntries005
     * @tc.desc Verify new iterator unaffected by old exhausted one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const iter1 = arr.entries();
      iter1.next();
      iter1.next();
      iter1.next();
      const iter2 = arr.entries();
      const entry = iter2.next().value as [int, int] | undefined;
      if (entry != undefined) {
        expect(entry[0]).assertEqual(0);
        expect(entry[1]).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0600
     * @tc.name testArrayEntries006
     * @tc.desc Verify push during iteration affects results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const iter = arr.entries();
      iter.next();
      arr.push(3);
      const second = iter.next().value as [int, int] | undefined;
      const third = iter.next().value as [int, int] | undefined;
      if (second != undefined && third != undefined) {
        expect(second[1]).assertEqual(2);
        expect(third[1]).assertEqual(3);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0700
     * @tc.name testArrayEntries007
     * @tc.desc Verify unshift before iteration affects results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 3);
      const iter = arr.entries();
      arr.unshift(1);
      const first = iter.next().value as [int, int] | undefined;
      if (first != undefined) {
        expect(first[0]).assertEqual(0);
        expect(first[1]).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0800
     * @tc.name testArrayEntries008
     * @tc.desc Verify pop during iteration ends early
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iter = arr.entries();
      iter.next();
      arr.pop();
      const second = iter.next().value as [int, int] | undefined;
      const third = iter.next();
      if (second != undefined) {
        expect(second[1]).assertEqual(2);
      }else {
        expect().assertFail();
      }
      expect(third.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_0900
     * @tc.name testArrayEntries009
     * @tc.desc Verify shift during iteration shifts indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iter = arr.entries();
      iter.next();
      arr.shift();
      const nextResult = iter.next().value as [int, int] | undefined;
      if (nextResult != undefined) {
        expect(nextResult[0]).assertEqual(1);
        expect(nextResult[1]).assertEqual(3);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1000
     * @tc.name testArrayEntries010
     * @tc.desc Verify splice during iteration continues correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const iter = arr.entries();
      iter.next();
      arr.splice(1, 2);
      const nextVal = iter.next().value as [int, int] | undefined;
      if (nextVal != undefined) {
        expect(nextVal[0]).assertEqual(1);
        expect(nextVal[1]).assertEqual(4);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1100
     * @tc.name testArrayEntries011
     * @tc.desc Verify modifying element during iteration reflected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iter = arr.entries();
      arr[1] = 999;
      iter.next();
      const second = iter.next().value as [int, int] | undefined;
      if (second != undefined) {
        expect(second[1]).assertEqual(999);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1200
     * @tc.name testArrayEntries012
     * @tc.desc Verify shrinking length during iteration ends early
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const iter = arr.entries();
      iter.next();
      iter.next();
      arr.length = 2;
      const third = iter.next();
      expect(third.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1300
     * @tc.name testArrayEntries013
     * @tc.desc Verify expanding length produces undefined holes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const iter = arr.entries();
      iter.next();
      arr.extendTo(5, 0);
      const second = iter.next().value as [int, int] | undefined;
      const third = iter.next().value as [int, int | undefined] | undefined;
      if (second != undefined) {
        expect(second[1]).assertEqual(2);
      }else {
        expect().assertFail();
      }
      if (third != undefined) {
        expect(third[1]).assertEqual(0);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1400
     * @tc.name testArrayEntries014
     * @tc.desc Verify clearing array during iteration ends immediately
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iter = arr.entries();
      iter.next();
      arr.length = 0;
      const remaining = Array.from(iter);
      expect(remaining.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1500
     * @tc.name testArrayEntries015
     * @tc.desc Verify sort during iteration reflects sorted state
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 2);
      const iter = arr.entries();
      iter.next();
      arr.sort((a, b) => {
        return a - b;
      });
      const second = iter.next().value as [int, int] | undefined;
      if (second != undefined) {
        expect(second[1]).assertEqual(2);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1600
     * @tc.name testArrayEntries016
     * @tc.desc Verify sparse array holes are undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (): int => 0);
      arr[0] = 10;
      arr[3] = 40;
      const iter = arr.entries();
      const e0 = iter.next().value as [int, int] | undefined;
      iter.next();
      iter.next();
      const e3 = iter.next().value as [int, int] | undefined;
      if (e0 != undefined && e3 != undefined) {
        expect(e0[1]).assertEqual(10);
        expect(e3[1]).assertEqual(40);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1700
     * @tc.name testArrayEntries017
     * @tc.desc Verify sparse array traversal count equals length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, (): int => 0);
      arr[0] = 1;
      arr[9] = 10;
      let count = 0;
      for (const e of arr.entries()) {
        count++;
      }
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1800
     * @tc.name testArrayEntries018
     * @tc.desc Verify delete produces hole with undefined value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, 2, 3);
      arr[1] = undefined;
      let holeValue: int | undefined = -1;
      for (const pair of arr.entries()) {
        const entry = pair as [int, int | undefined];
        if (entry[0] === 1) {
          holeValue = entry[1];
        }
      }
      expect(holeValue).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_1900
     * @tc.name testArrayEntries019
     * @tc.desc Verify sparse large array precise positioning
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1000, (): int => 0);
      arr[500] = 42;
      const iter = arr.entries();
      let idx = 500;
      while (idx-- > 0) {
        iter.next();
      }
      const at500 = iter.next().value as [int, int] | undefined;
      if (at500 != undefined) {
        expect(at500[0]).assertEqual(500);
        expect(at500[1]).assertEqual(42);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2000
     * @tc.name testArrayEntries020
     * @tc.desc Verify trailing sparse hole is undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(5, (): int | undefined => undefined);
      arr[0] = 1;
      const iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      const end = iter.next().value as [int, int | undefined] | undefined;
      if (end != undefined) {
        expect(end[0]).assertEqual(4);
        expect(end[1]).assertUndefined();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2100
     * @tc.name testArrayEntries021
     * @tc.desc Verify sparse array for-of count equals length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(7, (): int => 0);
      arr[2] = 10;
      arr[5] = 20;
      let entries: Array<[int, int]> = [];
      for (const e of arr.entries()) {
        entries.push(e);
      }
      expect(entries.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2200
     * @tc.name testArrayEntries022
     * @tc.desc Verify getter array element affects iteration value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new ArrWithGetter();
      arr.push(10);
      arr.push(20);
      arr.push(30);
      const iter = arr.entries();
      iter.next();
      const second = iter.next().value as [int, int] | undefined;
      if (second != undefined) {
        expect(second[1]).assertEqual(20);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2300
     * @tc.name testArrayEntries023
     * @tc.desc Verify entries().next() on normal array does not throw
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      let threw = false;
      try {
        arr.entries().next();
      } catch (e) {
        threw = true;
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2400
     * @tc.name testArrayEntries024
     * @tc.desc Verify Proxy intercept get on iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iter = arr.entries();
      iter.next();
      const second = iter.next().value as [int, int] | undefined;
      if (second != undefined) {
        expect(second[1]).assertEqual(2);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2500
     * @tc.name testArrayEntries025
     * @tc.desc Verify plain Proxy does not affect normal iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const iter = arr.entries();
      const a = iter.next().value as [int, int] | undefined;
      const b = iter.next().value as [int, int] | undefined;
      if (a != undefined && b != undefined) {
        expect(a[0]).assertEqual(0);
        expect(b[0]).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2600
     * @tc.name testArrayEntries026
     * @tc.desc Verify frozen array entries works normally
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2700
     * @tc.name testArrayEntries027
     * @tc.desc Verify sealed array entries works normally
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2800
     * @tc.name testArrayEntries028
     * @tc.desc Verify slice result entries index from 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const sliced = arr.slice(1, 4);
      const collected = Array.from(sliced.entries());
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertEqual(20);
      expect(collected[1][0]).assertEqual(1);
      expect(collected[1][1]).assertEqual(30);
      expect(collected[2][0]).assertEqual(2);
      expect(collected[2][1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_2900
     * @tc.name testArrayEntries029
     * @tc.desc Verify empty slice result entries immediate done
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const sliced = arr.slice(0, 0);
      const iter = sliced.entries();
      const result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3000
     * @tc.name testArrayEntries030
     * @tc.desc Verify toSpliced result entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const spliced = arr.toSpliced(1, 2);
      const collected = Array.from(spliced.entries());
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertEqual(1);
      expect(collected[1][0]).assertEqual(1);
      expect(collected[1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3100
     * @tc.name testArrayEntries031
     * @tc.desc Verify toReversed result entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const reversed = arr.toReversed();
      const collected = Array.from(reversed.entries());
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertEqual(3);
      expect(collected[1][0]).assertEqual(1);
      expect(collected[1][1]).assertEqual(2);
      expect(collected[2][0]).assertEqual(2);
      expect(collected[2][1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3200
     * @tc.name testArrayEntries032
     * @tc.desc Verify toSorted result entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 2);
      const sorted = arr.toSorted((a, b) => {
        return a - b;
      });
      const collected = Array.from(sorted.entries());
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertEqual(1);
      expect(collected[1][0]).assertEqual(1);
      expect(collected[1][1]).assertEqual(2);
      expect(collected[2][0]).assertEqual(2);
      expect(collected[2][1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3300
     * @tc.name testArrayEntries033
     * @tc.desc Verify chained toReversed and entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const entry = arr.toReversed().entries().next().value as [int, int] | undefined;
      if (entry != undefined) {
        expect(entry[0]).assertEqual(0);
        expect(entry[1]).assertEqual(2);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3400
     * @tc.name testArrayEntries034
     * @tc.desc Verify concat result entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2);
      const b = new Array<int>(3, 4);
      const c = a.concat(b);
      const collected = Array.from(c.entries());
      expect(collected.length).assertEqual(4);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertEqual(1);
      expect(collected[3][0]).assertEqual(3);
      expect(collected[3][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3500
     * @tc.name testArrayEntries035
     * @tc.desc Verify flat result entries count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2);
      const a2 = new Array<int>(3, 4);
      const arr = new Array<Array<int>>(a1, a2);
      const flat = arr.flat();
      const collected = Array.from(flat.entries());
      expect(collected.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3600
     * @tc.name testArrayEntries036
     * @tc.desc Verify break in for-of preserves iterator state
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const iter = arr.entries();
      for (const pair of iter) {
        const entry = pair as [int, int];
        if (entry[0] === 2) {
          break;
        }
      }
      const rest = Array.from(iter, (x: [int, int], _i: int) => x);
      expect(rest.length).assertEqual(2);
      expect(rest[0][0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3700
     * @tc.name testArrayEntries037
     * @tc.desc Verify continue skips even values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result: Array<[int, int]> = [];
      for (const pair of arr.entries()) {
        const entry = pair as [int, int];
        if (entry[1] % 2 === 0) {
          continue;
        }
        result.push(entry);
      }
      expect(result.length).assertEqual(2);
      expect(result[0][1]).assertEqual(1);
      expect(result[1][1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3800
     * @tc.name testArrayEntries038
     * @tc.desc Verify manual next with break control
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const iter = arr.entries();
      const result: Array<[int, int]> = [];
      while (true) {
        const n = iter.next();
        if (n.done) {
          break;
        }
        const entry = n.value as [int, int];
        if (entry[0] > 2) {
          break;
        }
        result.push(entry);
      }
      expect(result.length).assertEqual(3);
      expect(result[0][1]).assertEqual(1);
      expect(result[1][1]).assertEqual(2);
      expect(result[2][1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_3900
     * @tc.name testArrayEntries039
     * @tc.desc Verify early return in for-of entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = testFn();
      expect(result.length).assertEqual(1);
      expect(result[0][1]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4000
     * @tc.name testArrayEntries040
     * @tc.desc Verify nested for-of entries are independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      let r = '';
      for (const pair of arr.entries()) {
        const entry = pair as [int, int];
        for (const pair2 of arr.entries()) {
          const entry2 = pair2 as [int, int];
          r += entry[0].toString() + entry2[0].toString();
        }
      }
      expect(r.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4100
     * @tc.name testArrayEntries041
     * @tc.desc Verify new iterator after break works normally
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let savedIter: IterableIterator<[int, int]> | undefined;
      const arr = new Array<int>(1, 2, 3);
      for (const e of arr.entries()) {
        savedIter = arr.entries();
        break;
      }
      if (savedIter != undefined) {
        const n = savedIter.next().value as [int, int] | undefined;
        if (n != undefined) {
          expect(n[0]).assertEqual(0);
        }else {
          expect().assertFail();
        }
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4200
     * @tc.name testArrayEntries042
     * @tc.desc Verify modifying value tuple does not affect original array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20);
      const entry = arr.entries().next().value as [int, int];
      entry[1] = 999;
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4300
     * @tc.name testArrayEntries043
     * @tc.desc Verify modifying index part of tuple does not affect original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20);
      const entry = arr.entries().next().value as [int, int];
      entry[0] = 999;
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4400
     * @tc.name testArrayEntries044
     * @tc.desc Verify destructuring modification does not affect original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 10);
      const entry = arr.entries().next().value as [int, int];
      let i = entry[0];
      let v = entry[1];
      v = 999;
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4500
     * @tc.name testArrayEntries045
     * @tc.desc Verify stored entry modification does not affect original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const entries = Array.from(arr.entries());
      entries[0][1] = 999;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4600
     * @tc.name testArrayEntries046
     * @tc.desc Verify three concurrent iterators are independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const i1 = arr.entries();
      const i2 = arr.entries();
      const i3 = arr.entries();
      const a1 = i1.next().value as [int, int] | undefined;
      const b1 = i2.next().value as [int, int] | undefined;
      const a2 = i1.next().value as [int, int] | undefined;
      const c1 = i3.next().value as [int, int] | undefined;
      const b2 = i2.next().value as [int, int] | undefined;
      const c2 = i3.next().value as [int, int] | undefined;
      if (a1 != undefined && a2 != undefined) {
        expect(a1[0]).assertEqual(0);
        expect(a2[0]).assertEqual(1);
      }else {
        expect().assertFail();
      }
      if (c1 != undefined && c2 != undefined) {
        expect(c1[0]).assertEqual(0);
        expect(c2[0]).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4700
     * @tc.name testArrayEntries047
     * @tc.desc Verify array mutation after iterator creation affects all iterators
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const iterA = arr.entries();
      const iterB = arr.entries();
      arr.push(3);
      const lenA = Array.from(iterA, (x: [int, int], _i: int) => x).length;
      const lenB = Array.from(iterB, (x: [int, int], _i: int) => x).length;
      expect(lenA).assertEqual(3);
      expect(lenB).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4800
     * @tc.name testArrayEntries048
     * @tc.desc Verify one exhausted does not affect the other
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iterFast = arr.entries();
      const iterSlow = arr.entries();
      iterFast.next();
      iterFast.next();
      iterFast.next();
      iterFast.next();
      const s1 = iterSlow.next().value as [int, int] | undefined;
      if (s1 != undefined) {
        expect(s1[0]).assertEqual(0);
        expect(s1[1]).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_4900
     * @tc.name testArrayEntries049
     * @tc.desc Verify for-of and manual next share state
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const iter = arr.entries();
      for (const e of iter) {
        const entry = e as [int, int];
        if (entry[0] === 0) {
          break;
        }
      }
      const manual = iter.next().value as [int, int] | undefined;
      if (manual != undefined) {
        expect(manual[0]).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_5000
     * @tc.name testArrayEntries050
     * @tc.desc Verify exported iterator works across functions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iter = createIter(new Array<number>(10, 20));
      const entry = iter.next().value as [number, number] | undefined;
      if (entry != undefined) {
        expect(entry[1]).assertEqual(10);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_5100
     * @tc.name testArrayEntries051
     * @tc.desc Verify entry value is array type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1);
      const entry = arr.entries().next().value;
      if (entry != undefined) {
        expect(entry[0]).assertEqual(0);
        expect(entry[1]).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_5200
     * @tc.name testArrayEntries052
     * @tc.desc Verify entries shallow copy shares object reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ObjWithA = { a: 1 };
      const arr = Array.create<ObjWithA>(1, obj);
      const entry = arr.entries().next().value as [int, ObjWithA];
      entry[1].a = 999;
      expect(arr[0].a).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_5300
     * @tc.name testArrayEntries053
     * @tc.desc Verify Array.from entries with mapping function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = Array.from(arr.entries(), (pair: [int, int]) => pair[0] + pair[1]);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_5400
     * @tc.name testArrayEntries054
     * @tc.desc Verify empty array multiple entries calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const i1 = arr.entries();
      const i2 = arr.entries();
      const i3 = arr.entries();
      expect(i1.next().done && i2.next().done && i3.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_5500
     * @tc.name testArrayEntries055
     * @tc.desc Verify iter[Symbol.iterator] returns itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1);
      const iter = arr.entries();
      expect(typeof iter.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_5600
     * @tc.name testArrayEntries056
     * @tc.desc Verify entry index type is always number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>();
      arr.push(10n);
      arr.push(20n);
      const e = arr.entries().next().value as [int, bigint];
      expect(typeof e[0]).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_5700
     * @tc.name testArrayEntries057
     * @tc.desc Verify entries reduce index accumulation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const sumIdx = Array.from(arr.entries()).reduce((acc: int, entry: [int, int]) => acc + entry[0], 0);
      expect(sumIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_5800
     * @tc.name testArrayEntries058
     * @tc.desc Verify empty array entries yields immediate done
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const iter = arr.entries();
      const result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_5900
     * @tc.name testArrayEntries059
     * @tc.desc Verify string array entries returns correct index-value pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(3);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertEqual('a');
      expect(collected[1][0]).assertEqual(1);
      expect(collected[1][1]).assertEqual('b');
      expect(collected[2][0]).assertEqual(2);
      expect(collected[2][1]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_6000
     * @tc.name testArrayEntries060
     * @tc.desc Verify Date array entries returns correct index-value pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2026, 0, 1);
      const arr = Array.create<Date>(1, d);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(1);
      expect(collected[0][0]).assertEqual(0);
      expect((collected[0][1] as Date).getFullYear()).assertEqual(2026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_6100
     * @tc.name testArrayEntries061
     * @tc.desc Verify byte array entries returns correct index-value pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(10, 20, 30);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(3);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertEqual(10);
      expect(collected[2][1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_6200
     * @tc.name testArrayEntries062
     * @tc.desc Verify long array entries returns correct index-value pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(100, 200, 300);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(3);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[2][1]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_6300
     * @tc.name testArrayEntries063
     * @tc.desc Verify float array entries returns correct index-value pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(1.0f, 2.0f, 3.0f);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(3);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertEqual(1.0);
      expect(collected[2][1]).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_6400
     * @tc.name testArrayEntries064
     * @tc.desc Verify double array entries returns correct index-value pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(1.0, 2.0, 3.0);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(3);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[2][1]).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_6500
     * @tc.name testArrayEntries065
     * @tc.desc Verify boolean array entries returns correct index-value pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(3);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertTrue();
      expect(collected[1][1]).assertFalse();
      expect(collected[2][1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_6600
     * @tc.name testArrayEntries066
     * @tc.desc Verify Unicode Chinese string array entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\u4e2d', '\u6587', 'test');
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(3);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertEqual('\u4e2d');
      expect(collected[1][1]).assertEqual('\u6587');
      expect(collected[2][1]).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_6700
     * @tc.name testArrayEntries067
     * @tc.desc Verify empty and space string array entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', ' ', '\t');
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(3);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertEqual('');
      expect(collected[1][1]).assertEqual(' ');
      expect(collected[2][1]).assertEqual('\t');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_6800
     * @tc.name testArrayEntries068
     * @tc.desc Verify Map element array entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(new Array<[string, int]>(['k', 1]));
      const arr = Array.create<Map<string, int>>(1, m);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(1);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1].get('k')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_6900
     * @tc.name testArrayEntries069
     * @tc.desc Verify Set element array entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<int>(new Array<int>(1, 2, 3));
      const arr = Array.create<Set<int>>(1, s);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(1);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1].has(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_7000
     * @tc.name testArrayEntries070
     * @tc.desc Verify nullable int|null array entries with null value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | null> = new Array<int | null>(1, null, 3);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(3);
      expect(collected[0][0]).assertEqual(0);
      expect(collected[0][1]).assertEqual(1);
      expect(collected[1][1]).assertNull();
      expect(collected[2][1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_7100
     * @tc.name testArrayEntries071
     * @tc.desc Verify entries works on array with undefined elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | undefined> = new Array<int | undefined>(1, undefined, 3);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(3);
      expect(collected[0][1]).assertEqual(1);
      expect(collected[1][1]).assertUndefined();
      expect(collected[2][1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_7200
     * @tc.name testArrayEntries072
     * @tc.desc Verify entries on nested object array with null inner property
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: NodeWithRef = { val: 1, ref: null };
      const obj2: NodeWithRef = { val: 2, ref: { val: 3, ref: null } };
      const arr = new Array<NodeWithRef>(obj1, obj2);
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(2);
      expect(collected[0][1].ref).assertNull();
      expect(collected[1][1].ref != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_ENTRIES_7300
     * @tc.name testArrayEntries073
     * @tc.desc Verify entries on nullable nested type array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('testArrayEntries073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<NodeWithRef | null> = new Array<NodeWithRef | null>(null, { val: 2, ref: null });
      const collected = Array.from(arr.entries());
      expect(collected.length).assertEqual(2);
      expect(collected[0][1]).assertNull();
      expect(collected[1][1] != null).assertTrue();
    });

  });
}
