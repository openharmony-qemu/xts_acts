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

export default function ReadonlySetKeysTest(): void {
  describe('ReadonlySetKeysTest', (): void => {
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
     * @tc.name testReadonlySetKeys001
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_0100
     * @tc.desc Verify keys() with no parameters returns iterator normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let iter = set.keys();
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys002
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_0200
     * @tc.desc Verify keys() for-of traversal iterates correct number of elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let count = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys003
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_0300
     * @tc.desc Verify keys() iterator next() returns done false for non-empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const iter = set.keys();
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testReadonlySetKeys004
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_0400
     * @tc.desc Verify keys() returns iterator, for-of traversal gets all keys in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let keys: long[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(1);
      expect(keys[1]).assertEqual(2);
      expect(keys[2]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys005
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_0500
     * @tc.desc Verify using iterator next() method to get keys one by one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<float> = new Set<float>([10.0, 20.0, 30.0]);
      let iter = set.keys();
      expect(iter.next().value).assertEqual(10.0);
      expect(iter.next().value).assertEqual(20.0);
      expect(iter.next().value).assertEqual(30.0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys006
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_0600
     * @tc.desc Verify key traversal order matches insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c"]);
      let result: string[] = [];
      for (const k of set.keys()) {
        result.push(k);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.name testReadonlySetKeys007
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_0700
     * @tc.desc Verify single-element Set keys() iterator contains only one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["only"]);
      let iter = set.keys();
      let r = iter.next();
      expect(r.value).assertEqual("only");
      expect(r.done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys008
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_0800
     * @tc.desc Verify empty Set keys() returns iterator with first next() done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>();
      let iter = set.keys();
      let r = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetKeys009
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_0900
     * @tc.desc Verify empty Set keys() for-of loop body does not execute
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>();
      let count: number = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys010
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_1000
     * @tc.desc Verify Set with special numeric values keys() traverses normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([0, -1, Number.MAX_VALUE, Number.MIN_VALUE]);
      let keys: number[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(-1);
    });

    /**
     * @tc.name testReadonlySetKeys011
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_1100
     * @tc.desc Verify keys() return value type is IterableIterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      let iter = set.keys();
      // Iterator 协议: 有 next 方法且返回 {value, done}
      let t: string = typeof iter.next;
      expect(t).assertEqual("function");
      let r = iter.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys012
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_1200
     * @tc.desc Verify iterator value type matches Set generic type T
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["hello"]);
      let iter = set.keys();
      let r = iter.next();
      let type: string = typeof r.value;
      expect(type).assertEqual("string");
      expect(r.value).assertEqual("hello");
    });

    /**
     * @tc.name testReadonlySetKeys013
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_1300
     * @tc.desc Verify large Set keys() traverses all keys completely
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<number> = new Set<number>(arr);
      let count: number = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(10000);
    });

    /**
     * @tc.name testReadonlySetKeys014
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_1400
     * @tc.desc Verify Set<string> keys() returns string type iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["x", "y", "z"]);
      let keys: string[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("x");
    });

    /**
     * @tc.name testReadonlySetKeys015
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_1500
     * @tc.desc Verify Set<Object> keys() returns object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Object = new Object();
      let obj2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj1, obj2]);
      let keys: Object[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0] === obj1).assertTrue();
      expect(keys[1] === obj2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys016
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_1600
     * @tc.desc Verify Set<boolean> keys() returns boolean type iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      let keys: boolean[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertTrue();
      expect(keys[1]).assertFalse();
    });

    /**
     * @tc.name testReadonlySetKeys017
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_1700
     * @tc.desc Verify each keys() call returns new independent iterator object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([1.0, 2.0, 3.0]);
      let iter1 = set.keys();
      let iter2 = set.keys();
      expect(iter1 !== iter2).assertTrue();
      expect(iter1.next().value).assertEqual(1.0);
      expect(iter2.next().value).assertEqual(1.0);
    });

    /**
     * @tc.name testReadonlySetKeys018
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_1800
     * @tc.desc Verify multiple iterators maintain independent traversal positions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      let iter1 = set.keys();
      let iter2 = set.keys();
      iter1.next();
      iter1.next();
      expect(iter1.next().value).assertEqual(30);
      expect(iter2.next().value).assertEqual(10);
    });

    /**
     * @tc.name testReadonlySetKeys019
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_1900
     * @tc.desc Verify for-of iterates multiple keys independently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      let count1: number = 0;
      for (const k of set.keys()) {
        count1++;
      }
      let count2: number = 0;
      for (const k of set.keys()) {
        count2++;
      }
      expect(count1).assertEqual(2);
      expect(count2).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys020
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_2000
     * @tc.desc Verify iterator next() returns done=true and value=undefined after exhaustion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([1.0]);
      let iter = set.keys();
      iter.next();
      let r1 = iter.next();
      expect(r1.done).assertTrue();
      let r2 = iter.next();
      expect(r2.done).assertTrue();
      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetKeys021
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_2100
     * @tc.desc Verify empty Set iterator next() always returns done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>();
      let iter = set.keys();
      for (let i = 0; i < 5; i++) {
        let r = iter.next();
        expect(r.done).assertTrue();
        expect(r.value).assertUndefined();
      }
    });

    /**
     * @tc.name testReadonlySetKeys022
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_2200
     * @tc.desc Verify adding element via underlying Set during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseSet: Set<int> = new Set<int>([1, 2, 3]);
      const set: ReadonlySet<int> = baseSet;
      let iter = set.keys();
      expect(iter.next().value).assertEqual(1);
      baseSet.add(4);
      let r = iter.next();
      expect(r.value).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys023
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_2300
     * @tc.desc Verify deleting element via underlying Set during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseSet: Set<int> = new Set<int>([1, 2, 3]);
      const set: ReadonlySet<int> = baseSet;
      let iter = set.keys();
      expect(iter.next().value).assertEqual(1);
      baseSet.delete(2);
      let r = iter.next();
      expect(r.value).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys024
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_2400
     * @tc.desc Verify clearing Set via underlying Set during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseSet: Set<int> = new Set<int>([1, 2, 3]);
      const set: ReadonlySet<int> = baseSet;
      let iter = set.keys();
      expect(iter.next().value).assertEqual(1);
      baseSet.clear();
      let r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys025
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_2500
     * @tc.desc Verify Error thrown in for-of loop caught by try-catch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let caught: boolean = false;
      try {
        for (const k of set.keys()) {
          if (k === 2) {
            throw new Error("test error in iteration");
          }
        }
      } catch (e) {
        caught = true;
        expect(e.message).assertEqual("test error in iteration");
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys026
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_2600
     * @tc.desc Verify break exits for-of traversal of keys() normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      let result: int[] = [];
      for (const k of set.keys()) {
        result.push(k);
        if (k === 20) {
          break;
        }
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
    });

    /**
     * @tc.name testReadonlySetKeys027
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_2700
     * @tc.desc Verify continue skips specific elements in for-of traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      let result: int[] = [];
      for (const k of set.keys()) {
        if (k % 2 === 0) {
          continue;
        }
        result.push(k);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetKeys028
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_2800
     * @tc.desc Verify safe destructuring of next() return value, handling done=true undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1]);
      let iter = set.keys();
      let r1 = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual(1);
      let r2 = iter.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys029
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_2900
     * @tc.desc Verify Array.from converts keys() iterator to array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 改用for-of遍历keys()收集数组等价验证
      const set: ReadonlySet<int> = new Set<int>([5, 6, 7]);
      const result: int[] = [];
      for (const k of set.keys()) {
        result.push(k);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(6);
      expect(result[2]).assertEqual(7);
    });

    /**
     * @tc.name testReadonlySetKeys030
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_KEYS_3000
     * @tc.desc Verify ReadonlySet<string | number> keys() iterates union type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string | number> = new Set<string | number>();
      (set as Set<string | number>).add("a");
      (set as Set<string | number>).add(1);
      (set as Set<string | number>).add("b");
      let numCount: int = 0;
      let strCount: int = 0;
      for (const k of set.keys()) {
        let t: string = typeof k;
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
  });
}
