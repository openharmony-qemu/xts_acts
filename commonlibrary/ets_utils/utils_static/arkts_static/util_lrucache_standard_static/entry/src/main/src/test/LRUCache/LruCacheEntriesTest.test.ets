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

interface TagNode {
  tag: string;
}

class Point {
  x: int = 0;
  y: int = 0;
  constructor(x: int, y: int) {
    this.x = x;
    this.y = y;
  }
}

interface DataNode {
  id: int;
}

class ValNode {
  val: int = 0;
  constructor(val: int) {
    this.val = val;
  }
}

class EntryValue {
  a: int = 0;
  b: string = '';
}

enum EntSlot {
  First = 0,
  Second = 1
}

export default function lruCacheEntriesTest(): void {
  describe('LruCacheEntriesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0010
     * @tc.name testLruCacheEntries001
     * @tc.desc Merged batch (5 tests): [1] Verify entries without argument returns iterator collecting two pairs | [2] Verify entries without argument returns iterable consumed by for..of counting one pair | [3] ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries without argument returns iterator collecting two pairs ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.put(3, 15);
        let pair: IterableIterator<[int, int]> = cache.entries();
        let arr: Array<[int, int]> = Array.from(pair);
        expect(arr.length).assertEqual(2);
        expect(arr[1][0]).assertEqual(3);
        expect(arr[1][1]).assertEqual(15);
      }

      // --- [2] Verify entries without argument returns iterable consumed by for..of counting one pair ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(5, 50);
        let pair: IterableIterator<[int, int]> = cache.entries();
        let count: int = 0;
        for (let p of pair) {
          expect(p.length).assertEqual(2);
          count++;
        }
        expect(count).assertEqual(1);
      }

      // --- [3] Verify two independent entries calls on same cache iterate consistent pairs ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(7, 70);
        cache.put(8, 80);
        let firstIter: IterableIterator<[int, int]> = cache.entries();
        let secondIter: IterableIterator<[int, int]> = cache.entries();
        let firstPairs: Array<[int, int]> = Array.from(firstIter);
        let secondPairs: Array<[int, int]> = Array.from(secondIter);
        expect(firstPairs.length).assertEqual(2);
        expect(secondPairs.length).assertEqual(firstPairs.length);
        expect(secondPairs[0][0]).assertEqual(firstPairs[0][0]);
        expect(secondPairs[0][1]).assertEqual(firstPairs[0][1]);
        expect(secondPairs[1][0]).assertEqual(firstPairs[1][0]);
        expect(secondPairs[1][1]).assertEqual(firstPairs[1][1]);
      }

      // --- [4] Verify entries call does not change cache length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 11);
        let before: int = cache.length;
        cache.entries();
        let after: int = cache.length;
        expect(after).assertEqual(before);
      }

      // --- [5] Verify entries keeps both runtime key types of a union key cache in insertion order ---
      {
        let cache: util.LRUCache<string | double, int> = new util.LRUCache<string | double, int>();
        cache.put('a', 1);
        cache.put(2, 2);
        let arr: Array<[string | double, int]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual('a');
        expect(arr[0][1]).assertEqual(1);
        expect(arr[1][0]).assertEqual(2);
        expect(arr[1][1]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0020
     * @tc.name testLruCacheEntries002
     * @tc.desc Merged batch (5 tests): [1] Verify entries pair with value 0 returns 0 | [2] Verify entries pair with int max value 2147483647 returns it | [3] Verify entries pair with int min value -2147483648 re...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries pair with value 0 returns 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(9, 0);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        let pair: [int, int] = arr[0];
        expect(pair[1]).assertEqual(0);
      }

      // --- [2] Verify entries pair with int max value 2147483647 returns it ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(9, 2147483647);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(1);
        expect(arr[0][1]).assertEqual(2147483647);
      }

      // --- [3] Verify entries pair with int min value -2147483648 returns it ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(9, -2147483648);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(-2147483648);
      }

      // --- [4] Verify entries pair with key 0 value -5 returns key and value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(0, -5);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual(0);
        expect(arr[0][1]).assertEqual(-5);
      }

      // --- [5] Verify entries with negative and positive pairs keeps insertion order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-3, -30);
        cache.put(4, 40);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual(-3);
        expect(arr[0][1]).assertEqual(-30);
        expect(arr[1][0]).assertEqual(4);
        expect(arr[1][1]).assertEqual(40);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0030
     * @tc.name testLruCacheEntries003
     * @tc.desc Merged batch (5 tests): [1] Verify entries with key -1 and 0 pairs keeps insertion order | [2] Verify entries pair with NaN value keeps NaN judged by isNaN | [3] Verify entries pair with Infinity v...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries with key -1 and 0 pairs keeps insertion order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-1, 100);
        cache.put(0, 200);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual(-1);
        expect(arr[0][1]).assertEqual(100);
        expect(arr[1][0]).assertEqual(0);
        expect(arr[1][1]).assertEqual(200);
      }

      // --- [2] Verify entries pair with NaN value keeps NaN judged by isNaN ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, Double.NaN);
        let arr: Array<[int, double]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(1);
        expect(isNaN(arr[0][1])).assertTrue();
      }

      // --- [3] Verify entries pair with Infinity value returns Infinity ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, Double.POSITIVE_INFINITY);
        let arr: Array<[int, double]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(Double.POSITIVE_INFINITY);
      }

      // --- [4] Verify entries pair with -Infinity value returns -Infinity ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, Double.NEGATIVE_INFINITY);
        let arr: Array<[int, double]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(Double.NEGATIVE_INFINITY);
      }

      // --- [5] Verify entries pair with -0 value normalizes to 0 ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, -0);
        let arr: Array<[int, double]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0040
     * @tc.name testLruCacheEntries004
     * @tc.desc Merged batch (5 tests): [1] Verify entries pair with decimal 0.1 value returns it | [2] Verify entries pair with Number.MAX_VALUE returns it | [3] Verify entries pair with Number.MIN_VALUE returns ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries pair with decimal 0.1 value returns it ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        let value: double = 0.1;
        cache.put(1, value);
        let arr: Array<[int, double]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(value);
      }

      // --- [2] Verify entries pair with Number.MAX_VALUE returns it ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, Number.MAX_VALUE);
        let arr: Array<[int, double]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(Number.MAX_VALUE);
      }

      // --- [3] Verify entries pair with Number.MIN_VALUE returns it ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, Number.MIN_VALUE);
        let arr: Array<[int, double]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(Number.MIN_VALUE);
      }

      // --- [4] Verify entries pair with ordinary long 123 value returns it ---
      {
        let cache: util.LRUCache<long, long> = new util.LRUCache<long, long>();
        cache.put(1, 123);
        let arr: Array<[long, long]> = Array.from(cache.entries());
        let key: long = arr[0][0];
        expect(key).assertEqual(1);
        expect(arr[0][1]).assertEqual(123);
      }

      // --- [5] Verify entries pair with long max 9223372036854775807 value returns it ---
      {
        let cache: util.LRUCache<long, long> = new util.LRUCache<long, long>();
        let maxLong: long = 9223372036854775807;
        cache.put(1, maxLong);
        let arr: Array<[long, long]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(maxLong);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0050
     * @tc.name testLruCacheEntries005
     * @tc.desc Merged batch (5 tests): [1] Verify entries pair with long min -9223372036854775808 value returns it | [2] Verify entries pair with byte max 127 value returns it | [3] Verify entries pair with short...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries pair with long min -9223372036854775808 value returns it ---
      {
        let cache: util.LRUCache<long, long> = new util.LRUCache<long, long>();
        let minLong: long = -9223372036854775807 - 1;
        cache.put(1, minLong);
        let arr: Array<[long, long]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(minLong);
      }

      // --- [2] Verify entries pair with byte max 127 value returns it ---
      {
        let cache: util.LRUCache<byte, byte> = new util.LRUCache<byte, byte>();
        cache.put(1, 127 as byte);
        let arr: Array<[byte, byte]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(127 as byte);
      }

      // --- [3] Verify entries pair with short min -32768 value returns it ---
      {
        let cache: util.LRUCache<short, short> = new util.LRUCache<short, short>();
        cache.put(1, -32768 as short);
        let arr: Array<[short, short]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(-32768 as short);
      }

      // --- [4] Verify entries pair with single character string value returns it ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('a', 'v');
        let arr: Array<[string, string]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual('v');
      }

      // --- [5] Verify entries pair with float 1.5 value returns it ---
      {
        let cache: util.LRUCache<float, float> = new util.LRUCache<float, float>();
        cache.put(1.0 as float, 1.5 as float);
        let arr: Array<[float, float]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(1.5 as float);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0060
     * @tc.name testLruCacheEntries006
     * @tc.desc Merged batch (5 tests): [1] Verify entries pair with boolean true value returns true | [2] Verify entries pair with boolean false value returns false | [3] Verify entries with true and false value ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries pair with boolean true value returns true ---
      {
        let cache: util.LRUCache<int, boolean> = new util.LRUCache<int, boolean>();
        cache.put(1, true);
        let arr: Array<[int, boolean]> = Array.from(cache.entries());
        expect(arr[0][1]).assertTrue();
      }

      // --- [2] Verify entries pair with boolean false value returns false ---
      {
        let cache: util.LRUCache<int, boolean> = new util.LRUCache<int, boolean>();
        cache.put(1, false);
        let arr: Array<[int, boolean]> = Array.from(cache.entries());
        expect(arr[0][1]).assertFalse();
      }

      // --- [3] Verify entries with true and false value pairs keeps insertion order ---
      {
        let cache: util.LRUCache<int, boolean> = new util.LRUCache<int, boolean>();
        cache.put(1, true);
        cache.put(2, false);
        let arr: Array<[int, boolean]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual(1);
        expect(arr[0][1]).assertTrue();
        expect(arr[1][0]).assertEqual(2);
        expect(arr[1][1]).assertFalse();
      }

      // --- [4] Verify entries of a <bigint,bigint> cache yields a pair with the bigint value 1n ---
      {
        let cache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>();
          cache.put(1n, 1n);
          let arr: Array<[bigint, bigint]> = Array.from(cache.entries());
          expect(arr[0][1]).assertEqual(1n);
      }

      // --- [5] Verify entries of a <bigint,bigint> cache yields a pair whose huge bigint value is kept exactly ---
      {
        let cache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>();
          cache.put(1n, 123456789012345678901234567890n);
          let arr: Array<[bigint, bigint]> = Array.from(cache.entries());
          expect(arr[0][1]).assertEqual(123456789012345678901234567890n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0070
     * @tc.name testLruCacheEntries007
     * @tc.desc Merged batch (5 tests): [1] Verify entries of a <bigint,bigint> cache yields a pair with the negative bigint value -1n | [2] Verify entries pair with empty string value returns it | [3] Verify entr...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries of a <bigint,bigint> cache yields a pair with the negative bigint value -1n ---
      {
        let cache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>();
          cache.put(1n, -1n);
          let arr: Array<[bigint, bigint]> = Array.from(cache.entries());
          expect(arr[0][1]).assertEqual(-1n);
      }

      // --- [2] Verify entries pair with empty string value returns it ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        let value: string = '';
        cache.put(1, value);
        let arr: Array<[int, string]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(1);
        expect(arr[0][1]).assertEqual(value);
      }

      // --- [3] Verify entries pair with Chinese string value returns it ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, '你好');
        let arr: Array<[int, string]> = Array.from(cache.entries());
        let pair: [int, string] = arr[0];
        expect(pair[0]).assertEqual(1);
        expect(pair[1]).assertEqual('你好');
      }

      // --- [4] Verify entries pair with emoji surrogate pair string value returns it ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, '😀');
        let arr: Array<[int, string]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual('😀');
        expect(arr[0][0]).assertEqual(1);
      }

      // --- [5] Verify entries pair with NUL character string value returns it ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, '\u0000');
        let arr: Array<[int, string]> = Array.from(cache.entries());
        let text: string = arr[0][1];
        expect(text).assertEqual('\u0000');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0080
     * @tc.name testLruCacheEntries008
     * @tc.desc Merged batch (5 tests): [1] Verify entries pair with 10000-char long string value returns it | [2] Verify entries pair with numeric string 123 value returns it as string | [3] Verify entries pair w...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries pair with 10000-char long string value returns it ---
      {
        let longVal: string = '';
        for (let i: int = 0; i < 10000; i++) {
          longVal += 'b';
        }
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, longVal);
        let arr: Array<[int, string]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(longVal);
      }

      // --- [2] Verify entries pair with numeric string 123 value returns it as string ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, '123');
        cache.put(2, '456');
        let arr: Array<[int, string]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(2);
        expect(arr[0][1]).assertEqual('123');
      }

      // --- [3] Verify entries pair with reference-typed value returns same reference ---
      {
        // Date reference value
        let d: Date = new Date(2024, 5, 15);
        let cacheD: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        cacheD.put(1, d);
        let arrD: Array<[int, Date]> = Array.from(cacheD.entries());
        expect(arrD[0][1]).assertEqual(d);

        // RegExp reference value
        let r: RegExp = new RegExp('ab+c', 'g');
        let cacheR: util.LRUCache<int, RegExp> = new util.LRUCache<int, RegExp>();
        cacheR.put(1, r);
        let arrR: Array<[int, RegExp]> = Array.from(cacheR.entries());
        expect(arrR[0][1]).assertEqual(r);

        // Error reference value
        let e: Error = new Error('boom');
        let cacheE: util.LRUCache<int, Error> = new util.LRUCache<int, Error>();
        cacheE.put(1, e);
        let arrE: Array<[int, Error]> = Array.from(cacheE.entries());
        expect(arrE[0][1]).assertEqual(e);

        // Map reference value
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let cacheM: util.LRUCache<int, Map<string, int>> = new util.LRUCache<int, Map<string, int>>();
        cacheM.put(1, m);
        let arrM: Array<[int, Map<string, int>]> = Array.from(cacheM.entries());
        expect(arrM[0][1]).assertEqual(m);

        // Set reference value
        let s: Set<int> = new Set<int>();
        s.add(1);
        let cacheS: util.LRUCache<int, Set<int>> = new util.LRUCache<int, Set<int>>();
        cacheS.put(1, s);
        let arrS: Array<[int, Set<int>]> = Array.from(cacheS.entries());
        expect(arrS[0][1]).assertEqual(s);

        // Uint8Array reference value
        let u: Uint8Array = new Uint8Array([1, 2, 3]);
        let cacheU: util.LRUCache<int, Uint8Array> = new util.LRUCache<int, Uint8Array>();
        cacheU.put(1, u);
        let arrU: Array<[int, Uint8Array]> = Array.from(cacheU.entries());
        expect(arrU[0][1]).assertEqual(u);
      }

      // --- [4] Verify entries pair with interface object value returns same reference ---
      {
        let o: TagNode = { tag: 'a' };
        let cache: util.LRUCache<int, TagNode> = new util.LRUCache<int, TagNode>();
        cache.put(1, o);
        let arr: Array<[int, TagNode]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(o);
      }

      // --- [5] Verify entries pair with class instance value returns same reference ---
      {
        let p: Point = new Point(1, 2);
        let cache: util.LRUCache<int, Point> = new util.LRUCache<int, Point>();
        cache.put(1, p);
        let arr: Array<[int, Point]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(p);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0090
     * @tc.name testLruCacheEntries009
     * @tc.desc Merged batch (5 tests): [1] Verify entries pair with Array reference value returns same reference | [2] Verify entries with various key-value type combinations iterates pairs | [3] Verify entries w...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries pair with Array reference value returns same reference ---
      {
        let a: int[] = [1, 2, 3];
        let cache: util.LRUCache<int, int[]> = new util.LRUCache<int, int[]>();
        cache.put(1, a);
        let arr: Array<[int, int[]]> = Array.from(cache.entries());
        expect(arr[0][1]).assertEqual(a);
      }

      // --- [2] Verify entries with various key-value type combinations iterates pairs ---
      {
        // string key int value
        let cacheSI: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cacheSI.put('alpha', 100);
        let arrSI: Array<[string, int]> = Array.from(cacheSI.entries());
        expect(arrSI[0][0]).assertEqual('alpha');
        expect(arrSI[0][1]).assertEqual(100);

        // int key string value
        let cacheIS: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cacheIS.put(100, 'beta');
        let arrIS: Array<[int, string]> = Array.from(cacheIS.entries());
        expect(arrIS[0][0]).assertEqual(100);
        expect(arrIS[0][1]).assertEqual('beta');

        // boolean key boolean value
        let cacheBB: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>();
        cacheBB.put(true, false);
        let arrBB: Array<[boolean, boolean]> = Array.from(cacheBB.entries());
        expect(arrBB[0][0]).assertTrue();
        expect(arrBB[0][1]).assertFalse();

        // double key double value
        let cacheDD: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        cacheDD.put(0.5, 0.25);
        let arrDD: Array<[double, double]> = Array.from(cacheDD.entries());
        expect(arrDD[0][0]).assertEqual(0.5);
        expect(arrDD[0][1]).assertEqual(0.25);

        // string key Date value
        let dateValue: Date = new Date(2022, 3, 4);
        let cacheSD: util.LRUCache<string, Date> = new util.LRUCache<string, Date>();
        cacheSD.put('d', dateValue);
        let arrSD: Array<[string, Date]> = Array.from(cacheSD.entries());
        expect(arrSD[0][0]).assertEqual('d');
        expect(arrSD[0][1]).assertEqual(dateValue);

        // long key string value
        let kl: long = 9223372036854775807;
        let cacheLS: util.LRUCache<long, string> = new util.LRUCache<long, string>();
        cacheLS.put(kl, 'big');
        let arrLS: Array<[long, string]> = Array.from(cacheLS.entries());
        expect(arrLS[0][0]).assertEqual(kl);
        expect(arrLS[0][1]).assertEqual('big');

        // byte key int value
        let cacheBI: util.LRUCache<byte, int> = new util.LRUCache<byte, int>();
        cacheBI.put(5 as byte, 50);
        let arrBI: Array<[byte, int]> = Array.from(cacheBI.entries());
        expect(arrBI[0][0]).assertEqual(5 as byte);
        expect(arrBI[0][1]).assertEqual(50);
      }

      // --- [3] Verify entries with string key string value type combination iterates two pairs ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('k1', 'v1');
        cache.put('k2', 'v2');
        let arr: Array<[string, string]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual('k1');
        expect(arr[0][1]).assertEqual('v1');
        expect(arr[1][0]).assertEqual('k2');
        expect(arr[1][1]).assertEqual('v2');
      }

      // --- [4] Verify entries with Date key Date value type combination returns reference pair ---
      {
        let kd: Date = new Date(2024, 5, 15);
        let vd: Date = new Date(2023, 1, 2);
        let cache: util.LRUCache<Date, Date> = new util.LRUCache<Date, Date>();
        cache.put(kd, vd);
        let arr: Array<[Date, Date]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual(kd);
        expect(arr[0][1]).assertEqual(vd);
      }

      // --- [5] Verify entries with string key int array value type combination returns same reference ---
      {
        let av: int[] = [9, 8];
        let cache: util.LRUCache<string, int[]> = new util.LRUCache<string, int[]>();
        cache.put('arr', av);
        let arr: Array<[string, int[]]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual('arr');
        expect(arr[0][1]).assertEqual(av);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0100
     * @tc.name testLruCacheEntries010
     * @tc.desc Merged batch (5 tests): [1] Verify entries with int key interface object value type combination returns reference pair | [2] Verify entries with single character string key value type combination i...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries with int key interface object value type combination returns reference pair ---
      {
        let ob: DataNode = { id: 7 };
        let cache: util.LRUCache<int, DataNode> = new util.LRUCache<int, DataNode>();
        cache.put(7, ob);
        let arr: Array<[int, DataNode]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual(7);
        expect(arr[0][1]).assertEqual(ob);
      }

      // --- [2] Verify entries with single character string key value type combination iterates pairs ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('x', 'y');
        let arr: Array<[string, string]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual('x');
        expect(arr[0][1]).assertEqual('y');
      }

      // --- [3] Verify entries of a <bigint,int> cache yields the pair with bigint key 42n and int value 42 ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
          cache.put(42n, 42);
          let arr: Array<[bigint, int]> = Array.from(cache.entries());
          expect(arr[0][0]).assertEqual(42n);
          expect(arr[0][1]).assertEqual(42);
      }

      // --- [4] Verify entries with string key class instance value type combination returns same reference ---
      {
        let nd: ValNode = new ValNode(5);
        let cache: util.LRUCache<string, ValNode> = new util.LRUCache<string, ValNode>();
        cache.put('n', nd);
        let arr: Array<[string, ValNode]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual('n');
        expect(arr[0][1]).assertEqual(nd);
      }

      // --- [5] Verify entries keeps insertion order when a smaller key is put after a larger one ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(9, 90);
        cache.put(3, 30);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual(9);
        expect(arr[0][1]).assertEqual(90);
        expect(arr[1][0]).assertEqual(3);
        expect(arr[1][1]).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0110
     * @tc.name testLruCacheEntries011
     * @tc.desc Merged batch (5 tests): [1] Verify overwriting a key moves it to MRU position with the latest value in entries | [2] Verify entries keeps both pairs when different keys share same value | [3] Verif...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting a key moves it to MRU position with the latest value in entries ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 100);
        cache.put(2, 200);
        cache.put(1, 101);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(2);
        expect(arr[0][0]).assertEqual(2);
        expect(arr[0][1]).assertEqual(200);
        expect(arr[1][0]).assertEqual(1);
        expect(arr[1][1]).assertEqual(101);
      }

      // --- [2] Verify entries keeps both pairs when different keys share same value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(10, 5);
        cache.put(20, 5);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(2);
        expect(arr[1][0]).assertEqual(20);
        expect(arr[1][1]).assertEqual(5);
      }

      // --- [3] Verify entries dedups decimal 15 and hex 0xF same key keeping later value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(15, 80);
        cache.put(0xF, 90);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(1);
        expect(arr[0][0]).assertEqual(15);
        expect(arr[0][1]).assertEqual(90);
      }

      // --- [4] Verify entries treats -0 and 0 as same key normalized to 0 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(-0, 44);
        cache.put(0, 55);
        let arr: Array<[double, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(1);
        expect(arr[0][0]).assertEqual(0);
        expect(arr[0][1]).assertEqual(55);
      }

      // --- [5] Verify entries returns three pairs strictly in insertion order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(4, 40);
        cache.put(5, 50);
        cache.put(6, 60);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(3);
        expect(arr[2][0]).assertEqual(6);
        expect(arr[2][1]).assertEqual(60);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0120
     * @tc.name testLruCacheEntries012
     * @tc.desc Merged batch (5 tests): [1] Verify entries after capacity eviction returns only remaining pairs | [2] Verify entries order changes after get hit reorders LRU | [3] Verify entries after clear return...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries after capacity eviction returns only remaining pairs ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 11);
        cache.put(2, 22);
        cache.put(3, 33);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(2);
        expect(arr[0][0]).assertEqual(2);
        expect(arr[0][1]).assertEqual(22);
        expect(arr[1][0]).assertEqual(3);
        expect(arr[1][1]).assertEqual(33);
      }

      // --- [2] Verify entries order changes after get hit reorders LRU ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 11);
        cache.put(2, 22);
        cache.get(1);
        cache.put(3, 33);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr[0][0]).assertEqual(1);
        expect(arr[0][1]).assertEqual(11);
        expect(arr[1][0]).assertEqual(3);
        expect(arr[1][1]).assertEqual(33);
      }

      // --- [3] Verify entries after clear returns iterator with no pairs ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 11);
        cache.put(2, 22);
        cache.clear();
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(0);
        expect(cache.contains(1)).assertFalse();
      }

      // --- [4] Verify entries on empty cache returns empty array via Array.from ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(0);
        expect(cache.isEmpty()).assertTrue();
      }

      // --- [5] Verify empty-cache iterator for..of loop body does not run ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let count: int = 0;
        for (let p of cache.entries()) {
          expect(p.length).assertEqual(2);
          count++;
        }
        expect(count).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0130
     * @tc.name testLruCacheEntries013
     * @tc.desc Merged batch (5 tests): [1] Verify single pair cache entries returns exactly one pair | [2] Verify pair elements length is always 2 for multiple pairs | [3] Verify entries on non-empty cache return...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify single pair cache entries returns exactly one pair ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(7, 70);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(1);
        expect(arr[0][0]).assertEqual(7);
        expect(arr[0][1]).assertEqual(70);
      }

      // --- [2] Verify pair elements length is always 2 for multiple pairs ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr[0].length).assertEqual(2);
        expect(arr[1].length).assertEqual(2);
      }

      // --- [3] Verify entries on non-empty cache returns a non-null iterator object ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(2, 10);
        let iter: IterableIterator<[int, int]> = pro.entries();
        let firstPair: [int, int] | undefined = iter.next().value;
        expect(firstPair![0]).assertEqual(2);
        expect(firstPair![1]).assertEqual(10);
      }

      // --- [4] Verify entries iterator can be consumed by for..of with first value correct ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 5);
        let got: int = -1;
        for (let p of pro.entries()) {
          got = p[1];
        }
        expect(got).assertEqual(5);
      }

      // --- [5] Verify next().done is false while iteration is not exhausted ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 5);
        let r: IteratorResult<[int, int]> = pro.entries().next();
        expect(r.done).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0140
     * @tc.name testLruCacheEntries014
     * @tc.desc Merged batch (5 tests): [1] Verify next().done is true after iterator is exhausted | [2] Verify empty cache first next().done is immediately true | [3] Verify next().value is undefined after iterat...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify next().done is true after iterator is exhausted ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 5);
        let iter: IterableIterator<[int, int]> = pro.entries();
        iter.next();
        expect(iter.next().done).assertTrue();
      }

      // --- [2] Verify empty cache first next().done is immediately true ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(pro.entries().next().done).assertTrue();
      }

      // --- [3] Verify next().value is undefined after iterator is exhausted ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 5);
        let iter: IterableIterator<[int, int]> = pro.entries();
        iter.next();
        let r: IteratorResult<[int, int]> = iter.next();
        expect(r.value).assertEqual(undefined);
      }

      // --- [4] Verify Array.from collection of entries is an Array instance ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(2, 10);
        let arr: Array<[int, int]> = Array.from(pro.entries());
        expect(Array.isArray(arr)).assertTrue();
      }

      // --- [5] Verify value at the maximum safe integer 9007199254740991 is kept exactly ---
      {
        let pro: util.LRUCache<int, long> = new util.LRUCache<int, long>();
        pro.put(1, 9007199254740991);
        let arr: Array<[int, long]> = Array.from(pro.entries());
        expect(arr[0][1]).assertEqual(9007199254740991);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0150
     * @tc.name testLruCacheEntries015
     * @tc.desc Merged batch (5 tests): [1] Verify double precision value 2.718281828459045 kept exactly | [2] Verify entries of a <int,bigint> cache returns the exact bigint value 9007199254740993n beyond double ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify double precision value 2.718281828459045 kept exactly ---
      {
        let pro: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        pro.put(1, 2.718281828459045);
        let arr: Array<[int, double]> = Array.from(pro.entries());
        expect(arr[0][1]).assertEqual(2.718281828459045);
      }

      // --- [2] Verify entries of a <int,bigint> cache returns the exact bigint value 9007199254740993n beyond double safe integer ---
      {
        let pro: util.LRUCache<int, bigint> = new util.LRUCache<int, bigint>();
            pro.put(1, 9007199254740993n);
            let arr: Array<[int, bigint]> = Array.from(pro.entries());
            expect(arr[0][1]).assertEqual(9007199254740993n);
      }

      // --- [3] Verify Date value content getTime milliseconds kept ---
      {
        let pro: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        pro.put(1, new Date(1700000000000));
        let arr: Array<[int, Date]> = Array.from(pro.entries());
        expect(arr[0][1].getTime()).assertEqual(1700000000000);
      }

      // --- [4] Verify class instance value field content kept ---
      {
        let v: EntryValue = new EntryValue();
        v.a = 1;
        v.b = 'z';
        let pro: util.LRUCache<int, EntryValue> = new util.LRUCache<int, EntryValue>();
        pro.put(1, v);
        let arr: Array<[int, EntryValue]> = Array.from(pro.entries());
        expect(arr[0][1].a).assertEqual(1);
      }

      // --- [5] Verify nested array value content kept ---
      {
        let pro: util.LRUCache<int, int[]> = new util.LRUCache<int, int[]>();
        pro.put(1, [1, 2, 3]);
        let arr: Array<[int, int[]]> = Array.from(pro.entries());
        expect(arr[0][1][1]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0160
     * @tc.name testLruCacheEntries016
     * @tc.desc Merged batch (5 tests): [1] Verify Map value content via get kept | [2] Verify RegExp value match behavior kept | [3] Verify Set value membership kept | [4] Verify iteration length grows from 1 to ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Map value content via get kept ---
      {
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let pro: util.LRUCache<int, Map<string, int>> = new util.LRUCache<int, Map<string, int>>();
        pro.put(1, m);
        let arr: Array<[int, Map<string, int>]> = Array.from(pro.entries());
        expect(arr[0][1].get('a')).assertEqual(1);
      }

      // --- [2] Verify RegExp value match behavior kept ---
      {
        let r: RegExp = new RegExp('ab+c', 'i');
        let pro: util.LRUCache<int, RegExp> = new util.LRUCache<int, RegExp>();
        pro.put(1, r);
        let arr: Array<[int, RegExp]> = Array.from(pro.entries());
        expect(arr[0][1].test('ABBBc')).assertTrue();
      }

      // --- [3] Verify Set value membership kept ---
      {
        let s: Set<int> = new Set<int>();
        s.add(9);
        let pro: util.LRUCache<int, Set<int>> = new util.LRUCache<int, Set<int>>();
        pro.put(1, s);
        let arr: Array<[int, Set<int>]> = Array.from(pro.entries());
        expect(arr[0][1].has(9)).assertTrue();
      }

      // --- [4] Verify iteration length grows from 1 to 2 after second put ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        let before: int = Array.from(pro.entries()).length;
        pro.put(2, 20);
        let after: int = Array.from(pro.entries()).length;
        expect(after).assertEqual(before + 1);
      }

      // --- [5] Verify iteration length reduces to 1 after remove ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.remove(1);
        let arr: Array<[int, int]> = Array.from(pro.entries());
        expect(arr.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0170
     * @tc.name testLruCacheEntries017
     * @tc.desc Merged batch (5 tests): [1] Verify iteration length 1 after eviction with capacity 1 | [2] Verify entries length is bounded by capacity 64 after 100 puts | [3] Verify Array.from length equals cache...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iteration length 1 after eviction with capacity 1 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        pro.put(1, 10);
        pro.put(2, 20);
        let arr: Array<[int, int]> = Array.from(pro.entries());
        expect(arr.length).assertEqual(1);
      }

      // --- [2] Verify entries length is bounded by capacity 64 after 100 puts ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 100; i++) {
          pro.put(i, i * 2);
        }
        let arr: Array<[int, int]> = Array.from(pro.entries());
        expect(arr.length).assertEqual(64);
      }

      // --- [3] Verify Array.from length equals cache.length property ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 2);
        pro.put(3, 4);
        let arr: Array<[int, int]> = Array.from(pro.entries());
        expect(arr.length).assertEqual(pro.length);
      }

      // --- [4] Verify manual next loop reaches done after 2 iterations ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 2);
        pro.put(3, 4);
        let iter: IterableIterator<[int, int]> = pro.entries();
        let cnt: int = 0;
        let r: IteratorResult<[int, int]> = iter.next();
        while (!r.done) {
          cnt++;
          r = iter.next();
        }
        expect(cnt).assertEqual(2);
      }

      // --- [5] Verify get still returns original value after entries call ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.entries();
        expect(pro.get(1)).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0180
     * @tc.name testLruCacheEntries018
     * @tc.desc Merged batch (5 tests): [1] Verify fully iterating entries keeps cache.length unchanged | [2] Verify get still returns original value after full iteration | [3] Verify entries on full-capacity cach...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify fully iterating entries keeps cache.length unchanged ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        for (let p of pro.entries()) {
          expect(p.length).assertEqual(2);
        }
        expect(pro.length).assertEqual(2);
      }

      // --- [2] Verify get still returns original value after full iteration ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        for (let p of pro.entries()) {
          expect(p.length).assertEqual(2);
        }
        expect(pro.get(2)).assertEqual(20);
      }

      // --- [3] Verify entries on full-capacity cache does not trigger eviction ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        pro.put(1, 10);
        pro.entries();
        expect(pro.get(1)).assertEqual(10);
      }

      // --- [4] Verify entries does not change getMatchCount ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        let matchBefore: long = pro.getMatchCount();
        pro.entries();
        expect(pro.getMatchCount()).assertEqual(matchBefore);
      }

      // --- [5] Verify entries does not change getMissCount ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        let missBefore: long = pro.getMissCount();
        pro.entries();
        expect(pro.getMissCount()).assertEqual(missBefore);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0190
     * @tc.name testLruCacheEntries019
     * @tc.desc Merged batch (5 tests): [1] Verify two independent iterators do not interfere with each other | [2] Verify contains still true for stored keys after entries call | [3] Verify remove still works aft...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two independent iterators do not interfere with each other ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        let firstIter: IterableIterator<[int, int]> = pro.entries();
        firstIter.next();
        let secondIter: IterableIterator<[int, int]> = pro.entries();
        let arr: Array<[int, int]> = Array.from(secondIter);
        expect(arr[0][0]).assertEqual(1);
      }

      // --- [2] Verify contains still true for stored keys after entries call ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.entries();
        expect(pro.contains(1)).assertTrue();
        expect(pro.contains(2)).assertTrue();
      }

      // --- [3] Verify remove still works after entries call reducing length to 1 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.entries();
        pro.remove(1);
        expect(pro.length).assertEqual(1);
      }

      // --- [4] Verify clear still works after entries call making length 0 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.entries();
        pro.clear();
        expect(pro.length).assertEqual(0);
      }

      // --- [5] Verify updateCapacity still works after entries call keeping length ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.entries();
        pro.updateCapacity(4);
        expect(pro.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0200
     * @tc.name testLruCacheEntries020
     * @tc.desc Merged batch (5 tests): [1] Verify entries does not change getPutCount | [2] Verify entries does not change getRemovalCount | [3] Verify entries does not change getCreateCount | [4] Verify entries ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries does not change getPutCount ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        let pcBefore: long = pro.getPutCount();
        pro.entries();
        expect(pro.getPutCount()).assertEqual(pcBefore);
      }

      // --- [2] Verify entries does not change getRemovalCount ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        pro.put(1, 10);
        pro.put(2, 20);
        let rcBefore: long = pro.getRemovalCount();
        pro.entries();
        expect(pro.getRemovalCount()).assertEqual(rcBefore);
      }

      // --- [3] Verify entries does not change getCreateCount ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        let ccBefore: long = pro.getCreateCount();
        pro.entries();
        expect(pro.getCreateCount()).assertEqual(ccBefore);
      }

      // --- [4] Verify entries key order equals keys order after a get hit reorders LRU ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.get(1);
        let earr: Array<[int, int]> = Array.from(pro.entries());
        let karr: Array<int> = Array.from(pro.keys());
        expect(karr.length).assertEqual(earr.length);
        expect(karr[0]).assertEqual(earr[0][0]);
        expect(karr[1]).assertEqual(earr[1][0]);
        expect(karr[2]).assertEqual(earr[2][0]);
      }

      // --- [5] Verify entries value order equals values order ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 11);
        pro.put(2, 22);
        pro.put(3, 33);
        let earr: Array<[int, int]> = Array.from(pro.entries());
        let varr: Array<int> = Array.from(pro.values());
        expect(varr.length).assertEqual(earr.length);
        expect(varr[0]).assertEqual(earr[0][1]);
        expect(varr[1]).assertEqual(earr[1][1]);
        expect(varr[2]).assertEqual(earr[2][1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0210
     * @tc.name testLruCacheEntries021
     * @tc.desc Merged batch (5 tests): [1] Verify a contains hit promotes the key and entries reflects the new order | [2] Verify removing a middle key keeps the remaining pairs in order | [3] Verify put still ap...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a contains hit promotes the key and entries reflects the new order ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        expect(pro.contains(1)).assertTrue();
        let arr: Array<[int, int]> = Array.from(pro.entries());
        expect(arr.length).assertEqual(2);
        expect(arr[0][0]).assertEqual(2);
        expect(arr[0][1]).assertEqual(20);
        expect(arr[1][0]).assertEqual(1);
        expect(arr[1][1]).assertEqual(10);
      }

      // --- [2] Verify removing a middle key keeps the remaining pairs in order ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.remove(2);
        let arr: Array<[int, int]> = Array.from(pro.entries());
        expect(arr.length).assertEqual(2);
        expect(arr[0][0]).assertEqual(1);
        expect(arr[0][1]).assertEqual(10);
        expect(arr[1][0]).assertEqual(3);
        expect(arr[1][1]).assertEqual(30);
      }

      // --- [3] Verify put still appends a new pair after an entries call ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.entries();
        pro.put(2, 20);
        let arr: Array<[int, int]> = Array.from(pro.entries());
        expect(arr.length).assertEqual(2);
        expect(arr[0][0]).assertEqual(1);
        expect(arr[0][1]).assertEqual(10);
        expect(arr[1][0]).assertEqual(2);
        expect(arr[1][1]).assertEqual(20);
      }

      // --- [4] Verify updateCapacity shrink evicts LRU pairs and entries keeps only newest ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.updateCapacity(1);
        let arr: Array<[int, int]> = Array.from(pro.entries());
        expect(arr.length).assertEqual(1);
        expect(arr[0][0]).assertEqual(3);
        expect(arr[0][1]).assertEqual(30);
      }

      // --- [5] Verify capacity 3 overflow eviction keeps three pairs with the LRU first ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.put(4, 40);
        let arr: Array<[int, int]> = Array.from(pro.entries());
        expect(arr.length).assertEqual(3);
        expect(arr[0][0]).assertEqual(2);
        expect(arr[0][1]).assertEqual(20);
        expect(arr[1][0]).assertEqual(3);
        expect(arr[2][0]).assertEqual(4);
        expect(arr[2][1]).assertEqual(40);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ENTRIES_0220
     * @tc.name testLruCacheEntries022
     * @tc.desc Merged batch (4 tests): [1] Verify entries yields enum member keys with their values in insertion order | [2] Verify entries after a grow then shrink yields only the retained pairs | [3] Verify ent...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries yields enum member keys with their values in insertion order ---
      {
        let cache: util.LRUCache<EntSlot, int> = new util.LRUCache<EntSlot, int>();
        cache.put(EntSlot.First, 5);
        cache.put(EntSlot.Second, 6);
        let arr: Array<[EntSlot, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(2);
        expect(arr[0][0]).assertEqual(EntSlot.First);
        expect(arr[0][1]).assertEqual(5);
        expect(arr[1][0]).assertEqual(EntSlot.Second);
        expect(arr[1][1]).assertEqual(6);
      }

      // --- [2] Verify entries after a grow then shrink yields only the retained pairs ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.updateCapacity(4);
        cache.put(3, 30);
        cache.updateCapacity(2);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(2);
        expect(arr[0][0]).assertEqual(2);
        expect(arr[0][1]).assertEqual(20);
        expect(arr[1][0]).assertEqual(3);
        expect(arr[1][1]).assertEqual(30);
      }

      // --- [3] Verify entries yields the pair of a key removed then re-put at the tail ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.remove(2)).assertEqual(20);
        cache.put(2, 22);
        let arr: Array<[int, int]> = Array.from(cache.entries());
        expect(arr.length).assertEqual(3);
        expect(arr[2][0]).assertEqual(2);
        expect(arr[2][1]).assertEqual(22);
      }

      // --- [4] Verify entries returns the stored key paired with the LRUCache instance as value ---
      {
        let leaf: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        leaf.put(3, 33);
        let outer: util.LRUCache<string, util.LRUCache<int, int>> = new util.LRUCache<string, util.LRUCache<int, int>>(2);
        outer.put('leaf', leaf);
        let arr: Array<[string, util.LRUCache<int, int>]> = Array.from(outer.entries());
        expect(arr.length).assertEqual(1);
        expect(arr[0][0]).assertEqual('leaf');
        expect(arr[0][1]).assertEqual(leaf);
        expect(arr[0][1].length).assertEqual(1);
        expect(arr[0][1].get(3)).assertEqual(33);
      }
    });

  });
}
