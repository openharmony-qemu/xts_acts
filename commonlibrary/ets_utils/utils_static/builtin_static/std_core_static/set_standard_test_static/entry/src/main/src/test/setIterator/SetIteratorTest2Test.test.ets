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

class ExtendedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function SetIteratorTest2Test(): void {
  describe('SetIteratorTest2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.name testSetIteratorTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0010
     * @tc.desc Verify Set<byte> $_iterator traverses byte boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>();
      set.add(-128);
      set.add(0);
      set.add(127);
      const result: byte[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(-128);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(127);
    });

    /**
     * @tc.name testSetIteratorTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0020
     * @tc.desc Verify Set<short> $_iterator traverses short boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>();
      set.add(-32768);
      set.add(0);
      set.add(32767);
      const result: short[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(-32768);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(32767);
    });

    /**
     * @tc.name testSetIteratorTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0030
     * @tc.desc Verify Set<number> $_iterator traverses number special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([0.0, Number.NaN, Number.POSITIVE_INFINITY]);
      const result: number[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0.0);
      expect(Number.isNaN(result[1])).assertTrue();
      expect(result[2]).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testSetIteratorTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0040
     * @tc.desc Verify Set<number> $_iterator traverses number special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([-1.5, Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      const result: number[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(-1.5);
      expect(Number.isNaN(result[1])).assertTrue();
      expect(result[2]).assertEqual(Number.POSITIVE_INFINITY);
      expect(result[3]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testSetIteratorTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0050
     * @tc.desc Verify entries() iterator returns entry pairs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const entriesIter = set.entries();
      const result: int[] = [];
      for (const entry of entriesIter) {
        result.push(entry[0]);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0060
     * @tc.desc Verify entries() iterator traverses values correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b"]);
      const entriesIter = set.entries();
      const r1 = entriesIter.next();
      let v1 = r1.value as [string, string];
      expect(v1[0]).assertEqual("a");
      const r2 = entriesIter.next();
      let v2 = r2.value as [string, string];
      expect(v2[0]).assertEqual("b");
      expect(entriesIter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0070
     * @tc.desc Verify keys() iterator traverses all keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const keysIter = set.keys();
      const result: int[] = [];
      for (const k of keysIter) {
        result.push(k);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.name testSetIteratorTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0080
     * @tc.desc Verify Set<number> with scientific notation values via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1.0e3, 1.0e6]);
      const result: number[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1000);
      expect(result[1]).assertEqual(1000000);
    });

    /**
     * @tc.name testSetIteratorTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0090
     * @tc.desc Verify Set<int> with hex literal values via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0xFF, 0x7A]);
      const result: int[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(122);
    });

    /**
     * @tc.name testSetIteratorTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0100
     * @tc.desc Verify Set<string> with zero-width space via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "​", "b"]);
      const result: string[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("​");
      expect(result[2]).assertEqual("b");
    });

    /**
     * @tc.name testSetIteratorTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0110
     * @tc.desc Verify Set<string> with emoji via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["😀", "🔥"]);
      const result: string[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("😀");
      expect(result[1]).assertEqual("🔥");
    });

    /**
     * @tc.name testSetIteratorTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0120
     * @tc.desc Verify NaN deduplication in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([Number.NaN, Number.NaN]);
      const result: number[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0130
     * @tc.desc Verify -0 and +0 are deduplicated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([0, -0]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0140
     * @tc.desc Verify same object reference is deduplicated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new ExtendedItem(1);
      const set = new Set<ExtendedItem>([shared, shared]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0150
     * @tc.desc Verify different object references are not deduplicated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new ExtendedItem(1);
      const obj2 = new ExtendedItem(1);
      const set = new Set<ExtendedItem>([obj1, obj2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0160
     * @tc.desc Verify undefined as element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object | undefined>([undefined]);
      const iter = set.$_iterator();
      const result = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.name testSetIteratorTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0170
     * @tc.desc Verify BigInt as element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>();
      set.add(BigInt(123));
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0180
     * @tc.desc Verify BigInt boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxBigInt = BigInt(Number.MAX_SAFE_INTEGER) + BigInt(1);
      const set = new Set<Object>([maxBigInt]);
      const iter = set.$_iterator();
      const result = iter.next();
      expect(result.value).assertEqual(maxBigInt);
    });

    /**
     * @tc.name testSetIteratorTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0190
     * @tc.desc Verify BigInt element iteration via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>();
      set.add(BigInt(1));
      set.add(BigInt(2));
      set.add(BigInt(3));
      let count = 0;
      for (const v of set.$_iterator()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0200
     * @tc.desc Verify scientific notation boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1e-308, 1e308]);
      const result: number[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1e-308);
      expect(result[1]).assertEqual(1e308);
    });

    /**
     * @tc.name testSetIteratorTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0210
     * @tc.desc Verify binary-format string elements via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["0b1010", "0b1111"]);
      const result: string[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0220
     * @tc.desc Verify octal-format string elements via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["0o755", "0o644"]);
      const result: string[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0230
     * @tc.desc Verify class instance elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new ExtendedItem(100);
      const item2 = new ExtendedItem(200);
      const set = new Set<ExtendedItem>([item1, item2]);
      let count = 0;
      for (const v of set.$_iterator()) {
        expect(v instanceof ExtendedItem).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0240
     * @tc.desc Verify class instance element via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new ExtendedItem(1);
      const set = new Set<ExtendedItem>([item]);
      const result = set.$_iterator().next();
      expect(result.value).assertEqual(item);
    });

    /**
     * @tc.name testSetIteratorTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0250
     * @tc.desc Verify template literal elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = "test";
      const template = `prefix-${value}-suffix`;
      const set = new Set<string>([template]);
      const result = set.$_iterator().next().value;
      expect(result).assertEqual("prefix-test-suffix");
    });

    /**
     * @tc.name testSetIteratorTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0260
     * @tc.desc Verify multiline string elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const multiline = "line1\nline2\nline3";
      const set = new Set<string>([multiline]);
      let result = set.$_iterator().next().value as string;
      expect(result.includes("\n")).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0270
     * @tc.desc Verify long integer boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([-9223372036854775808, 9223372036854775807]);
      const result: long[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0280
     * @tc.desc Verify double precision boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([Number.MAX_VALUE, Number.MIN_VALUE]);
      const result: double[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0290
     * @tc.desc Verify Set with 100000 elements traverses all via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 100000; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      let count = 0;
      for (const v of set.$_iterator()) {
        count++;
      }
      expect(count).assertEqual(100000);
    });

    /**
     * @tc.name testSetIteratorTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0300
     * @tc.desc Verify $_iterator traversal using while loop instead of for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c", "d"]);
      const iter = set.$_iterator();
      const result: string[] = [];
      let r = iter.next();
      while (!r.done) {
        let val = r.value;
        result.push(val as string);
        r = iter.next();
      }
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("a");
      expect(result[3]).assertEqual("d");
    });

    /**
     * @tc.name testSetIteratorTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0310
     * @tc.desc Verify manual iterator state management via next() calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30, 40, 50]);
      const iter = set.$_iterator();
      let index = 0;
      const collected: int[] = [];
      while (index < 3) {
        const r = iter.next();
        if (!r.done) {
          collected.push(r.value as int);
          index++;
        } else {
          break;
        }
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(10);
      expect(collected[1]).assertEqual(20);
      expect(collected[2]).assertEqual(30);
    });

    /**
     * @tc.name testSetIteratorTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0320
     * @tc.desc Verify Set with nested Map elements traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map<string, number>();
      map1.set("key1", 100);
      map1.set("key2", 200);
      const map2 = new Map<string, number>();
      map2.set("key3", 300);
      const set = new Set<Map<string, number>>([map1, map2]);
      let totalCount = 0;
      for (const m of set.$_iterator()) {
        let count = 0;
        m.forEach((v: number) => {
          count++;
        });
        totalCount += count;
      }
      expect(totalCount).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0330
     * @tc.desc Verify Set with nested Set elements traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Set<string>(["a", "b"]);
      const inner2 = new Set<string>(["c", "d"]);
      const set = new Set<Set<string>>([inner1, inner2]);
      let count = 0;
      for (const inner of set.$_iterator()) {
        for (const v of inner) {
          count++;
        }
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name testSetIteratorTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0340
     * @tc.desc Verify Set with nested Array elements traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [4, 5, 6];
      const set = new Set<number[]>([arr1, arr2]);
      const result: number[] = [];
      for (const arr of set.$_iterator()) {
        for (let i = 0; i < arr.length; i++) {
          result.push(arr[i]);
        }
      }
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name testSetIteratorTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0350
     * @tc.desc Verify deeply nested Map->Set->Array structure traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerArray: number[] = [1, 2, 3];
      const innerSet = new Set<number[]>([innerArray]);
      const outerMap = new Map<string, Set<number[]>>();
      outerMap.set("data", innerSet);
      const set = new Set<Map<string, Set<number[]>>>([outerMap]);
      let totalCount = 0;
      for (const map of set.$_iterator()) {
        map.forEach((innerSetVal: Set<number[]>) => {
          for (const arr of innerSetVal) {
            totalCount += arr.length;
          }
        });
      }
      expect(totalCount).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0360
     * @tc.desc Verify deeply nested Array->Map->Array structure traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerMap = new Map<string, number[]>();
      innerMap.set("nums", [10, 20, 30]);
      const outerArray: Map<string, number[]>[] = [innerMap];
      const set = new Set<Array<Map<string, number[]>>>([outerArray]);
      let sum = 0;
      for (const arr of set.$_iterator()) {
        for (let i = 0; i < arr.length; i++) {
          const m = arr[i];
          m.forEach((v: number[]) => {
            for (let j = 0; j < v.length; j++) {
              sum += v[j];
            }
          });
        }
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.name testSetIteratorTest037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0370
     * @tc.desc Verify iterator closure state accumulation across iterations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4]);
      let capturedValues: int[] = [];
      let closureFactory = (): ((v: int) => void) => {
        return (v: int): void => {
          capturedValues.push(v);
        };
      };
      const handler1 = closureFactory();
      const handler2 = closureFactory();
      for (const v of set.$_iterator()) {
        handler1(v);
      }
      for (const v of set.$_iterator()) {
        handler2(v);
      }
      expect(capturedValues.length).assertEqual(8);
    });

    /**
     * @tc.name testSetIteratorTest038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0380
     * @tc.desc Verify iteration order consistency across multiple traversals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      const cached: string[] = [];
      for (const v of set.$_iterator()) {
        cached.push(v);
      }
      expect(cached.length).assertEqual(3);
      expect(cached[0]).assertEqual("a");
      const cachedAgain: string[] = [];
      for (const v of set.$_iterator()) {
        cachedAgain.push(v);
      }
      expect(cachedAgain.length).assertEqual(3);
      expect(cached[0]).assertEqual(cachedAgain[0]);
    });

    /**
     * @tc.name testSetIteratorTest039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0390
     * @tc.desc Verify iterator early termination state validation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["x", "y", "z"]);
      const iter = set.$_iterator();
      iter.next();
      iter.next();
      const third = iter.next();
      expect(third.value as string).assertEqual("z");
      expect(third.done).assertFalse();
      const fourth = iter.next();
      expect(fourth.done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0400
     * @tc.desc Verify exception handling inside for-of iteration body does not interrupt iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c", "d"]);
      const result: string[] = [];
      for (const v of set.$_iterator()) {
        try {
          if (v === "b") {
            throw new Error("skip");
          }
          result.push(v);
        } catch (e) {
          result.push("caught");
        }
      }
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("caught");
    });

    /**
     * @tc.name testSetIteratorTest041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0410
     * @tc.desc Verify iterator pagination processing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 20; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      const pageSize = 5;
      const pages: int[][] = [];
      let currentPage: int[] = [];
      let count = 0;
      for (const v of set.$_iterator()) {
        currentPage.push(v);
        count++;
        if (count % pageSize === 0) {
          pages.push(currentPage);
          currentPage = [];
        }
      }
      if (currentPage.length > 0) {
        pages.push(currentPage);
      }
      expect(pages.length).assertEqual(4);
      expect(pages[0].length).assertEqual(5);
      expect(pages[3].length).assertEqual(5);
    });

    /**
     * @tc.name testSetIteratorTest042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0420
     * @tc.desc Verify iteration does not modify original set structure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const sizeBefore = set.size;
      let count = 0;
      for (const v of set.$_iterator()) {
        count++;
      }
      expect(count).assertEqual(3);
      expect(set.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.name testSetIteratorTest043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0430
     * @tc.desc Verify iteration order stability across multiple traversals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([100, 200, 300]);
      const order1: int[] = [];
      const order2: int[] = [];
      const order3: int[] = [];
      for (const v of set.$_iterator()) {
        order1.push(v);
      }
      for (const v of set.$_iterator()) {
        order2.push(v);
      }
      for (const v of set.$_iterator()) {
        order3.push(v);
      }
      expect(order1[0]).assertEqual(order2[0]);
      expect(order2[0]).assertEqual(order3[0]);
      expect(order1[1]).assertEqual(order2[1]);
      expect(order1[2]).assertEqual(order2[2]);
    });

    /**
     * @tc.name testSetIteratorTest044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0440
     * @tc.desc Verify iterator reuse after complete traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["first", "second"]);
      const iter = set.$_iterator();
      let count1 = 0;
      for (const v of iter) {
        count1++;
      }
      expect(count1).assertEqual(2);
      let count2 = 0;
      for (const v of iter) {
        count2++;
      }
      expect(count2).assertEqual(0);
    });

    /**
     * @tc.name testSetIteratorTest045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0450
     * @tc.desc Verify multiple $_iterator() instances are independent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter1 = set.$_iterator();
      const iter2 = set.$_iterator();
      expect(iter1 !== iter2).assertTrue();
      iter1.next();
      iter1.next();
      expect(iter2.next().value as int).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0460
     * @tc.desc Verify IteratorResult structure properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["item"]);
      const iter = set.$_iterator();
      const result = iter.next();
      expect(result.value as string).assertEqual("item");
      expect(result.done).assertFalse();
      const typeOfValue: string = typeof result.value;
      expect(typeOfValue).assertEqual("string");
      const typeOfDone: string = typeof result.done;
      expect(typeOfDone).assertEqual("boolean");
    });

    /**
     * @tc.name testSetIteratorTest047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0470
     * @tc.desc Verify iteration with smallest positive integer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const iter = set.$_iterator();
      const result = iter.next();
      expect(result.value as int).assertEqual(1);
      expect((result.value as int) > 0).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0480
     * @tc.desc Verify iteration with maximum positive integer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([2147483647]);
      const iter = set.$_iterator();
      const result = iter.next();
      expect(result.value as int).assertEqual(2147483647);
    });

    /**
     * @tc.name testSetIteratorTest049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0490
     * @tc.desc Verify nested object reference equality
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sharedObj = new Map<string, int>();
      sharedObj.set("a", 1);
      const set = new Set<Object>([sharedObj, sharedObj]);
      expect(set.size).assertEqual(1);
      const iter = set.$_iterator();
      const result = iter.next();
      expect(result.value as Object).assertEqual(sharedObj);
    });

    /**
     * @tc.name testSetIteratorTest050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0500
     * @tc.desc Verify iterator with large string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const largeStr = "x".repeat(10000);
      const set = new Set<string>([largeStr]);
      const iter = set.$_iterator();
      const result = iter.next();
      expect(result.value as string).assertEqual(largeStr);
      expect((result.value as string).length).assertEqual(10000);
    });

    /**
     * @tc.name testSetIteratorTest051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0510
     * @tc.desc Verify iterator returns done after exhaustion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.$_iterator();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0520
     * @tc.desc Verify chained method calls on iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      const iter = set.values();
      const result1 = iter.$_iterator();
      expect(result1.next().value as string).assertEqual("a");
      const inner = iter.$_iterator();
      expect(inner.next().value as string).assertEqual("b");
    });

    /**
     * @tc.name testSetIteratorTest053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0530
     * @tc.desc Verify Set<int> with 50000 elements via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 50000; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      let count = 0;
      for (const v of set.$_iterator()) {
        count++;
      }
      expect(count).assertEqual(50000);
    });

    /**
     * @tc.name testSetIteratorTest054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0540
     * @tc.desc Verify Set<double> with Number.EPSILON precision via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 1.0 + Number.EPSILON]);
      const result: double[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[1] - result[0]).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.name testSetIteratorTest055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0550
     * @tc.desc Verify $_iterator picks up elements added during for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const result: int[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
        if (v === 2) {
          set.add(3);
        }
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorTest056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0560
     * @tc.desc Verify $_iterator with clear() during for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30, 40]);
      let count = 0;
      for (const v of set.$_iterator()) {
        count++;
        if (count === 2) {
          set.clear();
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0570
     * @tc.desc Verify for-of collection from Set $_iterator returns all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      const result: string[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.name testSetIteratorTest058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0580
     * @tc.desc Verify Set to Array conversion using iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const array: int[] = [];
      for (const v of set.$_iterator()) {
        array.push(v);
      }
      expect(array.length).assertEqual(5);
    });

    /**
     * @tc.name testSetIteratorTest059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0590
     * @tc.desc Verify Array to Set conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const array: int[] = [1, 2, 2, 3, 3, 3];
      const set = new Set<int>(array);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorTest060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0600
     * @tc.desc Verify Set union operation using iterators
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set1 = new Set<int>([1, 2, 3]);
      const set2 = new Set<int>([3, 4, 5]);
      const union = new Set<int>(set1);
      for (const v of set2.$_iterator()) {
        union.add(v);
      }
      expect(union.size).assertEqual(5);
    });

    /**
     * @tc.name testSetIteratorTest061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0610
     * @tc.desc Verify Set intersection using iterators
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set1 = new Set<int>([1, 2, 3, 4]);
      const set2 = new Set<int>([3, 4, 5, 6]);
      const intersection = new Set<int>();
      for (const v of set1.$_iterator()) {
        if (set2.has(v)) {
          intersection.add(v);
        }
      }
      expect(intersection.size).assertEqual(2);
      expect(intersection.has(3)).assertTrue();
      expect(intersection.has(4)).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0620
     * @tc.desc Verify Set difference using iterators
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set1 = new Set<int>([1, 2, 3, 4]);
      const set2 = new Set<int>([3, 4, 5, 6]);
      const difference = new Set<int>();
      for (const v of set1.$_iterator()) {
        if (!set2.has(v)) {
          difference.add(v);
        }
      }
      expect(difference.size).assertEqual(2);
      expect(difference.has(1)).assertTrue();
      expect(difference.has(2)).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0630
     * @tc.desc Verify Map keys iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([["a", 1], ["b", 2]]);
      const keys: string[] = [];
      for (const k of map.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0640
     * @tc.desc Verify Map values iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([["a", 1], ["b", 2]]);
      let sum = 0;
      for (const v of map.values()) {
        sum += v;
      }
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorTest065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0650
     * @tc.desc Verify Map entries iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([["a", 1], ["b", 2]]);
      let count = 0;
      for (const entry of map.entries()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0660
     * @tc.desc Verify nested Set expansion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Set<int>([1, 2]);
      const inner2 = new Set<int>([3, 4]);
      const outerSet = new Set<Set<int>>([inner1, inner2]);
      const allElements: int[] = [];
      for (const inner of outerSet.$_iterator()) {
        for (const v of inner) {
          allElements.push(v);
        }
      }
      expect(allElements.length).assertEqual(4);
    });

    /**
     * @tc.name testSetIteratorTest067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0670
     * @tc.desc Verify Set to deduplicate array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const array: string[] = ["a", "b", "a", "c", "b", "d"];
      const set = new Set<string>(array);
      const deduplicated: string[] = [];
      for (const v of set.$_iterator()) {
        deduplicated.push(v);
      }
      expect(deduplicated.length).assertEqual(4);
    });

    /**
     * @tc.name testSetIteratorTest068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0680
     * @tc.desc Verify Set find element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["apple", "banana", "cherry"]);
      let found: string = "";
      for (const v of set.$_iterator()) {
        if (v === "banana") {
          found = v;
          break;
        }
      }
      expect(found).assertEqual("banana");
    });

    /**
     * @tc.name testSetIteratorTest069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0690
     * @tc.desc Verify Set existence check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      let hasEven = false;
      let allPositive = true;
      for (const v of set.$_iterator()) {
        if (v % 2 === 0) {
          hasEven = true;
        }
        if (v <= 0) {
          allPositive = false;
        }
      }
      expect(hasEven).assertTrue();
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0700
     * @tc.desc Verify Set<Error> $_iterator traverses Error objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new Error("e1");
      const e2 = new Error("e2");
      const set = new Set<Error>([e1, e2]);
      let count = 0;
      for (const v of set.$_iterator()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0710
     * @tc.desc Verify Set<Date> $_iterator traverses Date objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1 = new Date(2024);
      const d2 = new Date(2025);
      const set = new Set<Date>([d1, d2]);
      const result: Date[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0] === d1).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0720
     * @tc.desc Verify Set<RegExp> $_iterator traverses RegExp objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>([new RegExp("a"), new RegExp("b")]);
      let count = 0;
      for (const v of set.$_iterator()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0730
     * @tc.desc Verify Set<Object> $_iterator traverses Object objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const set = new Set<Object>([obj1, obj2]);
      let count = 0;
      for (const v of set.$_iterator()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0740
     * @tc.desc Verify Set<WeakMap<Object, int>> $_iterator traverses WeakMap objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1, wm2]);
      let count = 0;
      for (const v of set.$_iterator()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0750
     * @tc.desc Verify Set<WeakSet<Object>> $_iterator traverses WeakSet objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1, ws2]);
      let count = 0;
      for (const v of set.$_iterator()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0760
     * @tc.desc Verify $_iterator skips deleted Error element during for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const e2: Error = new Error("b");
      const set = new Set<Error>([e1, e2]);
      const result: Error[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
        set.delete(e2);
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0770
     * @tc.desc Verify $_iterator skips deleted Date element during for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const d2: Date = new Date(2);
      const set = new Set<Date>([d1, d2]);
      const result: Date[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
        set.delete(d2);
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0780
     * @tc.desc Verify $_iterator skips deleted RegExp element during for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const r2: RegExp = new RegExp("b");
      const set = new Set<RegExp>([r1, r2]);
      const result: RegExp[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
        set.delete(r2);
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0790
     * @tc.desc Verify $_iterator skips deleted Object element during for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const set = new Set<Object>([obj1, obj2]);
      const result: Object[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
        set.delete(obj2);
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0800
     * @tc.desc Verify $_iterator skips deleted WeakMap element during for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const result: WeakMap<Object, int>[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
        set.delete(wm2);
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0810
     * @tc.desc Verify $_iterator skips deleted WeakSet element during for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1, ws2]);
      const result: WeakSet<Object>[] = [];
      for (const v of set.$_iterator()) {
        result.push(v);
        set.delete(ws2);
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest082
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0820
     * @tc.desc Verify $_iterator returns done after clear with Error elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>([new Error("a"), new Error("b")]);
      const iter = set.$_iterator();
      iter.next();
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest083
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0830
     * @tc.desc Verify $_iterator returns done after clear with Date elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Date>([new Date(1), new Date(2)]);
      const iter = set.$_iterator();
      iter.next();
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest084
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0840
     * @tc.desc Verify $_iterator returns done after clear with RegExp elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>([new RegExp("a"), new RegExp("b")]);
      const iter = set.$_iterator();
      iter.next();
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest085
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0850
     * @tc.desc Verify $_iterator returns done after clear with Object elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const set = new Set<Object>([obj1, obj2]);
      const iter = set.$_iterator();
      iter.next();
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest086
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0860
     * @tc.desc Verify $_iterator returns done after clear with WeakMap elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const iter = set.$_iterator();
      iter.next();
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest087
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0870
     * @tc.desc Verify $_iterator returns done after clear with WeakSet elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1, ws2]);
      const iter = set.$_iterator();
      iter.next();
      set.clear();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest088
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0880
     * @tc.desc Verify $_iterator on empty Error Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      expect(set.$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest089
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0890
     * @tc.desc Verify $_iterator on empty Date Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Date>();
      expect(set.$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest090
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0900
     * @tc.desc Verify $_iterator on empty RegExp Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>();
      expect(set.$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest091
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0910
     * @tc.desc Verify $_iterator on empty Object Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>();
      expect(set.$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest092
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0920
     * @tc.desc Verify $_iterator on empty WeakMap Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakMap<Object, int>>();
      expect(set.$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest093
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0930
     * @tc.desc Verify $_iterator on empty WeakSet Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakSet<Object>>();
      expect(set.$_iterator().next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest094
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0940
     * @tc.desc Verify $_iterator on single-element Error Set returns one value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>([new Error("a")]);
      const iter = set.$_iterator();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest095
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0950
     * @tc.desc Verify $_iterator on single-element Date Set returns one value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Date>([new Date(1)]);
      const iter = set.$_iterator();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest096
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0960
     * @tc.desc Verify $_iterator on single-element RegExp Set returns one value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>([new RegExp("a")]);
      const iter = set.$_iterator();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest097
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0970
     * @tc.desc Verify $_iterator on single-element Object Set returns one value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>([new Object()]);
      const iter = set.$_iterator();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest098
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0980
     * @tc.desc Verify $_iterator on single-element WeakMap Set returns one value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakMap<Object, int>>([new WeakMap<Object, int>()]);
      const iter = set.$_iterator();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest099
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_0990
     * @tc.desc Verify $_iterator on single-element WeakSet Set returns one value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakSet<Object>>([new WeakSet<Object>()]);
      const iter = set.$_iterator();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorTest100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1000
     * @tc.desc Verify duplicate Error refs deduplicate in $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set = new Set<Error>([e1, e1]);
      let count = 0;
      for (const _ of set.$_iterator()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest101
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1010
     * @tc.desc Verify duplicate Date refs deduplicate in $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set = new Set<Date>([d1, d1]);
      let count = 0;
      for (const _ of set.$_iterator()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest102
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1020
     * @tc.desc Verify duplicate RegExp refs deduplicate in $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set = new Set<RegExp>([r1, r1]);
      let count = 0;
      for (const _ of set.$_iterator()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest103
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1030
     * @tc.desc Verify duplicate Object refs deduplicate in $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const set = new Set<Object>([obj1, obj1]);
      let count = 0;
      for (const _ of set.$_iterator()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest104
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1040
     * @tc.desc Verify duplicate WeakMap refs deduplicate in $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1, wm1]);
      let count = 0;
      for (const _ of set.$_iterator()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest105
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1050
     * @tc.desc Verify duplicate WeakSet refs deduplicate in $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1, ws1]);
      let count = 0;
      for (const _ of set.$_iterator()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorTest106
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1060
     * @tc.desc Verify $_iterator reflects Error added to underlying Set before iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>([new Error("a")]);
      set.add(new Error("b"));
      let count = 0;
      for (const _ of set.$_iterator()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest107
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1070
     * @tc.desc Verify $_iterator reflects Date added to underlying Set before iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Date>([new Date(1)]);
      set.add(new Date(2));
      let count = 0;
      for (const _ of set.$_iterator()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest108
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1080
     * @tc.desc Verify $_iterator reflects RegExp added to underlying Set before iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>([new RegExp("a")]);
      set.add(new RegExp("b"));
      let count = 0;
      for (const _ of set.$_iterator()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest109
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1090
     * @tc.desc Verify $_iterator reflects Object added to underlying Set before iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const set = new Set<Object>([obj1]);
      set.add(obj2);
      let count = 0;
      for (const _ of set.$_iterator()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest110
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1100
     * @tc.desc Verify $_iterator reflects WeakMap added to underlying Set before iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1]);
      set.add(wm2);
      let count = 0;
      for (const _ of set.$_iterator()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorTest111
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DOLLAR_ITERATOR_1110
     * @tc.desc Verify $_iterator reflects WeakSet added to underlying Set before iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1]);
      set.add(ws2);
      let count = 0;
      for (const _ of set.$_iterator()) { count++; }
      expect(count).assertEqual(2);
    });

  });
}