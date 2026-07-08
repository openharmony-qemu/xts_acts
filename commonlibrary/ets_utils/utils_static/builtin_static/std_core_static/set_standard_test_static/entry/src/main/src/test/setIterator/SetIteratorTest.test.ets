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

class Item020 {
  id: int = 0;

  constructor(id: int) {
    this.id = id;
  }
}

export default function SetIteratorTest(): void {
  describe('SetIteratorTest', (): void => {
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
     * @tc.name testSetIterator001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0100
     * @tc.desc Verify dollar_iterator with no parameters returns IterableIterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a");
      set.add("b");
      const iter = set.$_iterator();
      expect(iter.next().value).assertEqual("a");
    });

    /**
     * @tc.name testSetIterator002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0200
     * @tc.desc Verify iterator traverses all elements via for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a");
      set.add("b");
      const result: string[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
    });

    /**
     * @tc.name testSetIterator003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0300
     * @tc.desc Verify dollar_iterator and values() return same content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(10);
      set.add(20);
      const iterResult: int[] = [];
      for (const v of set.$_iterator()) {
        iterResult.push(v);
      }
      const valsResult: int[] = [];
      for (const v of set.values()) {
        valsResult.push(v);
      }
      expect(iterResult.length).assertEqual(valsResult.length);
      for (let i = 0; i < iterResult.length; i++) {
        expect(iterResult[i]).assertEqual(valsResult[i]);
      }
    });

    /**
     * @tc.name testSetIterator004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0400
     * @tc.desc Verify empty Set for-of loop body does not execute
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      let count = 0;
      for (const v of set.$_iterator()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testSetIterator005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0500
     * @tc.desc Verify Set $_iterator() on single-element Set returns only one value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("only");
      const result: string[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("only");
    });

    /**
     * @tc.name testSetIterator006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0600
     * @tc.desc Verify return value has IterableIterator next method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a");
      const iter = set.$_iterator();
      let typeNext: string = typeof iter.next;
      expect(typeNext).assertEqual("function");
    });

    /**
     * @tc.name testSetIterator007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0700
     * @tc.desc Verify Set int dollar_iterator returns int type values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      set.add(42);
      const iter = set.$_iterator();
      const result = iter.next();
      expect(result.value).assertEqual(42);
      let type: string = typeof result.value;
      expect(type).assertEqual("long");
    });

    /**
     * @tc.name testSetIterator008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0800
     * @tc.desc Verify Set string dollar_iterator returns string type values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("hello");
      const iter = set.$_iterator();
      const result = iter.next();
      expect(result.value).assertEqual("hello");
      let type: string = typeof result.value;
      expect(type).assertEqual("string");
    });

    /**
     * @tc.name testSetIterator009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0900
     * @tc.desc Verify Set boolean dollar_iterator returns boolean type values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>();
      set.add(true);
      set.add(false);
      const result: boolean[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
    });

    /**
     * @tc.name testSetIterator010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1000
     * @tc.desc Verify Set Object dollar_iterator returns object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>();
      const obj = new Item020(1);
      set.add(obj);
      const iter = set.$_iterator();
      const result = iter.next();
      expect(result.value === obj).assertTrue();
    });

    /**
     * @tc.name testSetIterator011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1100
     * @tc.desc Verify large Set dollar_iterator traverses all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }
      const result: int[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(1000);
      expect(result[0]).assertEqual(0);
      expect(result[999]).assertEqual(999);
    });

    /**
     * @tc.name testSetIterator012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1200
     * @tc.desc Verify Set string with special strings traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("");
      set.add("你好");
      set.add("\t\n");
      const result: string[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual("你好");
    });

    /**
     * @tc.name testSetIterator013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1300
     * @tc.desc Verify Set number with special numeric values traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(0);
      set.add(-1);
      set.add(3.14);
      const result: number[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(-1);
    });

    /**
     * @tc.name testSetIterator014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1400
     * @tc.desc Verify Set int with int boundary values traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(2147483647);
      set.add(-2147483648);
      const result: int[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2147483647);
      expect(result[1]).assertEqual(-2147483648);
    });

    /**
     * @tc.name testSetIterator015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1500
     * @tc.desc Verify each dollar_iterator call returns new iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a");
      set.add("b");
      const iter1 = set.$_iterator();
      const iter2 = set.$_iterator();
      expect(iter1 !== iter2).assertTrue();
    });

    /**
     * @tc.name testSetIterator016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1600
     * @tc.desc Verify new iterator restarts from beginning
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("x");
      set.add("y");
      const iter1 = set.$_iterator();
      iter1.next();
      iter1.next();
      const iter2 = set.$_iterator();
      const result = iter2.next();
      expect(result.value).assertEqual("x");
      expect(result.done).assertFalse();
    });

    /**
     * @tc.name testSetIterator017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1700
     * @tc.desc Verify iterator supports nested for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(1);
      set.add(2);
      const result: int[] = [];
      const iter1 = set.$_iterator();
      for (const v1 of iter1) {
        result.push(v1);
        const iter2 = set.$_iterator();
        for (const v2 of iter2) {
          result.push(v2);
        }
      }
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(1);
      expect(result[5]).assertEqual(2);
    });

    /**
     * @tc.name testSetIterator018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1800
     * @tc.desc Verify Error thrown in for-of loop caught externally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a");
      set.add("b");
      try {
        for (const v of set.$_iterator()) {
          if (v === "a") {
            throw new Error("iter error");
          }
        }
        expect().assertFail();
      } catch (error) {
        expect(error.message).assertEqual("iter error");
      }
    });

    /**
     * @tc.name testSetIterator019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1900
     * @tc.desc Verify inner try-catch in loop continues traversal after exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a");
      set.add("b");
      set.add("c");
      const result: string[] = [];
      for (const v of set.$_iterator()) {
        try {
          if (v === "b") {
            throw new Error("skip b");
          }
          result.push(v);
        } catch (error) {
          expect(error.message).assertEqual("skip b");
          result.push("recovered");
        }
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("recovered");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.name testSetIterator020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_2000
     * @tc.desc Verify break in for-of interrupts traversal early
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(10);
      set.add(20);
      set.add(30);
      const result: int[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
        if (v === 20) {
          break;
        }
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
    });

    /**
     * @tc.name testSetIterator021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_2100
     * @tc.desc Verify continue in for-of skips specific values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(1);
      set.add(2);
      set.add(3);
      set.add(4);
      set.add(5);
      const result: int[] = [];
      for (const v of set.$_iterator()) {
        if (v % 2 === 0) {
          continue;
        }
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name testSetIterator022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_2200
     * @tc.desc Verify add during for-of iteration over dollar_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a");
      set.add("b");
      for (const v of set.$_iterator()) {
        if (v === "a") {
          set.add("c");
        }
      }
      expect(set.size).assertEqual(3);
      expect(set.has("c")).assertTrue();
    });

    /**
     * @tc.name testSetIterator023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_2300
     * @tc.desc Verify delete during for-of iteration over dollar_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a");
      set.add("b");
      for (const v of set.$_iterator()) {
        if (v === "a") {
          set.delete("b");
        }
      }
      expect(set.size).assertEqual(1);
      expect(set.has("b")).assertFalse();
      expect(set.has("a")).assertTrue();
    });

    /**
     * @tc.name testSetIterator024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_2400
     * @tc.desc Verify clear during for-of iteration over dollar_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a");
      set.add("b");
      for (const v of set.$_iterator()) {
        if (v === "a") {
          set.clear();
        }
      }
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetIterator025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_2500
     * @tc.desc Verify $_iterator() on Set of Item020 returns iterator of correct type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Item020(1);
      const set = new Set<Item020>([obj]);
      const iter = set.$_iterator();
      const result = iter.next();
      expect(result.value === obj).assertTrue();
      expect(result.value instanceof Item020).assertTrue();
    });
  });
}
