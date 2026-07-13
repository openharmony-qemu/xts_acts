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

class Obj018 {
  id: int = 0;

  constructor(id: int) {
    this.id = id;
  }
}

class Obj020 {
  name: string = "";
}

export default function ReadonlySetValuesTest(): void {
  describe('ReadonlySetValuesTest', (): void => {
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
     * @tc.name testReadonlySetValues001
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0100
     * @tc.desc Verify values() with no parameters returns iterator normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetValues002
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0200
     * @tc.desc Verify values() returns iterator for non-empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const iter = set.values();
      let iterExists: boolean = iter != null;
      expect(iterExists).assertTrue();
      let t: string = typeof iter.next;
      expect(t).assertEqual("function");
    });

    /**
     * @tc.name testReadonlySetValues003
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0300
     * @tc.desc Verify values() iterator next() traverses all elements then done is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(10);
      expect(iter.next().value).assertEqual(20);
      expect(iter.next().value).assertEqual(30);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues004
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0400
     * @tc.desc Verify iterator traverses all values in insertion order via for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const result: long[] = [];
      for (const v of set.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues005
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0500
     * @tc.desc Verify single-element Set values() returns single-element iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([100.0]);
      const iter = set.values();
      const first = iter.next();
      let type: string = typeof first.done;
      expect(type).assertEqual("boolean");
      expect(first.value).assertEqual(100.0);
      expect(first.done).assertFalse();
      const second = iter.next();
      expect(second.done).assertTrue();
      expect(second.value).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetValues006
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0600
     * @tc.desc Verify empty Set values() returns empty iterator with no loop execution
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>();
      let count = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetValues007
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0700
     * @tc.desc Verify empty Set values() iterator next() returns done=true value=undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>();
      const iter = set.values();
      const result = iter.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetValues008
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0800
     * @tc.desc Verify Set with undefined value values() iterates correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Object | undefined> = new Set<Object | undefined>([1 as Object, undefined]);
      const iter = set.values();
      let count = 0;
      for (const v of iter) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues009
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0900
     * @tc.desc Verify Set with null value values() iterates correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Object | null> = new Set<Object | null>([1 as Object, null]);
      const iter = set.values();
      let count = 0;
      for (const v of iter) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues010
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1000
     * @tc.desc Verify Set with empty string values() iterates correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>([""]);
      const result: string[] = [];
      for (const v of set.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("");
    });

    /**
     * @tc.name testReadonlySetValues011
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1100
     * @tc.desc Verify Set with NaN values() iterates correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, 1, 2]);
      const result: number[] = [];
      for (const v of set.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      let hasNaN: boolean = Number.isNaN(result[0]);
      expect(hasNaN).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues012
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1200
     * @tc.desc Verify Set with 0 and -0 treated as same value in values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([0, -0]);
      const result: number[] = [];
      for (const v of set.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetValues013
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1300
     * @tc.desc Verify values() traverses floating point number elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1.5, 2.7, 3.9]);
      const result: number[] = [];
      for (const v of set.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0] > 1.4).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues014
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1400
     * @tc.desc Verify ReadonlySet values() with Object type elements iterates correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new Obj018(1);
      const obj2 = new Obj018(2);
      const set: ReadonlySet<Object> = new Set<Object>([obj1, obj2]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(obj1);
      expect(iter.next().value).assertEqual(obj2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues015
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1500
     * @tc.desc Verify Set<string> values() returns string type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["hello", "world"]);
      let stringCount: int = 0;
      let totalCount: int = 0;
      for (const v of set.values()) {
        totalCount++;
        let t: string = typeof v;
        if (t === "string") {
          stringCount++;
        }
      }
      expect(stringCount).assertEqual(totalCount);
      expect(totalCount).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues016
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1600
     * @tc.desc Verify each values() call returns independent iterator restarting from beginning
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const iter1 = set.values();
      const iter2 = set.values();
      iter1.next();
      iter1.next();
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetValues017
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1700
     * @tc.desc Verify Set<boolean> values() returns boolean type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      const iter = set.values();
      const result: boolean[] = [];
      for (const v of iter) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
    });

    /**
     * @tc.name testReadonlySetValues018
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1800
     * @tc.desc Verify Set<Object> values() returns Object type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new Obj020();
      obj1.name = "a";
      const obj2 = new Obj020();
      obj2.name = "b";
      const set: ReadonlySet<Object> = new Set<Object>([obj1, obj2]);
      const result: Obj020[] = [];
      for (const v of set.values()) {
        result.push(v as Obj020);
      }
      expect(result.length).assertEqual(2);
      expect(result[0].name).assertEqual("a");
      expect(result[1].name).assertEqual("b");
    });

    /**
     * @tc.name testReadonlySetValues019
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1900
     * @tc.desc Verify large Set values() traverses all values correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      let count = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.name testReadonlySetValues020
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_2000
     * @tc.desc Verify Set with Number.MAX_VALUE values() returns correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1, Number.MAX_VALUE, 3.14]);
      const iter = set.values();
      const result: number[] = [];
      for (const v of iter) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(Number.MAX_VALUE);
      expect(result[2]).assertEqual(3.14);
    });

    /**
     * @tc.name testReadonlySetValues021
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_2100
     * @tc.desc Verify Set with positive and negative numbers values() in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([-5, 3, -2, 0, 4]);
      const result: int[] = [];
      for (const v of set.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(-5);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(-2);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetValues022
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_2200
     * @tc.desc Verify Set with Unicode strings values() returns correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["你好", "こんにちは", "안녕하세요"]);
      const result: string[] = [];
      for (const v of set.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("你好");
      expect(result[1]).assertEqual("こんにちは");
      expect(result[2]).assertEqual("안녕하세요");
    });

    /**
     * @tc.name testReadonlySetValues023
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_2300
     * @tc.desc Verify Set with very long string values() returns correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>([LONG_STR]);
      const result: string[] = [];
      for (const v of set.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(LONG_STR);
    });

    /**
     * @tc.name testReadonlySetValues024
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_2400
     * @tc.desc Verify two iterators traverse independently without interference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      const iter1 = set.values();
      const iter2 = set.values();
      iter1.next();
      iter1.next();
      let r1 = iter1.next();
      expect(r1.value).assertEqual(30);
      let r2 = iter2.next();
      expect(r2.value).assertEqual(10);
    });

    /**
     * @tc.name testReadonlySetValues025
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_2500
     * @tc.desc Verify using next() to access iterator elements one by one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const iter = set.values();
      let r1 = iter.next();
      expect(r1.value).assertEqual(1);
      let r2 = iter.next();
      expect(r2.value).assertEqual(2);
      let r3 = iter.next();
      expect(r3.value).assertEqual(3);
      let r4 = iter.next();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues026
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_2600
     * @tc.desc Verify exhausted iterator next() always returns done=true value=undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4]);
      const iter = set.values();
      iter.next();
      iter.next();
      let r3 = iter.next();
      expect(r3.value).assertEqual(3);
      let r4 = iter.next();
      expect(r4.value).assertEqual(4);
      let r5 = iter.next();
      expect(r5.done).assertTrue();
      expect(r5.value).assertUndefined();
      let r6 = iter.next();
      expect(r6.done).assertTrue();
      expect(r6.value).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetValues027
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_2700
     * @tc.desc Verify throw Error in for-of values() caught by outer try-catch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let caught: boolean = false;
      try {
        for (const v of set.values()) {
          if (v === 2) {
            throw new Error("interrupt iteration");
          }
        }
      } catch (e) {
        caught = true;
        expect(e.message).assertEqual("interrupt iteration");
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues028
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_2800
     * @tc.desc Verify break in for-of values() exits traversal early
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      const result: int[] = [];
      for (const v of set.values()) {
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
     * @tc.name testReadonlySetValues029
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_2900
     * @tc.desc Verify continue in for-of values() skips specific elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      const result: int[] = [];
      for (const v of set.values()) {
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
     * @tc.name testReadonlySetValues030
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_3000
     * @tc.desc Verify throw stops iteration and only visited elements recorded
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4]);
      const visited: int[] = [];
      try {
        for (const v of set.values()) {
          visited.push(v);
          if (v === 3) {
            throw new Error("stop at 3");
          }
        }
      } catch (e) {
        expect(e.message).assertEqual("stop at 3");
      }
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues031
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_3100
     * @tc.desc Verify ReadonlySet<string | number> values() iterates union type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string | number> = new Set<string | number>();
      (set as Set<string | number>).add("x");
      (set as Set<string | number>).add(42);
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
      expect(strCount).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetValues032
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_3200
     * @tc.desc Verify break in for-of values() then manual next() resumes from next element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4]);
      const iter = set.values();
      for (const v of iter) {
        if (v === 2) {
          break;
        }
      }
      const r = iter.next();
      expect(r.value as int).assertEqual(3);
      expect(r.done).assertFalse();
    });
  });
}
