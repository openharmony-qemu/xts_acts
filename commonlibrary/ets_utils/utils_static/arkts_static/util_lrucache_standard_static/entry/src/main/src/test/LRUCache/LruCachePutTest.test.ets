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
  beforeAll, afterEach, beforeEach, afterAll, describe, it, expect, TestType, Size, Level
} from '@ohos/hypium-static/src/main/indexStatic';
import util from '@ohos.util';
import Utils from './../Util.test';

class ProbeCache<K, V> extends util.LRUCache<K, V> {
  hook: (cache: util.LRUCache<K, V>, isEvict: boolean, key: K, value: V,
         newValue: V | undefined) => void =
    (cache: util.LRUCache<K, V>, isEvict: boolean, key: K, value: V, newValue: V | undefined) => {};
  make: (key: K) => V | undefined = (key: K) => undefined;

  constructor(hook?: (cache: util.LRUCache<K, V>, isEvict: boolean, key: K, value: V,
                              newValue: V | undefined) => void,
              make?: (key: K) => V | undefined, capacity?: int) {
    super(capacity);
    if (hook !== undefined) {
      this.hook = hook;
    }
    if (make !== undefined) {
      this.make = make;
    }
  }

  createDefault(key: K): V | undefined {
    return this.make(key);
  }

  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V | undefined): void {
    this.hook(this, isEvict, key, value, newValue);
  }
}

interface NumBoxA {
  val: int;
}

interface NumPairA {
  a: int;
  b: int;
}

class TagNode {
  tag: string = '';
  constructor(n: string) {
    this.tag = n;
  }
}

class CntBox {
  cnt: int = 0;
  constructor(c: int) {
    this.cnt = c;
  }
}

class ThrowOnEvict extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int): void {
    throw new Error('evict-fail');
  }
}

class IntTagObj {
  tag: int = 0;
  constructor(t: int) {
    this.tag = t;
  }
}

class CounterCache extends util.LRUCache<int, int> {
  removalTotal: int = 0;
  constructor(capacity?: int) {
    super(capacity);
  }
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.removalTotal = this.removalTotal + 1;
  }
}

class IntValueBox {
  value: int = 0;
  constructor(v: int) {
    this.value = v;
  }
}

interface IntPoint {
  x: int;
  y: int;
}

enum SlotRank {
  Low = 0,
  Mid = 1,
  High = 2
}

