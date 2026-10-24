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
} from '../../../../hypium/index';
import util from '@ohos.util';
import Utils from './../Util.test';

enum PutSlot {
  First = 0,
  Second = 1
}

class TenfoldChild extends util.LRUCache<int, int> {
  constructor() {
    super();
  }

  createDefault(key: int): int {
    return key * 10;
  }
}

export default function lruCacheGetPutCountTest(): void {
  describe('LruCacheGetPutCountTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0010
     * @tc.name testLruCacheGetPutCount001
     * @tc.desc Merged batch (5 tests): [1] Verify zero-argument getPutCount on fresh cache returns initial put count 0 | [2] Verify put key 0 accumulates put count 1 and the zero key is contained | [3] Verify put...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify zero-argument getPutCount on fresh cache returns initial put count 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(cache.getPutCount()).assertEqual(0);
      }

      // --- [2] Verify put key 0 accumulates put count 1 and the zero key is contained ---
      {
        let zeroKey: int = 0;
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(zeroKey, 10);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.contains(zeroKey)).assertTrue();
      }

      // --- [3] Verify put smallest positive key 1 accumulates put count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let count: long = cache.getPutCount();
        expect(count).assertEqual(1);
        expect(cache.get(1)).assertEqual(10);
      }

      // --- [4] Verify put negative key -1 accumulates put count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-1, 10);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.contains(-1)).assertTrue();
      }

      // --- [5] Verify put int max key 2147483647 accumulates put count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let key: int = 2147483647;
        cache.put(key, 10);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.contains(key)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0020
     * @tc.name testLruCacheGetPutCount002
     * @tc.desc Merged batch (5 tests): [1] Verify put int min key -2147483648 accumulates put count 1 and is contained | [2] Verify ordinary put key 2 accumulates put count 1 and becomes the first key | [3] Verif...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put int min key -2147483648 accumulates put count 1 and is contained ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-2147483648, 10);
        let count: long = cache.getPutCount();
        expect(count).assertEqual(1);
        expect(cache.contains(-2147483648)).assertTrue();
      }

      // --- [2] Verify ordinary put key 2 accumulates put count 1 and becomes the first key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.keys()[0]).assertEqual(2);
      }

      // --- [3] Verify put value 0 accumulates put count 1 and cache stays non-empty ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 0);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.isEmpty()).assertFalse();
      }

      // --- [4] Verify put smallest positive value 1 accumulates put count 1 and round-trips the value ---
      {
        let smallestValue: int = 1;
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, smallestValue);
        let count: long = cache.getPutCount();
        expect(count).assertEqual(1);
        expect(cache.get(2)).assertEqual(smallestValue);
      }

      // --- [5] Verify put negative value -1 accumulates put count 1 and occupies one slot ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, -1);
        let count: long = cache.getPutCount();
        let len: int = cache.length;
        expect(count).assertEqual(1);
        expect(len).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0030
     * @tc.name testLruCacheGetPutCount003
     * @tc.desc Merged batch (5 tests): [1] Verify put int max value 2147483647 accumulates put count 1 | [2] Verify put int min value -2147483648 accumulates put count 1 and stores that value | [3] Verify put lar...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put int max value 2147483647 accumulates put count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 2147483647);
        expect(cache.isEmpty()).assertFalse();
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [2] Verify put int min value -2147483648 accumulates put count 1 and stores that value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, -2147483648);
        let count: long = cache.getPutCount();
        expect(count).assertEqual(1);
        expect(cache.values()[0]).assertEqual(-2147483648);
      }

      // --- [3] Verify put large value 100 accumulates put count 1 and stores that value ---
      {
        let largeValue: int = 100;
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, largeValue);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.values()[0]).assertEqual(largeValue);
      }

      // --- [4] Verify two puts overwriting existing key accumulate put count 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.put(2, 20);
        expect(cache.getPutCount()).assertEqual(2);
        expect(cache.length).assertEqual(1);
      }

      // --- [5] Verify two puts overwriting key 0 accumulate put count 2 and keep the key contained ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(0, 10);
        cache.put(0, 20);
        let count: long = cache.getPutCount();
        expect(count).assertEqual(2);
        expect(cache.contains(0)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0040
     * @tc.name testLruCacheGetPutCount004
     * @tc.desc Merged batch (5 tests): [1] Verify two puts overwriting negative key -1 accumulate put count 2 while length stays 1 | [2] Verify two puts overwriting int max key accumulate put count 2 and keep tha...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two puts overwriting negative key -1 accumulate put count 2 while length stays 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-1, 10);
        cache.put(-1, 20);
        expect(cache.getPutCount()).assertEqual(2);
        let len: int = cache.length;
        expect(len).assertEqual(1);
      }

      // --- [2] Verify two puts overwriting int max key accumulate put count 2 and keep that key first ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2147483647, 10);
        cache.put(2147483647, 20);
        expect(cache.getPutCount()).assertEqual(2);
        expect(cache.keys()[0]).assertEqual(2147483647);
      }

      // --- [3] Verify two puts overwriting int min key accumulate put count 2 and keep the latest value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-2147483648, 10);
        cache.put(-2147483648, 20);
        expect(cache.getPutCount()).assertEqual(2);
        expect(cache.values()[0]).assertEqual(20);
      }

      // --- [4] Verify put count reaches two on overwrite then three after a distinct key while length counts two ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(3, 10);
        cache.put(3, 20);
        let beforeInsert: long = cache.getPutCount();
        cache.put(4, 30);
        expect(beforeInsert).assertEqual(2);
        expect(cache.getPutCount()).assertEqual(3);
        expect(cache.length).assertEqual(2);
      }

      // --- [5] Verify put empty string key accumulates put count 1 and occupies one slot ---
      {
        let emptyKey: string = '';
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put(emptyKey, 10);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0050
     * @tc.name testLruCacheGetPutCount005
     * @tc.desc Merged batch (5 tests): [1] Verify put ordinary string key key accumulates put count 1 after a contains miss | [2] Verify put Chinese multibyte string key accumulates put count 1 and is stored as t...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put ordinary string key key accumulates put count 1 after a contains miss ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.contains('key');
        cache.put('key', 10);
        let count: long = cache.getPutCount();
        expect(count).assertEqual(1);
      }

      // --- [2] Verify put Chinese multibyte string key accumulates put count 1 and is stored as the first key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('你好', 10);
        expect(cache.keys()[0]).assertEqual('你好');
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [3] Verify put special character script tag key accumulates put count 1 and reads back its value ---
      {
        let scriptKey: string = '<script>';
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put(scriptKey, 10);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.get(scriptKey)).assertEqual(10);
      }

      // --- [4] Verify put 10001-char overlong string key accumulates put count 1 ---
      {
        let longKey: string = 'x';
        let j: int = 0;
        while (j < 10000) {
          longKey = longKey + 'y';
          j++;
        }
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put(longKey, 10);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [5] Verify put UUID format string key accumulates put count 1 after a miss on the same key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.get('84bdf796-66cc-4655-9b89-d6218d100f9c');
        cache.put('84bdf796-66cc-4655-9b89-d6218d100f9c', 10);
        let count: long = cache.getPutCount();
        expect(count).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0060
     * @tc.name testLruCacheGetPutCount006
     * @tc.desc Merged batch (5 tests): [1] Verify string keys 0x10 and 16 are different keys accumulating put count 2 and both are stored in order | [2] Verify two puts overwriting same string key a accumulate pu...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify string keys 0x10 and 16 are different keys accumulating put count 2 and both are stored in order ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('0x10', 10);
        cache.put('16', 10);
        expect(cache.keys()[0]).assertEqual('0x10');
        expect(cache.keys()[1]).assertEqual('16');
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [2] Verify two puts overwriting same string key a accumulate put count 2 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('a', 10);
        cache.put('a', 20);
        let count: long = cache.getPutCount();
        expect(count).assertEqual(2);
      }

      // --- [3] Verify two distinct string keys x and y accumulate put count 2 and both are retrievable ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('x', 10);
        cache.put('y', 20);
        expect(cache.get('x')).assertEqual(10);
        expect(cache.get('y')).assertEqual(20);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [4] Verify boolean cache put true key accumulates put count 1 ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(true, 10);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [5] Verify boolean cache put false key accumulates put count 1 ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(false, 10);
        expect(cache.getPutCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0070
     * @tc.name testLruCacheGetPutCount007
     * @tc.desc Merged batch (5 tests): [1] Verify boolean cache put true and false keys accumulate put count 2 | [2] Verify bigint cache put bigint key 1n accumulates put count 1 | [3] Verify double cache put ord...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify boolean cache put true and false keys accumulate put count 2 ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(true, 10);
        cache.put(false, 10);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [2] Verify bigint cache put bigint key 1n accumulates put count 1 ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        cache.put(1n, 10);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [3] Verify double cache put ordinary double key 1.5 accumulates put count 1 and the key is contained ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(1.5, 10);
        expect(cache.contains(1.5)).assertTrue();
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [4] Verify double cache put 3.14 key accumulates put count 1 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(3.14, 10);
        let count: long = cache.getPutCount();
        expect(count).assertEqual(1);
        expect(cache.length).assertEqual(1);
      }

      // --- [5] Verify double cache put Infinity key accumulates put count 1 and reads back its value ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.POSITIVE_INFINITY, 10);
        expect(cache.get(Double.POSITIVE_INFINITY)).assertEqual(10);
        expect(cache.getPutCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0080
     * @tc.name testLruCacheGetPutCount008
     * @tc.desc Merged batch (5 tests): [1] Verify double cache put 0.0 then -0.0 as SameValueZero-equal keys accumulates put count 2 in one slot | [2] Verify double cache put NaN key accumulates put count 1 and o...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify double cache put 0.0 then -0.0 as SameValueZero-equal keys accumulates put count 2 in one slot ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(0.0, 10);
        cache.put(-0.0, 20);
        expect(cache.values().length).assertEqual(1);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [2] Verify double cache put NaN key accumulates put count 1 and occupies one slot ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.NaN, 10);
        expect(cache.length).assertEqual(1);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [3] Verify double cache put NaN twice increments put count from 1 to 2 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.NaN, 10);
        let afterFirst: long = cache.getPutCount();
        cache.put(Double.NaN, 20);
        let afterSecond: long = cache.getPutCount();
        expect(afterFirst).assertEqual(1);
        expect(afterSecond).assertEqual(2);
      }

      // --- [4] Verify double cache put 1.5 and 2.5 keys accumulate put count 2 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(1.5, 10);
        cache.put(2.5, 20);
        expect(cache.length).assertEqual(2);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [5] Verify object cache put single reference key accumulates put count 1 ---
      {
        let keyA: Record<string, int> = { 'a': 1 };
        let cache: util.LRUCache<Record<string, int>, int> = new util.LRUCache<Record<string, int>, int>();
        cache.put(keyA, 10);
        expect(cache.getPutCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0090
     * @tc.name testLruCacheGetPutCount009
     * @tc.desc Merged batch (5 tests): [1] Verify object cache content-equal different reference keys count separately accumulating put count 2 | [2] Verify object cache same reference key put twice accumulates p...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify object cache content-equal different reference keys count separately accumulating put count 2 ---
      {
        let firstKey: Record<string, int> = { 'a': 1 };
        let secondKey: Record<string, int> = { 'a': 1 };
        let cache: util.LRUCache<Record<string, int>, int> = new util.LRUCache<Record<string, int>, int>();
        cache.put(firstKey, 10);
        cache.put(secondKey, 10);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [2] Verify object cache same reference key put twice accumulates put count 2 ---
      {
        let keyC: Record<string, int> = { 'a': 1 };
        let cache: util.LRUCache<Record<string, int>, int> = new util.LRUCache<Record<string, int>, int>();
        cache.put(keyC, 10);
        cache.put(keyC, 10);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [3] Verify Date cache distinct instances with equal milliseconds count separately accumulating put count 2 ---
      {
        let firstDate: Date = new Date(0);
        let secondDate: Date = new Date(0);
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(firstDate, 10);
        cache.put(secondDate, 10);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [4] Verify RegExp cache distinct instances with same pattern count separately accumulating put count 2 in two slots ---
      {
        let firstRegex: RegExp = new RegExp('a');
        let secondRegex: RegExp = new RegExp('a');
        let cache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        cache.put(firstRegex, 10);
        cache.put(secondRegex, 10);
        expect(cache.getPutCount()).assertEqual(2);
        expect(cache.length).assertEqual(2);
      }

      // --- [5] Verify int array cache content-equal different references count separately accumulating put count 2 ---
      {
        let firstArray: int[] = [1, 2, 3];
        let secondArray: int[] = [1, 2, 3];
        let cache: util.LRUCache<int[], int> = new util.LRUCache<int[], int>();
        cache.put(firstArray, 10);
        cache.put(secondArray, 10);
        expect(cache.getPutCount()).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0100
     * @tc.name testLruCacheGetPutCount010
     * @tc.desc Merged batch (5 tests): [1] Verify Map cache distinct instances count separately accumulating put count 2 | [2] Verify Error cache distinct instances count separately accumulating put count 2 and s...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Map cache distinct instances count separately accumulating put count 2 ---
      {
        let mk: Map<string, int> = new Map<string, int>();
        mk.set('k', 1);
        let cache: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        cache.put(mk, 10);
        cache.put(new Map<string, int>(), 10);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [2] Verify Error cache distinct instances count separately accumulating put count 2 and second key contained ---
      {
        let firstError: Error = new Error('x');
        let secondError: Error = new Error('x');
        let cache: util.LRUCache<Error, int> = new util.LRUCache<Error, int>();
        cache.put(firstError, 10);
        cache.put(secondError, 10);
        expect(cache.getPutCount()).assertEqual(2);
        expect(cache.contains(secondError)).assertTrue();
      }

      // --- [3] Verify two different key puts accumulate put count 2 with both keys contained ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(5, 10);
        cache.put(6, 20);
        expect(cache.getPutCount()).assertEqual(2);
        expect(cache.contains(5)).assertTrue();
        expect(cache.contains(6)).assertTrue();
      }

      // --- [4] Verify one hundred different key puts accumulate put count 100 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let k: int = 0;
        while (k < 100) {
          cache.put(k, k + 1);
          k++;
        }
        expect(cache.getPutCount()).assertEqual(100);
      }

      // --- [5] Verify duplicate identical put not de-duplicated accumulating put count 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(4, 10);
        cache.put(4, 10);
        let count: long = cache.getPutCount();
        expect(count).assertEqual(2);
        expect(cache.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0110
     * @tc.name testLruCacheGetPutCount011
     * @tc.desc Merged batch (5 tests): [1] Verify a get miss filled by createDefault already raises the put count to one before the explicit overwrite makes it two | [2] Verify count continues accumulating after ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a get miss filled by createDefault already raises the put count to one before the explicit overwrite makes it two ---
      {
        let cache: TenfoldChild = new TenfoldChild();
        let filled: int | undefined = cache.get(3);
        expect(filled).assertEqual(30);
        expect(cache.length).assertEqual(1);
        let afterImplicitInsert: long = cache.getPutCount();
        expect(afterImplicitInsert).assertEqual(1);
        cache.put(3, 33);
        expect(cache.getPutCount()).assertEqual(2);
        let overwritten: int | undefined = cache.get(3);
        expect(overwritten).assertEqual(33);
      }

      // --- [2] Verify count continues accumulating after read returning previous plus 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(7, 10);
        let countBefore: long = cache.getPutCount();
        cache.put(8, 20);
        let countAfter: long = cache.getPutCount();
        expect(countAfter).assertEqual(countBefore + 1);
      }

      // --- [3] Verify a put rejected with a null key never counts so only the successful put leaves the put count at one ---
      {
        let cache: util.LRUCache<string | null, int> = new util.LRUCache<string | null, int>();
        try {
          cache.put(null, 1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.getPutCount()).assertEqual(0);

        cache.put('a', 10);
        expect(cache.getPutCount()).assertEqual(1);

        try {
          cache.put(null, 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.get('a')).assertEqual(10);
      }

      // --- [4] Verify remove after put keeps put count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.remove(2);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [5] Verify put int max key with int min value accumulates put count 1 and the max key is contained ---
      {
        let maxKey: int = 2147483647;
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(maxKey, -2147483648);
        let count: long = cache.getPutCount();
        expect(count).assertEqual(1);
        expect(cache.contains(maxKey)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0120
     * @tc.name testLruCacheGetPutCount012
     * @tc.desc Merged batch (5 tests): [1] Verify put int min key with int max value accumulates put count 1 and stores the max value | [2] Verify put negative key with negative value accumulates put count 1 and ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put int min key with int max value accumulates put count 1 and stores the max value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-2147483648, 2147483647);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.values()[0]).assertEqual(2147483647);
      }

      // --- [2] Verify put negative key with negative value accumulates put count 1 and round-trips the negative value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-1, -1);
        let stored: int | undefined = cache.get(-1);
        expect(stored).assertEqual(-1);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [3] Verify int string cache put string value A accumulates put count 1 and stores that value ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(2, 'A');
        expect(cache.values()[0]).assertEqual('A');
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [4] Verify int boolean cache put boolean value true accumulates put count 1 ---
      {
        let cache: util.LRUCache<int, boolean> = new util.LRUCache<int, boolean>();
        cache.put(2, true);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [5] Verify int double cache put double value 3.14 accumulates put count 1 ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(2, 3.14);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.get(2)).assertEqual(3.14);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0130
     * @tc.name testLruCacheGetPutCount013
     * @tc.desc Merged batch (5 tests): [1] Verify int bigint cache put bigint value 1n accumulates put count 1 | [2] Verify int Date cache put Date value accumulates put count 1 | [3] Verify int Record cache put ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify int bigint cache put bigint value 1n accumulates put count 1 ---
      {
        let cache: util.LRUCache<int, bigint> = new util.LRUCache<int, bigint>();
        cache.put(2, 1n);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [2] Verify int Date cache put Date value accumulates put count 1 ---
      {
        let cache: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        cache.put(2, new Date(0));
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [3] Verify int Record cache put Record value accumulates put count 1 ---
      {
        let vo: Record<string, int> = { 'a': 1 };
        let cache: util.LRUCache<int, Record<string, int>> = new util.LRUCache<int, Record<string, int>>();
        cache.put(2, vo);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [4] Verify int array cache put array value accumulates put count 1 ---
      {
        let va: int[] = [1, 2];
        let cache: util.LRUCache<int, int[]> = new util.LRUCache<int, int[]>();
        cache.put(2, va);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [5] Verify three distinct key puts return put count 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let count: long = cache.getPutCount();
        expect(count).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0140
     * @tc.name testLruCacheGetPutCount014
     * @tc.desc Merged batch (5 tests): [1] Verify eight puts in capacity-5 cache with eviction still return put count 8 | [2] Verify one thousand loop puts report put count 500 at the halfway mark and 1000 at the...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify eight puts in capacity-5 cache with eviction still return put count 8 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        let index: int = 0;
        while (index < 8) {
          cache.put(index, index * 10);
          index++;
        }
        expect(cache.getPutCount()).assertEqual(8);
      }

      // --- [2] Verify one thousand loop puts report put count 500 at the halfway mark and 1000 at the end ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let index: int = 0;
        while (index < 500) {
          cache.put(index, index + 1);
          index++;
        }
        let halfCount: long = cache.getPutCount();
        while (index < 1000) {
          cache.put(index, index + 1);
          index++;
        }
        expect(halfCount).assertEqual(500);
        expect(cache.getPutCount()).assertEqual(1000);
      }

      // --- [3] Verify clear between puts does not reset put count returning 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.clear();
        cache.put(2, 20);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [4] Verify remove between puts does not reset put count returning 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.remove(1);
        cache.put(2, 20);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [5] Verify overwriting both keys of a full two-slot cache raises the put count without evicting either entry ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(1, 11);
        cache.put(2, 21);
        expect(cache.getPutCount()).assertEqual(4);
        expect(cache.length).assertEqual(2);
        expect(cache.contains(1)).assertTrue();
        expect(cache.contains(2)).assertTrue();
        expect(cache.get(1)).assertEqual(11);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0150
     * @tc.name testLruCacheGetPutCount015
     * @tc.desc Merged batch (5 tests): [1] Verify five puts with four gets still return put count 5 | [2] Verify entries dropped by a capacity shrink stay gone after a later growth while the put count keeps accum...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify five puts with four gets still return put count 5 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.put(4, 40);
        cache.put(5, 50);
        cache.get(1);
        cache.get(2);
        cache.get(3);
        cache.get(4);
        expect(cache.getPutCount()).assertEqual(5);
      }

      // --- [2] Verify entries dropped by a capacity shrink stay gone after a later growth while the put count keeps accumulating ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.updateCapacity(1);
        expect(cache.length).assertEqual(1);
        expect(cache.getPutCount()).assertEqual(3);
        cache.updateCapacity(4);
        cache.put(4, 40);
        cache.put(5, 50);
        expect(cache.getPutCount()).assertEqual(5);
        expect(cache.length).assertEqual(3);
        expect(cache.contains(3)).assertTrue();
        expect(cache.contains(1)).assertFalse();
        expect(cache.contains(4)).assertTrue();
      }

      // --- [3] Verify put 100 put 200 put overwrite 200 returns put count 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(100, 1);
        cache.put(200, 2);
        cache.put(200, 3);
        expect(cache.getPutCount()).assertEqual(cache.length + 1);
      }

      // --- [4] Verify three new distinct key puts make put count equal length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.getPutCount()).assertEqual(cache.length);
      }

      // --- [5] Verify the put count matches an independently maintained tally while a loop churns a capacity-2 cache past its limit ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        let putCalls: long = 0;
        for (let round: int = 0; round < 6; round++) {
          cache.put(round, round * 10);
          putCalls = putCalls + 1;
        }
        expect(cache.getPutCount()).assertEqual(putCalls);
        expect(putCalls).assertEqual(6);
        expect(cache.length).assertEqual(2);
        expect(cache.contains(5)).assertTrue();
        expect(cache.contains(0)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0160
     * @tc.name testLruCacheGetPutCount016
     * @tc.desc Merged batch (5 tests): [1] Verify remove makes put count one more than length | [2] Verify clear keeps full historical put count two more than length | [3] Verify capacity-1 eviction makes put cou...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove makes put count one more than length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.remove(2);
        expect(cache.getPutCount()).assertEqual(cache.length + 1);
      }

      // --- [2] Verify clear keeps full historical put count two more than length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.clear();
        expect(cache.getPutCount()).assertEqual(cache.length + 2);
      }

      // --- [3] Verify capacity-1 eviction makes put count one more than length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.getPutCount()).assertEqual(cache.length + 1);
      }

      // --- [4] Verify put plus three hits makes put count equal length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        cache.get(1);
        cache.get(1);
        expect(cache.getPutCount()).assertEqual(cache.length);
      }

      // --- [5] Verify repeated getPutCount calls are idempotent returning same value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let firstCount: long = cache.getPutCount();
        cache.getPutCount();
        let secondCount: long = cache.getPutCount();
        expect(firstCount).assertEqual(secondCount);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0170
     * @tc.name testLruCacheGetPutCount017
     * @tc.desc Merged batch (5 tests): [1] Verify put instance A put count is 1 while instance B untouched | [2] Verify instance A three puts and instance B one put keep independent counts 3 and 1 | [3] Verify co...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put instance A put count is 1 while instance B untouched ---
      {
        let firstCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let secondCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        firstCache.put(1, 10);
        expect(firstCache.getPutCount()).assertEqual(1);
        expect(secondCache.getPutCount()).assertEqual(0);
      }

      // --- [2] Verify instance A three puts and instance B one put keep independent counts 3 and 1 ---
      {
        let firstCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let secondCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        firstCache.put(1, 10);
        firstCache.put(2, 20);
        firstCache.put(3, 30);
        secondCache.put(1, 10);
        expect(firstCache.getPutCount()).assertEqual(3);
        expect(secondCache.getPutCount()).assertEqual(1);
      }

      // --- [3] Verify count increments by 2 over base value after two additional puts ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let base: long = cache.getPutCount();
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.getPutCount()).assertEqual(base + 2);
      }

      // --- [4] Verify two instances interleaved puts keep independent counts 2 and 1 ---
      {
        let firstCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let secondCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        firstCache.put(1, 10);
        secondCache.put(2, 20);
        firstCache.put(3, 30);
        expect(firstCache.getPutCount()).assertEqual(2);
        expect(secondCache.getPutCount()).assertEqual(1);
      }

      // --- [5] Verify put count assignable to double variable equals 3.0 over three slots ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let d: double = cache.getPutCount();
        expect(d).assertEqual(3.0);
        expect(cache.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0180
     * @tc.name testLruCacheGetPutCount018
     * @tc.desc Merged batch (5 tests): [1] Verify put count toString returns string 4 | [2] Verify put count participates in long arithmetic doubled equals 6 | [3] Verify put count converted to long equals 2 with...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put count toString returns string 4 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.put(4, 40);
        expect(cache.getPutCount().toString()).assertEqual('4');
      }

      // --- [2] Verify put count participates in long arithmetic doubled equals 6 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let doubled: long = cache.getPutCount() + cache.getPutCount();
        expect(doubled).assertEqual(6);
      }

      // --- [3] Verify put count converted to long equals 2 with first key 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let iv: long = cache.getPutCount();
        expect(iv).assertEqual(2);
        expect(cache.keys()[0]).assertEqual(1);
      }

      // --- [4] Verify boolean boolean cache put true true returns put count 1 ---
      {
        let cache: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>();
        cache.put(true, true);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [5] Verify various typed cache put returns put count 1 ---
      {
        // long key, double value
        let cacheLongDouble: util.LRUCache<long, double> = new util.LRUCache<long, double>();
        cacheLongDouble.put(Int.toLong(100), 3.14);
        expect(cacheLongDouble.getPutCount()).assertEqual(1);

        // Date key, Record value
        let cacheDateRecord: util.LRUCache<Date, Record<string, int>> = new util.LRUCache<Date, Record<string, int>>();
        let recordValue: Record<string, int> = { 'a': 1 };
        cacheDateRecord.put(new Date(0), recordValue);
        expect(cacheDateRecord.getPutCount()).assertEqual(1);

        // Map key, Set value
        let cacheMapSet: util.LRUCache<Map<string, int>, Set<int>> = new util.LRUCache<Map<string, int>, Set<int>>();
        let mapKey: Map<string, int> = new Map<string, int>();
        mapKey.set('k', 1);
        let setValue: Set<int> = new Set<int>();
        setValue.add(1);
        cacheMapSet.put(mapKey, setValue);
        expect(cacheMapSet.getPutCount()).assertEqual(1);

        // Set key, Map value
        let cacheSetMap: util.LRUCache<Set<int>, Map<string, int>> = new util.LRUCache<Set<int>, Map<string, int>>();
        let setKey: Set<int> = new Set<int>();
        setKey.add(1);
        let mapVal: Map<string, int> = new Map<string, int>();
        mapVal.set('a', 1);
        cacheSetMap.put(setKey, mapVal);
        expect(cacheSetMap.getPutCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0190
     * @tc.name testLruCacheGetPutCount019
     * @tc.desc Merged batch (5 tests): [1] Verify RegExp Error cache put returns put count 1 | [2] Verify int array cache put array key array value returns put count 1 | [3] Verify bigint bigint cache put bigint ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify RegExp Error cache put returns put count 1 ---
      {
        let cache: util.LRUCache<RegExp, Error> = new util.LRUCache<RegExp, Error>();
        cache.put(new RegExp('a'), new Error('x'));
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [2] Verify int array cache put array key array value returns put count 1 ---
      {
        let cache: util.LRUCache<int[], int[]> = new util.LRUCache<int[], int[]>();
        let arrayKey: int[] = [1, 2];
        let arrayValue: int[] = [3, 4];
        cache.put(arrayKey, arrayValue);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [3] Verify bigint bigint cache put bigint key and value returns put count 1 ---
      {
        let cache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>();
        cache.put(1n, 2n);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [4] Verify string string cache put alpha beta returns put count 1 with one key stored ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('alpha', 'beta');
        expect(cache.keys().length).assertEqual(1);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [5] Verify single character string key value cache put returns put count 1 ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        let stringKey: string = 'a';
        cache.put(stringKey, 'b');
        expect(cache.getPutCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0200
     * @tc.name testLruCacheGetPutCount020
     * @tc.desc Merged batch (5 tests): [1] Verify short long cache put short key large long value returns put count 1 | [2] Verify Uint8Array int cache put typed array key returns put count 1 | [3] Verify WeakMap...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify short long cache put short key large long value returns put count 1 ---
      {
        let cache: util.LRUCache<short, long> = new util.LRUCache<short, long>();
        let shortKey: short = 1 as short;
        cache.put(shortKey, 9007199254740993);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [2] Verify Uint8Array int cache put typed array key returns put count 1 ---
      {
        let cache: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        let uintKey: Uint8Array = new Uint8Array([1, 2, 3]);
        cache.put(uintKey, 1);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [3] Verify WeakMap int cache put WeakMap key returns put count 1 ---
      {
        let cache: util.LRUCache<WeakMap<string, int>, int> = new util.LRUCache<WeakMap<string, int>, int>();
        let wmKey: WeakMap<string, int> = new WeakMap<string, int>();
        cache.put(wmKey, 1);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [4] Verify byte short cache put byte key short value returns put count 1 and round-trips the value ---
      {
        let cache: util.LRUCache<byte, short> = new util.LRUCache<byte, short>();
        let byteKey: byte = 1 as byte;
        let shortValue: short = 2 as short;
        cache.put(byteKey, shortValue);
        expect(cache.get(byteKey)).assertEqual(shortValue);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [5] Verify float float cache put float key float value returns put count 1 and stores that value ---
      {
        let cache: util.LRUCache<float, float> = new util.LRUCache<float, float>();
        let floatKey: float = 1.5 as float;
        let floatValue: float = 2.5 as float;
        cache.put(floatKey, floatValue);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.values()[0]).assertEqual(floatValue);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0210
     * @tc.name testLruCacheGetPutCount021
     * @tc.desc Merged batch (5 tests): [1] Verify capacity-1 cache single put returns put count 1 and length 1 | [2] Verify put in a cache at int maximum capacity 2147483647 returns put count 1 and keeps capacity...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify capacity-1 cache single put returns put count 1 and length 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 10);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.length).assertEqual(1);
      }

      // --- [2] Verify put in a cache at int maximum capacity 2147483647 returns put count 1 and keeps capacity ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        cache.put(1, 10);
        expect(cache.getCapacity()).assertEqual(2147483647);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [3] Verify single element cache getPutCount 1 and holds exactly one key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        expect(cache.getPutCount()).assertEqual(1);
        expect(cache.keys().length).assertEqual(1);
      }

      // --- [4] Verify updateCapacity shrink does not reset put count returning 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(10);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.updateCapacity(2);
        expect(cache.getPutCount()).assertEqual(3);
      }

      // --- [5] Verify put on new key after getPutCount call returns undefined ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.getPutCount();
        let putResult: int | undefined = cache.put(2, 20);
        expect(putResult).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0220
     * @tc.name testLruCacheGetPutCount022
     * @tc.desc Merged batch (5 tests): [1] Verify overwrite put after getPutCount call returns original value 10 | [2] Verify remove existing key after getPutCount call returns 10 | [3] Verify contains still true...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwrite put after getPutCount call returns original value 10 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.getPutCount();
        let putResult: int | undefined = cache.put(1, 20);
        expect(putResult).assertEqual(10);
      }

      // --- [2] Verify remove existing key after getPutCount call returns 10 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.getPutCount();
        let removeResult: int | undefined = cache.remove(1);
        expect(removeResult).assertEqual(10);
      }

      // --- [3] Verify contains still true after getPutCount call ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.getPutCount();
        expect(cache.contains(1)).assertTrue();
      }

      // --- [4] Verify overwriting the emoji surrogate-pair key then evicting it with a plain key accumulates put count 3 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(1);
        cache.put('😀', 1);
        cache.put('😀', 2);
        cache.put('plain', 3);
        expect(cache.getPutCount()).assertEqual(3);
        expect(cache.contains('😀')).assertFalse();
      }

      // --- [5] Verify re-putting the NUL character key alongside the 0xFFFF key accumulates put count 3 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('\u0000', 0);
        cache.put('\uFFFF', 1);
        cache.put('\u0000', 9);
        expect(cache.getPutCount()).assertEqual(3);
        expect(cache.get('\u0000')).assertEqual(9);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_PUT_COUNT_0230
     * @tc.name testLruCacheGetPutCount023
     * @tc.desc Merged batch (2 tests): [1] Verify puts on two enum members and an overwrite accumulate put count 3 | [2] Verify puts around a grow then shrink sequence accumulate put count 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetPutCount023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify puts on two enum members and an overwrite accumulate put count 3 ---
      {
        let cache: util.LRUCache<PutSlot, int> = new util.LRUCache<PutSlot, int>();
        cache.put(PutSlot.First, 1);
        cache.put(PutSlot.Second, 2);
        cache.put(PutSlot.First, 3);
        expect(cache.getPutCount()).assertEqual(3);
      }

      // --- [2] Verify puts around a grow then shrink sequence accumulate put count 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.updateCapacity(5);
        cache.put(3, 30);
        cache.updateCapacity(2);
        expect(cache.getPutCount()).assertEqual(3);
      }
    });

  });
}
