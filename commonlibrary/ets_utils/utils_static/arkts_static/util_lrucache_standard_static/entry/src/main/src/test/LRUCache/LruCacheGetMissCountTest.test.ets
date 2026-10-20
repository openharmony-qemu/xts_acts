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

class EchoMissChild extends util.LRUCache<int, int> {
  constructor() {
    super();
  }
  createDefault(key: int): int {
    return key;
  }
}

class StrLenMissChild extends util.LRUCache<string, int> {
  constructor() {
    super();
  }
  createDefault(key: string): int {
    return key.length;
  }
}

class ValHolderMiss {
  v: int = 1;
}

class ClassMissChild extends util.LRUCache<ValHolderMiss, ValHolderMiss> {
  constructor() {
    super();
  }
  createDefault(key: ValHolderMiss): ValHolderMiss {
    return new ValHolderMiss();
  }
}

enum MissSlot {
  First = 0,
  Second = 1
}

export default function lruCacheGetMissCountTest(): void {
  describe('LruCacheGetMissCountTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0010
     * @tc.name testLruCacheGetMissCount001
     * @tc.desc Merged batch (5 tests): [1] Verify zero-argument getMissCount on fresh cache returns initial miss count 0 | [2] Verify get on missing key 0 in empty cache accumulates miss count 1 | [3] Verify get ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify zero-argument getMissCount on fresh cache returns initial miss count 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(cache.getMissCount()).assertEqual(0);
      }

      // --- [2] Verify get on missing key 0 in empty cache accumulates miss count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(cache.isEmpty()).assertTrue();
        let missingKey: int = 0;
        cache.get(missingKey);
        expect(cache.getMissCount()).assertEqual(1);
        expect(cache.length).assertEqual(0);
      }

      // --- [3] Verify get on missing positive key 1 in empty cache accumulates miss count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let missingKey: int = 1;
        let miss: int | undefined = cache.get(missingKey);
        expect(miss).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [4] Verify get on missing key -1, the negative value adjacent to key 0, in an empty cache accumulates miss count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let negativeKey: int = -1;
        cache.get(negativeKey);
        let misses: long = cache.getMissCount();
        expect(misses).assertEqual(1);
      }

      // --- [5] Verify get on missing key 2 while other key 5 present accumulates miss count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(5, 50);
        let missingKey: int = 2;
        expect(cache.get(missingKey)).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0020
     * @tc.name testLruCacheGetMissCount002
     * @tc.desc Merged batch (5 tests): [1] Verify get on missing int max key 2147483647 accumulates miss count 1 | [2] Verify get on missing int minimum key -2147483648 given as a literal, the smallest int value,...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get on missing int max key 2147483647 accumulates miss count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let missingKey: int = 2147483647;
        cache.get(missingKey);
        expect(cache.getMissCount()).assertEqual(1);
        expect(cache.length).assertEqual(0);
      }

      // --- [2] Verify get on missing int minimum key -2147483648 given as a literal, the smallest int value, accumulates miss count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let minKey: int = -2147483648;
        cache.get(minKey);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [3] Verify hit on put key 2 does not raise miss count keeping 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let key: int = 2;
        cache.put(key, 10);
        expect(cache.get(key)).assertEqual(10);
        expect(cache.getMissCount()).assertEqual(0);
      }

      // --- [4] Verify hit on put key 0 does not raise miss count keeping 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(0, 10);
        let before: long = cache.getMissCount();
        cache.get(0);
        expect(cache.getMissCount()).assertEqual(before);
      }

      // --- [5] Verify hit on put key -1, the negative value adjacent to key 0, does not raise miss count keeping 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let negativeKey: int = -1;
        cache.put(negativeKey, 10);
        let value: int | undefined = cache.get(negativeKey);
        expect(value).assertEqual(10);
        expect(cache.getMissCount()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0030
     * @tc.name testLruCacheGetMissCount003
     * @tc.desc Merged batch (5 tests): [1] Verify hit on put int max key 2147483647 does not raise miss count keeping 0 | [2] Verify repeated hits on a put int key computed as -2147483647 - 1, which equals the in...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify hit on put int max key 2147483647 does not raise miss count keeping 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2147483647, 10);
        let key: int = 2147483647;
        cache.get(key);
        expect(cache.getMissCount()).assertEqual(0);
        expect(cache.length).assertEqual(1);
      }

      // --- [2] Verify repeated hits on a put int key computed as -2147483647 - 1, which equals the int minimum, keep miss count 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let minKey: int = -2147483647 - 1;
        cache.put(minKey, 10);
        cache.get(minKey);
        cache.get(minKey);
        expect(cache.getMissCount()).assertEqual(0);
      }

      // --- [3] Verify hit on put smallest positive key 1 does not raise miss count keeping 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let key: int = 1;
        let value: int = 10;
        cache.put(key, value);
        expect(cache.get(key)).assertEqual(value);
        expect(cache.getMissCount()).assertEqual(0);
        expect(cache.length).assertEqual(1);
      }

      // --- [4] Verify get on missing empty string key accumulates miss count 1 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        expect(cache.isEmpty()).assertTrue();
        let missingKey: string = '';
        cache.get(missingKey);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [5] Verify hit on put empty string key keeps miss count 0 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = '';
        cache.put(key, 10);
        expect(cache.get(key)).assertEqual(10);
        expect(cache.getMissCount()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0040
     * @tc.name testLruCacheGetMissCount004
     * @tc.desc Merged batch (5 tests): [1] Verify get on missing ordinary string key key accumulates miss count 1 | [2] Verify hit on put ordinary string key key keeps miss count 0 | [3] Verify get on missing Chi...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get on missing ordinary string key key accumulates miss count 1 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let missingKey: string = 'key';
        let miss: int | undefined = cache.get(missingKey);
        expect(miss).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [2] Verify hit on put ordinary string key key keeps miss count 0 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('key', 10);
        let value: int | undefined = cache.get('key');
        expect(value).assertEqual(10);
        expect(cache.getMissCount()).assertEqual(0);
        expect(cache.length).assertEqual(1);
      }

      // --- [3] Verify get on missing Chinese multibyte string key accumulates miss count 1 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.get('你好');
        expect(cache.getMissCount()).assertEqual(1);
        expect(cache.length).assertEqual(0);
      }

      // --- [4] Verify get on missing special character script tag key accumulates miss count 1 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = '<script>';
        cache.get(key);
        let misses: long = cache.getMissCount();
        expect(misses).assertEqual(1);
      }

      // --- [5] Verify get on missing 10001-char overlong string key accumulates miss count 1 ---
      {
        let longKey: string = 'x';
        let j: int = 0;
        while (j < 10000) {
          longKey = longKey + 'y';
          j++;
        }
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.get(longKey);
        expect(cache.getMissCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0050
     * @tc.name testLruCacheGetMissCount005
     * @tc.desc Merged batch (5 tests): [1] Verify get on missing UUID format string key accumulates miss count 1 | [2] Verify string keys compared by content as different keys for 0x10 and 16 accumulates miss cou...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get on missing UUID format string key accumulates miss count 1 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = '84bdf796-66cc-4655-9b89-d6218d100f9c';
        cache.get(key);
        expect(cache.getMissCount()).assertEqual(1);
        expect(cache.isEmpty()).assertTrue();
      }

      // --- [2] Verify string keys compared by content as different keys for 0x10 and 16 accumulates miss count 1 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('0x10', 10);
        let otherKey: string = '16';
        let miss: int | undefined = cache.get(otherKey);
        expect(miss).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [3] Verify two distinct string key misses accumulate miss count 2 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.get('a');
        cache.get('b');
        expect(cache.getMissCount()).assertEqual(2);
      }

      // --- [4] Verify boolean cache get on missing true key accumulates miss count 1 ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.get(true);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [5] Verify boolean cache hit on put true key keeps miss count 0 ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(true, 10);
        cache.get(true);
        expect(cache.getMissCount()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0060
     * @tc.name testLruCacheGetMissCount006
     * @tc.desc Merged batch (5 tests): [1] Verify boolean cache put false then get true is a miss accumulating count 1 | [2] Verify bigint cache get on missing bigint key 1n accumulates miss count 1 | [3] Verify ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify boolean cache put false then get true is a miss accumulating count 1 ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(false, 10);
        cache.get(true);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [2] Verify bigint cache get on missing bigint key 1n accumulates miss count 1 ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        cache.get(1n);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [3] Verify bigint cache hit on put 1n key keeps miss count 0 ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        cache.put(1n, 10);
        cache.get(1n);
        expect(cache.getMissCount()).assertEqual(0);
      }

      // --- [4] Verify double cache get on missing double key 1.5 accumulates miss count 1 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        let missingKey: double = 1.5;
        expect(cache.isEmpty()).assertTrue();
        cache.get(missingKey);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [5] Verify double cache hit on put 3.14 key keeps miss count 0 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        let key: double = 3.14;
        cache.put(key, 10);
        cache.get(key);
        expect(cache.getMissCount()).assertEqual(0);
        expect(cache.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0070
     * @tc.name testLruCacheGetMissCount007
     * @tc.desc Merged batch (5 tests): [1] Verify double cache get on missing Infinity key accumulates miss count 1 | [2] Verify positive zero and negative zero double keys are treated equal hit keeping miss coun...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify double cache get on missing Infinity key accumulates miss count 1 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.get(Double.POSITIVE_INFINITY);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [2] Verify positive zero and negative zero double keys are treated equal hit keeping miss count 0 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(0.0, 10);
        cache.get(-0.0);
        expect(cache.getMissCount()).assertEqual(0);
      }

      // --- [3] Verify NaN key hit with itself keeps miss count 0 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.NaN, 10);
        cache.get(Double.NaN);
        expect(cache.getMissCount()).assertEqual(0);
      }

      // --- [4] Verify get on missing 2.5 key when NaN key present accumulates miss count 1 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.NaN, 10);
        cache.get(2.5);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [5] Verify negative zero put and positive zero get are equal hit keeping miss count 0 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(-0.0, 10);
        cache.get(0.0);
        expect(cache.getMissCount()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0080
     * @tc.name testLruCacheGetMissCount008
     * @tc.desc Merged batch (5 tests): [1] Verify object cache content-equal different references count as miss accumulating count 1 | [2] Verify object cache same-reference key hit keeps miss count 0 | [3] Verif...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify object cache content-equal different references count as miss accumulating count 1 ---
      {
        let keyA: Record<string, int> = { 'a': 1 };
        let keyB: Record<string, int> = { 'a': 1 };
        let cache: util.LRUCache<Record<string, int>, int> = new util.LRUCache<Record<string, int>, int>();
        cache.put(keyA, 10);
        cache.get(keyB);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [2] Verify object cache same-reference key hit keeps miss count 0 ---
      {
        let keyC: Record<string, int> = { 'a': 1 };
        let cache: util.LRUCache<Record<string, int>, int> = new util.LRUCache<Record<string, int>, int>();
        cache.put(keyC, 10);
        cache.get(keyC);
        expect(cache.getMissCount()).assertEqual(0);
      }

      // --- [3] Verify Date cache distinct instances with equal milliseconds count as miss accumulating count 1 ---
      {
        let firstDate: Date = new Date(0);
        let secondDate: Date = new Date(0);
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(firstDate, 10);
        cache.get(secondDate);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [4] Verify Date cache same-reference key hit keeps miss count 0 ---
      {
        let dateKey: Date = new Date(1000);
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(dateKey, 10);
        cache.get(dateKey);
        expect(cache.getMissCount()).assertEqual(0);
      }

      // --- [5] Verify RegExp cache distinct instances with same pattern count as miss accumulating count 1 ---
      {
        let firstRegex: RegExp = new RegExp('a');
        let secondRegex: RegExp = new RegExp('a');
        let cache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        cache.put(firstRegex, 10);
        cache.get(secondRegex);
        expect(cache.getMissCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0090
     * @tc.name testLruCacheGetMissCount009
     * @tc.desc Merged batch (5 tests): [1] Verify RegExp cache same-reference key hit keeps miss count 0 | [2] Verify int array cache content-equal different references count as miss accumulating count 1 | [3] Ve...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify RegExp cache same-reference key hit keeps miss count 0 ---
      {
        let regexKey: RegExp = new RegExp('b');
        let cache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        cache.put(regexKey, 10);
        cache.get(regexKey);
        expect(cache.getMissCount()).assertEqual(0);
      }

      // --- [2] Verify int array cache content-equal different references count as miss accumulating count 1 ---
      {
        let firstArray: int[] = [1, 2, 3];
        let secondArray: int[] = [1, 2, 3];
        let cache: util.LRUCache<int[], int> = new util.LRUCache<int[], int>();
        cache.put(firstArray, 10);
        cache.get(secondArray);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [3] Verify int array cache same-reference key hit keeps miss count 0 ---
      {
        let arrayKey: int[] = [4, 5];
        let cache: util.LRUCache<int[], int> = new util.LRUCache<int[], int>();
        cache.put(arrayKey, 10);
        cache.get(arrayKey);
        expect(cache.getMissCount()).assertEqual(0);
      }

      // --- [4] Verify Map cache distinct instance empty map counts as miss accumulating count 1 ---
      {
        let mk: Map<string, int> = new Map<string, int>();
        mk.set('k', 1);
        let cache: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        cache.put(mk, 10);
        cache.get(new Map<string, int>());
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [5] Verify Error cache distinct instances with same message count as miss accumulating count 1 ---
      {
        let firstError: Error = new Error('x');
        let secondError: Error = new Error('x');
        let cache: util.LRUCache<Error, int> = new util.LRUCache<Error, int>();
        cache.put(firstError, 10);
        cache.get(secondError);
        expect(cache.getMissCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0100
     * @tc.name testLruCacheGetMissCount010
     * @tc.desc Merged batch (5 tests): [1] Verify one hundred different key misses accumulate miss count 100 | [2] Verify same missing key get repeated three times accumulates miss count 3 | [3] Verify hit follow...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one hundred different key misses accumulate miss count 100 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let k: int = 0;
        while (k < 100) {
          cache.get(k);
          k++;
        }
        expect(cache.getMissCount()).assertEqual(100);
      }

      // --- [2] Verify same missing key get repeated three times accumulates miss count 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(3);
        cache.get(3);
        cache.get(3);
        expect(cache.getMissCount()).assertEqual(3);
      }

      // --- [3] Verify hit followed by miss accumulates miss count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let present: int = 2;
        cache.put(present, 10);
        cache.get(present);
        let absent: int | undefined = cache.get(3);
        expect(absent).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [4] Verify alternating miss hit miss accumulates miss count 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.get(3);
        cache.get(2);
        cache.get(4);
        expect(cache.getMissCount()).assertEqual(2);
      }

      // --- [5] Verify read of miss count does not stop later miss accumulation returning previous plus 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let countBefore: long = cache.getMissCount();
        cache.get(9);
        let countAfter: long = cache.getMissCount();
        expect(countAfter).assertEqual(countBefore + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0110
     * @tc.name testLruCacheGetMissCount011
     * @tc.desc Merged batch (5 tests): [1] Verify clear does not reset miss counter accumulating count 2 | [2] Verify get on shrunk-away key after updateCapacity accumulates miss count 1 | [3] Verify get on remov...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify clear does not reset miss counter accumulating count 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(1);
        cache.clear();
        cache.get(2);
        expect(cache.getMissCount()).assertEqual(2);
      }

      // --- [2] Verify get on shrunk-away key after updateCapacity accumulates miss count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.updateCapacity(1);
        cache.get(1);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [3] Verify get on removed key counts as miss accumulating count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.remove(2);
        cache.get(2);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [4] Verify get on evicted key in capacity-1 cache accumulates miss count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.get(1);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [5] Verify get in a cache at int maximum capacity 2147483647 counts as miss accumulating count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        cache.get(5);
        expect(cache.getMissCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0120
     * @tc.name testLruCacheGetMissCount012
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault child get on missing key still accumulates miss count 1 | [2] Verify put overwriting existing key then hit keeps miss count 0 | [3] Verify two cache...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault child get on missing key still accumulates miss count 1 ---
      {
        let cache: EchoMissChild = new EchoMissChild();
        cache.get(3);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [2] Verify put overwriting existing key then hit keeps miss count 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.put(2, 20);
        cache.get(2);
        expect(cache.getMissCount()).assertEqual(0);
      }

      // --- [3] Verify two cache instances keep independent miss counters ---
      {
        let firstCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        firstCache.get(1);
        let secondCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(secondCache.getMissCount()).assertEqual(0);
      }

      // --- [4] Verify int min key hit then int max key miss accumulates miss count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-2147483648, 10);
        cache.get(-2147483648);
        cache.get(2147483647);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [5] Verify two no-argument reads summed still equal 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let a: long = cache.getMissCount();
        let b: long = cache.getMissCount();
        expect(a + b).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0130
     * @tc.name testLruCacheGetMissCount013
     * @tc.desc Merged batch (5 tests): [1] Verify cache remains usable and inserted key get returns original value after miss count read | [2] Verify remove only keeps miss count 0 | [3] Verify updateCapacity enl...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify cache remains usable and inserted key get returns original value after miss count read ---
      {
        let cache: EchoMissChild = new EchoMissChild();
        cache.get(1);
        cache.getMissCount();
        let v: int | undefined = cache.get(1);
        expect(v).assertEqual(1);
      }

      // --- [2] Verify remove only keeps miss count 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.remove(1);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(0);
      }

      // --- [3] Verify updateCapacity enlargement only keeps miss count 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.updateCapacity(128);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(0);
      }

      // --- [4] Verify clear only keeps miss count 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.clear();
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(0);
      }

      // --- [5] Verify reading other counters only keeps miss count 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.getMatchCount();
        cache.getCreateCount();
        cache.getRemovalCount();
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0140
     * @tc.name testLruCacheGetMissCount014
     * @tc.desc Merged batch (5 tests): [1] Verify single miss returns exactly 1 | [2] Verify a key that misses before and after put then remove counts two misses | [3] Verify repeated reads of the counter do not ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify single miss returns exactly 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(5);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [2] Verify a key that misses before and after put then remove counts two misses ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(7);
        cache.put(7, 70);
        cache.remove(7);
        cache.get(7);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(2);
      }

      // --- [3] Verify repeated reads of the counter do not change the miss count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(1);
        let first: long = cache.getMissCount();
        cache.getMissCount();
        let second: long = cache.getMissCount();
        expect(first).assertEqual(1);
        expect(second).assertEqual(1);
      }

      // --- [4] Verify two consecutive reads return identical values without self-increment side effect ---
      {
        let cache: EchoMissChild = new EchoMissChild();
        cache.get(1);
        let a: long = cache.getMissCount();
        let b: long = cache.getMissCount();
        expect(a).assertEqual(b);
      }

      // --- [5] Verify reading getMissCount does not change cache length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let len: int = cache.length;
        cache.getMissCount();
        expect(cache.length).assertEqual(len);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0150
     * @tc.name testLruCacheGetMissCount015
     * @tc.desc Merged batch (5 tests): [1] Verify remove after misses does not alter accumulated miss count | [2] Verify reading getMissCount leaves cache content untouched and hit returns original value | [3] Ve...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove after misses does not alter accumulated miss count ---
      {
        let cache: EchoMissChild = new EchoMissChild();
        cache.get(1);
        cache.get(2);
        let a: long = cache.getMissCount();
        cache.remove(1);
        let b: long = cache.getMissCount();
        expect(a).assertEqual(b);
      }

      // --- [2] Verify reading getMissCount leaves cache content untouched and hit returns original value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.getMissCount();
        let v: int | undefined = cache.get(1);
        expect(v).assertEqual(10);
      }

      // --- [3] Verify put between two reads keeps miss count stable ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(3);
        let a: long = cache.getMissCount();
        cache.put(1, 10);
        let b: long = cache.getMissCount();
        expect(a).assertEqual(b);
      }

      // --- [4] Verify reading miss count in capacity-1 cache does not evict and key still hits original value ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => key,
          1);
        cache.get(1);
        cache.getMissCount();
        let v: int | undefined = cache.get(1);
        expect(v).assertEqual(1);
      }

      // --- [5] Verify updateCapacity enlargement does not reset miss count ---
      {
        let cache: EchoMissChild = new EchoMissChild();
        cache.get(1);
        cache.get(2);
        let a: long = cache.getMissCount();
        cache.updateCapacity(100);
        let b: long = cache.getMissCount();
        expect(b).assertEqual(a);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0160
     * @tc.name testLruCacheGetMissCount016
     * @tc.desc Merged batch (5 tests): [1] Verify updateCapacity shrink does not reset miss count | [2] Verify a further miss after read equals previous value plus 1 | [3] Verify repeated hits keep miss count 0 i...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify updateCapacity shrink does not reset miss count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(3);
        let a: long = cache.getMissCount();
        cache.updateCapacity(1);
        let b: long = cache.getMissCount();
        expect(b).assertEqual(a);
      }

      // --- [2] Verify a further miss after read equals previous value plus 1 ---
      {
        let cache: EchoMissChild = new EchoMissChild();
        cache.get(1);
        let before: long = cache.getMissCount();
        cache.get(2);
        let after: long = cache.getMissCount();
        expect(after).assertEqual(before + 1);
      }

      // --- [3] Verify repeated hits keep miss count 0 independent of match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        cache.get(1);
        cache.get(1);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(0);
      }

      // --- [4] Verify miss count still accumulates when cache capacity is full ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.get(9);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [5] Verify cross reading four counters leaves miss count unchanged ---
      {
        let cache: EchoMissChild = new EchoMissChild();
        cache.get(1);
        cache.get(2);
        let before: long = cache.getMissCount();
        cache.getMatchCount();
        cache.getCreateCount();
        cache.getRemovalCount();
        let after: long = cache.getMissCount();
        expect(after).assertEqual(before);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0170
     * @tc.name testLruCacheGetMissCount017
     * @tc.desc Merged batch (5 tests): [1] Verify miss count and match count sum equals total get call count | [2] Verify reading miss count does not change match count value | [3] Verify create child single miss...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify miss count and match count sum equals total get call count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        cache.get(9);
        cache.get(1);
        cache.get(8);
        cache.get(1);
        let miss: long = cache.getMissCount();
        let match: long = cache.getMatchCount();
        expect(miss + match).assertEqual(5);
      }

      // --- [2] Verify reading miss count does not change match count value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        let a: long = cache.getMatchCount();
        cache.getMissCount();
        let b: long = cache.getMatchCount();
        expect(a).assertEqual(b);
      }

      // --- [3] Verify create child single miss makes miss count equal create count ---
      {
        let cache: EchoMissChild = new EchoMissChild();
        cache.get(3);
        let miss: long = cache.getMissCount();
        let create: long = cache.getCreateCount();
        expect(miss).assertEqual(create);
      }

      // --- [4] Verify loop of 256 different key misses counts exactly 256 ---
      {
        let cache: EchoMissChild = new EchoMissChild();
        for (let i: int = 0; i < 256; i++) {
          cache.get(i);
        }
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(256);
      }

      // --- [5] Verify empty string miss and int 0 miss return identical miss counts ---
      {
        let a: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        a.get('');
        let b: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        b.get(0);
        expect(a.getMissCount()).assertEqual(b.getMissCount());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0180
     * @tc.name testLruCacheGetMissCount018
     * @tc.desc Merged batch (5 tests): [1] Verify string int instantiation string key miss count is 1 | [2] Verify int string instantiation createDefault string value miss count is 1 | [3] Verify double double in...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify string int instantiation string key miss count is 1 ---
      {
        let cache: StrLenMissChild = new StrLenMissChild();
        cache.get('hello');
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [2] Verify int string instantiation createDefault string value miss count is 1 ---
      {
        let cache: ProbeCache<int, string> = new ProbeCache<int, string>(
          undefined,
          (key: int) => 'v' + key);
        cache.get(5);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [3] Verify double double instantiation double value miss count is 1 ---
      {
        let cache: ProbeCache<double, double> = new ProbeCache<double, double>(
          undefined,
          (key: double) => key * 0.5);
        cache.get(1.25);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [4] Verify long int instantiation out-of-int-range long key miss count is 1 ---
      {
        let cache: ProbeCache<long, int> = new ProbeCache<long, int>(
          undefined,
          (key: long) => 1);
        let k: long = 10000000000;
        cache.get(k);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [5] Verify float float instantiation float key miss count is 1 ---
      {
        let cache: ProbeCache<float, float> = new ProbeCache<float, float>(
          undefined,
          (key: float) => key);
        cache.get(1.5);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0190
     * @tc.name testLruCacheGetMissCount019
     * @tc.desc Merged batch (5 tests): [1] Verify boolean boolean instantiation boolean key miss count is 1 | [2] Verify int long instantiation long extreme createDefault value miss count is 1 | [3] Verify int bi...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify boolean boolean instantiation boolean key miss count is 1 ---
      {
        let cache: ProbeCache<boolean, boolean> = new ProbeCache<boolean, boolean>(
          undefined,
          (key: boolean) => true);
        cache.get(true);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [2] Verify int long instantiation long extreme createDefault value miss count is 1 ---
      {
        let cache: ProbeCache<int, long> = new ProbeCache<int, long>(
          undefined,
          (key: int) => 9223372036854775807);
        cache.get(1);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [3] Verify int bigint instantiation bigint createDefault value miss count is 1 ---
      {
        let cache: ProbeCache<int, bigint> = new ProbeCache<int, bigint>(
          undefined,
          (key: int) => 123456789012345678901234567890n);
        cache.get(3);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [4] Verify class class instantiation class instance key miss count is 1 ---
      {
        let cache: ClassMissChild = new ClassMissChild();
        let key: ValHolderMiss = new ValHolderMiss();
        cache.get(key);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [5] Verify two content-equal distinct class instance key misses count as 2 by reference semantics ---
      {
        let cache: ClassMissChild = new ClassMissChild();
        let firstKey: ValHolderMiss = new ValHolderMiss();
        let secondKey: ValHolderMiss = new ValHolderMiss();
        cache.get(firstKey);
        cache.get(secondKey);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0200
     * @tc.name testLruCacheGetMissCount020
     * @tc.desc Merged batch (5 tests): [1] Verify int Date instantiation Date createDefault value miss count is 1 | [2] Verify string TestClass instantiation string key mapping class value miss count is 1 | [3] V...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify int Date instantiation Date createDefault value miss count is 1 ---
      {
        let cache: ProbeCache<int, Date> = new ProbeCache<int, Date>(
          undefined,
          (key: int) => new Date(0));
        cache.get(5);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [2] Verify string TestClass instantiation string key mapping class value miss count is 1 ---
      {
        let cache: ProbeCache<string, ValHolderMiss> = new ProbeCache<string, ValHolderMiss>(
          undefined,
          (key: string) => new ValHolderMiss());
        cache.get('k1');
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [3] Verify int TestClass instantiation int key mapping class value miss count is 1 ---
      {
        let cache: ProbeCache<int, ValHolderMiss> = new ProbeCache<int, ValHolderMiss>(
          undefined,
          (key: int) => new ValHolderMiss());
        cache.get(2);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [4] Verify Date int instantiation Date reference key miss count is 1 ---
      {
        let cache: ProbeCache<Date, int> = new ProbeCache<Date, int>(
          undefined,
          (key: Date) => 1);
        let d: Date = new Date(2026, 8, 2);
        cache.get(d);
        let cnt: long = cache.getMissCount();
        expect(cnt).assertEqual(1);
      }

      // --- [5] Verify contains miss counts one miss and a following get miss makes two ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let absent: boolean = cache.contains(9);
        expect(absent).assertFalse();
        expect(cache.getMissCount()).assertEqual(1);
        let value: int | undefined = cache.get(9);
        expect(value).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0210
     * @tc.name testLruCacheGetMissCount021
     * @tc.desc Merged batch (5 tests): [1] Verify a miss on the emoji surrogate-pair key then its re-put and hit keeps miss count at 1 | [2] Verify misses on the distinct NUL character key and maximum BMP 0xFFFF ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a miss on the emoji surrogate-pair key then its re-put and hit keeps miss count at 1 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        expect(cache.get('😀')).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(1);
        cache.put('😀', 7);
        expect(cache.get('😀')).assertEqual(7);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [2] Verify misses on the distinct NUL character key and maximum BMP 0xFFFF key accumulate miss count 2 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        expect(cache.get('\u0000')).assertEqual(undefined);
        expect(cache.get('\uFFFF')).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(2);
      }

      // --- [3] Verify a miss on the enum member key followed by a hit on the other member keeps miss count 1 ---
      {
        let cache: util.LRUCache<MissSlot, int> = new util.LRUCache<MissSlot, int>();
        cache.put(MissSlot.First, 1);
        expect(cache.get(MissSlot.Second)).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(1);
        expect(cache.get(MissSlot.First)).assertEqual(1);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [4] Verify a NaN key miss and a following ordinary key miss accumulate miss count 2 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(1.5, 10);
        expect(cache.get(Double.NaN)).assertEqual(undefined);
        expect(cache.get(2.5)).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(2);
      }

      // --- [5] Verify a negative Infinity key miss then a positive Infinity key hit keeps miss count 1 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.POSITIVE_INFINITY, 1);
        expect(cache.get(Double.NEGATIVE_INFINITY)).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(1);
        expect(cache.get(Double.POSITIVE_INFINITY)).assertEqual(1);
        expect(cache.getMissCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MISS_COUNT_0220
     * @tc.name testLruCacheGetMissCount022
     * @tc.desc Merged batch (2 tests): [1] Verify misses on the long minimum and long maximum keys accumulate miss count 2 | [2] Verify a get on a key dropped by a grow then shrink sequence accumulates miss count 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMissCount022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify misses on the long minimum and long maximum keys accumulate miss count 2 ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let minLong: long = -9223372036854775807 - 1;
        let maxLong: long = 9223372036854775807;
        cache.put(123, 1);
        expect(cache.get(minLong)).assertEqual(undefined);
        expect(cache.get(maxLong)).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(2);
      }

      // --- [2] Verify a get on a key dropped by a grow then shrink sequence accumulates miss count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.updateCapacity(5);
        cache.put(3, 30);
        cache.updateCapacity(2);
        expect(cache.get(1)).assertEqual(undefined);
        expect(cache.getMissCount()).assertEqual(1);
      }
    });

  });
}
