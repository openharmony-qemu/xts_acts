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

class GetDefCache<K, V> extends util.LRUCache<K, V> {
  private mk: (key: K) => V;
  constructor(mk: (key: K) => V) {
    super();
    this.mk = mk;
  }
  createDefault(key: K): V | undefined {
    return this.mk(key);
  }
}

class RemovalWatchCache extends util.LRUCache<int, int> {
  removalHits: int = 0;
  constructor() {
    super();
  }
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int): void {
    this.removalHits = this.removalHits + 1;
  }
}

class DftRemovalCache extends util.LRUCache<int, int> {
  removalHits: int = 0;
  constructor() {
    super();
  }
  createDefault(key: int): int | undefined {
    return key;
  }
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int): void {
    this.removalHits = this.removalHits + 1;
  }
}

interface TagObj {
  tag: string;
}

class Label {
  text: string = '';
  constructor(t: string) {
    this.text = t;
  }
}

class Item {
  id: int = 0;
  constructor(i: int) {
    this.id = i;
  }
}

enum GetRank {
  Low = 0,
  Mid = 1,
  High = 2
}

export default function lruCacheGetTest(): void {
  describe('LruCacheGetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0010
     * @tc.name testLruCacheGet001
     * @tc.desc Merged batch (5 tests): [1] Verify get with single key parameter returns the stored value for an int key hit | [2] Verify get with single key parameter returns undefined on miss | [3] Verify repeat...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get with single key parameter returns the stored value for an int key hit ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let key: int = 10;
        cache.put(key, 100);
        let value: int | undefined = cache.get(key);
        expect(value).assertEqual(100);
      }

      // --- [2] Verify get with single key parameter returns undefined on miss ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(cache.get(10)).assertEqual(undefined);
      }

      // --- [3] Verify repeated single-key get keeps key value association stable ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 11);
        cache.get(1);
        cache.get(9);
        expect(cache.get(1)).assertEqual(11);
      }

      // --- [4] Verify get interleaved with put reflects current cache state ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('x', '1');
        cache.get('x');
        cache.put('y', '2');
        expect(cache.get('y')).assertEqual('2');
      }

      // --- [5] Verify get with key 0 returns associated value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(0, 100);
        let value: int | undefined = cache.get(0);
        expect(value).assertEqual(100);
        expect(cache.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0020
     * @tc.name testLruCacheGet002
     * @tc.desc Merged batch (5 tests): [1] Verify get with negative key -1 returns associated value | [2] Verify get with smallest positive key 1 returns associated value | [3] Verify get with int max key 2147483...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get with negative key -1 returns associated value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let negativeKey: int = -1;
        cache.put(negativeKey, 200);
        expect(cache.get(negativeKey)).assertEqual(200);
        expect(cache.contains(negativeKey)).assertTrue();
      }

      // --- [2] Verify get with smallest positive key 1 returns associated value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let stored: int = 300;
        cache.put(1, stored);
        let value: int | undefined = cache.get(1);
        expect(value).assertEqual(stored);
      }

      // --- [3] Verify get with int max key 2147483647 returns associated value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2147483647, 500);
        expect(cache.get(2147483647)).assertEqual(500);
        expect(cache.get(0)).assertEqual(undefined);
      }

      // --- [4] Verify get with int min key -2147483648 returns associated value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-2147483648, 600);
        expect(cache.get(-2147483648)).assertEqual(600);
        expect(cache.get(-2147483647)).assertEqual(undefined);
      }

      // --- [5] Verify get key 0 misses when only key 1 is stored ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        expect(cache.get(0)).assertEqual(undefined);
        expect(cache.get(1)).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0030
     * @tc.name testLruCacheGet003
     * @tc.desc Merged batch (5 tests): [1] Verify get int min key misses when only key 0 is stored | [2] Verify get int max key misses when only key -1 is stored | [3] Verify key stored as decimal 15 hit by hex 0...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get int min key misses when only key 0 is stored ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(0, 10);
        expect(cache.get(-2147483648)).assertEqual(undefined);
        expect(cache.length).assertEqual(1);
      }

      // --- [2] Verify get int max key misses when only key -1 is stored ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let storedKey: int = -1;
        let probeKey: int = 2147483647;
        cache.put(storedKey, 10);
        expect(cache.get(probeKey)).assertEqual(undefined);
      }

      // --- [3] Verify key stored as decimal 15 hit by hex 0xF form returns value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(15, 80);
        expect(cache.get(0xF)).assertEqual(80);
        expect(cache.get(15)).assertEqual(80);
      }

      // --- [4] Verify get with NaN key hits stably stored NaN entry ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.NaN, 11);
        expect(cache.get(Double.NaN)).assertEqual(11);
      }

      // --- [5] Verify get retrieves the value stored under a positive Infinity key ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        let stored: int = 22;
        cache.put(Double.POSITIVE_INFINITY, stored);
        let value: int | undefined = cache.get(Double.POSITIVE_INFINITY);
        expect(value).assertEqual(stored);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0040
     * @tc.name testLruCacheGet004
     * @tc.desc Merged batch (5 tests): [1] Verify get retrieves the value stored under a negative Infinity key | [2] Verify negative zero key normalized to same key as zero hits | [3] Verify get retrieves the val...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get retrieves the value stored under a negative Infinity key ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        let stored: int = 33;
        cache.put(Double.NEGATIVE_INFINITY, stored);
        let value: int | undefined = cache.get(Double.NEGATIVE_INFINITY);
        expect(value).assertEqual(stored);
      }

      // --- [2] Verify negative zero key normalized to same key as zero hits ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(0, 44);
        expect(cache.get(-0)).assertEqual(44);
      }

      // --- [3] Verify get retrieves the value stored under fractional double key 0.1 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        let key: double = 0.1;
        let stored: int = 55;
        cache.put(key, stored);
        let value: int | undefined = cache.get(key);
        expect(value).assertEqual(stored);
      }

      // --- [4] Verify get with double max Number.MAX_VALUE key returns associated value ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Number.MAX_VALUE, 66);
        expect(cache.get(Number.MAX_VALUE)).assertEqual(66);
      }

      // --- [5] Verify get with double min positive Number.MIN_VALUE key returns associated value ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Number.MIN_VALUE, 77);
        expect(cache.get(Number.MIN_VALUE)).assertEqual(77);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0050
     * @tc.name testLruCacheGet005
     * @tc.desc Merged batch (5 tests): [1] Verify get with negative double extreme key returns associated value | [2] Verify get key 0.25 misses when only 0.5 stored | [3] Verify get with ordinary long key 123 re...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get with negative double extreme key returns associated value ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(-Number.MAX_VALUE, 88);
        expect(cache.get(-Number.MAX_VALUE)).assertEqual(88);
      }

      // --- [2] Verify get key 0.25 misses when only 0.5 stored ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(0.5, 10);
        expect(cache.get(0.25)).assertEqual(undefined);
      }

      // --- [3] Verify get with ordinary long key 123 returns associated value ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        cache.put(123, 5);
        expect(cache.contains(123)).assertTrue();
        expect(cache.get(123)).assertEqual(5);
      }

      // --- [4] Verify get with long max key returns associated value ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let maxLong: long = 9223372036854775807;
        cache.put(maxLong, 6);
        expect(cache.get(maxLong)).assertEqual(6);
      }

      // --- [5] Verify get with long min key returns associated value ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let minLong: long = -9223372036854775807 - 1;
        cache.put(minLong, 7);
        expect(cache.get(minLong)).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0060
     * @tc.name testLruCacheGet006
     * @tc.desc Merged batch (5 tests): [1] Verify get long max key misses when only key 5 stored | [2] Verify get with byte max key 127 returns associated value | [3] Verify get with short min key -32768 returns ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get long max key misses when only key 5 stored ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let maxLong: long = 9223372036854775807;
        cache.put(5, 10);
        expect(cache.get(maxLong)).assertEqual(undefined);
      }

      // --- [2] Verify get with byte max key 127 returns associated value ---
      {
        let cache: util.LRUCache<byte, int> = new util.LRUCache<byte, int>();
        cache.put(127 as byte, 15);
        let key: byte = 127 as byte;
        expect(cache.get(key)).assertEqual(15);
      }

      // --- [3] Verify get with short min key -32768 returns associated value ---
      {
        let cache: util.LRUCache<short, int> = new util.LRUCache<short, int>();
        cache.put(-32768 as short, 25);
        expect(cache.get(-32768 as short)).assertEqual(25);
      }

      // --- [4] Verify get with single character string key k returns associated value ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = 'k';
        cache.put(key, 35);
        let value: int | undefined = cache.get(key);
        expect(value).assertEqual(35);
      }

      // --- [5] Verify get with float key 1.5 returns associated value ---
      {
        let cache: util.LRUCache<float, int> = new util.LRUCache<float, int>();
        cache.put(1.5 as float, 45);
        expect(cache.contains(1.5 as float)).assertTrue();
        expect(cache.get(1.5 as float)).assertEqual(45);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0070
     * @tc.name testLruCacheGet007
     * @tc.desc Merged batch (5 tests): [1] Verify get with boolean key true returns associated value | [2] Verify get with boolean key false returns associated value | [3] Verify get true misses when only key fal...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get with boolean key true returns associated value ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(true, 51);
        expect(cache.get(true)).assertEqual(51);
      }

      // --- [2] Verify get with boolean key false returns associated value ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(false, 52);
        expect(cache.get(false)).assertEqual(52);
      }

      // --- [3] Verify get true misses when only key false stored ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(false, 53);
        expect(cache.get(true)).assertEqual(undefined);
      }

      // --- [4] Verify get with long key from int 1 hits stored value ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        cache.put(Int.toLong(1), 61);
        expect(cache.get(Int.toLong(1))).assertEqual(61);
      }

      // --- [5] Verify get with huge bigint key beyond long range hits stored value ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        cache.put(123456789012345678901234567890n, 62);
        expect(cache.get(123456789012345678901234567890n)).assertEqual(62);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0080
     * @tc.name testLruCacheGet008
     * @tc.desc Merged batch (5 tests): [1] Verify get long key 2 misses when only long key 1 stored | [2] Verify get with empty string key returns associated value | [3] Verify get with 10000 char string key retu...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get long key 2 misses when only long key 1 stored ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        cache.put(Int.toLong(1), 63);
        expect(cache.get(Int.toLong(2))).assertEqual(undefined);
      }

      // --- [2] Verify get with empty string key returns associated value ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('', 71);
        let value: int | undefined = cache.get('');
        expect(value).assertEqual(71);
      }

      // --- [3] Verify get with 10000 char string key returns associated value ---
      {
        let longKey: string = '';
        for (let i: int = 0; i < 10000; i++) {
          longKey += 'a';
        }
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put(longKey, 72);
        expect(cache.get(longKey)).assertEqual(72);
      }

      // --- [4] Verify get with null character string key returns associated value ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('\0', 73);
        expect(cache.get('\0')).assertEqual(73);
        expect(cache.get('')).assertEqual(undefined);
      }

      // --- [5] Verify get with Chinese string key returns associated value ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let stored: int = 74;
        cache.put('你好', stored);
        expect(cache.get('你好')).assertEqual(stored);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0090
     * @tc.name testLruCacheGet009
     * @tc.desc Merged batch (5 tests): [1] Verify get with emoji surrogate pair string key returns associated value | [2] Verify get with ordinary string key returns associated value | [3] Verify get empty string...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get with emoji surrogate pair string key returns associated value ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('😀', 75);
        let key: string = '😀';
        let value: int | undefined = cache.get(key);
        expect(value).assertEqual(75);
      }

      // --- [2] Verify get with ordinary string key returns associated value ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('cache_key', 76);
        expect(cache.contains('cache_key')).assertTrue();
        expect(cache.get('cache_key')).assertEqual(76);
      }

      // --- [3] Verify get empty string misses when only key a stored ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('a', 77);
        expect(cache.get('')).assertEqual(undefined);
      }

      // --- [4] Verify case sensitive key Key misses when only key key stored ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('key', 78);
        expect(cache.get('Key')).assertEqual(undefined);
      }

      // --- [5] Verify get with reference-typed key returns associated value ---
      {
        // K=Date
        let dateKey: Date = new Date(2024, 5, 15);
        let cacheDate: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cacheDate.put(dateKey, 82);
        expect(cacheDate.get(dateKey)).assertEqual(82);

        // K=RegExp
        let regexKey: RegExp = new RegExp('ab+c', 'g');
        let cacheRegex: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        cacheRegex.put(regexKey, 84);
        expect(cacheRegex.get(regexKey)).assertEqual(84);

        // K=Error
        let errorKey: Error = new Error('boom');
        let cacheError: util.LRUCache<Error, int> = new util.LRUCache<Error, int>();
        cacheError.put(errorKey, 86);
        expect(cacheError.get(errorKey)).assertEqual(86);

        // K=Map
        let mapKey: Map<string, int> = new Map<string, int>();
        mapKey.set('a', 1);
        let cacheMap: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        cacheMap.put(mapKey, 90);
        expect(cacheMap.get(mapKey)).assertEqual(90);

        // K=Set
        let setKey: Set<int> = new Set<int>();
        setKey.add(1);
        let cacheSet: util.LRUCache<Set<int>, int> = new util.LRUCache<Set<int>, int>();
        cacheSet.put(setKey, 91);
        expect(cacheSet.get(setKey)).assertEqual(91);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0100
     * @tc.name testLruCacheGet010
     * @tc.desc Merged batch (5 tests): [1] Verify distinct Date references with same time are different keys and miss | [2] Verify distinct RegExp references with same pattern are different keys and miss | [3] Ve...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify distinct Date references with same time are different keys and miss ---
      {
        let firstDate: Date = new Date(2024, 5, 15);
        let secondDate: Date = new Date(2024, 5, 15);
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(firstDate, 83);
        expect(cache.get(secondDate)).assertEqual(undefined);
      }

      // --- [2] Verify distinct RegExp references with same pattern are different keys and miss ---
      {
        let firstRegex: RegExp = new RegExp('ab+c', 'g');
        let secondRegex: RegExp = new RegExp('ab+c', 'g');
        let cache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        cache.put(firstRegex, 85);
        expect(cache.get(secondRegex)).assertEqual(undefined);
      }

      // --- [3] Verify get with object literal reference returns associated value ---
      {
        let objectKey: TagObj = { tag: 'a' };
        let cache: util.LRUCache<TagObj, int> = new util.LRUCache<TagObj, int>();
        cache.put(objectKey, 81);
        expect(cache.get(objectKey)).assertEqual(81);
      }

      // --- [4] Verify distinct object literals with same fields are different keys and miss ---
      {
        let firstTag: TagObj = { tag: 'x' };
        let secondTag: TagObj = { tag: 'x' };
        let cache: util.LRUCache<TagObj, int> = new util.LRUCache<TagObj, int>();
        cache.put(firstTag, 92);
        expect(cache.get(secondTag)).assertEqual(undefined);
      }

      // --- [5] Verify get with class instance reference returns associated value ---
      {
        let labelKey: Label = new Label('x');
        let cache: util.LRUCache<Label, int> = new util.LRUCache<Label, int>();
        cache.put(labelKey, 87);
        expect(cache.get(labelKey)).assertEqual(87);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0110
     * @tc.name testLruCacheGet011
     * @tc.desc Merged batch (5 tests): [1] Verify distinct class instances with same fields are different keys and miss | [2] Verify get with Array reference returns associated value | [3] Verify distinct arrays ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify distinct class instances with same fields are different keys and miss ---
      {
        let firstLabel: Label = new Label('x');
        let secondLabel: Label = new Label('x');
        let cache: util.LRUCache<Label, int> = new util.LRUCache<Label, int>();
        cache.put(firstLabel, 88);
        expect(cache.get(secondLabel)).assertEqual(undefined);
      }

      // --- [2] Verify get with Array reference returns associated value ---
      {
        let arrayKey: int[] = [1, 2, 3];
        let cache: util.LRUCache<int[], int> = new util.LRUCache<int[], int>();
        cache.put(arrayKey, 89);
        expect(cache.get(arrayKey)).assertEqual(89);
      }

      // --- [3] Verify distinct arrays with same content are different keys and miss ---
      {
        let firstArray: int[] = [1, 2];
        let secondArray: int[] = [1, 2];
        let cache: util.LRUCache<int[], int> = new util.LRUCache<int[], int>();
        cache.put(firstArray, 93);
        expect(cache.get(secondArray)).assertEqual(undefined);
      }

      // --- [4] Verify get with null key throws BusinessError after valid key a stored in string|null key union cache (null not queryable) ---
      {
        let cache: util.LRUCache<string | null, int> = new util.LRUCache<string | null, int>();
        cache.put('a', 96);
        try {
          cache.get(null);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }

      // --- [5] Verify get with undefined key throws BusinessError after valid key a stored in string|undefined key union cache (undefined not queryable) ---
      {
        let cache: util.LRUCache<string | undefined, int> = new util.LRUCache<string | undefined, int>();
        cache.put('a', 97);
        try {
          cache.get(undefined);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0120
     * @tc.name testLruCacheGet012
     * @tc.desc Merged batch (5 tests): [1] Verify get returns undefined after key explicitly removed | [2] Verify get returns newly put value after earlier miss on same key | [3] Verify get returns overwritten ne...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get returns undefined after key explicitly removed ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.remove(1);
        expect(cache.get(1)).assertEqual(undefined);
      }

      // --- [2] Verify get returns newly put value after earlier miss on same key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(2);
        cache.put(2, 20);
        expect(cache.get(2)).assertEqual(20);
      }

      // --- [3] Verify get returns overwritten new value after remove and re-put same key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(3, 30);
        cache.remove(3);
        cache.put(3, 300);
        expect(cache.get(3)).assertEqual(300);
      }

      // --- [4] Verify get of various typed value returns same runtime type ---
      {
        // V=int
        let cacheInt: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cacheInt.put(5, 60);
        expect(typeof cacheInt.get(5)).assertEqual('int');
        expect(cacheInt.get(5)).assertEqual(60);

        // V=long
        let lvLong: long = 456;
        let cacheLong: util.LRUCache<int, long> = new util.LRUCache<int, long>();
        cacheLong.put(1, lvLong);
        expect(typeof cacheLong.get(1)).assertEqual('long');
        expect(cacheLong.get(1)).assertEqual(456);

        // V=float
        let cacheFloat: util.LRUCache<int, float> = new util.LRUCache<int, float>();
        cacheFloat.put(3, 1.5 as float);
        expect(typeof cacheFloat.get(3)).assertEqual('float');
        expect(cacheFloat.get(3)).assertEqual(1.5 as float);

        // V=byte
        let cacheByte: util.LRUCache<int, byte> = new util.LRUCache<int, byte>();
        cacheByte.put(4, 127 as byte);
        expect(typeof cacheByte.get(4)).assertEqual('byte');
        expect(cacheByte.get(4)).assertEqual(127 as byte);

        // V=string
        let cacheStr: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cacheStr.put(7, 'abc');
        expect(typeof cacheStr.get(7)).assertEqual('string');
        expect(cacheStr.get(7)).assertEqual('abc');

        // V=boolean
        let cacheBool: util.LRUCache<int, boolean> = new util.LRUCache<int, boolean>();
        cacheBool.put(8, true);
        expect(typeof cacheBool.get(8)).assertEqual('boolean');
        expect(cacheBool.get(8)).assertTrue();
      }

      // --- [5] Verify get of double value returns number type ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(2, 0.25);
        expect(typeof cache.get(2)).assertEqual('number');
        expect(cache.get(2)).assertEqual(0.25);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0130
     * @tc.name testLruCacheGet013
     * @tc.desc Merged batch (5 tests): [1] Verify get of class instance value returns object type | [2] Verify get of object literal value returns object type | [3] Verify get miss default createDefault returns u...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get of class instance value returns object type ---
      {
        let l: Label = new Label('x');
        let cache: util.LRUCache<int, Label> = new util.LRUCache<int, Label>();
        cache.put(1, l);
        expect(typeof cache.get(1)).assertEqual('object');
        expect(cache.get(1)).assertEqual(l);
      }

      // --- [2] Verify get of object literal value returns object type ---
      {
        let o: TagObj = { tag: 'n' };
        let cache: util.LRUCache<int, TagObj> = new util.LRUCache<int, TagObj>();
        cache.put(2, o);
        expect(typeof cache.get(2)).assertEqual('object');
        expect(cache.get(2)).assertEqual(o);
      }

      // --- [3] Verify get miss default createDefault returns undefined type ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(typeof cache.get(42)).assertEqual('undefined');
        expect(cache.get(42)).assertEqual(undefined);
      }

      // --- [4] Verify miss with int createDefault override returns int type ---
      {
        let cache: GetDefCache<int, int> = new GetDefCache<int, int>((key: int): int => { return key; });
        expect(typeof cache.get(7)).assertEqual('int');
        expect(cache.get(7)).assertEqual(7);
      }

      // --- [5] Verify miss with string createDefault override returns string type ---
      {
        let cache: GetDefCache<int, string> = new GetDefCache<int, string>((key: int): string => { return 's'; });
        expect(typeof cache.get(7)).assertEqual('string');
        expect(cache.get(7)).assertEqual('s');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0140
     * @tc.name testLruCacheGet014
     * @tc.desc Merged batch (5 tests): [1] Verify get returns associated value 0 | [2] Verify get returns int max value 2147483647 | [3] Verify get returns int min value -2147483648 | [4] Verify get returns NaN v...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get returns associated value 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 0);
        expect(cache.contains(1)).assertTrue();
        let value: int | undefined = cache.get(1);
        expect(value).assertEqual(0);
      }

      // --- [2] Verify get returns int max value 2147483647 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(3, 2147483647);
        let expected: int = 2147483647;
        expect(cache.get(3)).assertEqual(expected);
      }

      // --- [3] Verify get returns int min value -2147483648 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let minValue: int = -2147483648;
        cache.put(4, minValue);
        expect(cache.get(4)).assertEqual(minValue);
      }

      // --- [4] Verify get returns NaN value detected by isNaN ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(5, Double.NaN);
        expect(isNaN(cache.get(5) ?? Double.NaN)).assertTrue();
      }

      // --- [5] Verify get returns Infinity value ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(6, Double.POSITIVE_INFINITY);
        expect(cache.get(6)).assertEqual(Double.POSITIVE_INFINITY);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0150
     * @tc.name testLruCacheGet015
     * @tc.desc Merged batch (5 tests): [1] Verify get returns negative Infinity value | [2] Verify get returns negative zero normalized to zero | [3] Verify get returns double max Number.MAX_VALUE | [4] Verify ge...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get returns negative Infinity value ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(7, Double.NEGATIVE_INFINITY);
        expect(cache.get(7)).assertEqual(Double.NEGATIVE_INFINITY);
      }

      // --- [2] Verify get returns negative zero normalized to zero ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(8, -0);
        expect(cache.get(8)).assertEqual(0);
      }

      // --- [3] Verify get returns double max Number.MAX_VALUE ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(9, Number.MAX_VALUE);
        expect(cache.get(9)).assertEqual(Number.MAX_VALUE);
      }

      // --- [4] Verify get returns double min positive Number.MIN_VALUE ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(10, Number.MIN_VALUE);
        expect(cache.get(10)).assertEqual(Number.MIN_VALUE);
      }

      // --- [5] Verify get returns empty string value ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, '');
        expect(cache.get(1)).assertEqual('');
        expect(cache.isEmpty()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0160
     * @tc.name testLruCacheGet016
     * @tc.desc Merged batch (5 tests): [1] Verify get returns 10000-char long string value | [2] Verify get returns Chinese string value | [3] Verify get returns emoji surrogate pair string value | [4] Verify get...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get returns 10000-char long string value ---
      {
        let longVal: string = '';
        for (let i: int = 0; i < 10000; i++) {
          longVal += 'b';
        }
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(2, longVal);
        expect(cache.get(2)).assertEqual(longVal);
      }

      // --- [2] Verify get returns Chinese string value ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(3, '你好');
        expect(cache.get(3)).assertEqual('你好');
        expect(cache.contains(3)).assertTrue();
      }

      // --- [3] Verify get returns emoji surrogate pair string value ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        let stored: string = '😀';
        cache.put(4, stored);
        expect(cache.get(4)).assertEqual(stored);
      }

      // --- [4] Verify get returns string containing null character ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(5, '\0');
        let value: string | undefined = cache.get(5);
        expect(value).assertEqual('\0');
        expect(cache.length).assertEqual(1);
      }

      // --- [5] Verify get returns stored Date object reference ---
      {
        let d: Date = new Date(2024, 5, 15);
        let cache: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        cache.put(1, d);
        expect(cache.get(1)).assertEqual(d);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0170
     * @tc.name testLruCacheGet017
     * @tc.desc Merged batch (5 tests): [1] Verify get returns stored RegExp object reference | [2] Verify get returns stored Error object reference | [3] Verify get returns stored object literal reference | [4] V...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get returns stored RegExp object reference ---
      {
        let r: RegExp = new RegExp('ab+c', 'g');
        let cache: util.LRUCache<int, RegExp> = new util.LRUCache<int, RegExp>();
        cache.put(1, r);
        expect(cache.get(1)).assertEqual(r);
      }

      // --- [2] Verify get returns stored Error object reference ---
      {
        let e: Error = new Error('boom');
        let cache: util.LRUCache<int, Error> = new util.LRUCache<int, Error>();
        cache.put(1, e);
        expect(cache.get(1)).assertEqual(e);
      }

      // --- [3] Verify get returns stored object literal reference ---
      {
        let o: TagObj = { tag: 'n' };
        let cache: util.LRUCache<int, TagObj> = new util.LRUCache<int, TagObj>();
        cache.put(1, o);
        expect(cache.get(1)).assertEqual(o);
      }

      // --- [4] Verify get returns stored class instance reference ---
      {
        let l: Label = new Label('x');
        let cache: util.LRUCache<int, Label> = new util.LRUCache<int, Label>();
        cache.put(1, l);
        expect(cache.get(1)).assertEqual(l);
      }

      // --- [5] Verify get returns stored Array reference ---
      {
        let a: int[] = [1, 2, 3];
        let cache: util.LRUCache<int, int[]> = new util.LRUCache<int, int[]>();
        cache.put(1, a);
        expect(cache.get(1)).assertEqual(a);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0180
     * @tc.name testLruCacheGet018
     * @tc.desc Merged batch (5 tests): [1] Verify get returns stored Map reference | [2] Verify get returns stored Set reference | [3] Verify get returns stored Uint8Array reference | [4] Verify get hit Date valu...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get returns stored Map reference ---
      {
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let cache: util.LRUCache<int, Map<string, int>> = new util.LRUCache<int, Map<string, int>>();
        cache.put(1, m);
        expect(cache.get(1)).assertEqual(m);
      }

      // --- [2] Verify get returns stored Set reference ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        let cache: util.LRUCache<int, Set<int>> = new util.LRUCache<int, Set<int>>();
        cache.put(1, s);
        expect(cache.get(1)).assertEqual(s);
      }

      // --- [3] Verify get returns stored Uint8Array reference ---
      {
        let u8: Uint8Array = new Uint8Array([1, 2, 3]);
        let cache: util.LRUCache<int, Uint8Array> = new util.LRUCache<int, Uint8Array>();
        cache.put(1, u8);
        expect(cache.get(1)).assertEqual(u8);
      }

      // --- [4] Verify get hit Date value is a Date instance ---
      {
        let d: Date = new Date(2024, 5, 15);
        let cache: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        cache.put(1, d);
        expect(cache.get(1) instanceof Date).assertTrue();
        let gotDate: Date | undefined = cache.get(1);
        expect(gotDate!.getTime()).assertEqual(d.getTime());
      }

      // --- [5] Verify get hit Map value is a Map instance ---
      {
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let cache: util.LRUCache<int, Map<string, int>> = new util.LRUCache<int, Map<string, int>>();
        cache.put(1, m);
        expect(cache.get(1) instanceof Map).assertTrue();
        let gotMap: Map<string, int> | undefined = cache.get(1);
        expect(gotMap!.size).assertEqual(1);
        expect(gotMap!.get('a')).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0190
     * @tc.name testLruCacheGet019
     * @tc.desc Merged batch (5 tests): [1] Verify get hit Set value is a Set instance | [2] Verify get hit Array value is an Array instance | [3] Verify get hit Error value is an Error instance | [4] Verify get h...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get hit Set value is a Set instance ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        let cache: util.LRUCache<int, Set<int>> = new util.LRUCache<int, Set<int>>();
        cache.put(1, s);
        expect(cache.get(1) instanceof Set).assertTrue();
        let gotSet: Set<int> | undefined = cache.get(1);
        expect(gotSet!.size).assertEqual(1);
        expect(gotSet!.has(1)).assertTrue();
      }

      // --- [2] Verify get hit Array value is an Array instance ---
      {
        let a: int[] = [1, 2];
        let cache: util.LRUCache<int, int[]> = new util.LRUCache<int, int[]>();
        cache.put(1, a);
        expect(cache.get(1) instanceof Array).assertTrue();
        let gotArr: int[] | undefined = cache.get(1);
        expect(gotArr!.length).assertEqual(2);
        expect(gotArr![0]).assertEqual(1);
      }

      // --- [3] Verify get hit Error value is an Error instance ---
      {
        let e: Error = new Error('x');
        let cache: util.LRUCache<int, Error> = new util.LRUCache<int, Error>();
        cache.put(1, e);
        expect(cache.get(1) instanceof Error).assertTrue();
        let gotErr: Error | undefined = cache.get(1);
        expect(gotErr!.message).assertEqual('x');
      }

      // --- [4] Verify get hit class instance value is the specific class instance ---
      {
        let l: Label = new Label('x');
        let cache: util.LRUCache<int, Label> = new util.LRUCache<int, Label>();
        cache.put(1, l);
        expect(cache.get(1) instanceof Label).assertTrue();
        let gotLabel: Label | undefined = cache.get(1);
        expect(gotLabel!.text).assertEqual('x');
      }

      // --- [5] Verify length property unchanged after repeated mixed hit and miss get ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        cache.get(1);
        cache.get(9);
        expect(cache.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0200
     * @tc.name testLruCacheGet020
     * @tc.desc Merged batch (5 tests): [1] Verify values() length unchanged after get hit | [2] Verify keys() length unchanged after get hit | [3] Verify overwrite put then get new value keeps length single key |...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values() length unchanged after get hit ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.get(1);
        expect(cache.values().length).assertEqual(2);
      }

      // --- [2] Verify keys() length unchanged after get hit ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.get(2);
        expect(cache.keys().length).assertEqual(2);
      }

      // --- [3] Verify overwrite put then get new value keeps length single key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(1, 30);
        cache.get(1);
        expect(cache.length).assertEqual(1);
      }

      // --- [4] Verify get hit does not change other key associated value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.get(1);
        expect(cache.get(2)).assertEqual(20);
      }

      // --- [5] Verify cache stays empty with length 0 after get miss on empty cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(9);
        expect(cache.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0210
     * @tc.name testLruCacheGet021
     * @tc.desc Merged batch (5 tests): [1] Verify get does not modify stored Uint8Array value content | [2] Verify put overwriting same key after get hit returns new value | [3] Verify remove still works on a key...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get does not modify stored Uint8Array value content ---
      {
        let u8: Uint8Array = new Uint8Array([1, 2, 3]);
        let cache: util.LRUCache<int, Uint8Array> = new util.LRUCache<int, Uint8Array>();
        cache.put(1, u8);
        cache.get(1);
        expect(u8[0]).assertEqual(1);
        expect(u8[2]).assertEqual(3);
      }

      // --- [2] Verify put overwriting same key after get hit returns new value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        cache.put(1, 30);
        expect(cache.get(1)).assertEqual(30);
      }

      // --- [3] Verify remove still works on a key after get hit ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        cache.remove(1);
        expect(cache.get(1)).assertEqual(undefined);
      }

      // --- [4] Verify get on a cache whose value type is string or double returns each stored branch with its runtime type ---
      {
        let cache: util.LRUCache<int, string | double> = new util.LRUCache<int, string | double>(4);
        cache.put(1, 'alpha');
        cache.put(2, 42);
        expect(cache.get(1)).assertEqual('alpha');
        expect(cache.get(2)).assertEqual(42);
        expect(typeof cache.get(1)).assertEqual('string');
        expect(typeof cache.get(2)).assertEqual('number');
      }

      // --- [5] Verify clear still empties cache after get hit ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        cache.clear();
        expect(cache.length).assertEqual(0);
        expect(cache.keys().join(',')).assertEqual('');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0220
     * @tc.name testLruCacheGet022
     * @tc.desc Merged batch (5 tests): [1] Verify get hit moves key pair to values() end as most recently accessed | [2] Verify sequential get on two keys orders values() by access time | [3] Verify get on alread...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get hit moves key pair to values() end as most recently accessed ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'A');
        cache.put(2, 'B');
        cache.put(3, 'C');
        let moved: string | undefined = cache.get(1);
        expect(moved).assertEqual('A');
        expect(cache.values()[2]).assertEqual('A');
      }

      // --- [2] Verify sequential get on two keys orders values() by access time ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'A');
        cache.put(2, 'B');
        cache.put(3, 'C');
        cache.get(1);
        cache.get(2);
        expect(cache.values()[2]).assertEqual('B');
      }

      // --- [3] Verify get on already last key leaves values() order unchanged ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'A');
        cache.put(2, 'B');
        cache.put(3, 'C');
        cache.get(3);
        expect(cache.values()[0]).assertEqual('A');
        expect(cache.values().length).assertEqual(3);
      }

      // --- [4] Verify repeated get on same key updates order to most recent access ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'A');
        cache.put(2, 'B');
        cache.put(3, 'C');
        cache.get(1);
        cache.get(1);
        expect(cache.values()[2]).assertEqual('A');
      }

      // --- [5] Verify keys() order syncs with access time after get hit ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'A');
        cache.put(2, 'B');
        cache.put(3, 'C');
        cache.get(1);
        expect(cache.keys()[2]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0230
     * @tc.name testLruCacheGet023
     * @tc.desc Merged batch (5 tests): [1] Verify get on oldest key makes next oldest first in values() | [2] Verify get miss does not change values() order | [3] Verify K=mixed type key get returns typed value |...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get on oldest key makes next oldest first in values() ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'A');
        cache.put(2, 'B');
        cache.put(3, 'C');
        cache.get(1);
        let order: Array<string> = cache.values();
        expect(order[0]).assertEqual('B');
        expect(order.length).assertEqual(3);
      }

      // --- [2] Verify get miss does not change values() order ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'A');
        cache.put(2, 'B');
        cache.put(3, 'C');
        cache.get(9);
        expect(cache.values()[0]).assertEqual('A');
        expect(cache.values()[2]).assertEqual('C');
      }

      // --- [3] Verify K=mixed type key get returns typed value ---
      {
        // K=long, V=string
        let cacheLong: util.LRUCache<long, string> = new util.LRUCache<long, string>();
        cacheLong.put(123, 'abc');
        let valueLong: string | undefined = cacheLong.get(123);
        expect(valueLong).assertEqual('abc');

        // K=boolean, V=object
        let oBool: TagObj = { tag: 'x' };
        let cacheBool: util.LRUCache<boolean, TagObj> = new util.LRUCache<boolean, TagObj>();
        cacheBool.put(true, oBool);
        expect(cacheBool.get(true)).assertEqual(oBool);

        // K=Date, V=double
        let dDate: Date = new Date(2024, 5, 15);
        let cacheDate: util.LRUCache<Date, double> = new util.LRUCache<Date, double>();
        cacheDate.put(dDate, 0.5);
        expect(cacheDate.get(dDate)).assertEqual(0.5);

        // K=object, V=boolean
        let rObj: TagObj = { tag: 'x' };
        let cacheObj: util.LRUCache<TagObj, boolean> = new util.LRUCache<TagObj, boolean>();
        cacheObj.put(rObj, false);
        expect(cacheObj.get(rObj)).assertFalse();
      }

      // --- [4] Verify K=string key get returns class instance value ---
      {
        let it: Item = new Item(9);
        let cache: util.LRUCache<string, Item> = new util.LRUCache<string, Item>();
        cache.put('k', it);
        expect(cache.get('k')).assertEqual(it);
      }

      // --- [5] Verify long key miss returns default undefined ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        expect(cache.get(Int.toLong(1))).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0240
     * @tc.name testLruCacheGet024
     * @tc.desc Merged batch (5 tests): [1] Verify subclass createDefault returning key+100 get returns computed value | [2] Verify subclass createDefault returning constant 7 get returns that constant | [3] Verif...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify subclass createDefault returning key+100 get returns computed value ---
      {
        let cache: GetDefCache<int, int> = new GetDefCache<int, int>((key: int): int => { return key + 100; });
        expect(cache.get(5)).assertEqual(105);
      }

      // --- [2] Verify subclass createDefault returning constant 7 get returns that constant ---
      {
        let cache: GetDefCache<int, int> = new GetDefCache<int, int>((key: int): int => { return 7; });
        expect(cache.get(9)).assertEqual(7);
        let otherValue: int | undefined = cache.get(200);
        expect(otherValue).assertEqual(7);
      }

      // --- [3] Verify subclass createDefault returning key times 3 get returns triple ---
      {
        let cache: GetDefCache<int, int> = new GetDefCache<int, int>((key: int): int => { return key * 3; });
        expect(cache.get(4)).assertEqual(12);
      }

      // --- [4] Verify int string subclass createDefault returning dft get returns that string ---
      {
        let cache: GetDefCache<int, string> = new GetDefCache<int, string>((key: int): string => { return 'dft'; });
        expect(cache.get(1)).assertEqual('dft');
      }

      // --- [5] Verify int object subclass createDefault returning object get returns its tag field ---
      {
        let cache: GetDefCache<int, TagObj> = new GetDefCache<int, TagObj>((key: int): TagObj => { return { tag: 'dft' }; });
        let got: TagObj = cache.get(2)!;
        expect(got.tag).assertEqual('dft');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0250
     * @tc.name testLruCacheGet025
     * @tc.desc Merged batch (5 tests): [1] Verify subclass createDefault returning zero get returns zero | [2] Verify subclass createDefault returning empty string get returns empty string | [3] Verify subclass c...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify subclass createDefault returning zero get returns zero ---
      {
        let cache: GetDefCache<int, int> = new GetDefCache<int, int>((key: int): int => { return 0; });
        expect(cache.get(3)).assertEqual(0);
      }

      // --- [2] Verify subclass createDefault returning empty string get returns empty string ---
      {
        let cache: GetDefCache<int, string> = new GetDefCache<int, string>((key: int): string => { return ''; });
        expect(cache.get(6)).assertEqual('');
      }

      // --- [3] Verify subclass createDefault returning non undefined get miss triggers one object creation count ---
      {
        let cache: GetDefCache<int, int> = new GetDefCache<int, int>((key: int): int => { return key + 1; });
        cache.get(5);
        expect(cache.getCreateCount()).assertEqual(1);
      }

      // --- [4] Verify get single key hit survivor after updateCapacity shrink returns associated value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 100);
        cache.put(2, 200);
        cache.put(3, 300);
        cache.updateCapacity(1);
        expect(cache.get(3)).assertEqual(300);
      }

      // --- [5] Verify get on evicted key after updateCapacity shrink returns undefined ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 100);
        cache.put(2, 200);
        cache.put(3, 300);
        cache.updateCapacity(1);
        expect(cache.get(1)).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0260
     * @tc.name testLruCacheGet026
     * @tc.desc Merged batch (5 tests): [1] Verify get out-of-range low value -1 on contiguous key cache returns undefined | [2] Verify get value 5 just beyond length on contiguous key cache returns undefined | [3...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get out-of-range low value -1 on contiguous key cache returns undefined ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 5; i++) {
          cache.put(i, i * 10);
        }
        let belowRange: int = -1;
        expect(cache.get(belowRange)).assertEqual(undefined);
        expect(cache.length).assertEqual(5);
      }

      // --- [2] Verify get value 5 just beyond length on contiguous key cache returns undefined ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 5; i++) {
          cache.put(i, i * 10);
        }
        expect(cache.get(cache.length)).assertEqual(undefined);
      }

      // --- [3] Verify get last element key 4 at length minus one on contiguous key cache hits ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 5; i++) {
          cache.put(i, i * 10);
        }
        expect(cache.get(4)).assertEqual(40);
      }

      // --- [4] Verify stored int key 7 queried by string 7 type mismatch returns undefined ---
      {
        let cache: util.LRUCache<int | string, int> = new util.LRUCache<int | string, int>();
        cache.put(7, 70);
        expect(cache.get('7')).assertEqual(undefined);
      }

      // --- [5] Verify stored string key 7 queried by int 7 type mismatch returns undefined ---
      {
        let cache: util.LRUCache<int | string, int> = new util.LRUCache<int | string, int>();
        cache.put('7', 71);
        expect(cache.get(7)).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0270
     * @tc.name testLruCacheGet027
     * @tc.desc Merged batch (5 tests): [1] Verify stored boolean key true queried by int 1 type mismatch returns undefined | [2] Verify stored int key 1 queried by boolean true type mismatch returns undefined | [...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify stored boolean key true queried by int 1 type mismatch returns undefined ---
      {
        let cache: util.LRUCache<boolean | int, int> = new util.LRUCache<boolean | int, int>();
        cache.put(true, 1);
        expect(cache.get(1)).assertEqual(undefined);
      }

      // --- [2] Verify stored int key 1 queried by boolean true type mismatch returns undefined ---
      {
        let cache: util.LRUCache<boolean | int, int> = new util.LRUCache<boolean | int, int>();
        cache.put(1, 2);
        expect(cache.get(true)).assertEqual(undefined);
      }

      // --- [3] Verify byte key 3 queried by byte 3 hits on byte numeric path ---
      {
        let cache: util.LRUCache<byte, int> = new util.LRUCache<byte, int>();
        let key: byte = 3 as byte;
        cache.put(key, 33);
        let value: int | undefined = cache.get(key);
        expect(value).assertEqual(33);
      }

      // --- [4] Verify float key 0.1 queried by float 0.1 hits on float precision path ---
      {
        let cache: util.LRUCache<float, int> = new util.LRUCache<float, int>();
        cache.put(0.1 as float, 44);
        let value: int | undefined = cache.get(0.1 as float);
        expect(value).assertEqual(44);
      }

      // --- [5] Verify get with undefined key throws BusinessError after numeric key 5 stored in undefined union key cache (undefined not queryable) ---
      {
        let cache: util.LRUCache<string | int | undefined, int> = new util.LRUCache<string | int | undefined, int>();
        cache.put(5, 55);
        try {
          cache.get(undefined);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }
    });

  });
}
