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

export default function SetIteratorNext2Test(): void {
  describe('SetIteratorNext2Test', (): void => {
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
     * @tc.desc Verify Set<byte> values() next traverses byte boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>();
      set.add(-128);
      set.add(0);
      set.add(127);
      const iter = set.values();
      expect(iter.next().value).assertEqual(-128);
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(127);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0200
     * @tc.desc Verify Set<short> values() next traverses short boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>();
      set.add(-32768);
      set.add(0);
      set.add(32767);
      const iter = set.values();
      expect(iter.next().value).assertEqual(-32768);
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(32767);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0300
     * @tc.desc Verify Set<byte> keys() next returns same as values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>();
      set.add(10);
      set.add(20);
      const ki = set.keys();
      const vi = set.values();
      expect(ki.next().value).assertEqual(vi.next().value);
      expect(ki.next().value).assertEqual(vi.next().value);
      expect(ki.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0400
     * @tc.desc Verify Set<number> with scientific notation values via next()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1.0e3, 1.0e6]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(1000);
      expect(iter.next().value).assertEqual(1000000);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0500
     * @tc.desc Verify Set<int> with hex literal values via next()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0xFF, 0x7A]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(255);
      expect(iter.next().value).assertEqual(122);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0600
     * @tc.desc Verify Set<long> values() next traverses long boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([-9223372036854775808, 0, 9223372036854775807]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(-9223372036854775808);
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(9223372036854775807);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0700
     * @tc.desc Verify Set<string> with zero-width space via next()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "​", "b"]);
      const iter = set.values();
      expect(iter.next().value).assertEqual("a");
      expect(iter.next().value).assertEqual("​");
      expect(iter.next().value).assertEqual("b");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0800
     * @tc.desc Verify Set<string> with emoji via next()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["😀", "🔥"]);
      const iter = set.values();
      expect(iter.next().value).assertEqual("😀");
      expect(iter.next().value).assertEqual("🔥");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_0900
     * @tc.desc Verify Set<string> with 10000-char string via next()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr = "a".repeat(10000);
      const set = new Set<string>([longStr]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(longStr);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1000
     * @tc.desc Verify entries() iterator traverses 1000 elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      const iter = set.entries();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.name testSetIteratorNext011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1100
     * @tc.desc Verify for-of with values() iterator traverses all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["x", "y", "z"]);
      const result: string[] = [];
      for (const v of set.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("x");
      expect(result[1]).assertEqual("y");
      expect(result[2]).assertEqual("z");
    });

    /**
     * @tc.name testSetIteratorNext012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1200
     * @tc.desc Verify for-of with values() break stops iteration early
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const result: int[] = [];
      for (const v of set.values()) {
        result.push(v);
        if (v === 3) {
          break;
        }
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorNext013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1300
     * @tc.desc Verify for-of with values() continue skips specific values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
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
     * @tc.name testSetIteratorNext014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1400
     * @tc.desc Verify next() traverses 5000 elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 5000; i++) {
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
      expect(count).assertEqual(5000);
    });

    /**
     * @tc.name testSetIteratorNext015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1500
     * @tc.desc Verify next() traverses 10000 elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 10000; i++) {
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
      expect(count).assertEqual(10000);
    });

    /**
     * @tc.name testSetIteratorNext016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1600
     * @tc.desc Verify next() with 50000 elements computes sum correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 50000; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      const iter = set.values();
      let sum = 0;
      let r = iter.next();
      while (!r.done) {
        let val = r.value as int;
        sum += val;
        r = iter.next();
      }
      expect(sum).assertEqual(1249975000);
    });

    /**
     * @tc.name testSetIteratorNext017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1700
     * @tc.desc Verify entries() with large data set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      const iter = set.entries();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(10000);
    });

    /**
     * @tc.name testSetIteratorNext018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1800
     * @tc.desc Verify next() traverses 100000 elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 100000; i++) {
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
      expect(count).assertEqual(100000);
    });

    /**
     * @tc.name testSetIteratorNext019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_1900
     * @tc.desc Verify while loop traversal pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["w", "x", "y", "z"]);
      const iter = set.values();
      const result: string[] = [];
      let r = iter.next();
      while (!r.done) {
        let val = r.value;
        result.push(val as string);
        r = iter.next();
      }
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name testSetIteratorNext020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2000
     * @tc.desc Verify multiple types mixed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>([1, "str", true]);
      const iter = set.values();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorNext021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2100
     * @tc.desc Verify floating point precision issues
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([0.1, 0.2]);
      const iter = set.values();
      const r1 = iter.next();
      const r2 = iter.next();
      expect((r1.value as number) + (r2.value as number) !== 0.3).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2200
     * @tc.desc Verify empty string vs space string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["", " "]);
      const iter = set.values();
      const r1 = iter.next();
      const r2 = iter.next();
      expect(r1.value).assertEqual("");
      expect(r2.value).assertEqual(" ");
      expect((r1.value as string) !== (r2.value as string)).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2300
     * @tc.desc Verify Set size with accented characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["café", "naïve"]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorNext024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2400
     * @tc.desc Verify iterator state after advancing two positions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      iter.next();
      iter.next();
      const snapshot = iter.next();
      expect(snapshot.value).assertEqual(3);
      expect(snapshot.done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2500
     * @tc.desc Verify nested Map next() iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set("a", 1);
      map.set("b", 2);
      const set = new Set<Map<string, int>>([map]);
      const iter = set.values();
      const r = iter.next();
      let mapVal = r.value as Map<string, int>;
      expect(mapVal.get("a")).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorNext026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2600
     * @tc.desc Verify nested Set next() iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerSet = new Set<string>(["x", "y"]);
      const set = new Set<Set<string>>([innerSet]);
      const iter = set.values();
      const r = iter.next();
      let setVal = r.value as Set<string>;
      expect(setVal.size).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorNext027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2700
     * @tc.desc Verify next() batch fetching pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const iter = set.values();
      const batch: int[] = [];
      for (let i = 0; i < 3; i++) {
        const r = iter.next();
        if (!r.done) {
          batch.push(r.value as int);
        }
      }
      expect(batch.length).assertEqual(3);
      expect(batch[0]).assertEqual(1);
      expect(batch[1]).assertEqual(2);
      expect(batch[2]).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorNext028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2800
     * @tc.desc Verify next() skip elements pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30, 40]);
      const iter = set.values();
      iter.next();
      iter.next();
      const third = iter.next();
      expect(third.value).assertEqual(30);
    });

    /**
     * @tc.name testSetIteratorNext029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_2900
     * @tc.desc Verify next() index tracking
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      const iter = set.values();
      const expected: string[] = ["a", "b", "c"];
      let index = 0;
      let r = iter.next();
      while (!r.done) {
        expect(r.value).assertEqual(expected[index]);
        index++;
        r = iter.next();
      }
      expect(index).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorNext030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3000
     * @tc.desc Verify next() object collection to Map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["key1", "key2"]);
      const map = new Map<string, int>();
      const iter = set.values();
      let idx = 0;
      let r = iter.next();
      while (!r.done) {
        let val = r.value;
        map.set(val as string, idx++);
        r = iter.next();
      }
      expect(map.size).assertEqual(2);
      let v = map.get("key1");
      expect(v as int).assertEqual(0);
    });

    /**
     * @tc.name testSetIteratorNext031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3100
     * @tc.desc Verify next() grouping collection
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5, 6]);
      const iter = set.values();
      const groups: int[][] = [[], []];
      let r = iter.next();
      while (!r.done) {
        let val = r.value;
        if (val != undefined) {
          groups[val % 2].push(val);
        }
        r = iter.next();
      }
      expect(groups[0].length).assertEqual(3);
      expect(groups[1].length).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorNext032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3200
     * @tc.desc Verify next() filter collection
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const iter = set.values();
      const filtered: int[] = [];
      let r = iter.next();
      while (!r.done) {
        let val = r.value;
        if (val != undefined && val > 2) {
          filtered.push(val);
        }
        r = iter.next();
      }
      expect(filtered.length).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorNext033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3300
     * @tc.desc Verify next() map collection
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      const mapped: int[] = [];
      let r = iter.next();
      while (!r.done) {
        let val = r.value;
        if (val != undefined) {
          mapped.push(val * 10);
        }
        r = iter.next();
      }
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual(10);
      expect(mapped[2]).assertEqual(30);
    });

    /**
     * @tc.name testSetIteratorNext034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3400
     * @tc.desc Verify next() flatMap collection
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1: number[] = [1, 2];
      const inner2: number[] = [3, 4];
      const set = new Set<number[]>([inner1, inner2]);
      const iter = set.values();
      const flat: number[] = [];
      let r = iter.next();
      while (!r.done) {
        let val = r.value;
        if (val != undefined) {
          for (let i = 0; i < val.length; i++) {
            flat.push(val[i]);
          }
        }
        r = iter.next();
      }
      expect(flat.length).assertEqual(4);
    });

    /**
     * @tc.name testSetIteratorNext035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3500
     * @tc.desc Verify deeply nested Map->Set->Array iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerArray1: number[] = [1, 2];
      const innerArray2: number[] = [3, 4];
      const innerSet = new Set<number[]>([innerArray1, innerArray2]);
      const outerMap = new Map<string, Set<number[]>>();
      outerMap.set("data", innerSet);
      const set = new Set<Map<string, Set<number[]>>>([outerMap]);
      const iter = set.values();
      let total = 0;
      let r = iter.next();
      if (!r.done) {
        let mapEntry = r.value as Map<string, Set<number[]>>;
        mapEntry.forEach((innerSetVal: Set<number[]>) => {
          for (const arr of innerSetVal) {
            total += arr.length;
          }
        });
      }
      expect(total).assertEqual(4);
    });

    /**
     * @tc.name testSetIteratorNext036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3600
     * @tc.desc Verify deeply nested Array->Map->Set iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerSet = new Set<string>(["a", "b"]);
      const innerMap = new Map<string, Set<string>>();
      innerMap.set("set", innerSet);
      const outerArray: Map<string, Set<string>>[] = [innerMap];
      const set = new Set<Array<Map<string, Set<string>>>>([outerArray]);
      const iter = set.values();
      let count = 0;
      let r = iter.next();
      if (!r.done) {
        let outerArr = r.value as Array<Map<string, Set<string>>>;
        for (let i = 0; i < outerArr.length; i++) {
          const m = outerArr[i];
          m.forEach((s: Set<string>) => {
            count += s.size;
          });
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorNext037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3700
     * @tc.desc Verify nested object property access from iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set("count", 42);
      const set = new Set<Map<string, int>>([map]);
      const iter = set.values();
      const r = iter.next();
      expect(r.done).assertFalse();
      const value = r.value as Map<string, int>;
      let cnt = value.get("count");
      expect(cnt as int).assertEqual(42);
    });

    /**
     * @tc.name testSetIteratorNext038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3800
     * @tc.desc Verify nested object property access
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number[]>();
      map.set("values", [10, 20, 30]);
      const set = new Set<Map<string, number[]>>([map]);
      const iter = set.values();
      const r = iter.next();
      const innerArray = (r.value as Map<string, number[]>).get("values");
      expect((innerArray as number[]).length).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorNext039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_3900
     * @tc.desc Verify entries() key equals value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["x", "y"]);
      const iter = set.entries();
      const r1 = iter.next();
      let entry = r1.value as [string, string];
      expect(entry[0]).assertEqual(entry[1]);
      expect(entry[0]).assertEqual("x");
      const r2 = iter.next();
      entry = r2.value as [string, string];
      expect(entry[0]).assertEqual(entry[1]);
      expect(entry[0]).assertEqual("y");
    });

    /**
     * @tc.name testSetIteratorNext040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4000
     * @tc.desc Verify next() with large string returns correct value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const largeStr = "item".repeat(1000);
      const set = new Set<string>([largeStr, "second"]);
      const iter = set.values();
      let r = iter.next();
      expect((r.value as string).length).assertEqual(4000);
      r = iter.next();
      expect(r.value).assertEqual("second");
    });

    /**
     * @tc.name testSetIteratorNext041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4100
     * @tc.desc Verify next() accumulates number values via type assertion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1.5, 2.5]);
      const iter = set.values();
      let sum: number = 0;
      let r = iter.next();
      while (!r.done) {
        let val = r.value as number;
        sum += val;
        r = iter.next();
      }
      expect(sum).assertEqual(4.0);
    });

    /**
     * @tc.name testSetIteratorNext042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4200
     * @tc.desc Verify multiple iterators parallel traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4]);
      const iter1 = set.values();
      const iter2 = set.values();
      const r1_1 = iter1.next();
      const r2_1 = iter2.next();
      expect(r1_1.value).assertEqual(r2_1.value);
      iter1.next();
      iter1.next();
      expect(iter2.next().value).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorNext043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4300
     * @tc.desc Verify iterator state isolation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      const iter1 = set.values();
      const iter2 = set.values();
      iter1.next();
      iter1.next();
      const r2 = iter2.next();
      expect(r2.value).assertEqual("a");
      expect(iter1.next().value).assertEqual("c");
    });

    /**
     * @tc.name testSetIteratorNext044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4400
     * @tc.desc Verify next() batch pause resume
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30, 40, 50]);
      const iter = set.values();
      const batch1: int[] = [];
      for (let i = 0; i < 2; i++) {
        const r = iter.next();
        if (!r.done) {
          batch1.push(r.value as int);
        }
      }
      expect(batch1.length).assertEqual(2);
      const batch2: int[] = [];
      for (let i = 0; i < 2; i++) {
        const r = iter.next();
        if (!r.done) {
          batch2.push(r.value as int);
        }
      }
      expect(batch2.length).assertEqual(2);
      expect(batch1[0]).assertEqual(10);
      expect(batch2[0]).assertEqual(30);
    });

    /**
     * @tc.name testSetIteratorNext045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4500
     * @tc.desc Verify next() on empty Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      const iter = set.values();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4600
     * @tc.desc Verify next() picks up elements added during traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.values();
      const r1 = iter.next();
      expect(r1.value).assertEqual(1);
      set.add(3);
      set.add(4);
      const r2 = iter.next();
      expect(r2.value).assertEqual(2);
      const r3 = iter.next();
      expect(r3.value).assertEqual(3);
      const r4 = iter.next();
      expect(r4.value).assertEqual(4);
      const r5 = iter.next();
      expect(r5.done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4700
     * @tc.desc Verify next() behavior after clear() during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const iter = set.values();
      iter.next();
      set.clear();
      const remainder: int[] = [];
      let r = iter.next();
      while (!r.done) {
        remainder.push(r.value as int);
        r = iter.next();
      }
      expect(remainder.length).assertEqual(0);
    });

    /**
     * @tc.name testSetIteratorNext048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4800
     * @tc.desc Verify for-of with values() iterator collects all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["x", "y", "z"]);
      const result: string[] = [];
      for (const v of set.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("x");
      expect(result[2]).assertEqual("z");
    });

    /**
     * @tc.name testSetIteratorNext049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_4900
     * @tc.desc Verify sequential next() calls retrieve all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([100, 200, 300]);
      const iter = set.values();
      const a = iter.next().value;
      const b = iter.next().value;
      const c = iter.next().value;
      expect(a).assertEqual(100);
      expect(b).assertEqual(200);
      expect(c).assertEqual(300);
    });

    /**
     * @tc.name testSetIteratorNext050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_5000
     * @tc.desc Verify Set<Error> values() next() traverses Error objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("err1");
      const e2: Error = new Error("err2");
      const set = new Set<Error>([e1, e2]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(e1);
      expect(iter.next().value).assertEqual(e2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_5100
     * @tc.desc Verify Set<Date> values() next() traverses Date objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(0);
      const d2: Date = new Date(1);
      const set = new Set<Date>([d1, d2]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(d1);
      expect(iter.next().value).assertEqual(d2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_5200
     * @tc.desc Verify Set<RegExp> values() next() traverses RegExp objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("abc");
      const r2: RegExp = new RegExp("xyz");
      const set = new Set<RegExp>([r1, r2]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(r1);
      expect(iter.next().value).assertEqual(r2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_5300
     * @tc.desc Verify Set<Object> values() next() traverses Promise objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      const set = new Set<Object>([p1, p2]);
      const iter = set.values();
      expect(iter.next().value === p1).assertTrue();
      expect(iter.next().value === p2).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_5400
     * @tc.desc Verify Set<WeakMap<Object, int>> values() next() traverses WeakMap objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const iter = set.values();
      expect(iter.next().value === wm1).assertTrue();
      expect(iter.next().value === wm2).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_5500
     * @tc.desc Verify Set<WeakSet<Object>> values() next() traverses WeakSet objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1, ws2]);
      const iter = set.values();
      expect(iter.next().value === ws1).assertTrue();
      expect(iter.next().value === ws2).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_5600
     * @tc.desc Verify next() skips deleted Error element during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set = new Set<Error>([e1, new Error("b")]);
      const iter = set.values();
      iter.next();
      set.delete(e1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_5700
     * @tc.desc Verify next() skips deleted Date element during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set = new Set<Date>([d1, new Date(2)]);
      const iter = set.values();
      iter.next();
      set.delete(d1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_5800
     * @tc.desc Verify next() skips deleted RegExp element during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set = new Set<RegExp>([r1, new RegExp("b")]);
      const iter = set.values();
      iter.next();
      set.delete(r1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_5900
     * @tc.desc Verify next() skips deleted Promise element during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      const set = new Set<Object>([p1, p2]);
      const iter = set.values();
      iter.next();
      set.delete(p1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_6000
     * @tc.desc Verify next() skips deleted WeakMap element during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const iter = set.values();
      iter.next();
      set.delete(wm1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_6100
     * @tc.desc Verify next() skips deleted WeakSet element during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1, ws2]);
      const iter = set.values();
      iter.next();
      set.delete(ws1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_6200
     * @tc.desc Verify next() returns done after clear with Error elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>([new Error("a")]);
      const iter = set.values();
      iter.next();
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_6300
     * @tc.desc Verify next() returns done after clear with Date elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Date>([new Date(1)]);
      const iter = set.values();
      iter.next();
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_6400
     * @tc.desc Verify next() returns done after clear with RegExp elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>([new RegExp("a")]);
      const iter = set.values();
      iter.next();
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_6500
     * @tc.desc Verify next() returns done after clear with Promise elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>([new Object()]);
      const iter = set.values();
      iter.next();
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_6600
     * @tc.desc Verify next() returns done after clear with WeakMap elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakMap<Object, int>>([new WeakMap<Object, int>()]);
      const iter = set.values();
      iter.next();
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_6700
     * @tc.desc Verify next() returns done after clear with WeakSet elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakSet<Object>>([new WeakSet<Object>()]);
      const iter = set.values();
      iter.next();
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_6800
     * @tc.desc Verify next() on empty Error Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      const iter = set.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_6900
     * @tc.desc Verify next() on empty Date Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Date>();
      const iter = set.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_7000
     * @tc.desc Verify next() on empty RegExp Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>();
      const iter = set.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_7100
     * @tc.desc Verify next() on empty Promise Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>();
      const iter = set.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_7200
     * @tc.desc Verify next() on empty WeakMap Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakMap<Object, int>>();
      const iter = set.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_7300
     * @tc.desc Verify next() on empty WeakSet Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakSet<Object>>();
      const iter = set.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_7400
     * @tc.desc Verify next() on single-element Error Set returns value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>([new Error("a")]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_7500
     * @tc.desc Verify next() on single-element Date Set returns value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Date>([new Date(1)]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_7600
     * @tc.desc Verify next() on single-element RegExp Set returns value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>([new RegExp("a")]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_7700
     * @tc.desc Verify next() on single-element Promise Set returns value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>([new Object()]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_7800
     * @tc.desc Verify next() on single-element WeakMap Set returns value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakMap<Object, int>>([new WeakMap<Object, int>()]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_7900
     * @tc.desc Verify next() on single-element WeakSet Set returns value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakSet<Object>>([new WeakSet<Object>()]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_8000
     * @tc.desc Verify next() deduplicates duplicate Error refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set = new Set<Error>([e1, e1]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_8100
     * @tc.desc Verify next() deduplicates duplicate Date refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set = new Set<Date>([d1, d1]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext082
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_8200
     * @tc.desc Verify next() deduplicates duplicate RegExp refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set = new Set<RegExp>([r1, r1]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext083
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_8300
     * @tc.desc Verify next() deduplicates duplicate Promise refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const set = new Set<Object>([p1, p1]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext084
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_8400
     * @tc.desc Verify next() deduplicates duplicate WeakMap refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1, wm1]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext085
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_8500
     * @tc.desc Verify next() deduplicates duplicate WeakSet refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1, ws1]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorNext086
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_8600
     * @tc.desc Verify next() picks up Error added to underlying Set during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>([new Error("a")]);
      const iter = set.values();
      iter.next();
      set.add(new Error("b"));
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext087
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_8700
     * @tc.desc Verify next() picks up Date added to underlying Set during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Date>([new Date(1)]);
      const iter = set.values();
      iter.next();
      set.add(new Date(2));
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext088
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_8800
     * @tc.desc Verify next() picks up RegExp added to underlying Set during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>([new RegExp("a")]);
      const iter = set.values();
      iter.next();
      set.add(new RegExp("b"));
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext089
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_8900
     * @tc.desc Verify next() picks up Promise added to underlying Set during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      const set = new Set<Object>([p1]);
      const iter = set.values();
      iter.next();
      set.add(p2);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext090
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_9000
     * @tc.desc Verify next() picks up WeakMap added to underlying Set during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1]);
      const iter = set.values();
      iter.next();
      set.add(wm2);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.name testSetIteratorNext091
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_NEXT_9100
     * @tc.desc Verify next() picks up WeakSet added to underlying Set during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorNext091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1]);
      const iter = set.values();
      iter.next();
      set.add(ws2);
      expect(iter.next().done).assertFalse();
    });

  });
}