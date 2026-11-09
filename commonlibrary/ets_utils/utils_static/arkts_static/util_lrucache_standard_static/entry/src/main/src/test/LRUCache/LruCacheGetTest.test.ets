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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0280
     * @tc.name testLruCacheGet028
     * @tc.desc Merged batch (5 tests): [1] Verify get with null key throws BusinessError after numeric key 5 stored in null union key cache (null not queryable) | [2] Verify stored single character string key k q...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get with null key throws BusinessError after numeric key 5 stored in null union key cache (null not queryable) ---
      {
        let cache: util.LRUCache<string | int | null, int> = new util.LRUCache<string | int | null, int>();
        cache.put(5, 56);
        try {
          cache.get(null);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }

      // --- [2] Verify stored single character string key k queried by string k returns the stored value ---
      {
        let cache: util.LRUCache<string | string, int> = new util.LRUCache<string | string, int>();
        cache.put('k', 7);
        expect(cache.get('k')).assertEqual(7);
      }

      // --- [3] Verify Date key stored in Date string union queried by string returns undefined ---
      {
        let d: Date = new Date(0);
        let cache: util.LRUCache<Date | string, int> = new util.LRUCache<Date | string, int>();
        cache.put(d, 30);
        expect(cache.get('x')).assertEqual(undefined);
      }

      // --- [4] Verify string key stored in Date string union queried by Date returns undefined ---
      {
        let cache: util.LRUCache<Date | string, int> = new util.LRUCache<Date | string, int>();
        cache.put('x', 31);
        let q: Date = new Date(0);
        expect(cache.get(q)).assertEqual(undefined);
      }

      // --- [5] Verify int array key stored in array string union queried by string returns undefined ---
      {
        let arr: int[] = [1];
        let cache: util.LRUCache<int[] | string, int> = new util.LRUCache<int[] | string, int>();
        cache.put(arr, 32);
        expect(cache.get('x')).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0290
     * @tc.name testLruCacheGet029
     * @tc.desc Merged batch (5 tests): [1] Verify stored double key 1.5 queried by NaN returns undefined | [2] Verify stored NaN key queried by double key 1.5 returns undefined | [3] Verify stored double key 0.1 ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify stored double key 1.5 queried by NaN returns undefined ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(1.5, 15);
        expect(cache.get(Double.NaN)).assertEqual(undefined);
      }

      // --- [2] Verify stored NaN key queried by double key 1.5 returns undefined ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.NaN, 16);
        expect(cache.get(1.5)).assertEqual(undefined);
      }

      // --- [3] Verify stored double key 0.1 queried by numerically same 0.10000000000000001 hits ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        let stored: double = 0.1;
        cache.put(stored, 17);
        expect(cache.get(0.1)).assertEqual(17);
        expect(cache.get(0.10000000000000001)).assertEqual(17);
      }

      // --- [4] Verify stored long key 9007199254740993 just above the double safe integer limit queried by neighbor 9007199254740992 returns undefined ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let near: long = 9007199254740993;
        cache.put(near, 18);
        expect(cache.get(9007199254740992)).assertEqual(undefined);
      }

      // --- [5] Verify stored long key 9007199254740993 just above the double safe integer limit queried by the same key hits ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let near: long = 9007199254740993;
        cache.put(near, 19);
        expect(cache.get(9007199254740993)).assertEqual(19);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0300
     * @tc.name testLruCacheGet030
     * @tc.desc Merged batch (5 tests): [1] Verify get on former key in cache emptied by clear returns undefined | [2] Verify single element cache of capacity 1 get unique key hits | [3] Verify single element cach...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get on former key in cache emptied by clear returns undefined ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(9, 99);
        cache.clear();
        expect(cache.get(9)).assertEqual(undefined);
      }

      // --- [2] Verify single element cache of capacity 1 get unique key hits ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 10);
        expect(cache.get(1)).assertEqual(10);
      }

      // --- [3] Verify single element cache of capacity 1 get other key returns undefined ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 10);
        expect(cache.get(2)).assertEqual(undefined);
      }

      // --- [4] Verify multiple keys mapping to same value get middle key returns shared value ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('a', 5);
        cache.put('b', 5);
        cache.put('c', 5);
        expect(cache.get('b')).assertEqual(5);
      }

      // --- [5] Verify get after multiple put overwrites on same key returns last written value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(1, 11);
        cache.put(1, 12);
        expect(cache.get(1)).assertEqual(12);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0310
     * @tc.name testLruCacheGet031
     * @tc.desc Merged batch (5 tests): [1] Verify repeated consecutive get hits on same key return stable value | [2] Verify multiple keys sharing one reference value get returns shared instance field | [3] Verif...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify repeated consecutive get hits on same key return stable value ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('r', 42);
        cache.get('r');
        cache.get('r');
        cache.get('r');
        expect(cache.get('r')).assertEqual(42);
      }

      // --- [2] Verify multiple keys sharing one reference value get returns shared instance field ---
      {
        let shared: TagObj = { tag: 's' };
        let cache: util.LRUCache<string, TagObj> = new util.LRUCache<string, TagObj>();
        cache.put('x', shared);
        cache.put('y', shared);
        let got: TagObj = cache.get('y')!;
        expect(got.tag).assertEqual('s');
      }

      // --- [3] Verify evicted key after re put get restores hit with new value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.get(1)).assertEqual(undefined);
        cache.put(1, 40);
        expect(cache.get(1)).assertEqual(40);
      }

      // --- [4] Verify Uint8Array reference key get hits returning associated value ---
      {
        let ta: Uint8Array = new Uint8Array([1, 2, 3]);
        let cache: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        cache.put(ta, 21);
        expect(cache.get(ta)).assertEqual(21);
      }

      // --- [5] Verify get resolves a WeakMap reference key to its stored value ---
      {
        let wm: WeakMap<object, int> = new WeakMap<object, int>();
        let cache: util.LRUCache<WeakMap<object, int>, int> = new util.LRUCache<WeakMap<object, int>, int>();
        let stored: int = 22;
        cache.put(wm, stored);
        let value: int | undefined = cache.get(wm);
        expect(value).assertEqual(stored);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0320
     * @tc.name testLruCacheGet032
     * @tc.desc Merged batch (5 tests): [1] Verify get resolves a Record reference key to its stored value | [2] Verify two content same different reference Map keys treated distinct get miss | [3] Verify two cont...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get resolves a Record reference key to its stored value ---
      {
        let rec: Record<string, int> = { 'a': 1 };
        let cache: util.LRUCache<Record<string, int>, int> = new util.LRUCache<Record<string, int>, int>();
        let stored: int = 24;
        cache.put(rec, stored);
        let value: int | undefined = cache.get(rec);
        expect(value).assertEqual(stored);
      }

      // --- [2] Verify two content same different reference Map keys treated distinct get miss ---
      {
        let firstMap: Map<string, int> = new Map<string, int>();
        firstMap.set('a', 1);
        let secondMap: Map<string, int> = new Map<string, int>();
        secondMap.set('a', 1);
        let cache: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        cache.put(firstMap, 25);
        expect(cache.get(secondMap)).assertEqual(undefined);
      }

      // --- [3] Verify two content same different reference Set keys treated distinct get miss ---
      {
        let firstSet: Set<int> = new Set<int>();
        firstSet.add(1);
        let secondSet: Set<int> = new Set<int>();
        secondSet.add(1);
        let cache: util.LRUCache<Set<int>, int> = new util.LRUCache<Set<int>, int>();
        cache.put(firstSet, 26);
        expect(cache.get(secondSet)).assertEqual(undefined);
      }

      // --- [4] Verify stored Date key same reference mutated time get still hits by reference ---
      {
        let d: Date = new Date(1000);
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(d, 27);
        d.setTime(2000);
        expect(cache.get(d)).assertEqual(27);
      }

      // --- [5] Verify capacity 2 cache with 4 keys after two round eviction get second key returns undefined ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.put(4, 40);
        expect(cache.get(2)).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0330
     * @tc.name testLruCacheGet033
     * @tc.desc Merged batch (5 tests): [1] Verify capacity 2 cache with 4 keys after two round eviction get newest key hits | [2] Verify get hit returns long extreme value without precision loss | [3] Verify get ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify capacity 2 cache with 4 keys after two round eviction get newest key hits ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.put(4, 40);
        expect(cache.get(4)).assertEqual(40);
      }

      // --- [2] Verify get hit returns long extreme value without precision loss ---
      {
        let cache: util.LRUCache<string, long> = new util.LRUCache<string, long>();
        let big: long = 9223372036854775807;
        cache.put('m', big);
        expect(cache.get('m')).assertEqual(big);
      }

      // --- [3] Verify get hit returns double float operation result preserving precision ---
      {
        let cache: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        let sum: double = 0.1 + 0.2;
        cache.put('d', sum);
        expect(cache.get('d')).assertEqual(0.30000000000000004);
      }

      // --- [4] Verify get hit reference type value is same instance mutation synchronized ---
      {
        let p: Item = new Item(9);
        let cache: util.LRUCache<string, Item> = new util.LRUCache<string, Item>();
        cache.put('p', p);
        p.id = 10;
        expect(cache.get('p')!.id).assertEqual(10);
      }

      // --- [5] Verify get hit returns byte extreme value keeping numeric value ---
      {
        let cache: util.LRUCache<string, byte> = new util.LRUCache<string, byte>();
        cache.put('b', 127 as byte);
        expect(cache.get('b')).assertEqual(127);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0340
     * @tc.name testLruCacheGet034
     * @tc.desc Merged batch (5 tests): [1] Verify get retrieves the huge bigint value stored under string key z | [2] Verify get retrieves boolean value true stored under string key t | [3] Verify subclass create...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get retrieves the huge bigint value stored under string key z ---
      {
        let cache: util.LRUCache<string, bigint> = new util.LRUCache<string, bigint>();
        let stored: bigint = 999999999999999999999999999999n;
        cache.put('z', stored);
        let value: bigint | undefined = cache.get('z');
        expect(value).assertEqual(stored);
      }

      // --- [2] Verify get retrieves boolean value true stored under string key t ---
      {
        let cache: util.LRUCache<string, boolean> = new util.LRUCache<string, boolean>();
        let stored: boolean = true;
        cache.put('t', stored);
        let value: boolean | undefined = cache.get('t');
        expect(value).assertTrue();
      }

      // --- [3] Verify subclass createDefault explicitly returning undefined get miss returns undefined ---
      {
        let cache: GetDefCache<int, int | undefined> = new GetDefCache<int, int | undefined>((key: int): int | undefined => { return undefined; });
        expect(cache.get(5)).assertEqual(undefined);
      }

      // --- [4] Verify overridden createDefault does not affect get on existing key which still hits ---
      {
        let cache: GetDefCache<int, int | undefined> = new GetDefCache<int, int | undefined>((key: int): int | undefined => { return undefined; });
        cache.put(1, 10);
        expect(cache.get(1)).assertEqual(10);
      }

      // --- [5] Verify subclass createDefault throwing get miss propagates exception ---
      {
        let cache: GetDefCache<int, int> = new GetDefCache<int, int>((key: int): int => { throw new Error('createDefault-boom'); });
        try {
          cache.get(5);
          expect().assertFail();
        } catch (e) {
          expect(e.message).assertEqual('createDefault-boom');
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0350
     * @tc.name testLruCacheGet035
     * @tc.desc Merged batch (5 tests): [1] Verify subclass createDefault throwing get hit on existing key still returns stored value | [2] Verify createDefault first call throws and second call returns default in...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify subclass createDefault throwing get hit on existing key still returns stored value ---
      {
        let cache: GetDefCache<int, int> = new GetDefCache<int, int>((key: int): int => { throw new Error('boom2'); });
        cache.put(1, 10);
        expect(cache.get(1)).assertEqual(10);
      }

      // --- [2] Verify createDefault first call throws and second call returns default independently ---
      {
        let flipCalls: int = 0;
        let cache: GetDefCache<int, int> = new GetDefCache<int, int>((key: int): int => {
          flipCalls = flipCalls + 1;
          if (flipCalls === 1) {
            throw new Error('first-boom');
          }
          return key + 1000;
        });
        try {
          cache.get(7);
          expect().assertFail();
        } catch (e) {
          expect(e.message).assertEqual('first-boom');
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(cache.get(7)).assertEqual(1007);
      }

      // --- [3] Verify subclass createDefault returning key derived value get miss returns derived value ---
      {
        let cache: GetDefCache<string, string> = new GetDefCache<string, string>((key: string): string => { return 'default-' + key; });
        expect(cache.get('k1')).assertEqual('default-k1');
      }

      // --- [4] Verify subclass createDefault returning undefined get miss does not change cache length ---
      {
        let cache: GetDefCache<int, int | undefined> = new GetDefCache<int, int | undefined>((key: int): int | undefined => { return undefined; });
        cache.get(3);
        expect(cache.length).assertEqual(0);
      }

      // --- [5] Verify subclass createDefault non undefined value is returned then reused by the repeat get ---
      {
        let cache: GetDefCache<int, Date> = new GetDefCache<int, Date>((key: int): Date => { return new Date(1); });
        let firstDate: Date = cache.get(1)!;
        let secondDate: Date = cache.get(1)!;
        expect(firstDate.getTime()).assertEqual(1);
        expect(secondDate.getTime()).assertEqual(1);
        expect(cache.getCreateCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0360
     * @tc.name testLruCacheGet036
     * @tc.desc Merged batch (5 tests): [1] Verify cache without createDefault override get miss does not trigger afterRemoval | [2] Verify subclass createDefault non undefined get miss does not trigger afterRemov...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify cache without createDefault override get miss does not trigger afterRemoval ---
      {
        let cache: RemovalWatchCache = new RemovalWatchCache();
        cache.get(1);
        expect(cache.removalHits).assertEqual(0);
      }

      // --- [2] Verify subclass createDefault non undefined get miss does not trigger afterRemoval (removalHits stays 0) ---
      {
        let cache: DftRemovalCache = new DftRemovalCache();
        cache.get(3);
        expect(cache.removalHits).assertEqual(0);
      }

      // --- [3] Verify overridden createDefault not called when get hits existing key ---
      {
        let spyCalls: int = 0;
        let cache: GetDefCache<int, int> = new GetDefCache<int, int>((key: int): int => {
          spyCalls = spyCalls + 1;
          return key;
        });
        cache.put(1, 10);
        cache.get(1);
        expect(spyCalls).assertEqual(0);
      }

      // --- [4] Verify get hit on key 1 promotes it to most recently used so later put evicts older key 2 instead and key 1 survives ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.get(1)).assertEqual(10);
        cache.put(3, 30);
        expect(cache.get(1)).assertEqual(10);
        expect(cache.get(2)).assertEqual(undefined);
      }

      // --- [5] Verify loop of 1000 put then 1000 get on contiguous keys every get hits with stored value (stable repeated get) ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2000);
        for (let i: int = 0; i < 1000; i++) {
          cache.put(i, i + 1);
        }
        for (let i: int = 0; i < 1000; i++) {
          expect(cache.get(i)).assertEqual(i + 1);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0370
     * @tc.name testLruCacheGet037
     * @tc.desc Merged batch (5 tests): [1] Verify self-referential Map value get returns same instance with cycle intact | [2] Verify self-referential Set object key get hits returning associated value | [3] Veri...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify self-referential Map value get returns same instance with cycle intact ---
      {
        let m: Map<string, object> = new Map<string, object>();
        m.set('self', m);
        let cache: util.LRUCache<int, Map<string, object>> = new util.LRUCache<int, Map<string, object>>();
        cache.put(1, m);
        let got: Map<string, object> = cache.get(1)!;
        expect(got.has('self')).assertTrue();
        expect(got.size).assertEqual(1);
        m.set('extra', m);
        expect(got.size).assertEqual(2);
        expect(got.has('extra')).assertTrue();
      }

      // --- [2] Verify self-referential Set object key get hits returning associated value ---
      {
        let s: Set<object> = new Set<object>();
        s.add(s);
        let cache: util.LRUCache<Set<object>, int> = new util.LRUCache<Set<object>, int>();
        cache.put(s, 77);
        expect(cache.get(s)).assertEqual(77);
        expect(s.has(s)).assertTrue();
      }

      // --- [3] Verify an int key computed by 32-bit overflow (INT_MIN - 1) aliases the literal INT_MAX key so a later get through the wrapped key returns the overwriting value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        let mn: int = -2147483648;
        let wrappedDown: int = mn - 1;
        cache.put(2147483647, 11);
        cache.put(wrappedDown, 22);
        expect(cache.length).assertEqual(1);
        expect(cache.get(2147483647)).assertEqual(22);
      }

      // --- [4] Verify object key entry stays reachable through its reference after a field change while a content-equal fresh object misses ---
      {
        let k: Item = new Item(5);
        let cache: util.LRUCache<Item, int> = new util.LRUCache<Item, int>(4);
        cache.put(k, 50);
        k.id = 500;
        expect(cache.get(new Item(5))).assertEqual(undefined);
        expect(cache.get(k)).assertEqual(50);
      }

      // --- [5] Verify while loop driven by length lets repeated get misses insert createDefault values until length four ---
      {
        let cache: GetDefCache<int, int> = new GetDefCache<int, int>((key: int): int => { return key * 100; });
        let nextKey: int = 0;
        let createdSum: int = 0;
        while (cache.length < 4) {
          let created: int | undefined = cache.get(nextKey);
          if (created !== undefined) {
            createdSum = createdSum + created;
          }
          nextKey++;
        }
        expect(nextKey).assertEqual(4);
        expect(createdSum).assertEqual(600);
        expect(cache.length).assertEqual(4);
        expect(cache.getCreateCount()).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0380
     * @tc.name testLruCacheGet038
     * @tc.desc Merged batch (5 tests): [1] Verify get retrieves the value stored under the minimum long key | [2] Verify get retrieves each stored enum member value and misses the absent member | [3] Verify a get...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get retrieves the value stored under the minimum long key ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let minLong: long = -9223372036854775807 - 1;
        cache.put(minLong, 42);
        expect(cache.get(minLong)).assertEqual(42);
        expect(cache.get(minLong + 1)).assertEqual(undefined);
      }

      // --- [2] Verify get retrieves each stored enum member value and misses the absent member ---
      {
        let cache: util.LRUCache<GetRank, int> = new util.LRUCache<GetRank, int>(2);
        cache.put(GetRank.Low, 7);
        cache.put(GetRank.High, 9);
        expect(cache.get(GetRank.Low)).assertEqual(7);
        expect(cache.get(GetRank.High)).assertEqual(9);
        expect(cache.get(GetRank.Mid)).assertEqual(undefined);
      }

      // --- [3] Verify a get hit on the NUL key promotes it so the zero width space key is the one evicted at capacity two ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(2);
        cache.put('\u0000', 5);
        cache.put('\u200B', 6);
        expect(cache.get('\u0000')).assertEqual(5);
        cache.put('\uFEFF', 7);
        expect(cache.get('\u200B')).assertEqual(undefined);
        expect(cache.get('\u0000')).assertEqual(5);
        expect(cache.get('\uFEFF')).assertEqual(7);
      }

      // --- [4] Verify get returns the same LRUCache instance stored as value and returns undefined for an absent key ---
      {
        let inner: util.LRUCache<int, int> = new util.LRUCache<int, int>(6);
        inner.put(11, 111);
        let outer: util.LRUCache<string, util.LRUCache<int, int>> = new util.LRUCache<string, util.LRUCache<int, int>>(3);
        outer.put('slot', inner);
        let fetched: util.LRUCache<int, int> | undefined = outer.get('slot');
        expect(fetched).assertEqual(inner);
        expect(outer.get('absent')).assertEqual(undefined);
        outer.put('other', new util.LRUCache<int, int>(1));
        expect(outer.get('slot')).assertEqual(inner);
      }

      // --- [5] Verify chained get on a stored LRUCache value reads the inner entry ---
      {
        let a: util.LRUCache<int, string> = new util.LRUCache<int, string>(2);
        a.put(1, 'alpha');
        a.put(2, 'beta');
        let outer: util.LRUCache<string, util.LRUCache<int, string>> = new util.LRUCache<string, util.LRUCache<int, string>>(2);
        outer.put('node', a);
        expect(outer.get('node')!.get(2)).assertEqual('beta');
        expect(outer.get('node')!.get(1)).assertEqual('alpha');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_0390
     * @tc.name testLruCacheGet039
     * @tc.desc Merged batch (3 tests): [1] Verify get resolves each cache instance key to its own string value and misses an unregistered instance | [2] Verify chained get through three nested cache levels reads ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get resolves each cache instance key to its own string value and misses an unregistered instance ---
      {
        let primaryKey: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        primaryKey.put(1, 11);
        let secondaryKey: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        secondaryKey.put(2, 22);
        let catalog: util.LRUCache<util.LRUCache<int, int>, string> =
          new util.LRUCache<util.LRUCache<int, int>, string>(3);
        catalog.put(primaryKey, 'first');
        catalog.put(secondaryKey, 'second');
        expect(catalog.get(primaryKey)).assertEqual('first');
        expect(catalog.get(secondaryKey)).assertEqual('second');
        let missingKey: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        expect(catalog.get(missingKey)).assertEqual(undefined);
        expect(catalog.getMissCount()).assertEqual(1);
      }

      // --- [2] Verify chained get through three nested cache levels reads the innermost entry ---
      {
        let level1: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        level1.put(1, 111);
        level1.put(2, 222);
        let level2: util.LRUCache<string, util.LRUCache<int, int>> =
          new util.LRUCache<string, util.LRUCache<int, int>>(2);
        level2.put('mid', level1);
        let level3: util.LRUCache<int, util.LRUCache<string, util.LRUCache<int, int>>> =
          new util.LRUCache<int, util.LRUCache<string, util.LRUCache<int, int>>>(1);
        level3.put(9, level2);
        expect(level3.get(9)!.get('mid')!.get(1)).assertEqual(111);
        expect(level3.get(9)!.get('mid')!.get(2)).assertEqual(222);
      }

      // --- [3] Verify a reference read before eviction stays usable after its entry leaves the outer cache ---
      {
        let tracked: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        tracked.put(1, 100);
        let holder: util.LRUCache<int, util.LRUCache<int, int>> =
          new util.LRUCache<int, util.LRUCache<int, int>>(2);
        holder.put(1, tracked);
        let held: util.LRUCache<int, int> | undefined = holder.get(1);
        holder.put(2, new util.LRUCache<int, int>(2));
        holder.put(3, new util.LRUCache<int, int>(2));
        expect(holder.get(1)).assertEqual(undefined);
        expect(holder.length).assertEqual(2);
        expect(held!.get(1)).assertEqual(100);
        expect(held!.length).assertEqual(1);
      }
    });

  });
}