export default function lruCachePutTest(): void {
  describe('LruCachePutTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0010
     * @tc.name testLruCachePut001
     * @tc.desc Merged batch (5 tests): [1] Verify put with two variable args returns undefined for a new key | [2] Verify three consecutive put calls accumulate cache length to 3 | [3] Verify put with key 100 (la...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put with two variable args returns undefined for a new key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let key: int = 2;
        let value: int = 10;
        let result: int | undefined = cache.put(key, value);
        expect(result).assertEqual(undefined);
      }

      // --- [2] Verify three consecutive put calls accumulate cache length to 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.length).assertEqual(3);
        expect(cache.get(2)).assertEqual(20);
      }

      // --- [3] Verify put with key 100 (large value) is retrievable ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(100, 7);
        expect(cache.get(100)).assertEqual(7);
      }

      // --- [4] Verify put with key 2147483647 (int maximum) is stored and retrievable ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let maxKey: int = 2147483647;
        cache.put(maxKey, 1);
        expect(cache.get(maxKey)).assertEqual(1);
        expect(cache.contains(maxKey)).assertTrue();
      }

      // --- [5] Verify put with key -2147483648 (int minimum) is retrievable ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-2147483648, 2);
        expect(cache.length).assertEqual(1);
        expect(cache.get(-2147483648)).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0020
     * @tc.name testLruCachePut002
     * @tc.desc Merged batch (5 tests): [1] Verify writing adjacent int key 2 does not disturb the value stored under key 1 | [2] Verify put with double key 1.5 is retrievable while neighbor 2.5 misses | [3] Verif...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify writing adjacent int key 2 does not disturb the value stored under key 1 ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'a');
        cache.put(2, 'b');
        expect(cache.get(1)).assertEqual('a');
      }

      // --- [2] Verify put with double key 1.5 is retrievable while neighbor 2.5 misses ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(1.5, 10);
        expect(cache.get(1.5)).assertEqual(10);
        expect(cache.get(2.5)).assertEqual(undefined);
      }

      // --- [3] Verify -0.0 and 0.0 keys merge under SameValueZero leaving length 1 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(-0.0, 1);
        cache.put(0.0, 2);
        expect(cache.length).assertEqual(1);
      }

      // --- [4] Verify NaN key is stored and read back as NaN ---
      {
        let cache: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        cache.put(Double.NaN, Double.NaN);
        let got: double = cache.get(Double.NaN)!;
        expect(isNaN(got)).assertTrue();
      }

      // --- [5] Verify boolean true and false keys coexist in cache ---
      {
        let cache: util.LRUCache<boolean, string> = new util.LRUCache<boolean, string>();
        cache.put(true, 't');
        cache.put(false, 'f');
        expect(cache.get(true)).assertEqual('t');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0030
     * @tc.name testLruCachePut003
     * @tc.desc Merged batch (5 tests): [1] Verify put with bigint key 7n stores value and get returns the string seven | [2] Verify put with ordinary string key is retrievable | [3] Verify put with empty string k...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put with bigint key 7n stores value and get returns the string seven ---
      {
        let cache: util.LRUCache<bigint, string> = new util.LRUCache<bigint, string>();
        cache.put(7n, 'seven');
        expect(cache.get(7n)).assertEqual('seven');
      }

      // --- [2] Verify put with ordinary string key is retrievable ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('name', 1);
        expect(cache.get('name')).assertEqual(1);
        expect(cache.length).assertEqual(1);
      }

      // --- [3] Verify put with empty string key is retrievable ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = '';
        cache.put(key, 9);
        let got: int | undefined = cache.get(key);
        expect(got).assertEqual(9);
      }

      // --- [4] Verify put with 100-character long string key increases cache length ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1);
        expect(cache.length).assertEqual(1);
      }

      // --- [5] Verify put with special-character string key is retrievable ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('user-name_1', 3);
        let got: int | undefined = cache.get('user-name_1');
        expect(got).assertEqual(3);
        expect(cache.contains('user-name_1')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0040
     * @tc.name testLruCachePut004
     * @tc.desc Merged batch (5 tests): [1] Verify put with object literal instance key is retrievable by reference | [2] Verify content-equal but reference-different object keys coexist under reference semantics ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put with object literal instance key is retrievable by reference ---
      {
        let b: NumBoxA = { val: 5 };
        let cache: util.LRUCache<NumBoxA, int> = new util.LRUCache<NumBoxA, int>();
        cache.put(b, 100);
        expect(cache.get(b)).assertEqual(100);
      }

      // --- [2] Verify content-equal but reference-different object keys coexist under reference semantics ---
      {
        let firstPair: NumPairA = { a: 1, b: 2 };
        let secondPair: NumPairA = { a: 1, b: 2 };
        let cache: util.LRUCache<NumPairA, int> = new util.LRUCache<NumPairA, int>();
        cache.put(firstPair, 100);
        cache.put(secondPair, 200);
        expect(cache.values()[0]).assertEqual(100);
        expect(cache.values()[1]).assertEqual(200);
      }

      // --- [3] Verify put with int array instance key is retrievable by reference ---
      {
        let k: int[] = [1, 2];
        let cache: util.LRUCache<int[], string> = new util.LRUCache<int[], string>();
        cache.put(k, 'arr');
        expect(cache.get(k)).assertEqual('arr');
      }

      // --- [4] Verify put with null key throws BusinessError on nullable key type (length unchanged) ---
      {
        let cache: util.LRUCache<string | null, int> = new util.LRUCache<string | null, int>();
        let before: int = cache.length;
        try {
          cache.put(null, 5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.length).assertEqual(before);
      }

      // --- [5] Verify put with value 0 is read back as 0 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('k', 0);
        let got: int | undefined = cache.get('k');
        expect(got).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0050
     * @tc.name testLruCachePut005
     * @tc.desc Merged batch (5 tests): [1] Verify put with value -1 (negative boundary) is read back | [2] Verify put with value 2147483647 (int maximum) is read back | [3] Verify put with value -2147483648 (int ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put with value -1 (negative boundary) is read back ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('k', -1);
        let got: int | undefined = cache.get('k');
        expect(got).assertEqual(-1);
      }

      // --- [2] Verify put with value 2147483647 (int maximum) is read back ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let maxValue: int = 2147483647;
        cache.put('k', maxValue);
        expect(cache.get('k')).assertEqual(maxValue);
      }

      // --- [3] Verify put with value -2147483648 (int minimum) is read back ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let minValue: int = -2147483648;
        cache.put('k', minValue);
        let got: int | undefined = cache.get('k');
        expect(got).assertEqual(minValue);
      }

      // --- [4] Verify put with double value 1.5 is read back ---
      {
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        cache.put('k', 1.5);
        let got: double | undefined = cache.get('k');
        expect(got).assertEqual(1.5);
        expect(cache.length).assertEqual(1);
      }

      // --- [5] Verify put with NaN value is read back as NaN ---
      {
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        cache.put('k', Double.NaN);
        let got: double = cache.get('k')!;
        expect(isNaN(got)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0060
     * @tc.name testLruCachePut006
     * @tc.desc Merged batch (5 tests): [1] Verify put with negative double value -3.14 is read back | [2] Verify put with empty string value is read back as empty | [3] Verify put with 100-character long string v...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put with negative double value -3.14 is read back ---
      {
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        let neg: double = -3.14;
        cache.put('k', neg);
        expect(cache.get('k')).assertEqual(neg);
        expect(cache.length).assertEqual(1);
      }

      // --- [2] Verify put with empty string value is read back as empty ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('k', '');
        let got: string | undefined = cache.get('k');
        expect(got).assertEqual('');
      }

      // --- [3] Verify put with 100-character long string value is read back ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        let text: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
        cache.put('k', text);
        expect(cache.contains('k')).assertTrue();
        expect(cache.get('k')).assertEqual(text);
      }

      // --- [4] Verify special-character string value is stored without escaping ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        let key: string = 'k';
        cache.put(key, '<tag> & "q"');
        expect(cache.get(key)).assertEqual('<tag> & "q"');
      }

      // --- [5] Verify boolean value true inserts as a new entry and is returned on overwrite ---
      {
        let cache: util.LRUCache<string, boolean> = new util.LRUCache<string, boolean>();
        let previous: boolean | undefined = cache.put('k', true);
        expect(previous).assertEqual(undefined);
        let replaced: boolean | undefined = cache.put('k', false);
        expect(replaced).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0070
     * @tc.name testLruCachePut007
     * @tc.desc Merged batch (5 tests): [1] Verify bigint value 9007199254740993n beyond double precision inserts as a new entry | [2] Verify put stores class instance by reference and get sees later mutation | [3...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify bigint value 9007199254740993n beyond double precision inserts as a new entry ---
      {
        let cache: util.LRUCache<string, bigint> = new util.LRUCache<string, bigint>();
        let previous: bigint | undefined = cache.put('k', 9007199254740993n);
        expect(previous).assertEqual(undefined);
        let replaced: bigint | undefined = cache.put('k', 1n);
        expect(replaced).assertEqual(9007199254740993n);
      }

      // --- [2] Verify put stores class instance by reference and get sees later mutation ---
      {
        let inst: TagNode = new TagNode('orig');
        let cache: util.LRUCache<string, TagNode> = new util.LRUCache<string, TagNode>();
        cache.put('k', inst);
        inst.tag = 'changed';
        let got: TagNode = cache.get('k')!;
        expect(got.tag).assertEqual('changed');
      }

      // --- [3] Verify put stores object literal by reference and get sees later mutation ---
      {
        let b: NumBoxA = { val: 1 };
        let cache: util.LRUCache<string, NumBoxA> = new util.LRUCache<string, NumBoxA>();
        cache.put('k', b);
        b.val = 99;
        let got: NumBoxA = cache.get('k')!;
        expect(got.val).assertEqual(99);
      }

      // --- [4] Verify put stores int array by reference and get sees later element mutation ---
      {
        let arr: int[] = [1, 2, 3];
        let cache: util.LRUCache<string, int[]> = new util.LRUCache<string, int[]>();
        cache.put('k', arr);
        arr[0] = 99;
        let got: int[] = cache.get('k')!;
        expect(got[0]).assertEqual(99);
      }

      // --- [5] Verify put stores Map instance by reference and inner key-value is readable ---
      {
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let cache: util.LRUCache<string, Map<string, int>> = new util.LRUCache<string, Map<string, int>>();
        cache.put('k', m);
        expect(cache.get('k')!.get('a')).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0080
     * @tc.name testLruCachePut008
     * @tc.desc Merged batch (5 tests): [1] Verify put stores Set instance by reference and element count is readable | [2] Verify put stores Date by reference and get sees later setTime mutation | [3] Verify put ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put stores Set instance by reference and element count is readable ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        let cache: util.LRUCache<string, Set<int>> = new util.LRUCache<string, Set<int>>();
        cache.put('k', s);
        expect(cache.get('k')!.size).assertEqual(1);
      }

      // --- [2] Verify put stores Date by reference and get sees later setTime mutation ---
      {
        let d: Date = new Date(1700000000000);
        let cache: util.LRUCache<string, Date> = new util.LRUCache<string, Date>();
        cache.put('k', d);
        d.setTime(999);
        let got: Date = cache.get('k')!;
        expect(got.getTime()).assertEqual(999);
      }

      // --- [3] Verify put stores RegExp instance by reference and source is readable ---
      {
        let r: RegExp = new RegExp('a+', 'g');
        let cache: util.LRUCache<string, RegExp> = new util.LRUCache<string, RegExp>();
        cache.put('k', r);
        expect(cache.get('k')!.source).assertEqual('a+');
      }

      // --- [4] Verify put with null value on nullable value type throws BusinessError ---
      {
        try {
          let cache: util.LRUCache<string, string | null> = new util.LRUCache<string, string | null>();
          cache.put('k', null);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }

      // --- [5] Verify put with undefined value throws BusinessError (key not kept) ---
      {
        let cache: util.LRUCache<string, string | undefined> = new util.LRUCache<string, string | undefined>();
        try {
          cache.put('k', undefined);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.contains('k')).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0090
     * @tc.name testLruCachePut009
     * @tc.desc Merged batch (5 tests): [1] Verify overwriting existing int key returns original value 'a' | [2] Verify overwriting existing string key returns original value 1 | [3] Verify overwriting existing ke...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting existing int key returns original value 'a' ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'a');
        expect(cache.put(1, 'b')).assertEqual('a');
        expect(cache.get(1)).assertEqual('b');
      }

      // --- [2] Verify overwriting existing string key returns original value 1 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('k', 1);
        let old: int | undefined = cache.put('k', 2);
        expect(old).assertEqual(1);
        expect(cache.get('k')).assertEqual(2);
      }

      // --- [3] Verify overwriting existing key does not change cache length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.length).assertEqual(2);
        cache.put(1, 30);
        expect(cache.length).assertEqual(2);
        expect(cache.get(1)).assertEqual(30);
      }

      // --- [4] Verify overwriting a key whose value is 0 returns original 0 accurately ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 0);
        let old: int | undefined = cache.put(1, 1);
        expect(old).assertEqual(0);
      }

      // --- [5] Verify second overwrite returns the value written in the previous round ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'a');
        cache.put(1, 'b');
        let old: string | undefined = cache.put(1, 'c');
        expect(old).assertEqual('b');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0100
     * @tc.name testLruCachePut010
     * @tc.desc Merged batch (5 tests): [1] Verify overwriting a double-valued key returns the original double value | [2] Verify put of a new key when full silently evicts without throwing and keeps length at cap...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting a double-valued key returns the original double value ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        let previous: double = 1.5;
        cache.put(1, previous);
        let old: double | undefined = cache.put(1, 2.5);
        expect(old).assertEqual(previous);
      }

      // --- [2] Verify put of a new key when full silently evicts without throwing and keeps length at capacity ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.length).assertEqual(1);
        expect(cache.get(1)).assertEqual(undefined);
      }

      // --- [3] Verify overflow on capacity three with string keys evicts the least recently used key a and keeps the newcomer ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(3);
        cache.put('a', 1);
        cache.put('b', 2);
        cache.put('c', 3);
        expect(cache.get('c')).assertEqual(3);
        cache.put('d', 4);
        expect(cache.get('a')).assertEqual(undefined);
        expect(cache.get('d')).assertEqual(4);
      }

      // --- [4] Verify putting 65 keys into a default capacity 64 cache evicts the oldest key and keeps the newest ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 65; i++) {
          cache.put(i, i);
        }
        let evicted: int | undefined = cache.put(0, 99);
        expect(evicted).assertEqual(undefined);
        let retained: int | undefined = cache.put(64, 999);
        expect(retained).assertEqual(64);
      }

      // --- [5] Verify overwriting an existing key when full does not trigger eviction and length stays same ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(1, 30);
        expect(cache.length).assertEqual(2);
        expect(cache.get(2)).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0110
     * @tc.name testLruCachePut011
     * @tc.desc Merged batch (5 tests): [1] Verify refreshing both keys in turn leaves the last refreshed key most recent so the earlier refreshed key is evicted | [2] Verify K as Date same-reference key is put an...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify refreshing both keys in turn leaves the last refreshed key most recent so the earlier refreshed key is evicted ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(1, 11);
        cache.put(2, 22);
        let result: int | undefined = cache.put(3, 30);
        expect(result).assertEqual(undefined);
        expect(cache.get(1)).assertEqual(undefined);
        expect(cache.get(2)).assertEqual(22);
      }

      // --- [2] Verify K as Date same-reference key is put and retrieved ---
      {
        let key: Date = new Date(1700000000000);
        let cache: util.LRUCache<Date, string> = new util.LRUCache<Date, string>();
        cache.put(key, 'date');
        expect(cache.get(key)).assertEqual('date');
      }

      // --- [3] Verify two same-millisecond Date keys with different references coexist under reference semantics ---
      {
        let firstDate: Date = new Date(1700000000000);
        let secondDate: Date = new Date(1700000000000);
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(firstDate, 1);
        cache.put(secondDate, 2);
        expect(cache.values()[0]).assertEqual(1);
        expect(cache.values()[1]).assertEqual(2);
      }

      // --- [4] Verify same-reference Date key repeated put triggers overwrite returning original value ---
      {
        let key: Date = new Date(1700000000000);
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(key, 1);
        let old: int | undefined = cache.put(key, 2);
        expect(old).assertEqual(1);
      }

      // --- [5] Verify two Date keys with different times coexist ---
      {
        let firstDate: Date = new Date(1700000000000);
        let secondDate: Date = new Date(1700000001000);
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(firstDate, 1);
        cache.put(secondDate, 2);
        expect(cache.get(firstDate)).assertEqual(1);
        expect(cache.get(secondDate)).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0120
     * @tc.name testLruCachePut012
     * @tc.desc Merged batch (5 tests): [1] Verify K as Date and V as class instance returns the same instance reference | [2] Verify K as Date and V as object returns the same object property | [3] Verify overwri...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify K as Date and V as class instance returns the same instance reference ---
      {
        let key: Date = new Date(1700000000000);
        let tag: TagNode = new TagNode('t1');
        let cache: util.LRUCache<Date, TagNode> = new util.LRUCache<Date, TagNode>();
        cache.put(key, tag);
        expect(cache.get(key)!.tag).assertEqual('t1');
      }

      // --- [2] Verify K as Date and V as object returns the same object property ---
      {
        let key: Date = new Date(1700000000000);
        let b: NumBoxA = { val: 7 };
        let cache: util.LRUCache<Date, NumBoxA> = new util.LRUCache<Date, NumBoxA>();
        cache.put(key, b);
        expect(cache.get(key)!.val).assertEqual(7);
      }

      // --- [3] Verify overwriting existing typed value returns old value of same runtime type ---
      {
        // string value
        let stringCache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        stringCache.put('kk', 'old');
        let previousString: string | undefined = stringCache.put('kk', 'new');
        expect(typeof previousString).assertEqual('string');
        expect(previousString).assertEqual('old');

        // int value
        let intCache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        intCache.put('mm', 5);
        let previousInt: int | undefined = intCache.put('mm', 6);
        expect(typeof previousInt).assertEqual('int');
        expect(previousInt).assertEqual(5);

        // long value
        let longCache: util.LRUCache<string, long> = new util.LRUCache<string, long>();
        let longOldValue: long = 7;
        let longNewValue: long = 8;
        longCache.put('nn', longOldValue);
        let previousLong: long | undefined = longCache.put('nn', longNewValue);
        expect(typeof previousLong).assertEqual('long');
        expect(previousLong).assertEqual(longOldValue);

        // boolean value
        let booleanCache: util.LRUCache<int, boolean> = new util.LRUCache<int, boolean>();
        booleanCache.put(5, false);
        let previousBoolean: boolean | undefined = booleanCache.put(5, true);
        expect(typeof previousBoolean).assertEqual('boolean');
        expect(previousBoolean).assertFalse();

        // byte value
        let byteCache: util.LRUCache<int, byte> = new util.LRUCache<int, byte>();
        byteCache.put(8, 127 as byte);
        let previousByte: byte | undefined = byteCache.put(8, 126 as byte);
        expect(byteCache.length).assertEqual(1);
        expect(typeof previousByte).assertEqual('byte');

        // short value
        let shortCache: util.LRUCache<int, short> = new util.LRUCache<int, short>();
        shortCache.put(9, 300 as short);
        let previousShort: short | undefined = shortCache.put(9, 301 as short);
        expect(previousShort).assertEqual(300 as short);
        expect(typeof previousShort).assertEqual('short');

        // float value
        let floatCache: util.LRUCache<int, float> = new util.LRUCache<int, float>();
        floatCache.put(10, 1.5 as float);
        let previousFloat: float | undefined = floatCache.put(10, 2.5 as float);
        expect(typeof previousFloat).assertEqual('float');
        expect(floatCache.get(10)).assertEqual(2.5 as float);
      }

      // --- [4] Verify overwriting existing double value returns old value of number runtime type ---
      {
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        cache.put('oo', 1.25);
        let previous: double | undefined = cache.put('oo', 2.25);
        expect(typeof previous).assertEqual('number');
        expect(previous).assertEqual(1.25);
      }

      // --- [5] Verify put overwriting existing value under int key returns old bigint value whose typeof is bigint ---
      {
        let cache: util.LRUCache<int, bigint> = new util.LRUCache<int, bigint>();
        cache.put(6, 100n);
        let previous: bigint | undefined = cache.put(6, 200n);
        expect(typeof previous).assertEqual('bigint');
        expect(previous).assertEqual(100n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0130
     * @tc.name testLruCachePut013
     * @tc.desc Merged batch (5 tests): [1] Verify overwriting existing single character string value returns old value of string runtime type | [2] Verify overwrite of long value returns original long value 999 a...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting existing single character string value returns old value of string runtime type ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(7, 'a');
        let previous: string | undefined = cache.put(7, 'b');
        expect(typeof previous).assertEqual('string');
        expect(previous).assertEqual('a');
      }

      // --- [2] Verify overwrite of long value returns original long value 999 accurately ---
      {
        let cache: util.LRUCache<int, long> = new util.LRUCache<int, long>();
        let firstValue: long = 999;
        let secondValue: long = 1000;
        cache.put(101, firstValue);
        let previous: long | undefined = cache.put(101, secondValue);
        expect(previous).assertEqual(firstValue);
      }

      // --- [3] Verify put overwriting existing bigint value 9007199254740993n beyond double safe integer under string key returns the original exact value ---
      {
        let cacheB: util.LRUCache<string, bigint> = new util.LRUCache<string, bigint>();
        cacheB.put('b2', 9007199254740993n);
        let previousB: bigint | undefined = cacheB.put('b2', 9007199254740995n);
        expect(previousB).assertEqual(9007199254740993n);
      }

      // --- [4] Verify overwrite of double value returns original double value 6.25 ---
      {
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        cache.put('b3', 6.25);
        expect(cache.put('b3', 7.5)).assertEqual(6.25);
        expect(cache.contains('b3')).assertTrue();
      }

      // --- [5] Verify overwrite of long value returns original long 3 and cache stores new 4 ---
      {
        let cache: util.LRUCache<string, long> = new util.LRUCache<string, long>();
        let threeValue: long = 3;
        let fourValue: long = 4;
        cache.put('b5', threeValue);
        let previous: long | undefined = cache.put('b5', fourValue);
        expect(previous).assertEqual(threeValue);
        expect(cache.get('b5')).assertEqual(fourValue);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0140
     * @tc.name testLruCachePut014
     * @tc.desc Merged batch (5 tests): [1] Verify overwrite of negative double value returns original -2.5 | [2] Verify put overwriting existing bigint value under int key returns the original bigint value | [3] ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwrite of negative double value returns original -2.5 ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(201, -2.5);
        let previous: double | undefined = cache.put(201, -3.5);
        expect(previous).assertEqual(-2.5);
      }

      // --- [2] Verify put overwriting existing bigint value under int key returns the original bigint value ---
      {
        let cache: util.LRUCache<int, bigint> = new util.LRUCache<int, bigint>();
        cache.put(202, 123456789n);
        let previous: bigint | undefined = cache.put(202, 987654321n);
        expect(previous).assertEqual(123456789n);
      }

      // --- [3] Verify overwrite of byte value at 127 boundary returns original byte 127 ---
      {
        let cache: util.LRUCache<int, byte> = new util.LRUCache<int, byte>();
        cache.put(203, 127 as byte);
        let old: byte | undefined = cache.put(203, 64 as byte);
        expect(old).assertEqual(127 as byte);
      }

      // --- [4] Verify overwrite of byte value at -128 boundary returns original byte -128 ---
      {
        let cache: util.LRUCache<int, byte> = new util.LRUCache<int, byte>();
        cache.put(204, -128 as byte);
        let previous: byte | undefined = cache.put(204, 0 as byte);
        expect(previous).assertEqual(-128 as byte);
      }

      // --- [5] Verify overwrite of short value at 32767 boundary returns original short 32767 ---
      {
        let cache: util.LRUCache<int, short> = new util.LRUCache<int, short>();
        cache.put(205, 32767 as short);
        expect(cache.put(205, 100 as short)).assertEqual(32767 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0150
     * @tc.name testLruCachePut015
     * @tc.desc Merged batch (5 tests): [1] Verify overwrite of float value returns original float 0.5 | [2] Verify overwrite of single character string value at 65535 boundary returns original maximum code unit |...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwrite of float value returns original float 0.5 ---
      {
        let cache: util.LRUCache<int, float> = new util.LRUCache<int, float>();
        cache.put(206, 0.5 as float);
        let old: float | undefined = cache.put(206, 0.75 as float);
        expect(old).assertEqual(0.5 as float);
        expect(cache.contains(206)).assertTrue();
      }

      // --- [2] Verify overwrite of single character string value at 65535 boundary returns original maximum code unit ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        let maxChar: string = '\uFFFF';
        cache.put(207, maxChar);
        let old: string | undefined = cache.put(207, 'z');
        expect(old).assertEqual(maxChar);
      }

      // --- [3] Verify overwrite of single character string null value returns original null code unit ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(208, '\u0000');
        let old: string | undefined = cache.put(208, 'y');
        expect(old).assertEqual('\u0000');
        expect(cache.length).assertEqual(1);
      }

      // --- [4] Verify overwrite of long max value returns original long maximum ---
      {
        let cache: util.LRUCache<int, long> = new util.LRUCache<int, long>();
        let maxCount: long = 9223372036854775807;
        cache.put(209, maxCount);
        let oneCount: long = 1;
        let previous: long | undefined = cache.put(209, oneCount);
        expect(previous).assertEqual(maxCount);
      }

      // --- [5] Verify overwrite of long minimum value returns original long minimum ---
      {
        let cache: util.LRUCache<int, long> = new util.LRUCache<int, long>();
        let minCount: long = -9223372036854775807 - 1;
        cache.put(210, minCount);
        let twoCount: long = 2;
        let previous: long | undefined = cache.put(210, twoCount);
        expect(previous).assertEqual(minCount);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0160
     * @tc.name testLruCachePut016
     * @tc.desc Merged batch (5 tests): [1] Verify overwriting existing Date value returns old Date instance satisfying instanceof | [2] Verify overwriting existing Date value returns old Date instance whose time ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting existing Date value returns old Date instance satisfying instanceof ---
      {
        let cache: util.LRUCache<string, Date> = new util.LRUCache<string, Date>();
        let previousDate: Date = new Date(1234567890123);
        cache.put('dateKeyA', previousDate);
        let previous: Date | undefined = cache.put('dateKeyA', new Date(999));
        expect(previous instanceof Date).assertTrue();
        expect(previous!.getTime()).assertEqual(previousDate.getTime());
      }

      // --- [2] Verify overwriting existing Date value returns old Date instance whose time is unchanged ---
      {
        let cache: util.LRUCache<string, Date> = new util.LRUCache<string, Date>();
        let previousDate: Date = new Date(987654321000);
        cache.put('dateKeyB', previousDate);
        let previous: Date | undefined = cache.put('dateKeyB', new Date(111));
        expect(previous!.getTime()).assertEqual(987654321000);
      }

      // --- [3] Verify overwriting existing RegExp value returns old RegExp instance satisfying instanceof ---
      {
        let cache: util.LRUCache<string, RegExp> = new util.LRUCache<string, RegExp>();
        let previousPattern: RegExp = new RegExp('ab+c', 'g');
        cache.put('regexKeyA', previousPattern);
        let previous: RegExp | undefined = cache.put('regexKeyA', new RegExp('x'));
        expect(previous instanceof RegExp).assertTrue();
        expect(previous!.source).assertEqual('ab+c');
      }

      // --- [4] Verify overwriting existing RegExp value returns old instance with unchanged source ---
      {
        let cache: util.LRUCache<string, RegExp> = new util.LRUCache<string, RegExp>();
        cache.put('regexKeyB', new RegExp('^a$', 'i'));
        let previous: RegExp | undefined = cache.put('regexKeyB', new RegExp('b'));
        expect(previous!.source).assertEqual('^a$');
      }

      // --- [5] Verify overwriting existing object value returns old object with original property ---
      {
        let previousBox: NumBoxA = { val: 11 };
        let cache: util.LRUCache<string, NumBoxA> = new util.LRUCache<string, NumBoxA>();
        cache.put('objectKeyA', previousBox);
        let previous: NumBoxA | undefined = cache.put('objectKeyA', { val: 22 });
        expect(previous!.val).assertEqual(11);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0170
     * @tc.name testLruCachePut017
     * @tc.desc Merged batch (5 tests): [1] Verify overwriting existing int array value returns old array with unchanged length | [2] Verify overwriting existing Date array value returns old array whose elements a...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting existing int array value returns old array with unchanged length ---
      {
        let previousItems: int[] = [7, 8];
        let cache: util.LRUCache<string, int[]> = new util.LRUCache<string, int[]>();
        cache.put('intArrayKeyA', previousItems);
        let previous: int[] | undefined = cache.put('intArrayKeyA', [9]);
        expect(previous!.length).assertEqual(2);
      }

      // --- [2] Verify overwriting existing Date array value returns old array whose elements are preserved ---
      {
        let firstDate: Date = new Date(1700000000000);
        let secondDate: Date = new Date(1700000001000);
        let arrDE: Date[] = [firstDate, secondDate];
        let cache: util.LRUCache<string, Date[]> = new util.LRUCache<string, Date[]>();
        cache.put('dateArrayKeyA', arrDE);
        let previous: Date[] | undefined = cache.put('dateArrayKeyA', [new Date(1)]);
        expect(previous![0].getTime()).assertEqual(1700000000000);
      }

      // --- [3] Verify overwriting existing pair object value returns old object with original second field ---
      {
        let previousPair: NumPairA = { a: 3, b: 4 };
        let cache: util.LRUCache<string, NumPairA> = new util.LRUCache<string, NumPairA>();
        cache.put('pairKeyA', previousPair);
        let previous: NumPairA | undefined = cache.put('pairKeyA', { a: 5, b: 6 });
        expect(previous!.b).assertEqual(4);
      }

      // --- [4] Verify overwriting existing Uint8Array value returns old buffer with unchanged byteLength ---
      {
        let bufferA: Uint8Array = new Uint8Array([1, 2, 3, 4]);
        let cache: util.LRUCache<int, Uint8Array> = new util.LRUCache<int, Uint8Array>();
        cache.put(301, bufferA);
        let previous: Uint8Array | undefined = cache.put(301, new Uint8Array([9]));
        expect(previous!.byteLength).assertEqual(4);
      }

      // --- [5] Verify overwriting existing Uint8Array value returns old buffer with unchanged first byte ---
      {
        let bufferB: Uint8Array = new Uint8Array([0xEF, 0xBB, 0xBF]);
        let cache: util.LRUCache<int, Uint8Array> = new util.LRUCache<int, Uint8Array>();
        cache.put(302, bufferB);
        let previous: Uint8Array | undefined = cache.put(302, new Uint8Array([0]));
        expect(previous![0]).assertEqual(0xEF);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0180
     * @tc.name testLruCachePut018
     * @tc.desc Merged batch (5 tests): [1] Verify overwriting existing Map value returns old Map with unchanged element count | [2] Verify overwriting existing Set value returns old Set with unchanged element cou...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting existing Map value returns old Map with unchanged element count ---
      {
        let previousMap: Map<string, int> = new Map<string, int>();
        previousMap.set('x', 1);
        previousMap.set('y', 2);
        let cache: util.LRUCache<string, Map<string, int>> = new util.LRUCache<string, Map<string, int>>();
        cache.put('mapKeyA', previousMap);
        let previous: Map<string, int> | undefined = cache.put('mapKeyA', new Map<string, int>());
        expect(previous!.size).assertEqual(2);
      }

      // --- [2] Verify overwriting existing Set value returns old Set with unchanged element count ---
      {
        let previousSet: Set<int> = new Set<int>();
        previousSet.add(1);
        previousSet.add(2);
        previousSet.add(3);
        let cache: util.LRUCache<string, Set<int>> = new util.LRUCache<string, Set<int>>();
        cache.put('setKeyA', previousSet);
        let previous: Set<int> | undefined = cache.put('setKeyA', new Set<int>());
        expect(previous!.size).assertEqual(3);
      }

      // --- [3] Verify overwriting existing class instance value returns old instance with original tag ---
      {
        let previousNode: TagNode = new TagNode('n-old');
        let cache: util.LRUCache<int, TagNode> = new util.LRUCache<int, TagNode>();
        cache.put(401, previousNode);
        let previous: TagNode | undefined = cache.put(401, new TagNode('n-new'));
        expect(previous!.tag).assertEqual('n-old');
      }

      // --- [4] Verify overwriting existing class instance value returns old instance of the class ---
      {
        let previousBox: CntBox = new CntBox(11);
        let cache: util.LRUCache<int, CntBox> = new util.LRUCache<int, CntBox>();
        cache.put(402, previousBox);
        let previous: CntBox | undefined = cache.put(402, new CntBox(22));
        expect(previous instanceof CntBox).assertTrue();
        expect(previous!.cnt).assertEqual(11);
      }

      // --- [5] Verify overwriting existing Uint8Array value returns old buffer with preserved interior byte ---
      {
        let buffer: Uint8Array = new Uint8Array([0x00, 0xFF, 0x00, 0xFF]);
        let cache: util.LRUCache<int, Uint8Array> = new util.LRUCache<int, Uint8Array>();
        cache.put(501, buffer);
        let previous: Uint8Array | undefined = cache.put(501, new Uint8Array([0x01]));
        expect(previous![1]).assertEqual(0xFF);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0190
     * @tc.name testLruCachePut019
     * @tc.desc Merged batch (5 tests): [1] Verify overwriting existing Uint8Array value returns old buffer with preserved last byte | [2] Verify overwrite returns the same reference as the previously stored objec...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting existing Uint8Array value returns old buffer with preserved last byte ---
      {
        let buffer: Uint8Array = new Uint8Array([0xEF, 0xBB, 0xBF]);
        let cache: util.LRUCache<int, Uint8Array> = new util.LRUCache<int, Uint8Array>();
        cache.put(502, buffer);
        let previous: Uint8Array | undefined = cache.put(502, new Uint8Array([0x01]));
        expect(previous![2]).assertEqual(0xBF);
      }

      // --- [2] Verify overwrite returns the same reference as the previously stored object value ---
      {
        let previousPair: NumPairA = { a: 1, b: 1 };
        let cache: util.LRUCache<string, NumPairA> = new util.LRUCache<string, NumPairA>();
        cache.put('pairRefKeyA', previousPair);
        let previous: NumPairA | undefined = cache.put('pairRefKeyA', { a: 2, b: 2 });
        expect(previous).assertEqual(previousPair);
        expect(cache.get('pairRefKeyA')!.a).assertEqual(2);
      }

      // --- [3] Verify overwrite returns the same reference as the previously stored Date value ---
      {
        let dateKey: Date = new Date(555);
        let cache: util.LRUCache<string, Date> = new util.LRUCache<string, Date>();
        cache.put('dateRefKeyA', dateKey);
        let previous: Date | undefined = cache.put('dateRefKeyA', new Date(666));
        expect(previous).assertEqual(dateKey);
        expect(cache.get('dateRefKeyA')!.getTime()).assertEqual(666);
      }

      // --- [4] Verify overwrite returns the same reference as the previously stored class instance value ---
      {
        let previousBox: CntBox = new CntBox(1);
        let cache: util.LRUCache<int, CntBox> = new util.LRUCache<int, CntBox>();
        cache.put(601, previousBox);
        let previous: CntBox | undefined = cache.put(601, new CntBox(2));
        expect(previous).assertEqual(previousBox);
        expect(cache.get(601)!.cnt).assertEqual(2);
      }

      // --- [5] Verify reference-typed and numeric key repeated put returns original value ---
      {
        // RegExp key
        let regExpKey: RegExp = new RegExp('a+', 'g');
        let regExpCache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        regExpCache.put(regExpKey, 30);
        let previousRegExp: int | undefined = regExpCache.put(regExpKey, 31);
        expect(previousRegExp).assertEqual(30);

        // object key
        let objectKey: NumBoxA = {val : 1 };
        let objectCache: util.LRUCache<NumBoxA, string> = new util.LRUCache<NumBoxA, string>();
        objectCache.put(objectKey, 'alpha');
        let previousObject: string | undefined = objectCache.put(objectKey, 'beta');
        expect(previousObject).assertEqual('alpha');

        // long key
        let longKey: long = 5;
        let longKeyCache: util.LRUCache<long, string> = new util.LRUCache<long, string>();
        longKeyCache.put(longKey, 'five');
        let previousLong: string | undefined = longKeyCache.put(longKey, 'six');
        expect(previousLong).assertEqual('five');

        // double key
        let doubleCache: util.LRUCache<double, string> = new util.LRUCache<double, string>();
        let doubleKey: double = 3.14;
        doubleCache.put(doubleKey, 'pi');
        expect(doubleCache.put(doubleKey, 'tau')).assertEqual('pi');

        // boolean key
        let booleanKeyCache: util.LRUCache<boolean, string> = new util.LRUCache<boolean, string>();
        booleanKeyCache.put(true, 'yes');
        let previousBooleanKey: string | undefined = booleanKeyCache.put(true, 'no');
        expect(previousBooleanKey).assertEqual('yes');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0200
     * @tc.name testLruCachePut020
     * @tc.desc Merged batch (5 tests): [1] Verify int array key repeated put returns original string value | [2] Verify overwrite return value can be stored as value for another key in the same cache | [3] Verify...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify int array key repeated put returns original string value ---
      {
        let itemKeys: int[] = [1, 2];
        let cache: util.LRUCache<int[], string> = new util.LRUCache<int[], string>();
        cache.put(itemKeys, 'gamma');
        let previous: string | undefined = cache.put(itemKeys, 'delta');
        expect(previous).assertEqual('gamma');
      }

      // --- [2] Verify overwrite return value can be stored as value for another key in the same cache ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('chain', 10);
        let result: int | undefined = cache.put('chain', 20);
        expect(result).assertEqual(10);
        cache.put('next', result!);
        expect(cache.get('next')).assertEqual(10);
      }

      // --- [3] Verify overwrite returns old int value and key still contained in cache ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('cc', 33);
        let result: int | undefined = cache.put('cc', 44);
        expect(result).assertEqual(33);
        expect(cache.contains('cc')).assertTrue();
      }

      // --- [4] Verify overwrite returns previous value 88 while get returns the new value 89 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('c7', 88);
        let previous: int | undefined = cache.put('c7', 89);
        let freshValue: int = cache.get('c7')!;
        expect(previous).assertEqual(88);
        expect(freshValue).assertEqual(89);
      }

      // --- [5] Verify overwriting an existing key never changes the cache length ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('l1', 1);
        cache.put('l1', 2);
        expect(cache.length).assertEqual(1);
        cache.put('l2', 2);
        cache.put('l3', 3);
        expect(cache.length).assertEqual(3);
        cache.put('l1', 9);
        expect(cache.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0210
     * @tc.name testLruCachePut021
     * @tc.desc Merged batch (5 tests): [1] Verify overwriting an existing key counts two puts and leaves match count removal count and capacity unchanged | [2] Verify after overwrite get returns the new int value...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting an existing key counts two puts and leaves match count removal count and capacity unchanged ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(8);
        cache.put('p1', 1);
        cache.put('p1', 2);
        expect(cache.getPutCount()).assertEqual(2);
        expect(cache.getMatchCount()).assertEqual(0);
        expect(cache.getRemovalCount()).assertEqual(0);
        expect(cache.getCapacity()).assertEqual(8);
      }

      // --- [2] Verify after overwrite get returns the new int value 6 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('t1', 5);
        cache.put('t1', 6);
        let got: int = cache.get('t1')!;
        expect(got).assertEqual(6);
      }

      // --- [3] Verify after string overwrite get returns the new string value ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('u1', 'old');
        cache.put('u1', 'new');
        expect(cache.get('u1')).assertEqual('new');
      }

      // --- [4] Verify empty string key overwrite returns the original value 1 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = '';
        cache.put(key, 1);
        let old: int | undefined = cache.put(key, 2);
        expect(old).assertEqual(1);
      }

      // --- [5] Verify empty string key still working and overwrite keeps length at 1 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('', 3);
        cache.put('', 4);
        expect(cache.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0220
     * @tc.name testLruCachePut022
     * @tc.desc Merged batch (5 tests): [1] Verify int minimum key overwrite returns the original value 1 | [2] Verify double tiny value 1e-308 overwrite returns the original double | [3] Verify double huge value ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify int minimum key overwrite returns the original value 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-2147483648, 1);
        let previous: int | undefined = cache.put(-2147483648, 2);
        expect(previous).assertEqual(1);
      }

      // --- [2] Verify double tiny value 1e-308 overwrite returns the original double ---
      {
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        cache.put('tiny', 1e-308);
        let previous: double | undefined = cache.put('tiny', 2.0);
        expect(previous).assertEqual(1e-308);
      }

      // --- [3] Verify double huge value 1e308 overwrite returns the original double ---
      {
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        cache.put('huge', 1e308);
        expect(cache.put('huge', 3.0)).assertEqual(1e308);
        expect(cache.length).assertEqual(1);
      }

      // --- [4] Verify single character string value of zero overwrite returns the original zero code unit ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('z0', '\u0000');
        let previous: string | undefined = cache.put('z0', 'q');
        expect(previous).assertEqual('\u0000');
      }

      // --- [5] Verify first put with null value throws BusinessError before any overwrite ---
      {
        let cache: util.LRUCache<string, int | null> = new util.LRUCache<string, int | null>();
        try {
          cache.put('nullv', null);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0230
     * @tc.name testLruCachePut023
     * @tc.desc Merged batch (5 tests): [1] Verify first put with undefined value throws BusinessError before any overwrite | [2] Verify overwrite return value can be passed to createDefault as its argument | [3] ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify first put with undefined value throws BusinessError before any overwrite ---
      {
        let cache: util.LRUCache<string, int | undefined> = new util.LRUCache<string, int | undefined>();
        try {
          cache.put('undefv', undefined);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.length).assertEqual(0);
      }

      // --- [2] Verify overwrite return value can be passed to createDefault as its argument ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(12, 120);
        let result: int | undefined = cache.put(12, 121);
        expect(result).assertEqual(120);
        expect(cache.createDefault(result!)).assertEqual(undefined);
      }

      // --- [3] Verify overwrite return value can be used as key of another cache instance ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('rv3', 20);
        let result: int | undefined = cache.put('rv3', 21);
        expect(result).assertEqual(20);
        let otherCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        otherCache.put(result!, 99);
        expect(otherCache.get(result!)).assertEqual(99);
      }

      // --- [4] Verify capacity 2 put of third new key returns undefined after eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        let result: int | undefined = cache.put(3, 30);
        expect(result).assertEqual(undefined);
      }

      // --- [5] Verify capacity 2 cache is truncated to length 2 after third key inserted ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let len: int = cache.length;
        expect(len).assertEqual(2);
        expect(cache.contains(1)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0240
     * @tc.name testLruCachePut024
     * @tc.desc Merged batch (5 tests): [1] Verify capacity 1 overwrite of existing key returns old value without eviction | [2] Verify capacity 1 overwrite keeps length unchanged at 1 | [3] Verify capacity 3 put ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify capacity 1 overwrite of existing key returns old value without eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 10);
        let previous: int | undefined = cache.put(1, 20);
        expect(previous).assertEqual(10);
      }

      // --- [2] Verify capacity 1 overwrite keeps length unchanged at 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 10);
        cache.put(1, 20);
        expect(cache.length).assertEqual(1);
      }

      // --- [3] Verify capacity 3 put of fourth new key returns undefined and counts one removal ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(10, 100);
        cache.put(20, 200);
        cache.put(30, 300);
        let result: int | undefined = cache.put(40, 400);
        expect(result).assertEqual(undefined);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [4] Verify full capacity overwrite of existing key does not trigger removal count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(1, 30);
        expect(cache.getRemovalCount()).assertEqual(0);
        expect(cache.get(1)).assertEqual(30);
      }

      // --- [5] Verify repeated overwrites at full capacity return previous values and keep length at the capacity limit ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        let first: int | undefined = cache.put(1, 30);
        let second: int | undefined = cache.put(1, 40);
        expect(first).assertEqual(10);
        expect(second).assertEqual(30);
        expect(cache.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0250
     * @tc.name testLruCachePut025
     * @tc.desc Merged batch (5 tests): [1] Verify int key at maximum 2147483647 overwrite returns the original value | [2] Verify adjacent int keys coexist and overwriting one leaves the other intact | [3] Verify...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify int key at maximum 2147483647 overwrite returns the original value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2147483647, 1);
        expect(cache.put(2147483647, 2)).assertEqual(1);
      }

      // --- [2] Verify adjacent int keys coexist and overwriting one leaves the other intact ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(3, 30);
        cache.put(4, 40);
        cache.put(3, 31);
        expect(cache.get(4)).assertEqual(40);
      }

      // --- [3] Verify long key overwrite returns original long value and cache stores the new one ---
      {
        let key: long = 1;
        let firstValue: long = 11;
        let secondValue: long = 12;
        let cache: util.LRUCache<long, long> = new util.LRUCache<long, long>();
        cache.put(key, firstValue);
        let previous: long | undefined = cache.put(key, secondValue);
        expect(previous).assertEqual(firstValue);
        expect(cache.get(key)).assertEqual(secondValue);
      }

      // --- [4] Verify double key overwrite returns original double value ---
      {
        let cache: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        let key: double = 2.5;
        cache.put(key, 2.5);
        let old: double | undefined = cache.put(key, 3.5);
        expect(old).assertEqual(2.5);
        expect(cache.get(key)).assertEqual(3.5);
      }

      // --- [5] Verify boolean key overwrite returns original int value ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(false, 1);
        let previous: int | undefined = cache.put(false, 2);
        expect(previous).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0260
     * @tc.name testLruCachePut026
     * @tc.desc Merged batch (5 tests): [1] Verify put overwriting existing value under bigint key 1n returns the old int value 1 | [2] Verify Date key with class instance value returns the original instance on ov...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put overwriting existing value under bigint key 1n returns the old int value 1 ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        cache.put(1n, 1);
        let previous: int | undefined = cache.put(1n, 2);
        expect(previous).assertEqual(1);
      }

      // --- [2] Verify Date key with class instance value returns the original instance on overwrite ---
      {
        let dKey: Date = new Date(1700000000000);
        let wrap: TagNode = new TagNode('w1');
        let cache: util.LRUCache<Date, TagNode> = new util.LRUCache<Date, TagNode>();
        cache.put(dKey, wrap);
        let previous: TagNode | undefined = cache.put(dKey, new TagNode('w2'));
        expect(previous instanceof TagNode).assertTrue();
        expect(previous!.tag).assertEqual('w1');
      }

      // --- [3] Verify Date key with object value returns the original object property on overwrite ---
      {
        let dMeta: Date = new Date(1700000000000);
        let previousBox: NumBoxA = { val: 1 };
        let cache: util.LRUCache<Date, NumBoxA> = new util.LRUCache<Date, NumBoxA>();
        cache.put(dMeta, previousBox);
        let previous: NumBoxA | undefined = cache.put(dMeta, { val: 2 });
        expect(previous!.val).assertEqual(1);
      }

      // --- [4] Verify RegExp key repeated put returns the original string value ---
      {
        let rZ: RegExp = new RegExp('\\d+', 'i');
        let cache: util.LRUCache<RegExp, string> = new util.LRUCache<RegExp, string>();
        cache.put(rZ, 'digits');
        let previous: string | undefined = cache.put(rZ, 'letters');
        expect(previous).assertEqual('digits');
      }

      // --- [5] Verify int array key with long value returns the original long on overwrite ---
      {
        let arrKeyY: int[] = [9, 8];
        let firstValue: long = 1;
        let secondValue: long = 2;
        let cache: util.LRUCache<int[], long> = new util.LRUCache<int[], long>();
        cache.put(arrKeyY, firstValue);
        let previous: long | undefined = cache.put(arrKeyY, secondValue);
        expect(previous).assertEqual(firstValue);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0270
     * @tc.name testLruCachePut027
     * @tc.desc Merged batch (5 tests): [1] Verify Date key with long value returns the original long on overwrite | [2] Verify put with undefined key throws BusinessError (not storable) | [3] Verify put with null...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Date key with long value returns the original long on overwrite ---
      {
        let dComb: Date = new Date(1700000000000);
        let firstValue: long = 5;
        let secondValue: long = 6;
        let cache: util.LRUCache<Date, long> = new util.LRUCache<Date, long>();
        cache.put(dComb, firstValue);
        let previous: long | undefined = cache.put(dComb, secondValue);
        expect(previous).assertEqual(firstValue);
      }

      // --- [2] Verify put with undefined key throws BusinessError (not storable) ---
      {
        let cache: util.LRUCache<string | undefined, int> = new util.LRUCache<string | undefined, int>();
        try {
          cache.put(undefined, 5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.length).assertEqual(0);
      }

      // --- [3] Verify put with null key on a null-or-undefined union cache throws BusinessError ---
      {
        try {
          let cache: util.LRUCache<string | null | undefined, int> = new util.LRUCache<string | null | undefined, int>();
          cache.put(null, 1);
          cache.put(undefined, 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }

      // --- [4] Verify put with undefined key throws before string 'undefined' key is reached ---
      {
        let cache: util.LRUCache<string | undefined, int> = new util.LRUCache<string | undefined, int>();
        try {
          cache.put(undefined, 1);
          cache.put('undefined', 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.length).assertEqual(0);
      }

      // --- [5] Verify put with null key throws before string 'null' key is reached ---
      {
        let cache: util.LRUCache<string | null, int> = new util.LRUCache<string | null, int>();
        try {
          cache.put(null, 1);
          cache.put('null', 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0280
     * @tc.name testLruCachePut028
     * @tc.desc Merged batch (5 tests): [1] Verify long maximum 9223372036854775807 key stored and read back | [2] Verify long large negative -4611686018427387904 key stored and read back | [3] Verify a positive I...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify long maximum 9223372036854775807 key stored and read back ---
      {
        let longMaxKey: long = 9223372036854775807;
        let cache: util.LRUCache<long, string> = new util.LRUCache<long, string>();
        cache.put(longMaxKey, 'max');
        expect(cache.get(longMaxKey)).assertEqual('max');
      }

      // --- [2] Verify long large negative -4611686018427387904 key stored and read back ---
      {
        let longMinKey: long = -4611686018427387904;
        let cache: util.LRUCache<long, string> = new util.LRUCache<long, string>();
        cache.put(longMinKey, 'neg');
        expect(cache.get(longMinKey)).assertEqual('neg');
      }

      // --- [3] Verify a positive Infinity double key with its value inserts as a new entry ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        let previous: int | undefined = cache.put(Double.POSITIVE_INFINITY, 1);
        expect(previous).assertEqual(undefined);
        expect(cache.length).assertEqual(1);
      }

      // --- [4] Verify a negative Infinity double key with its value inserts as a new entry ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        let previous: int | undefined = cache.put(Double.NEGATIVE_INFINITY, 2);
        expect(previous).assertEqual(undefined);
        expect(cache.length).assertEqual(1);
      }

      // --- [5] Verify Number.MAX_VALUE double key stored and read back ---
      {
        let doubleMaxValue: double = Number.MAX_VALUE;
        let cache: util.LRUCache<double, string> = new util.LRUCache<double, string>();
        cache.put(doubleMaxValue, 'huge');
        expect(cache.get(doubleMaxValue)).assertEqual('huge');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0290
     * @tc.name testLruCachePut029
     * @tc.desc Merged batch (5 tests): [1] Verify Number.MIN_VALUE double key stored and read back | [2] Verify Number.MAX_SAFE_INTEGER double key stored and read back | [3] Verify negative double -1.5 key stored...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Number.MIN_VALUE double key stored and read back ---
      {
        let doubleMinValue: double = Number.MIN_VALUE;
        let cache: util.LRUCache<double, string> = new util.LRUCache<double, string>();
        cache.put(doubleMinValue, 'tiny');
        expect(cache.get(doubleMinValue)).assertEqual('tiny');
      }

      // --- [2] Verify Number.MAX_SAFE_INTEGER double key stored and read back ---
      {
        let safeIntKey: double = Number.MAX_SAFE_INTEGER;
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(safeIntKey, 7);
        expect(cache.get(safeIntKey)).assertEqual(7);
      }

      // --- [3] Verify negative double -1.5 key stored and read back distinct from positive ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(-1.5, 8);
        cache.put(1.5, 9);
        expect(cache.get(-1.5)).assertEqual(8);
        expect(cache.get(1.5)).assertEqual(9);
      }

      // --- [4] Verify double positive Infinity value stored and read back ---
      {
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        cache.put('k', Double.POSITIVE_INFINITY);
        expect(cache.get('k')).assertEqual(Double.POSITIVE_INFINITY);
      }

      // --- [5] Verify double negative Infinity value stored and read back ---
      {
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        cache.put('k', Double.NEGATIVE_INFINITY);
        expect(cache.get('k')).assertEqual(Double.NEGATIVE_INFINITY);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0300
     * @tc.name testLruCachePut030
     * @tc.desc Merged batch (5 tests): [1] Verify Number.MAX_VALUE double value stored and read back | [2] Verify Number.MIN_VALUE double value stored and read back | [3] Verify long maximum value stored and read...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Number.MAX_VALUE double value stored and read back ---
      {
        let doubleMaxValue: double = Number.MAX_VALUE;
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        cache.put('k', doubleMaxValue);
        expect(cache.get('k')).assertEqual(doubleMaxValue);
      }

      // --- [2] Verify Number.MIN_VALUE double value stored and read back ---
      {
        let doubleMinValue: double = Number.MIN_VALUE;
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        cache.put('k', doubleMinValue);
        expect(cache.get('k')).assertEqual(doubleMinValue);
      }

      // --- [3] Verify long maximum value stored and read back beyond int range ---
      {
        let longMaxValue: long = 9223372036854775807;
        let cache: util.LRUCache<string, long> = new util.LRUCache<string, long>();
        cache.put('k', longMaxValue);
        expect(cache.get('k')).assertEqual(longMaxValue);
      }

      // --- [4] Verify long large negative value stored and read back beyond int range ---
      {
        let longMinValue: long = -4611686018427387904;
        let cache: util.LRUCache<string, long> = new util.LRUCache<string, long>();
        cache.put('k', longMinValue);
        expect(cache.get('k')).assertEqual(longMinValue);
      }

      // --- [5] Verify overwriting a NaN value key returns the original NaN checked by isNaN ---
      {
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        cache.put('k', Double.NaN);
        let previous: double | undefined = cache.put('k', 1.0);
        expect(isNaN(previous!)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0310
     * @tc.name testLruCachePut031
     * @tc.desc Merged batch (5 tests): [1] Verify put with undefined value throws BusinessError on overwrite attempt | [2] Verify single character string value 'A' stored and read back | [3] Verify empty cache is...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put with undefined value throws BusinessError on overwrite attempt ---
      {
        let cache: util.LRUCache<string, string | undefined> = new util.LRUCache<string, string | undefined>();
        cache.put('k', 'real');
        try {
          cache.put('k', undefined);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        let previous: string | undefined = cache.put('k', 'again');
        expect(previous).assertEqual('real');
      }

      // --- [2] Verify single character string value 'A' stored and read back ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        let key: string = 'k';
        cache.put(key, 'A');
        let got: string | undefined = cache.get(key);
        expect(got).assertEqual('A');
        expect(cache.contains(key)).assertTrue();
      }

      // --- [3] Verify empty cache isEmpty true then put makes isEmpty false ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(cache.isEmpty()).assertTrue();
        cache.put(1, 10);
        expect(cache.isEmpty()).assertFalse();
      }

      // --- [4] Verify re-put after clear treats key as new and returns undefined ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.clear();
        let result: int | undefined = cache.put(1, 20);
        expect(result).assertEqual(undefined);
      }

      // --- [5] Verify multiple keys sharing identical int value coexist at length 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 9);
        cache.put(2, 9);
        cache.put(3, 9);
        expect(cache.length).assertEqual(3);
        expect(cache.contains(2)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0320
     * @tc.name testLruCachePut032
     * @tc.desc Merged batch (5 tests): [1] Verify multiple keys sharing identical string value each read back same value | [2] Verify single element same-key same-value overwrite returns value and keeps length 1 ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify multiple keys sharing identical string value each read back same value ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'same');
        cache.put(2, 'same');
        expect(cache.get(2)).assertEqual('same');
      }

      // --- [2] Verify single element same-key same-value overwrite returns value and keeps length 1 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('k', 1);
        let previous: int | undefined = cache.put('k', 1);
        expect(previous).assertEqual(1);
        expect(cache.length).assertEqual(1);
      }

      // --- [3] Verify two RegExp instances with same pattern coexist as two key entries ---
      {
        let firstPattern: RegExp = new RegExp('a+', 'g');
        let secondPattern: RegExp = new RegExp('a+', 'g');
        let cache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        cache.put(firstPattern, 1);
        cache.put(secondPattern, 2);
        expect(cache.values()[0]).assertEqual(1);
        expect(cache.values()[1]).assertEqual(2);
      }

      // --- [4] Verify two Error instances with same message coexist as two key entries ---
      {
        let firstError: Error = new Error('boom');
        let secondError: Error = new Error('boom');
        let cache: util.LRUCache<Error, int> = new util.LRUCache<Error, int>();
        cache.put(firstError, 1);
        cache.put(secondError, 2);
        expect(cache.values()[0]).assertEqual(1);
        expect(cache.values()[1]).assertEqual(2);
      }

      // --- [5] Verify two Map instances with same content coexist as two key entries ---
      {
        let firstMap: Map<string, int> = new Map<string, int>();
        firstMap.set('a', 1);
        let secondMap: Map<string, int> = new Map<string, int>();
        secondMap.set('a', 1);
        let cache: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        cache.put(firstMap, 1);
        cache.put(secondMap, 2);
        expect(cache.values()[0]).assertEqual(1);
        expect(cache.values()[1]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0330
     * @tc.name testLruCachePut033
     * @tc.desc Merged batch (5 tests): [1] Verify two Set instances with same content coexist as two key entries | [2] Verify two class instances with same property coexist as two key entries | [3] Verify two Uin...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two Set instances with same content coexist as two key entries ---
      {
        let firstSet: Set<int> = new Set<int>();
        firstSet.add(1);
        let secondSet: Set<int> = new Set<int>();
        secondSet.add(1);
        let cache: util.LRUCache<Set<int>, int> = new util.LRUCache<Set<int>, int>();
        cache.put(firstSet, 1);
        cache.put(secondSet, 2);
        expect(cache.values()[0]).assertEqual(1);
        expect(cache.values()[1]).assertEqual(2);
      }

      // --- [2] Verify two class instances with same property coexist as two key entries ---
      {
        let firstBox: IntValueBox = new IntValueBox(7);
        let secondBox: IntValueBox = new IntValueBox(7);
        let cache: util.LRUCache<IntValueBox, string> = new util.LRUCache<IntValueBox, string>();
        cache.put(firstBox, 'a');
        cache.put(secondBox, 'b');
        expect(cache.values()[0]).assertEqual('a');
        expect(cache.values()[1]).assertEqual('b');
      }

      // --- [3] Verify two Uint8Array instances with same content coexist as two key entries ---
      {
        let firstBytes: Uint8Array = new Uint8Array([1, 2]);
        let secondBytes: Uint8Array = new Uint8Array([1, 2]);
        let cache: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        cache.put(firstBytes, 1);
        cache.put(secondBytes, 2);
        expect(cache.values()[0]).assertEqual(1);
        expect(cache.values()[1]).assertEqual(2);
      }

      // --- [4] Verify same Error reference repeated put triggers overwrite returning original value ---
      {
        let errorKey: Error = new Error('x');
        let cache: util.LRUCache<Error, int> = new util.LRUCache<Error, int>();
        cache.put(errorKey, 1);
        let previous: int | undefined = cache.put(errorKey, 2);
        expect(previous).assertEqual(1);
      }

      // --- [5] Verify two RegExp keys with different patterns coexist ---
      {
        let firstPattern: RegExp = new RegExp('a+');
        let secondPattern: RegExp = new RegExp('b+');
        let cache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        cache.put(firstPattern, 1);
        cache.put(secondPattern, 2);
        expect(cache.get(firstPattern)).assertEqual(1);
        expect(cache.get(secondPattern)).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0340
     * @tc.name testLruCachePut034
     * @tc.desc Merged batch (5 tests): [1] Verify a WeakMap reference key with its value inserts as a new entry | [2] Verify WeakSet instance key put is retrievable by same reference | [3] Verify a Record referen...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a WeakMap reference key with its value inserts as a new entry ---
      {
        let weakMapKey: WeakMap<object, int> = new WeakMap<object, int>();
        let cache: util.LRUCache<WeakMap<object, int>, int> = new util.LRUCache<WeakMap<object, int>, int>();
        let previous: int | undefined = cache.put(weakMapKey, 3);
        expect(previous).assertEqual(undefined);
        expect(cache.length).assertEqual(1);
      }

      // --- [2] Verify WeakSet instance key put is retrievable by same reference ---
      {
        let weakSetKey: WeakSet<object> = new WeakSet<object>();
        let cache: util.LRUCache<WeakSet<object>, int> = new util.LRUCache<WeakSet<object>, int>();
        cache.put(weakSetKey, 4);
        expect(cache.get(weakSetKey)).assertEqual(4);
      }

      // --- [3] Verify a Record reference key with its value inserts as a new entry ---
      {
        let recordKey: Record<string, int> = { 'a': 1 };
        let cache: util.LRUCache<Record<string, int>, int> = new util.LRUCache<Record<string, int>, int>();
        let previous: int | undefined = cache.put(recordKey, 5);
        expect(previous).assertEqual(undefined);
        expect(cache.length).assertEqual(1);
      }

      // --- [4] Verify same Uint8Array reference key put is retrievable by same reference ---
      {
        let bytesKey: Uint8Array = new Uint8Array([9, 8]);
        let cache: util.LRUCache<Uint8Array, string> = new util.LRUCache<Uint8Array, string>();
        cache.put(bytesKey, 'bytes');
        expect(cache.get(bytesKey)).assertEqual('bytes');
      }

      // --- [5] Verify same Set reference repeated put triggers overwrite returning original value ---
      {
        let setKey: Set<int> = new Set<int>();
        setKey.add(5);
        let cache: util.LRUCache<Set<int>, int> = new util.LRUCache<Set<int>, int>();
        cache.put(setKey, 1);
        let previous: int | undefined = cache.put(setKey, 2);
        expect(previous).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0350
     * @tc.name testLruCachePut035
     * @tc.desc Merged batch (5 tests): [1] Verify overwriting a key with Infinity value returns original Infinity | [2] Verify overwriting a key with -Infinity value returns original -Infinity | [3] Verify after ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting a key with Infinity value returns original Infinity ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, Double.POSITIVE_INFINITY);
        let previous: double | undefined = cache.put(1, 1.0);
        expect(previous).assertEqual(Double.POSITIVE_INFINITY);
      }

      // --- [2] Verify overwriting a key with -Infinity value returns original -Infinity ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, Double.NEGATIVE_INFINITY);
        let previous: double | undefined = cache.put(1, 2.0);
        expect(previous).assertEqual(Double.NEGATIVE_INFINITY);
      }

      // --- [3] Verify after eviction overwriting a surviving key returns that key original value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let previous: int | undefined = cache.put(2, 99);
        expect(previous).assertEqual(20);
      }

      // --- [4] Verify re-putting an evicted key is treated as new and returns undefined ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 10);
        cache.put(2, 20);
        let result: int | undefined = cache.put(1, 99);
        expect(result).assertEqual(undefined);
      }

      // --- [5] Verify eviction callback throw during put propagates out to the caller ---
      {
        let cache: ThrowOnEvict = new ThrowOnEvict(1);
        cache.put(1, 10);
        let threw: boolean = false;
        try {
          cache.put(2, 20);
          expect().assertFail();
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }
        expect(threw).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0360
     * @tc.name testLruCachePut036
     * @tc.desc Merged batch (5 tests): [1] Verify overwrite callback throw propagates out of put on existing key | [2] Verify cache remains usable after first callback throw and later put succeeds | [3] Verify pu...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwrite callback throw propagates out of put on existing key ---
      {
        let cache: ThrowOnEvict = new ThrowOnEvict(2);
        cache.put(1, 10);
        let threw: boolean = false;
        try {
          cache.put(1, 20);
          expect().assertFail();
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(threw).assertTrue();
      }

      // --- [2] Verify cache remains usable after first callback throw and later put succeeds ---
      {
        let thrown: boolean = false;
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            if (!thrown) {
              thrown = true;
              throw new Error('first');
            }
          },
          undefined,
          1);
        cache.put(1, 10);
        let threw: boolean = false;
        try {
          cache.put(2, 20);
          expect().assertFail();
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(threw).assertTrue();
        cache.put(3, 30);
        expect(cache.get(3)).assertEqual(30);
      }

      // --- [3] Verify put below capacity does not invoke afterRemoval keeping call count 0 ---
      {
        let calls: int = 0;
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            calls = calls + 1;
          },
          undefined,
          3);
        cache.put(1, 10);
        cache.put(2, 20);
        expect(calls).assertEqual(0);
      }

      // --- [4] Verify normal callback return does not disturb new key put returning undefined ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            return;
          },
          undefined,
          1);
        cache.put(1, 10);
        let result: int | undefined = cache.put(2, 20);
        expect(result).assertEqual(undefined);
      }

      // --- [5] Verify overwrite aborted by callback throw removes the entry leaving length 0 ---
      {
        let cache: ThrowOnEvict = new ThrowOnEvict(3);
        cache.put(1, 10);
        try {
          cache.put(1, 20);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(cache.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0370
     * @tc.name testLruCachePut037
     * @tc.desc Merged batch (5 tests): [1] Verify eviction callback throw does not block new key insertion and it stays readable | [2] Verify consecutive eviction callback throws both propagate accumulating catch...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify eviction callback throw does not block new key insertion and it stays readable ---
      {
        let cache: ThrowOnEvict = new ThrowOnEvict(1);
        cache.put(1, 10);
        try {
          cache.put(2, 20);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }
        expect(cache.length).assertEqual(2);
        expect(cache.get(2)).assertEqual(20);
      }

      // --- [2] Verify consecutive eviction callback throws both propagate accumulating catch count 2 ---
      {
        let cache: ThrowOnEvict = new ThrowOnEvict(1);
        cache.put(1, 10);
        let throwCount: int = 0;
        try {
          cache.put(2, 20);
          expect().assertFail();
        } catch (e) {
          throwCount = throwCount + 1;
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }
        try {
          cache.put(3, 30);
          expect().assertFail();
        } catch (e) {
          throwCount = throwCount + 1;
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }
        expect(throwCount).assertEqual(2);
      }

      // --- [3] Verify capacity 2 last two written keys remain readable after overflow ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.put(4, 40);
        cache.put(5, 50);
        expect(cache.get(4)).assertEqual(40);
        expect(cache.get(5)).assertEqual(50);
      }

      // --- [4] Verify values after overflow return in LRU order with least recent first ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.put(4, 40);
        let valueList: Array<int> = cache.values();
        expect(valueList[0]).assertEqual(20);
      }

      // --- [5] Verify large capacity 100 with 50 keys triggers no eviction and length 50 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(100);
        for (let i: int = 0; i < 50; i++) {
          cache.put(i, i);
        }
        expect(cache.length).assertEqual(50);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0380
     * @tc.name testLruCachePut038
     * @tc.desc Merged batch (5 tests): [1] Verify multiple overflows accumulate removal count to 3 for capacity 2 with five keys | [2] Verify first and second round overflows each evict the least recently used ke...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify multiple overflows accumulate removal count to 3 for capacity 2 with five keys ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        for (let key: int = 1; key <= 2; key++) {
          cache.put(key, key * 10);
        }
        cache.put(3, 30);
        let removalsAtThirdPut: long = cache.getRemovalCount();
        cache.put(4, 40);
        cache.put(5, 50);
        expect(removalsAtThirdPut).assertEqual(1);
        expect(cache.getRemovalCount()).assertEqual(3);
      }

      // --- [2] Verify first and second round overflows each evict the least recently used key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.get(1);
        cache.put(4, 40);
        cache.put(5, 50);
        expect(cache.get(2)).assertEqual(undefined);
        expect(cache.get(3)).assertEqual(undefined);
      }

      // --- [3] Verify the last inserted key stays retrievable after the cache overflows twice ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.get(1);
        cache.put(4, 40);
        cache.put(5, 50);
        expect(cache.get(5)).assertEqual(50);
      }

      // --- [4] Verify filling cache exactly to capacity keeps length equal to capacity without eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.length).assertEqual(3);
        expect(cache.contains(3)).assertTrue();
      }

      // --- [5] Verify all keys remain readable when cache is exactly at full capacity ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.get(3)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0390
     * @tc.name testLruCachePut039
     * @tc.desc Merged batch (5 tests): [1] Verify eviction callback receives the original class instance as value argument | [2] Verify two-argument put of a new key returns undefined and the key then reads back ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify eviction callback receives the original class instance as value argument ---
      {
        let removedTag: int = -1;
        let cache: ProbeCache<int, IntTagObj> = new ProbeCache<int, IntTagObj>(
          (self: util.LRUCache<int, IntTagObj>, isEvict: boolean, key: int, value: IntTagObj, newValue: IntTagObj | undefined) => {
            removedTag = value.tag;
          },
          undefined,
          1);
        let firstObj: IntTagObj = new IntTagObj(11);
        cache.put(1, firstObj);
        let secondObj: IntTagObj = new IntTagObj(22);
        cache.put(2, secondObj);
        expect(removedTag).assertEqual(11);
      }

      // --- [2] Verify two-argument put of a new key returns undefined and the key then reads back the stored value ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        let result: string | undefined = cache.put(1, 'one');
        expect(result).assertEqual(undefined);
        expect(cache.get(1)).assertEqual('one');
      }

      // --- [3] Verify two consecutive new-key puts accumulate length and getPutCount together ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'one');
        cache.put(2, 'two');
        expect(cache.length).assertEqual(2);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [4] Verify repeated put on the same key overwrites the old value while length stays 1 ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'a');
        cache.put(1, 'b');
        expect(cache.length).assertEqual(1);
        expect(cache.get(1)).assertEqual('b');
      }

      // --- [5] Verify different keys storing the same value stay independent without cross interference ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'same');
        cache.put(2, 'same');
        expect(cache.get(1)).assertEqual('same');
        expect(cache.get(2)).assertEqual('same');
        expect(cache.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0400
     * @tc.name testLruCachePut040
     * @tc.desc Merged batch (5 tests): [1] Verify two gets after put return the stored string value and accumulate match count to 2 | [2] Verify the same int value written under two different keys is stored indep...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two gets after put return the stored string value and accumulate match count to 2 ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'a');
        cache.get(1);
        let value: string | undefined = cache.get(1);
        expect(value).assertEqual('a');
        expect(cache.getMatchCount()).assertEqual(2);
      }

      // --- [2] Verify the same int value written under two different keys is stored independently ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('x', 5);
        cache.put('y', 5);
        expect(cache.get('x')).assertEqual(5);
        expect(cache.get('y')).assertEqual(5);
        expect(cache.length).assertEqual(2);
      }

      // --- [3] Verify put overwrite stores the whole new object value and get returns the new object tag ---
      {
        let cache: util.LRUCache<int, TagNode> = new util.LRUCache<int, TagNode>();
        cache.put(1, new TagNode('old'));
        cache.put(1, new TagNode('new'));
        let result: TagNode | undefined = cache.get(1);
        expect(result!.tag).assertEqual('new');
      }

      // --- [4] Verify a shared array value read from two keys reflects an external push in both ---
      {
        let shared: int[] = [9];
        let cache: util.LRUCache<string, int[]> = new util.LRUCache<string, int[]>();
        cache.put('a', shared);
        cache.put('b', shared);
        shared.push(8);
        let valueA: int[] | undefined = cache.get('a');
        let valueB: int[] | undefined = cache.get('b');
        expect(valueA![1]).assertEqual(8);
        expect(valueB![1]).assertEqual(8);
      }

      // --- [5] Verify new-key put returns undefined and the value is retrievable afterwards ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let result: int | undefined = cache.put(9, 99);
        expect(result).assertEqual(undefined);
        let got: int | undefined = cache.get(9);
        expect(got).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0410
     * @tc.name testLruCachePut041
     * @tc.desc Merged batch (5 tests): [1] Verify overwriting an existing key returns the original value 44 and stores the new value 55 | [2] Verify three sequential new-key puts each return undefined and length ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting an existing key returns the original value 44 and stores the new value 55 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(4, 44);
        let previous: int | undefined = cache.put(4, 55);
        expect(previous).assertEqual(44);
        let got: int | undefined = cache.get(4);
        expect(got).assertEqual(55);
      }

      // --- [2] Verify three sequential new-key puts each return undefined and length reaches 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let firstResult: int | undefined = cache.put(1, 10);
        let secondResult: int | undefined = cache.put(2, 20);
        let thirdResult: int | undefined = cache.put(3, 30);
        expect(firstResult).assertEqual(undefined);
        expect(secondResult).assertEqual(undefined);
        expect(thirdResult).assertEqual(undefined);
        expect(cache.length).assertEqual(3);
      }

      // --- [3] Verify overwrite put returns 66 and getPutCount accumulates to 2 together ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(6, 66);
        let result: int | undefined = cache.put(6, 77);
        expect(result).assertEqual(66);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [4] Verify overwrite of an existing key triggering afterRemoval propagates its thrown exception ---
      {
        let cache: ThrowOnEvict = new ThrowOnEvict();
        cache.put(1, 11);
        let threw: boolean = false;
        try {
          cache.put(1, 22);
          expect().assertFail();
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(threw).assertTrue();
      }

      // --- [5] Verify eviction callback throw propagates and aborts removal while the new key is inserted (length 2) ---
      {
        let cache: ThrowOnEvict = new ThrowOnEvict(1);
        cache.put(1, 11);
        let threw: boolean = false;
        try {
          cache.put(2, 22);
          expect().assertFail();
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }
        expect(threw).assertTrue();
        expect(cache.length).assertEqual(2);
        expect(cache.get(1)).assertEqual(11);
        expect(cache.get(2)).assertEqual(22);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0420
     * @tc.name testLruCachePut042
     * @tc.desc Merged batch (5 tests): [1] Verify put of a new key changes length state from 0 to 1 | [2] Verify put overwrite of an existing key keeps length state unchanged at 2 | [3] Verify put of a new key ch...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put of a new key changes length state from 0 to 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let lengthBefore: int = cache.length;
        cache.put(10, 100);
        expect(lengthBefore).assertEqual(0);
        expect(cache.length).assertEqual(1);
      }

      // --- [2] Verify put overwrite of an existing key keeps length state unchanged at 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(10, 100);
        cache.put(20, 200);
        let lengthBefore: int = cache.length;
        cache.put(10, 111);
        expect(lengthBefore).assertEqual(2);
        expect(cache.length).assertEqual(2);
      }

      // --- [3] Verify put of a new key changes getPutCount state from 0 to 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let countBefore: long = cache.getPutCount();
        cache.put(10, 100);
        expect(countBefore).assertEqual(0);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [4] Verify three puts that exactly fill capacity 3 trigger no eviction keeping getRemovalCount 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        let removalsWhileFilling: long[] = [];
        cache.put(10, 100);
        removalsWhileFilling.push(cache.getRemovalCount());
        cache.put(20, 200);
        removalsWhileFilling.push(cache.getRemovalCount());
        cache.put(30, 300);
        removalsWhileFilling.push(cache.getRemovalCount());
        expect(removalsWhileFilling[0]).assertEqual(0);
        expect(removalsWhileFilling[1]).assertEqual(0);
        expect(removalsWhileFilling[2]).assertEqual(0);
        expect(cache.length).assertEqual(3);
      }

      // --- [5] Verify put triggered eviction leaves getMissCount state untouched at 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(10, 100);
        let missesBeforeEviction: long = cache.getMissCount();
        cache.put(20, 200);
        let missesAfterEviction: long = cache.getMissCount();
        expect(missesBeforeEviction).assertEqual(0);
        expect(missesAfterEviction).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0430
     * @tc.name testLruCachePut043
     * @tc.desc Merged batch (5 tests): [1] Verify a put issued after a hit returns undefined for the new key and leaves the match count at 1 | [2] Verify put overwrite of an existing key keeps the toString state ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a put issued after a hit returns undefined for the new key and leaves the match count at 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let firstPutResult: int | undefined = cache.put(10, 100);
        cache.get(10);
        let matchesAfterHit: long = cache.getMatchCount();
        let secondPutResult: int | undefined = cache.put(20, 200);
        expect(firstPutResult).assertEqual(undefined);
        expect(matchesAfterHit).assertEqual(1);
        expect(secondPutResult).assertEqual(undefined);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [2] Verify put overwrite of an existing key keeps the toString state unchanged ---
      {
        let overwritten: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let directlyWritten: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        overwritten.put(10, 100);
        overwritten.get(10);
        directlyWritten.put(10, 111);
        directlyWritten.get(10);
        let textBeforeOverwrite: string = overwritten.toString();
        overwritten.put(10, 111);
        let textAfterOverwrite: string = overwritten.toString();
        expect(textAfterOverwrite).assertEqual(textBeforeOverwrite);
        expect(textAfterOverwrite).assertEqual(directlyWritten.toString());
      }

      // --- [3] Verify after putting three keys each get in order returns the value written to that key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 11);
        cache.put(2, 22);
        cache.put(3, 33);
        expect(cache.get(1)).assertEqual(11);
        expect(cache.get(2)).assertEqual(22);
        expect(cache.get(3)).assertEqual(33);
      }

      // --- [4] Verify overwriting returns the stored object value and keeps a single entry ---
      {
        let cache: util.LRUCache<string, NumPairA> = new util.LRUCache<string, NumPairA>();
        let stored: NumPairA = { a: 1, b: 2 };
        cache.put('k', stored);
        let previous: NumPairA | undefined = cache.put('k', { a: 9, b: 9 });
        expect(previous).assertEqual(stored);
        expect(cache.length).assertEqual(1);
      }

      // --- [5] Verify a put after a miss adds one entry without adding to the miss count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(9);
        let missesBeforePut: long = cache.getMissCount();
        let lengthBeforePut: int = cache.length;
        cache.put(10, 100);
        expect(missesBeforePut).assertEqual(1);
        expect(lengthBeforePut).assertEqual(0);
        expect(cache.getMissCount()).assertEqual(1);
        expect(cache.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0440
     * @tc.name testLruCachePut044
     * @tc.desc Merged batch (5 tests): [1] Verify hit get of an existing key after put bypasses createDefault keeping createCount 0 | [2] Verify nested put using an inner get result as value writes it so get(1) r...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify hit get of an existing key after put bypasses createDefault keeping createCount 0 ---
      {
        let createCountRec: int = 0;
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => {
            createCountRec = createCountRec + 1;
            return -1;
          });
        cache.put(5, 55);
        let createCountAfterPut: int = createCountRec;
        let got: int | undefined = cache.get(5);
        expect(got).assertEqual(55);
        expect(createCountAfterPut).assertEqual(0);
        expect(createCountRec).assertEqual(0);
      }

      // --- [2] Verify nested put using an inner get result as value writes it so get(1) returns 20 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 20);
        let inner: int = cache.get(2)!;
        let outer: int | undefined = cache.put(1, inner);
        expect(inner).assertEqual(20);
        expect(outer).assertEqual(undefined);
        expect(cache.get(1)).assertEqual(20);
      }

      // --- [3] Verify nested same-key overwrite chain writes the original value 10 back so cache value is 10 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let inner: int | undefined = cache.put(1, 11);
        let outer: int | undefined = cache.put(1, inner!);
        expect(inner).assertEqual(10);
        expect(outer).assertEqual(11);
        expect(cache.get(1)).assertEqual(10);
      }

      // --- [4] Verify put after updateCapacity shrink triggers one more eviction with length stable at 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(10, 100);
        cache.put(20, 200);
        cache.updateCapacity(1);
        cache.put(30, 300);
        expect(cache.length).assertEqual(1);
        expect(cache.getRemovalCount()).assertEqual(2);
      }

      // --- [5] Verify three same-key put returns follow the chain undefined, 11, 22 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let first: int | undefined = cache.put(1, 11);
        let second: int | undefined = cache.put(1, 22);
        let third: int | undefined = cache.put(1, 33);
        expect(first).assertEqual(undefined);
        expect(second).assertEqual(11);
        expect(third).assertEqual(22);
        expect(cache.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0450
     * @tc.name testLruCachePut045
     * @tc.desc Merged batch (5 tests): [1] Verify eviction callback records evicted keys in order 10 then 20 on capacity 1 | [2] Verify afterRemoval counter counts a manual remove plus one capacity eviction | [3]...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify eviction callback records evicted keys in order 10 then 20 on capacity 1 ---
      {
        let evictedRec: int[] = [];
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            if (isEvict) {
              evictedRec.push(key);
            }
          },
          undefined,
          1);
        cache.put(10, 100);
        cache.put(20, 200);
        cache.put(30, 300);
        expect(evictedRec[0]).assertEqual(10);
        expect(evictedRec[1]).assertEqual(20);
      }

      // --- [2] Verify afterRemoval counter counts a manual remove plus one capacity eviction ---
      {
        let cache: CounterCache = new CounterCache(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.remove(2);
        cache.put(3, 30);
        cache.put(4, 40);
        expect(cache.removalTotal).assertEqual(2);
        expect(cache.length).assertEqual(2);
      }

      // --- [3] Verify createDefault reads external map state returning the configured default 99 on miss ---
      {
        let source: Map<int, int> = new Map<int, int>();
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => {
            let d: int | undefined = source.get(key);
            if (d === undefined) {
              return 0;
            }
            return d;
          });
        source.set(9, 99);
        cache.put(1, 11);
        let got: int | undefined = cache.get(9);
        expect(got).assertEqual(99);
      }

      // --- [4] Verify afterRemoval call count stays consistent with getRemovalCount state ---
      {
        let cache: CounterCache = new CounterCache(1);
        cache.put(10, 100);
        cache.put(20, 200);
        cache.put(30, 300);
        expect(cache.removalTotal).assertEqual(cache.getRemovalCount());
      }

      // --- [5] Verify overwrite afterRemoval passes isEvict false, old value 55 and new value 66 ---
      {
        let oldValue: int = -1;
        let newValueArg: int | undefined = -1;
        let isEvictArg: boolean = false;
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            oldValue = value;
            newValueArg = newValue;
            isEvictArg = isEvict;
          });
        cache.put(5, 55);
        cache.put(5, 66);
        expect(oldValue).assertEqual(55);
        expect(newValueArg).assertEqual(66);
        expect(isEvictArg).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0460
     * @tc.name testLruCachePut046
     * @tc.desc Merged batch (5 tests): [1] Verify eviction afterRemoval passes undefined as newValue argument | [2] Verify values snapshot taken before put stays length 2 without the new key while cache length is...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify eviction afterRemoval passes undefined as newValue argument ---
      {
        let evictedNewValue: int | null | undefined = -1;
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            if (isEvict) {
              evictedNewValue = newValue;
            }
          },
          undefined,
          1);
        cache.put(1, 11);
        cache.put(2, 22);
        expect(evictedNewValue).assertEqual(undefined);
      }

      // --- [2] Verify values snapshot taken before put stays length 2 without the new key while cache length is 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 11);
        cache.put(2, 22);
        let snapshot: Array<int> = cache.values();
        cache.put(3, 33);
        expect(snapshot.length).assertEqual(2);
        expect(cache.length).assertEqual(3);
      }

      // --- [3] Verify put inside iteration over a values snapshot leaves snapshot length at 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 11);
        cache.put(2, 22);
        let items: Array<int> = cache.values();
        for (let i: int = 0; i < items.length; i++) {
          cache.put(3, 33);
        }
        expect(items.length).assertEqual(2);
        expect(cache.length).assertEqual(3);
      }

      // --- [4] Verify iterator created before put collects the final 2 entries after eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 11);
        cache.put(2, 22);
        let iter: Iterable<[int, int]> = cache.$_iterator();
        cache.put(3, 33);
        let items: [int, int][] = Array.from(iter);
        expect(items[0][0]).assertEqual(2);
        expect(items[1][0]).assertEqual(3);
        expect(items[1][1]).assertEqual(33);
      }

      // --- [5] Verify values after three puts return in LRU order from least to most recently used ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 11);
        cache.put(2, 22);
        cache.put(3, 33);
        let valueList: Array<int> = cache.values();
        expect(valueList[0]).assertEqual(11);
        expect(valueList[1]).assertEqual(22);
        expect(valueList[2]).assertEqual(33);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0470
     * @tc.name testLruCachePut047
     * @tc.desc Merged batch (5 tests): [1] Verify get reorders recency so a following put evicts the least recently used key 2 | [2] Verify overwrite counts as an access so a following put evicts the untouched ke...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get reorders recency so a following put evicts the least recently used key 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 11);
        cache.put(2, 22);
        cache.get(1);
        cache.put(3, 33);
        expect(cache.get(2)).assertEqual(undefined);
        expect(cache.get(1)).assertEqual(11);
        expect(cache.get(3)).assertEqual(33);
      }

      // --- [2] Verify overwrite counts as an access so a following put evicts the untouched key 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 11);
        cache.put(2, 22);
        cache.put(1, 99);
        cache.put(3, 33);
        expect(cache.get(2)).assertEqual(undefined);
        expect(cache.get(1)).assertEqual(99);
      }

      // --- [3] Verify pure put sequence on capacity 3 evicts the least recently used key 1 keeping key 4 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 11);
        cache.put(2, 22);
        cache.put(3, 33);
        cache.put(4, 44);
        expect(cache.get(1)).assertEqual(undefined);
        expect(cache.get(4)).assertEqual(44);
      }

      // --- [4] Verify overwriting a key that holds int max value returns 2147483647 unchanged ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 2147483647);
        let previous: int | undefined = cache.put(1, 5);
        expect(previous).assertEqual(2147483647);
      }

      // --- [5] Verify int min value re-stored after an intermediate overwrite is read back unchanged ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, -2147483648);
        cache.put(1, 5);
        cache.put(1, -2147483648);
        expect(cache.get(1)).assertEqual(-2147483648);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0480
     * @tc.name testLruCachePut048
     * @tc.desc Merged batch (5 tests): [1] Verify combined int max key with int min value round trips completely | [2] Verify put then get round-trips the bigint max value 9223372036854775807n exactly | [3] Verif...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify combined int max key with int min value round trips completely ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2147483647, -2147483648);
        let got: int | undefined = cache.get(2147483647);
        expect(got).assertEqual(-2147483648);
      }

      // --- [2] Verify put then get round-trips the bigint max value 9223372036854775807n exactly ---
      {
        let cache: util.LRUCache<int, bigint> = new util.LRUCache<int, bigint>();
        cache.put(1, 9223372036854775807n);
        let v: bigint | undefined = cache.get(1);
        expect(v).assertEqual(9223372036854775807n);
      }

      // --- [3] Verify put then get round-trips the bigint min value -9223372036854775808n exactly ---
      {
        let cache: util.LRUCache<int, bigint> = new util.LRUCache<int, bigint>();
        cache.put(1, -9223372036854775808n);
        let v: bigint | undefined = cache.get(1);
        expect(v).assertEqual(-9223372036854775808n);
      }

      // --- [4] Verify double value 1.5 round trips keeping floating point precision ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        let value: double = 1.5;
        cache.put(1, value);
        let got: double | undefined = cache.get(1);
        expect(got).assertEqual(value);
      }

      // --- [5] Verify large double value 1e308 round trips without overflow truncation ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, 1e308);
        let got: double | undefined = cache.get(1);
        expect(got).assertEqual(1e308);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0490
     * @tc.name testLruCachePut049
     * @tc.desc Merged batch (5 tests): [1] Verify int max and int min keys coexist without cross values | [2] Verify key 0 and int max key coexist with values 0 and 2147483647 both intact | [3] Verify second put ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify int max and int min keys coexist without cross values ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2147483647, 111);
        cache.put(-2147483648, 222);
        expect(cache.get(2147483647)).assertEqual(111);
        expect(cache.get(-2147483648)).assertEqual(222);
      }

      // --- [2] Verify key 0 and int max key coexist with values 0 and 2147483647 both intact ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(0, 0);
        cache.put(2147483647, 2147483647);
        expect(cache.get(0)).assertEqual(0);
        expect(cache.get(2147483647)).assertEqual(2147483647);
      }

      // --- [3] Verify second put on minimum capacity 1 triggers eviction returning undefined with old key invisible ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 11);
        let result: int | undefined = cache.put(2, 22);
        expect(result).assertEqual(undefined);
        expect(cache.length).assertEqual(1);
        expect(cache.get(1)).assertEqual(undefined);
      }

      // --- [4] Verify int max capacity 2147483647 holds multiple puts without eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        cache.put(1, 11);
        cache.put(2, 22);
        cache.put(3, 33);
        expect(cache.length).assertEqual(3);
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [5] Verify three puts on capacity 1 evict entries equal to the overflow count of 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 11);
        cache.put(2, 22);
        cache.put(3, 33);
        expect(cache.getRemovalCount()).assertEqual(2);
        expect(cache.contains(1)).assertFalse();
        expect(cache.contains(3)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0500
     * @tc.name testLruCachePut050
     * @tc.desc Merged batch (5 tests): [1] Verify int key stores double value 7.5 completely while a neighboring key misses | [2] Verify put with bigint key 9007199254740993n beyond double safe integer then get r...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify int key stores double value 7.5 completely while a neighboring key misses ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(7, 7.5);
        let got: double | undefined = cache.get(7);
        expect(got).assertEqual(7.5);
        expect(cache.get(8)).assertEqual(undefined);
      }

      // --- [2] Verify put with bigint key 9007199254740993n beyond double safe integer then get returns the stored int value ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        cache.put(9007199254740993n, 1);
        let v: int | undefined = cache.get(9007199254740993n);
        expect(v).assertEqual(1);
      }

      // --- [3] Verify boolean keys true and false coexist each retrieving the correct value ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(true, 1);
        cache.put(false, 0);
        expect(cache.get(true)).assertEqual(1);
        expect(cache.get(false)).assertEqual(0);
      }

      // --- [4] Verify string key stores and retrieves value completely ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('alpha', 1);
        let got: int | undefined = cache.get('alpha');
        expect(got).assertEqual(1);
      }

      // --- [5] Verify a fractional double key 2.5 with its value inserts as a new entry ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        let key: double = 2.5;
        let previous: int | undefined = cache.put(key, 1);
        expect(previous).assertEqual(undefined);
        expect(cache.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0510
     * @tc.name testLruCachePut051
     * @tc.desc Merged batch (5 tests): [1] Verify equal-millisecond Date keys with different references are distinct so get by the other reference misses | [2] Verify Date key with a different millisecond value m...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify equal-millisecond Date keys with different references are distinct so get by the other reference misses ---
      {
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        let firstDate: Date = new Date(1700000000000);
        let secondDate: Date = new Date(1700000000000);
        cache.put(firstDate, 1);
        let got: int | undefined = cache.get(secondDate);
        expect(got).assertEqual(undefined);
        expect(cache.get(firstDate)).assertEqual(1);
      }

      // --- [2] Verify Date key with a different millisecond value misses and get returns undefined ---
      {
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        let firstDate: Date = new Date(1700000000000);
        let secondDate: Date = new Date(1700000000001);
        cache.put(firstDate, 1);
        let got: int | undefined = cache.get(secondDate);
        expect(got).assertEqual(undefined);
      }

      // --- [3] Verify the same Date reference instance put and get hits returning 5 ---
      {
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        let dateKey: Date = new Date(1700000000000);
        cache.put(dateKey, 5);
        let got: int | undefined = cache.get(dateKey);
        expect(got).assertEqual(5);
      }

      // --- [4] Verify equal-millisecond Date keys with different references are separate entries so second put returns undefined ---
      {
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        let firstDate: Date = new Date(1700000000000);
        let secondDate: Date = new Date(1700000000000);
        cache.put(firstDate, 1);
        let result: int | undefined = cache.put(secondDate, 2);
        expect(result).assertEqual(undefined);
        expect(cache.length).assertEqual(2);
        expect(cache.get(firstDate)).assertEqual(1);
        expect(cache.get(secondDate)).assertEqual(2);
      }

      // --- [5] Verify RegExp keys with the same pattern but different instances miss by reference equality ---
      {
        let cache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        let firstPattern: RegExp = new RegExp('ab+c');
        let secondPattern: RegExp = new RegExp('ab+c');
        cache.put(firstPattern, 1);
        let got: int | undefined = cache.get(secondPattern);
        expect(got).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0520
     * @tc.name testLruCachePut052
     * @tc.desc Merged batch (5 tests): [1] Verify class instance keys use reference identity so same instance hits and same-content different instance misses | [2] Verify the same class instance as value of two k...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify class instance keys use reference identity so same instance hits and same-content different instance misses ---
      {
        let cache: util.LRUCache<IntValueBox, int> = new util.LRUCache<IntValueBox, int>();
        let firstKey: IntValueBox = new IntValueBox(1);
        let secondKey: IntValueBox = new IntValueBox(1);
        cache.put(firstKey, 10);
        expect(cache.get(firstKey)).assertEqual(10);
        expect(cache.get(secondKey)).assertEqual(undefined);
      }

      // --- [2] Verify the same class instance as value of two keys reflects an external field change in both ---
      {
        let cache: util.LRUCache<int, IntValueBox> = new util.LRUCache<int, IntValueBox>();
        let sharedBox: IntValueBox = new IntValueBox(1);
        cache.put(1, sharedBox);
        cache.put(2, sharedBox);
        sharedBox.value = 99;
        let firstBox: IntValueBox | undefined = cache.get(1);
        let secondBox: IntValueBox | undefined = cache.get(2);
        expect(firstBox!.value).assertEqual(99);
        expect(secondBox!.value).assertEqual(99);
      }

      // --- [3] Verify object literal value is returned by the same reference with fields intact ---
      {
        let point: IntPoint = { x: 1, y: 2 };
        let cache: util.LRUCache<int, IntPoint> = new util.LRUCache<int, IntPoint>();
        cache.put(1, point);
        let result: IntPoint | undefined = cache.get(1);
        expect(result!.x).assertEqual(1);
        expect(result!.y).assertEqual(2);
      }

      // --- [4] Verify nested Map value stays queryable after put and get ---
      {
        let inner: Map<string, int> = new Map<string, int>();
        inner.set('k', 1);
        let cache: util.LRUCache<int, Map<string, int>> = new util.LRUCache<int, Map<string, int>>();
        cache.put(1, inner);
        let result: Map<string, int> | undefined = cache.get(1);
        expect(result!.get('k')).assertEqual(1);
      }

      // --- [5] Verify array value reflects an external push so get returns the grown length ---
      {
        let items: int[] = [1, 2, 3];
        let cache: util.LRUCache<int, int[]> = new util.LRUCache<int, int[]>();
        cache.put(1, items);
        items.push(4);
        let result: int[] | undefined = cache.get(1);
        expect(result!.length).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0530
     * @tc.name testLruCachePut053
     * @tc.desc Merged batch (5 tests): [1] Verify string value get of a missing key without createDefault override returns undefined | [2] Verify int key 1 and double key 1.0 are SameValueZero-equivalent numeric ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify string value get of a missing key without createDefault override returns undefined ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'x');
        let got: string | undefined = cache.get(99);
        expect(got).assertEqual(undefined);
      }

      // --- [2] Verify int key 1 and double key 1.0 are SameValueZero-equivalent numeric keys: second put overwrites value 10 with 20 under one entry ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(1, 10);
        let old: int | undefined = cache.put(1.0, 20);
        expect(old).assertEqual(10);
        expect(cache.length).assertEqual(1);
        expect(cache.get(1)).assertEqual(20);
        expect(cache.get(1.0)).assertEqual(20);
      }

      // --- [3] Verify -0.0 then 0.0 merge under SameValueZero, put returns old value 111 and get returns the later value 222 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(-0.0, 111);
        let old: int | undefined = cache.put(0.0, 222);
        expect(old).assertEqual(111);
        expect(cache.length).assertEqual(1);
        expect(cache.get(0)).assertEqual(222);
      }

      // --- [4] Verify overwriting a NaN key returns the previous value 1, length stays 1 and new value 2 is retrievable under NaN ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.NaN, 1);
        let old: int | undefined = cache.put(Double.NaN, 2);
        expect(old).assertEqual(1);
        expect(cache.length).assertEqual(1);
        expect(cache.get(Double.NaN)).assertEqual(2);
      }

      // --- [5] Verify put reads keys and values row by row from a 2D array data source and stores all three entries ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let rows: int[][] = [[1, 10], [2, 20], [3, 30]];
        for (let i: int = 0; i < rows.length; i++) {
          cache.put(rows[i][0], rows[i][1]);
        }
        expect(cache.length).assertEqual(3);
        expect(cache.get(1)).assertEqual(10);
        expect(cache.get(2)).assertEqual(20);
        expect(cache.get(3)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0540
     * @tc.name testLruCachePut054
     * @tc.desc Merged batch (5 tests): [1] Verify put reads keys and values separately from a key array and a value array and pairs them by index | [2] Verify put in a loop reading entries from another LRUCache c...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put reads keys and values separately from a key array and a value array and pairs them by index ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let keyArr: string[] = ['a', 'b', 'c'];
        let valArr: int[] = [1, 2, 3];
        for (let i: int = 0; i < keyArr.length; i++) {
          cache.put(keyArr[i], valArr[i]);
        }
        expect(cache.length).assertEqual(3);
        expect(cache.get('a')).assertEqual(1);
        expect(cache.get('b')).assertEqual(2);
        expect(cache.get('c')).assertEqual(3);
      }

      // --- [2] Verify put in a loop reading entries from another LRUCache container copies all key-value pairs into a fresh cache ---
      {
        let src: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        src.put('x', 100);
        src.put('y', 200);
        src.put('z', 300);
        let dst: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        for (let pair of src.entries()) {
          dst.put(pair[0], pair[1]);
        }
        expect(dst.length).assertEqual(3);
        expect(dst.get('x')).assertEqual(100);
        expect(dst.get('z')).assertEqual(300);
        expect(src.length).assertEqual(3);
      }

      // --- [3] Verify put after updateCapacity grow keeps existing entries and accepts new keys without any eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 11);
        cache.put(2, 22);
        cache.updateCapacity(4);
        cache.put(3, 33);
        cache.put(4, 44);
        expect(cache.length).assertEqual(4);
        expect(cache.get(1)).assertEqual(11);
        expect(cache.get(4)).assertEqual(44);
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [4] Verify remaining capacity decreases by one for each put into an empty cache until full then stays zero on overfill ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        expect(cache.getCapacity() - cache.length).assertEqual(5);
        cache.put(1, 11);
        expect(cache.getCapacity() - cache.length).assertEqual(4);
        cache.put(2, 22);
        cache.put(3, 33);
        expect(cache.getCapacity() - cache.length).assertEqual(2);
        cache.put(4, 44);
        cache.put(5, 55);
        expect(cache.getCapacity() - cache.length).assertEqual(0);
        cache.put(6, 66);
        expect(cache.getCapacity() - cache.length).assertEqual(0);
        expect(cache.length).assertEqual(5);
      }

      // --- [5] Verify overwriting an existing key leaves remaining capacity unchanged while a new key consumes one slot ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(4);
        cache.put('a', 1);
        cache.put('b', 2);
        expect(cache.getCapacity() - cache.length).assertEqual(2);
        cache.put('a', 10);
        cache.put('b', 20);
        expect(cache.length).assertEqual(2);
        expect(cache.getCapacity() - cache.length).assertEqual(2);
        cache.put('c', 3);
        expect(cache.getCapacity() - cache.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0550
     * @tc.name testLruCachePut055
     * @tc.desc Merged batch (5 tests): [1] Verify put treats an overflow-produced int key (INT_MAX + 1) as the same key as the literal INT_MIN, returning the previous value and keeping a single slot | [2] Verify ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put treats an overflow-produced int key (INT_MAX + 1) as the same key as the literal INT_MIN, returning the previous value and keeping a single slot ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        let mx: int = 2147483647;
        let wrappedUp: int = mx + 1;
        cache.put(-2147483648, 11);
        let oldValue: int | undefined = cache.put(wrappedUp, 22);
        expect(oldValue).assertEqual(11);
        expect(cache.length).assertEqual(1);
      }

      // --- [2] Verify long keys -1 and 4294967295 (2^32 - 1) share the low 32 bits 0xFFFFFFFF yet stay distinct entries with independent values ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>(4);
        let lo: long = -1;
        let hi: long = 4294967295;
        cache.put(lo, 11);
        cache.put(hi, 22);
        expect(cache.length).assertEqual(2);
        expect(cache.get(lo)).assertEqual(11);
        expect(cache.get(hi)).assertEqual(22);
      }

      // --- [3] Verify put with emoji surrogate pair string key and value inserts entries ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        let emojiKey: string = '😀';
        let emojiValue: string = '😀';
        cache.put(emojiKey, 'plain');
        cache.put('plain', emojiValue);

        expect(emojiKey.length).assertEqual(2);
        expect(emojiValue.length).assertEqual(2);
        expect(cache.length).assertEqual(2);
        expect(cache.get(emojiKey)).assertEqual('plain');
        expect(cache.get('plain')).assertEqual(emojiValue);
      }

      // --- [4] Verify put with enum key and enum value inserts and retrieves entries ---
      {
        let cache: util.LRUCache<SlotRank, SlotRank> = new util.LRUCache<SlotRank, SlotRank>(2);
        cache.put(SlotRank.High, SlotRank.Low);
        cache.put(SlotRank.Mid, SlotRank.High);

        expect(cache.length).assertEqual(2);
        expect(cache.get(SlotRank.High)).assertEqual(SlotRank.Low);
        expect(cache.get(SlotRank.Mid)).assertEqual(SlotRank.High);
        expect(cache.contains(SlotRank.Mid)).assertTrue();
      }

      // --- [5] Verify put through a mutated object key overwrites the same entry without growing the cache and leaves the sibling entry intact ---
      {
        let keep: IntTagObj = new IntTagObj(4);
        let k: IntTagObj = new IntTagObj(3);
        let cache: util.LRUCache<IntTagObj, int> = new util.LRUCache<IntTagObj, int>(5);

        cache.put(keep, 40);
        cache.put(k, 10);
        k.tag = 300;
        cache.put(k, 20);
        expect(cache.length).assertEqual(2);
        expect(cache.get(k)).assertEqual(20);
        expect(cache.get(keep)).assertEqual(40);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0560
     * @tc.name testLruCachePut056
     * @tc.desc Merged batch (5 tests): [1] Verify three visually blank strings of length zero one and two are stored as three distinct keys | [2] Verify put returns undefined for each new invisible key and contai...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three visually blank strings of length zero one and two are stored as three distinct keys ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('', 0);
        cache.put(' ', 1);
        cache.put('  ', 2);
        expect(cache.length).assertEqual(3);
        let ks: string[] = cache.keys();
        expect(ks[0].length).assertEqual(0);
        expect(ks[1].length).assertEqual(1);
        expect(ks[2].length).assertEqual(2);
        expect(cache.get('')).assertEqual(0);
        expect(cache.get(' ')).assertEqual(1);
        expect(cache.get('  ')).assertEqual(2);
      }

      // --- [2] Verify put returns undefined for each new invisible key and contains confirms all three are present ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let first: int | undefined = cache.put('\u0000', 10);
        let second: int | undefined = cache.put('\u200B', 20);
        cache.put('\uFEFF', 30);
        expect(first).assertEqual(undefined);
        expect(second).assertEqual(undefined);
        expect(cache.length).assertEqual(3);
        expect(cache.contains('\u0000')).assertTrue();
        expect(cache.contains('\u200B')).assertTrue();
        expect(cache.contains('\uFEFF')).assertTrue();
      }

      // --- [3] Verify two double keys colliding once rounded to the 2^53 precision limit overwrite one entry ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        let base: double = 9007199254740992.0;
        let rounded: double = 9007199254740993.0;
        cache.put(base, 10);
        let previous: int | undefined = cache.put(rounded, 20);
        expect(previous).assertEqual(10);
        expect(cache.length).assertEqual(1);
        expect(cache.get(base)).assertEqual(20);
      }

      // --- [4] Verify an emoji surrogate pair key and its two lone surrogate halves are three distinct keys ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let pair: string = '😀';
        cache.put(pair, 1);
        cache.put('\uD83D', 2);
        cache.put('\uDE00', 3);
        expect(pair.length).assertEqual(2);
        expect(cache.length).assertEqual(3);
        expect(cache.get(pair)).assertEqual(1);
        expect(cache.get('\uD83D')).assertEqual(2);
        expect(cache.get('\uDE00')).assertEqual(3);
      }

      // --- [5] Verify blank strings of different lengths are evicted separately when capacity two overflows ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(2);
        cache.put('', 0);
        cache.put(' ', 1);
        cache.put('  ', 2);
        expect(cache.length).assertEqual(2);
        expect(cache.contains('')).assertFalse();
        expect(cache.contains(' ')).assertTrue();
        expect(cache.get('  ')).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PUT_0570
     * @tc.name testLruCachePut057
     * @tc.desc Merged batch (3 tests): [1] Verify three distinct LRUCache instances are stored as values and overwriting a key returns the replaced instance | [2] Verify cache instances work as outer cache keys a...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCachePut057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three distinct LRUCache instances are stored as values and overwriting a key returns the replaced instance ---
      {
        let outer: util.LRUCache<int, util.LRUCache<int, int>> = new util.LRUCache<int, util.LRUCache<int, int>>(4);
        let first: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        let second: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        let third: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        expect(outer.put(10, first)).assertEqual(undefined);
        expect(outer.put(20, second)).assertEqual(undefined);
        expect(outer.put(30, third)).assertEqual(undefined);
        expect(outer.length).assertEqual(3);
        expect(outer.put(20, first)).assertEqual(second);
      }

      // --- [2] Verify cache instances work as outer cache keys and overwriting one returns the prior string ---
      {
        let ownerA: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        ownerA.put(1, 1);
        let ownerB: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        ownerB.put(2, 2);
        let index: util.LRUCache<util.LRUCache<int, int>, string> =
          new util.LRUCache<util.LRUCache<int, int>, string>(3);
        expect(index.put(ownerA, 'alpha')).assertEqual(undefined);
        expect(index.put(ownerB, 'beta')).assertEqual(undefined);
        expect(index.length).assertEqual(2);
        expect(index.put(ownerA, 'gamma')).assertEqual('alpha');
        expect(index.length).assertEqual(2);
      }

      // --- [3] Verify a subclass cache instance stored as a value is cast back to its subclass type ---
      {
        let counted: CounterCache = new CounterCache(1);
        counted.put(1, 10);
        counted.put(2, 20);
        let shelf: util.LRUCache<string, util.LRUCache<int, int>> =
          new util.LRUCache<string, util.LRUCache<int, int>>(2);
        shelf.put('slot', counted);
        let back: CounterCache = shelf.get('slot')! as CounterCache;
        expect(back.removalTotal).assertEqual(1);
        expect(back.length).assertEqual(1);
      }
    });

  });
}
