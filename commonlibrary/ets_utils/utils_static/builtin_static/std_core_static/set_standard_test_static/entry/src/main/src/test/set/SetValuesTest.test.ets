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

const LONG_STR = "a".repeat(10000);

class Obj023 {
  name: string = "";

  constructor(n: string) {
    this.name = n;
  }
}

export default function SetValuesTest(): void {
  describe('SetValuesTest', (): void => {
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
     * @tc.name testSetValues001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_0100
     * @tc.desc Verify values() with no parameters returns iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b"]);
      let iter = set.values();
      expect(iter.next().value).assertEqual("a");
    });

    /**
     * @tc.name testSetValues002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_0200
     * @tc.desc Verify iterator object traverses all values in insertion order via for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      let result: string[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.name testSetValues003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_0300
     * @tc.desc Verify single-element Set values() returns single-element iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([42]);
      let result: number[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.name testSetValues004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_0400
     * @tc.desc Verify empty Set values() returns empty iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      let result: string[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name testSetValues005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_0500
     * @tc.desc Verify empty Set values() iterator next() returns done true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      let iter = set.values();
      let entry = iter.next();
      expect(entry.done).assertEqual(true);
      expect(entry.value).assertUndefined();
    });

    /**
     * @tc.name testSetValues006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_0600
     * @tc.desc Verify Set with undefined value values() iterates correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<(string | undefined)>();
      set.add(undefined);
      set.add("a");
      let result: (string | undefined)[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertEqual("a");
    });

    /**
     * @tc.name testSetValues007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_0700
     * @tc.desc Verify Set with null value values() iterates correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<(string | null)>();
      set.add(null);
      set.add("a");
      let result: (string | null)[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertNull();
      expect(result[1]).assertEqual("a");
    });

    /**
     * @tc.name testSetValues008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_0800
     * @tc.desc Verify Set with empty string values() iterates correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("");
      set.add("a");
      let result: string[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual("a");
    });

    /**
     * @tc.name testSetValues009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_0900
     * @tc.desc Verify Set with NaN values() iterates correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(Number.NaN);
      set.add(1);
      let result: number[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(2);
      expect(Number.isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.name testSetValues010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_1000
     * @tc.desc Verify Set with 0 and -0 treated as same value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(0);
      set.add(-0);
      let result: number[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetValues011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_1100
     * @tc.desc Verify values() return value type is IterableIterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b"]);
      let iter = set.values();
      let typeNext: string = typeof iter.next;
      expect(typeNext).assertEqual("function");
      expect(iter.next().value).assertEqual("a");
    });

    /**
     * @tc.name testSetValues012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_1200
     * @tc.desc Verify Set string values() returns string type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["hello", "world"]);
      for (const k of set.values()) {
        let t: string = typeof k;
        expect(t).assertEqual("string");
      }
    });

    /**
     * @tc.name testSetValues013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_1300
     * @tc.desc Verify Set number values() returns number type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1, 2, 3]);
      for (const k of set.values()) {
        let t: string = typeof k;
        expect(t).assertEqual("number");
      }
    });

    /**
     * @tc.name testSetValues014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_1400
     * @tc.desc Verify Set boolean values() returns boolean type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      let result: boolean[] = [];
      for (const k of set.values()) {
        let t: string = typeof k;
        expect(t).assertEqual("boolean");
        result.push(k);
      }
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name testSetValues015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_1500
     * @tc.desc Verify Set Object values() returns Object type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new Obj023("obj1");
      const obj2 = new Obj023("obj2");
      const set = new Set<Object>([obj1, obj2]);
      let result: Object[] = [];
      for (const k of set.values()) {
        expect(k instanceof Obj023).assertTrue();
        result.push(k);
      }
      expect(result.length).assertEqual(2);
      expect(result[0] === obj1).assertTrue();
      expect(result[1] === obj2).assertTrue();
    });

    /**
     * @tc.name testSetValues016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_1600
     * @tc.desc Verify large Set values() traverses all values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      for (let i = 0; i < 10000; i++) {
        set.add(i);
      }
      let count = 0;
      for (const k of set.values()) {
        count++;
      }
      expect(count).assertEqual(10000);
    });

    /**
     * @tc.name testSetValues017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_1700
     * @tc.desc Verify Set with Number.MAX_VALUE values() returns correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(Number.MAX_VALUE);
      set.add(Number.MIN_VALUE);
      let result: number[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(Number.MAX_VALUE);
      expect(result[1]).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name testSetValues018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_1800
     * @tc.desc Verify Set with positive and negative numbers values() in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([-1, 0, 1, -999, 999]);
      let result: number[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result[0]).assertEqual(-1);
      expect(result[4]).assertEqual(999);
    });

    /**
     * @tc.name testSetValues019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_1900
     * @tc.desc Verify Set with Unicode strings values() returns correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["你好", "世界", "🎉", "​"]);
      let result: string[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("你好");
      expect(result[2]).assertEqual("🎉");
    });

    /**
     * @tc.name testSetValues020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_2000
     * @tc.desc Verify Set with very long string values() returns correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr = LONG_STR;
      const set = new Set<string>([longStr, "short"]);
      let result: string[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual("short");
    });

    /**
     * @tc.name testSetValues021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_2100
     * @tc.desc Verify each values() call returns new iterator object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b"]);
      let iter1 = set.values();
      let iter2 = set.values();
      expect(iter1 !== iter2).assertTrue();
    });

    /**
     * @tc.name testSetValues022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_2200
     * @tc.desc Verify two iterators traverse independently without interference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      let iter1 = set.values();
      let iter2 = set.values();
      expect(iter1.next().value).assertEqual("a");
      expect(iter2.next().value).assertEqual("a");
      expect(iter1.next().value).assertEqual("b");
      expect(iter2.next().value).assertEqual("b");
    });

    /**
     * @tc.name testSetValues023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_2300
     * @tc.desc Verify using next() to access iterator elements one by one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["x", "y", "z"]);
      let iter = set.values();
      expect(iter.next().value).assertEqual("x");
      expect(iter.next().value).assertEqual("y");
      expect(iter.next().value).assertEqual("z");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetValues024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_2400
     * @tc.desc Verify values() and entries() return consistent content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b"]);
      let values: string[] = [];
      let entries: string[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      for (const entry of set.entries()) {
        entries.push(entry[0]);
      }
      expect(values.length).assertEqual(entries.length);
      expect(values[0]).assertEqual(entries[0]);
    });

    /**
     * @tc.name testSetValues025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_2500
     * @tc.desc Verify values() and keys() return same content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      let valuesArr: string[] = [];
      let keysArr: string[] = [];
      for (const v of set.values()) {
        valuesArr.push(v);
      }
      for (const k of set.keys()) {
        keysArr.push(k);
      }
      expect(valuesArr.length).assertEqual(keysArr.length);
      expect(valuesArr[0]).assertEqual(keysArr[0]);
    });

    /**
     * @tc.name testSetValues026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_2600
     * @tc.desc Verify after add values() reflects new content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a"]);
      set.add("b");
      let result: string[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
    });

    /**
     * @tc.name testSetValues027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_2700
     * @tc.desc Verify after delete values() reflects changes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      set.delete("b");
      let result: string[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("c");
    });

    /**
     * @tc.name testSetValues028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_2800
     * @tc.desc Verify after clear values() returns empty iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b"]);
      set.clear();
      let result: string[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name testSetValues029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_2900
     * @tc.desc Verify duplicate add of same value values() contains only one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a");
      set.add("a");
      set.add("a");
      let result: string[] = [];
      for (const k of set.values()) {
        result.push(k);
      }
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("a");
    });

    /**
     * @tc.name testSetValues030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_3000
     * @tc.desc Verify exhausted iterator next() does not throw exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a"]);
      let iter = set.values();
      iter.next();
      iter.next();
      let result = iter.next();
      expect(result.done).assertEqual(true);
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.name testSetValues031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_3100
     * @tc.desc Verify empty Set iterator next() does not throw exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      let iter = set.values();
      for (let i = 0; i < 5; i++) {
        let result = iter.next();
        expect(result.done).assertEqual(true);
      }
    });

    /**
     * @tc.name testSetValues032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_3200
     * @tc.desc Verify add during for-of iteration over values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b"]);
      let result: string[] = [];
      for (const k of set.values()) {
        result.push(k);
        if (k === "a") {
          set.add("c");
        }
      }
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name testSetValues033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_3300
     * @tc.desc Verify delete during for-of iteration over values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      let result: string[] = [];
      for (const k of set.values()) {
        result.push(k);
        if (k === "a") {
          set.delete("b");
        }
      }
      expect(set.size).assertEqual(2);
      expect(set.has("b")).assertFalse();
      expect(set.has("a")).assertTrue();
      expect(set.has("c")).assertTrue();
    });

    /**
     * @tc.name testSetValues034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_3400
     * @tc.desc Verify clear during for-of iteration over values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      let result: string[] = [];
      for (const k of set.values()) {
        result.push(k);
        if (k === "a") {
          set.clear();
        }
      }
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetValues035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_3500
     * @tc.desc Verify Error thrown in for-of loop caught by outer catch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b"]);
      try {
        for (const k of set.values()) {
          if (k === "b") {
            throw new Error("iteration error");
          }
        }
        expect().assertFail();
      } catch (error) {
        expect(error.message).assertEqual("iteration error");
      }
    });

    /**
     * @tc.name testSetValues036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_3600
     * @tc.desc Verify safe use of iterator in try-catch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b"]);
      let iter = set.values();
      try {
        let entry = iter.next();
        expect(entry.value).assertEqual("a");
      } catch (error) {
        expect().assertFail();
      }
      let entry = iter.next();
      expect(entry.value).assertEqual("b");
    });

    /**
     * @tc.name testSetValues037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_3700
     * @tc.desc Verify Set<string | number> values() iterates union type elements of both types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number>();
      set.add("hello");
      set.add(42);
      set.add("world");
      let numCount: int = 0;
      let strCount: int = 0;
      for (const v of set.values()) {
        let t: string = typeof v;
        if (t === "number") {
          numCount++;
        }
        if (t === "string") {
          strCount++;
        }
      }
      expect(numCount).assertEqual(1);
      expect(strCount).assertEqual(2);
    });

    /**
     * @tc.name testSetValues038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_3800
     * @tc.desc Verify values() iterates Obj023 references in insertion order for Set of Obj023
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetValues038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new Obj023("a");
      const obj2 = new Obj023("b");
      const set = new Set<Obj023>([obj1, obj2]);
      let result: Obj023[] = [];
      for (const v of set.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0] === obj1).assertTrue();
      expect(result[1] === obj2).assertTrue();
      expect(result[0].name).assertEqual("a");
      expect(result[1].name).assertEqual("b");
    });
  });
}
