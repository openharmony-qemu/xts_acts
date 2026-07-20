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

class ItemDollar {
  id: int = 0;

  constructor(id: int) {
    this.id = id;
  }
}

export default function SetIteratorDollarIterator2Test(): void {
  describe('SetIteratorDollarIterator2Test', (): void => {
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
     * @tc.desc Verify Set<long> values() $_iterator traverses long elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([-9223372036854775808, 0, 9223372036854775807]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: long[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(-9223372036854775808);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(9223372036854775807);
    });

    /**
     * @tc.name testSetIteratorDollarIterator002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0200
     * @tc.desc Verify Set<boolean> values() $_iterator traverses boolean elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: boolean[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
    });

    /**
     * @tc.name testSetIteratorDollarIterator003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0300
     * @tc.desc Verify Set<Object> values() $_iterator traverses object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new ItemDollar(1);
      const obj2 = new ItemDollar(2);
      const set = new Set<Object>([obj1, obj2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result = inner.next();
      expect(result.value).assertEqual(obj1);
      const result2 = inner.next();
      expect(result2.value).assertEqual(obj2);
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0400
     * @tc.desc Verify Set<byte> values() $_iterator traverses byte boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>();
      set.add(-128);
      set.add(0);
      set.add(127);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: byte[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(-128);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(127);
    });

    /**
     * @tc.name testSetIteratorDollarIterator005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0500
     * @tc.desc Verify Set<short> values() $_iterator traverses short boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>();
      set.add(-32768);
      set.add(0);
      set.add(32767);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: short[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(-32768);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(32767);
    });

    /**
     * @tc.name testSetIteratorDollarIterator006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0600
     * @tc.desc Verify Set<number> values() $_iterator traverses number special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([0.0, Number.NaN, Number.POSITIVE_INFINITY]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: number[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0.0);
      expect(Number.isNaN(result[1])).assertTrue();
      expect(result[2]).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testSetIteratorDollarIterator007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0700
     * @tc.desc Verify Set<number> values() $_iterator traverses number special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([-1.5, Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: number[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(-1.5);
      expect(Number.isNaN(result[1])).assertTrue();
      expect(result[2]).assertEqual(Number.POSITIVE_INFINITY);
      expect(result[3]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testSetIteratorDollarIterator008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0800
     * @tc.desc Verify Set with 1000 elements $_iterator traverses all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      const iter = set.values();
      const inner = iter.$_iterator();
      let count = 0;
      for (const v of inner) {
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.name testSetIteratorDollarIterator009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_0900
     * @tc.desc Verify Set with 10000 elements $_iterator traverses all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      const iter = set.values();
      const inner = iter.$_iterator();
      let count = 0;
      for (const v of inner) {
        count++;
      }
      expect(count).assertEqual(10000);
    });

    /**
     * @tc.name testSetIteratorDollarIterator010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1000
     * @tc.desc Verify delete during $_iterator traversal skips deleted element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: int[] = [];
      for (const v of inner) {
        result.push(v);
        if (v === 1) {
          set.delete(2);
        }
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorDollarIterator011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1100
     * @tc.desc Verify nested for-of with $_iterator works correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.values();
      const result: int[] = [];
      const outer = iter.$_iterator();
      for (const v1 of outer) {
        result.push(v1);
        const inner2 = set.values().$_iterator();
        for (const v2 of inner2) {
          result.push(v2);
        }
      }
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorDollarIterator012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1200
     * @tc.desc Verify Set<number> with scientific notation via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1.0e3, 1.0e6]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: number[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1000);
      expect(result[1]).assertEqual(1000000);
    });

    /**
     * @tc.name testSetIteratorDollarIterator013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1300
     * @tc.desc Verify Set<int> with hex literal values via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0xFF, 0x7A]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: int[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(122);
    });

    /**
     * @tc.name testSetIteratorDollarIterator014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1400
     * @tc.desc Verify Set<string> with zero-width space via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "​", "b"]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: string[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("​");
      expect(result[2]).assertEqual("b");
    });

    /**
     * @tc.name testSetIteratorDollarIterator015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1500
     * @tc.desc Verify Set<string> with emoji via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["😀", "🔥"]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: string[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("😀");
      expect(result[1]).assertEqual("🔥");
    });

    /**
     * @tc.name testSetIteratorDollarIterator016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1600
     * @tc.desc Verify Set<string> with multilingual strings via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["テスト", "테스트", "тест"]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: string[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("テスト");
      expect(result[1]).assertEqual("테스트");
      expect(result[2]).assertEqual("тест");
    });

    /**
     * @tc.name testSetIteratorDollarIterator017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1700
     * @tc.desc Verify Set<string> with 10000-char string via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr = "a".repeat(10000);
      const set = new Set<string>([longStr]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: string[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(longStr);
    });

    /**
     * @tc.name testSetIteratorDollarIterator018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1800
     * @tc.desc Verify Set<int> with negative values via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([-1, -999, -2147483648]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: int[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-999);
      expect(result[2]).assertEqual(-2147483648);
    });

    /**
     * @tc.name testSetIteratorDollarIterator019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_1900
     * @tc.desc Verify Set<number> with NaN and Infinity via $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: number[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(Number.isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(Number.POSITIVE_INFINITY);
      expect(result[2]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testSetIteratorDollarIterator020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_2000
     * @tc.desc Verify entries().$_iterator() returns first entry key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b"]);
      const iter = set.entries();
      const inner = iter.$_iterator();
      const r = inner.next();
      let entry = r.value as [string, string];
      expect(entry[0]).assertEqual("a");
    });

    /**
     * @tc.name testSetIteratorDollarIterator021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_2100
     * @tc.desc Verify $_iterator() chained with entries()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const iter = set.entries();
      const inner = iter.$_iterator();
      let entry = inner.next().value as [int, int];
      expect(entry[0]).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_2200
     * @tc.desc Verify $_iterator() with undefined element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object | undefined>([undefined]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const r = inner.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.name testSetIteratorDollarIterator023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_2300
     * @tc.desc Verify $_iterator() with null element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object | null>([null]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const r = inner.next();
      expect(r.value).assertNull();
    });

    /**
     * @tc.name testSetIteratorDollarIterator024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_2400
     * @tc.desc Verify $_iterator() with object reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      const set = new Set<Object>([obj]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const r = inner.next();
      expect(r.value).assertEqual(obj);
    });

    /**
     * @tc.name testSetIteratorDollarIterator025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_2500
     * @tc.desc Verify $_iterator() with class instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new ItemDollar(42);
      const set = new Set<ItemDollar>([item]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const r = inner.next();
      let val = r.value as ItemDollar;
      expect(val.id).assertEqual(42);
    });

    /**
     * @tc.name testSetIteratorDollarIterator026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_2600
     * @tc.desc Verify $_iterator() with union type values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number>(["text", 123]);
      const iter = set.values();
      const inner = iter.$_iterator();
      let count = 0;
      for (const v of inner) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorDollarIterator027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_2700
     * @tc.desc Verify $_iterator() traversal with for-of loop
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const iter = set.values();
      const inner = iter.$_iterator();
      let count = 0;
      for (const v of inner) {
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name testSetIteratorDollarIterator028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_2800
     * @tc.desc Verify $_iterator() with 10000 elements computes sum correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      const iter = set.values();
      const inner = iter.$_iterator();
      let sum = 0;
      for (const v of inner) {
        sum += v;
      }
      expect(sum).assertEqual(49995000);
    });

    /**
     * @tc.name testSetIteratorDollarIterator029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_2900
     * @tc.desc Verify $_iterator() with 50000 elements traverses all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 50000; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      const iter = set.values();
      const inner = iter.$_iterator();
      let count = 0;
      for (const v of inner) {
        count++;
      }
      expect(count).assertEqual(50000);
    });

    /**
     * @tc.name testSetIteratorDollarIterator030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_3000
     * @tc.desc Verify $_iterator() traversal collects values into closure variable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      const iter = set.values();
      let closureData: string[] = [];
      const inner = iter.$_iterator();
      for (const v of inner) {
        closureData.push(v);
      }
      expect(closureData.length).assertEqual(3);
      expect(closureData[0]).assertEqual("a");
    });

    /**
     * @tc.name testSetIteratorDollarIterator031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_3100
     * @tc.desc Verify $_iterator() batch processing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 20; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      const iter = set.values();
      const inner = iter.$_iterator();
      const batches: int[][] = [];
      let batch: int[] = [];
      let count = 0;
      for (const v of inner) {
        batch.push(v);
        count++;
        if (count % 5 === 0) {
          batches.push(batch);
          batch = [];
        }
      }
      if (batch.length > 0) {
        batches.push(batch);
      }
      expect(batches.length).assertEqual(4);
    });

    /**
     * @tc.name testSetIteratorDollarIterator032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_3200
     * @tc.desc Verify $_iterator() pagination
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["p1", "p2", "p3", "p4"]);
      const iter = set.values();
      const inner = iter.$_iterator();
      let page = 0;
      let itemCount = 0;
      for (const v of inner) {
        itemCount++;
        if (itemCount >= 2) {
          page++;
          itemCount = 0;
        }
      }
      expect(page).assertLarger(0);
    });

    /**
     * @tc.name testSetIteratorDollarIterator033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_3300
     * @tc.desc Verify $_iterator() mapper pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const mapped: int[] = [];
      for (const v of inner) {
        mapped.push(v * 2);
      }
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[2]).assertEqual(6);
    });

    /**
     * @tc.name testSetIteratorDollarIterator034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_3400
     * @tc.desc Verify $_iterator() reducer pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4]);
      const iter = set.values();
      const inner = iter.$_iterator();
      let sum = 0;
      for (const v of inner) {
        sum += v;
      }
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.name testSetIteratorDollarIterator035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_3500
     * @tc.desc Verify $_iterator() accumulator pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "bb", "ccc"]);
      const iter = set.values();
      const inner = iter.$_iterator();
      let concatenated = "";
      for (const v of inner) {
        concatenated += v;
      }
      expect(concatenated).assertEqual("abbccc");
    });

    /**
     * @tc.name testSetIteratorDollarIterator036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_3600
     * @tc.desc Verify $_iterator() merger pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set1 = new Set<int>([1, 2, 3]);
      const set2 = new Set<int>([4, 5, 6]);
      const merged: int[] = [];
      for (const v of set1.values().$_iterator()) {
        merged.push(v);
      }
      for (const v of set2.values().$_iterator()) {
        merged.push(v);
      }
      expect(merged.length).assertEqual(6);
    });

    /**
     * @tc.name testSetIteratorDollarIterator037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_3700
     * @tc.desc Verify $_iterator() chained calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      const iter = set.values();
      const result1 = iter.$_iterator();
      expect(result1.next().value).assertEqual("a");
      const result2 = iter.$_iterator();
      expect(result2.next().value).assertEqual("b");
    });

    /**
     * @tc.name testSetIteratorDollarIterator038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_3800
     * @tc.desc Verify $_iterator() nested iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerSet1 = new Set<int>([1, 2]);
      const innerSet2 = new Set<int>([3, 4]);
      const set = new Set<Set<int>>([innerSet1, innerSet2]);
      let total = 0;
      for (const inner of set.values().$_iterator()) {
        for (const v of inner) {
          total += v;
        }
      }
      expect(total).assertEqual(10);
    });

    /**
     * @tc.name testSetIteratorDollarIterator039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_3900
     * @tc.desc Verify $_iterator() exception interruption
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["safe", "error", "after"]);
      const iter = set.values();
      let caught = false;
      try {
        const inner = iter.$_iterator();
        for (const v of inner) {
          if (v === "error") {
            throw new Error("test error");
          }
        }
      } catch (e) {
        caught = true;
        expect(e.message).assertEqual("test error");
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_4000
     * @tc.desc Verify $_iterator() exhausts iterator and returns done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      inner.next();
      inner.next();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_4100
     * @tc.desc Verify $_iterator() early termination via break
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const iter = set.values();
      const inner = iter.$_iterator();
      let count = 0;
      for (const v of inner) {
        count++;
        if (count >= 3) {
          break;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testSetIteratorDollarIterator042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_4200
     * @tc.desc Verify $_iterator() early termination after partial traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const set = new Set<int>(arr);
      const iter = set.values();
      const inner = iter.$_iterator();
      let count = 0;
      for (const v of inner) {
        count++;
        if (count >= 500) {
          break;
        }
      }
      expect(count).assertEqual(500);
    });

    /**
     * @tc.name testSetIteratorDollarIterator043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_4300
     * @tc.desc Verify $_iterator() on empty Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      const iter = set.values();
      const inner = iter.$_iterator();
      const r = inner.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_4400
     * @tc.desc Verify $_iterator() picks up elements added during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: int[] = [];
      for (const v of inner) {
        result.push(v);
        if (v === 2) {
          set.add(4);
        }
      }
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.name testSetIteratorDollarIterator045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_4500
     * @tc.desc Verify for-of collection from values() $_iterator returns all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: string[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.name testSetIteratorDollarIterator046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_4600
     * @tc.desc Verify $_iterator() with clear() during traversal behaves predictably
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30, 40]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const first = inner.next();
      expect(first.value).assertEqual(10);
      set.clear();
      const second = inner.next();
      expect(second.done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_4700
     * @tc.desc Verify Set<number> values() $_iterator traverses fractional number elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([0.5, 1.5, 2.5]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: number[] = [];
      for (const v of inner) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0.5);
      expect(result[1]).assertEqual(1.5);
      expect(result[2]).assertEqual(2.5);
    });

    /**
     * @tc.name testSetIteratorDollarIterator048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_4800
     * @tc.desc Verify Set<Error> values() $_iterator traverses Error objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>([new Error("e1"), new Error("e2")]);
      const iter = set.values();
      const inner = iter.$_iterator();
      let count = 0;
      for (const v of inner) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorDollarIterator049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_4900
     * @tc.desc Verify Set<Date> values() $_iterator traverses Date objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1 = new Date(2024);
      const d2 = new Date(2025);
      const set = new Set<Date>([d1, d2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().value).assertEqual(d1);
      expect(inner.next().value).assertEqual(d2);
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_5000
     * @tc.desc Verify Set<RegExp> values() $_iterator traverses RegExp objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>([new RegExp("abc"), new RegExp("xyz")]);
      const iter = set.values();
      const inner = iter.$_iterator();
      let count = 0;
      for (const v of inner) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorDollarIterator051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_5100
     * @tc.desc Verify Set<Object> values() $_iterator traverses Object objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const set = new Set<Object>([obj1, obj2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      let count = 0;
      for (const v of inner) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorDollarIterator052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_5200
     * @tc.desc Verify Set<WeakMap<Object, int>> values() $_iterator traverses WeakMap objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().value === wm1).assertTrue();
      expect(inner.next().value === wm2).assertTrue();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_5300
     * @tc.desc Verify Set<WeakSet<Object>> values() $_iterator traverses WeakSet objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1, ws2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      let count = 0;
      for (const v of inner) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetIteratorDollarIterator054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_5400
     * @tc.desc Verify $_iterator skips deleted Error element during traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const e2: Error = new Error("b");
      const set = new Set<Error>([e1, e2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: Error[] = [];
      for (const v of inner) {
        result.push(v);
        if (v === e1) {
          set.delete(e2);
        }
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_5500
     * @tc.desc Verify $_iterator skips deleted Date element during traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const d2: Date = new Date(2);
      const set = new Set<Date>([d1, d2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: Date[] = [];
      for (const v of inner) {
        result.push(v);
        if (v === d1) {
          set.delete(d2);
        }
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_5600
     * @tc.desc Verify $_iterator skips deleted RegExp element during traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const r2: RegExp = new RegExp("b");
      const set = new Set<RegExp>([r1, r2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: RegExp[] = [];
      for (const v of inner) {
        result.push(v);
        if (v === r1) {
          set.delete(r2);
        }
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_5700
     * @tc.desc Verify $_iterator skips deleted Object element during traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const set = new Set<Object>([obj1, obj2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: Object[] = [];
      for (const v of inner) {
        result.push(v);
        if (v === obj1) {
          set.delete(obj2);
        }
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_5800
     * @tc.desc Verify $_iterator skips deleted WeakMap element during traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: WeakMap<Object, int>[] = [];
      for (const v of inner) {
        result.push(v);
        if (v === wm1) {
          set.delete(wm2);
        }
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_5900
     * @tc.desc Verify $_iterator skips deleted WeakSet element during traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1, ws2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      const result: WeakSet<Object>[] = [];
      for (const v of inner) {
        result.push(v);
        if (v === ws1) {
          set.delete(ws2);
        }
      }
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_6000
     * @tc.desc Verify $_iterator returns done after clear with Error elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>([new Error("a"), new Error("b")]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.clear();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_6100
     * @tc.desc Verify $_iterator returns done after clear with Date elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Date>([new Date(1), new Date(2)]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.clear();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_6200
     * @tc.desc Verify $_iterator returns done after clear with RegExp elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>([new RegExp("a"), new RegExp("b")]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.clear();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_6300
     * @tc.desc Verify $_iterator returns done after clear with Object elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const set = new Set<Object>([obj1, obj2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.clear();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_6400
     * @tc.desc Verify $_iterator returns done after clear with WeakMap elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.clear();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_6500
     * @tc.desc Verify $_iterator returns done after clear with WeakSet elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1, ws2]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.clear();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_6600
     * @tc.desc Verify $_iterator on empty Error Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_6700
     * @tc.desc Verify $_iterator on empty Date Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Date>();
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_6800
     * @tc.desc Verify $_iterator on empty RegExp Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>();
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_6900
     * @tc.desc Verify $_iterator on empty Object Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>();
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_7000
     * @tc.desc Verify $_iterator on empty WeakMap Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakMap<Object, int>>();
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_7100
     * @tc.desc Verify $_iterator on empty WeakSet Set returns done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakSet<Object>>();
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_7200
     * @tc.desc Verify $_iterator on single-element Error Set returns one value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>([new Error("a")]);
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertFalse();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_7300
     * @tc.desc Verify $_iterator on single-element Date Set returns one value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Date>([new Date(1)]);
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertFalse();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_7400
     * @tc.desc Verify $_iterator on single-element RegExp Set returns one value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>([new RegExp("a")]);
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertFalse();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_7500
     * @tc.desc Verify $_iterator on single-element Object Set returns one value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>([new Object()]);
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertFalse();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_7600
     * @tc.desc Verify $_iterator on single-element WeakMap Set returns one value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakMap<Object, int>>([new WeakMap<Object, int>()]);
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertFalse();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_7700
     * @tc.desc Verify $_iterator on single-element WeakSet Set returns one value then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<WeakSet<Object>>([new WeakSet<Object>()]);
      const iter = set.values();
      const inner = iter.$_iterator();
      expect(inner.next().done).assertFalse();
      expect(inner.next().done).assertTrue();
    });

    /**
     * @tc.name testSetIteratorDollarIterator078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_7800
     * @tc.desc Verify duplicate Error refs deduplicate in $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set = new Set<Error>([e1, e1]);
      let count = 0;
      for (const _ of set.values().$_iterator()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_7900
     * @tc.desc Verify duplicate Date refs deduplicate in $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set = new Set<Date>([d1, d1]);
      let count = 0;
      for (const _ of set.values().$_iterator()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_8000
     * @tc.desc Verify duplicate RegExp refs deduplicate in $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set = new Set<RegExp>([r1, r1]);
      let count = 0;
      for (const _ of set.values().$_iterator()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_8100
     * @tc.desc Verify duplicate Object refs deduplicate in $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const set = new Set<Object>([obj1, obj1]);
      let count = 0;
      for (const _ of set.values().$_iterator()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator082
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_8200
     * @tc.desc Verify duplicate WeakMap refs deduplicate in $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1, wm1]);
      let count = 0;
      for (const _ of set.values().$_iterator()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator083
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_8300
     * @tc.desc Verify duplicate WeakSet refs deduplicate in $_iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1, ws1]);
      let count = 0;
      for (const _ of set.values().$_iterator()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator084
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_8400
     * @tc.desc Verify $_iterator picks up Error added to underlying Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const e2: Error = new Error("b");
      const set = new Set<Error>([e1]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.add(e2);
      let count = 0;
      for (const _ of inner) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator085
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_8500
     * @tc.desc Verify $_iterator picks up Date added to underlying Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const d2: Date = new Date(2);
      const set = new Set<Date>([d1]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.add(d2);
      let count = 0;
      for (const _ of inner) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator086
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_8600
     * @tc.desc Verify $_iterator picks up RegExp added to underlying Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<RegExp>([new RegExp("a")]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.add(new RegExp("b"));
      let count = 0;
      for (const _ of inner) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator087
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_8700
     * @tc.desc Verify $_iterator picks up Object added to underlying Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const set = new Set<Object>([obj1]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.add(obj2);
      let count = 0;
      for (const _ of inner) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator088
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_8800
     * @tc.desc Verify $_iterator picks up WeakMap added to underlying Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set = new Set<WeakMap<Object, int>>([wm1]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.add(wm2);
      let count = 0;
      for (const _ of inner) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetIteratorDollarIterator089
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETITERATOR_DOLLARITERATOR_8900
     * @tc.desc Verify $_iterator picks up WeakSet added to underlying Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetIteratorDollarIterator089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set = new Set<WeakSet<Object>>([ws1]);
      const iter = set.values();
      const inner = iter.$_iterator();
      inner.next();
      set.add(ws2);
      let count = 0;
      for (const _ of inner) { count++; }
      expect(count).assertEqual(1);
    });

  });
}