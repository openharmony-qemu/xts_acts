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

class CountingRemovalChild<K, V> extends util.LRUCache<K, V> {
  removed: int = 0;
  constructor(capacity?: int) {
    super(capacity);
  }
  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V): void {
    this.removed++;
  }
}

enum KeySlot {
  First = 0,
  Second = 1
}

export default function lruCacheKeysTest(): void {
  describe('LruCacheKeysTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0010
     * @tc.name testLruCacheKeys001
     * @tc.desc Merged batch (5 tests): [1] Verify keys on empty cache returns empty array | [2] Verify keys on single key cache returns that key | [3] Verify keys on six key cache returns all keys in LRU to MRU o...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys on empty cache returns empty array ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(0);
        expect(cache.isEmpty()).assertTrue();
      }

      // --- [2] Verify keys on single key cache returns that key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let key: int = 10;
        cache.put(key, 100);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(key);
      }

      // --- [3] Verify keys on six key cache returns all keys in LRU to MRU order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 1; i <= 6; i++) {
          cache.put(i, i * 100);
        }
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(1);
        expect(ks[1]).assertEqual(2);
        expect(ks[2]).assertEqual(3);
        expect(ks[3]).assertEqual(4);
        expect(ks[4]).assertEqual(5);
        expect(ks[5]).assertEqual(6);
      }

      // --- [4] Verify keys result stable across repeated calls ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 11);
        cache.put(2, 22);
        let firstKeys: int[] = cache.keys();
        let secondKeys: int[] = cache.keys();
        expect(secondKeys.length).assertEqual(firstKeys.length);
        expect(secondKeys[0]).assertEqual(firstKeys[0]);
        expect(secondKeys[1]).assertEqual(firstKeys[1]);
      }

      // --- [5] Verify keys returns key -1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let negativeKey: int = -1;
        cache.put(negativeKey, 200);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(negativeKey);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0020
     * @tc.name testLruCacheKeys002
     * @tc.desc Merged batch (5 tests): [1] Verify keys returns int max key 2147483647 | [2] Verify keys returns int min key -2147483648 | [3] Verify keys on mixed boundary int key set returns all keys by insertio...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys returns int max key 2147483647 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2147483647, 500);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(1);
        expect(ks[0]).assertEqual(2147483647);
      }

      // --- [2] Verify keys returns int min key -2147483648 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let storedValue: int = 600;
        cache.put(-2147483648, storedValue);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(-2147483648);
      }

      // --- [3] Verify keys on mixed boundary int key set returns all keys by insertion order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(0, 100);
        cache.put(-1, 200);
        cache.put(1, 300);
        cache.put(7, 400);
        cache.put(2147483647, 500);
        cache.put(-2147483648, 600);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(0);
        expect(ks[1]).assertEqual(-1);
        expect(ks[2]).assertEqual(1);
        expect(ks[3]).assertEqual(7);
        expect(ks[4]).assertEqual(2147483647);
        expect(ks[5]).assertEqual(-2147483648);
      }

      // --- [4] Verify decimal 15 and hex 0xF numerically same key keeps single entry ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(15, 80);
        cache.put(0xF, 90);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(1);
        expect(ks[0]).assertEqual(15);
      }

      // --- [5] Verify keys returns NaN key ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.NaN, 11);
        let ks: double[] = cache.keys();
        expect(ks.length).assertEqual(1);
        expect(isNaN(ks[0])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0030
     * @tc.name testLruCacheKeys003
     * @tc.desc Merged batch (5 tests): [1] Verify keys returns Infinity key | [2] Verify keys returns -Infinity key | [3] Verify -0 and 0 judged same key keys returns normalized 0 | [4] Verify keys returns ordina...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys returns Infinity key ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.POSITIVE_INFINITY, 22);
        let ks: double[] = cache.keys();
        expect(ks[0]).assertEqual(Double.POSITIVE_INFINITY);
      }

      // --- [2] Verify keys returns -Infinity key ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.NEGATIVE_INFINITY, 33);
        let ks: double[] = cache.keys();
        expect(ks[0]).assertEqual(Double.NEGATIVE_INFINITY);
      }

      // --- [3] Verify -0 and 0 judged same key keys returns normalized 0 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(-0, 44);
        let ks: double[] = cache.keys();
        expect(ks[0]).assertEqual(0);
      }

      // --- [4] Verify keys returns ordinary decimal key 0.1 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(0.1, 55);
        let ks: double[] = cache.keys();
        expect(ks[0]).assertEqual(0.1);
        expect(ks.length).assertEqual(1);
      }

      // --- [5] Verify keys returns double max Number.MAX_VALUE key ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Number.MAX_VALUE, 66);
        let ks: double[] = cache.keys();
        expect(ks[0]).assertEqual(Number.MAX_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0040
     * @tc.name testLruCacheKeys004
     * @tc.desc Merged batch (5 tests): [1] Verify keys returns double min positive Number.MIN_VALUE key | [2] Verify keys returns negative double extreme -Number.MAX_VALUE key | [3] Verify keys on double cache re...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys returns double min positive Number.MIN_VALUE key ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Number.MIN_VALUE, 77);
        let ks: double[] = cache.keys();
        expect(ks[0]).assertEqual(Number.MIN_VALUE);
      }

      // --- [2] Verify keys returns negative double extreme -Number.MAX_VALUE key ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(-Number.MAX_VALUE, 88);
        let ks: double[] = cache.keys();
        expect(ks[0]).assertEqual(-Number.MAX_VALUE);
      }

      // --- [3] Verify keys on double cache returns integral and fractional keys in insertion order ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(1, 11);
        cache.put(1.5, 22);
        let ks: double[] = cache.keys();
        expect(ks[0]).assertEqual(1);
        expect(ks[1]).assertEqual(1.5);
      }

      // --- [4] Verify keys returns ordinary long key 123 ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        cache.put(123, 5);
        let ks: long[] = cache.keys();
        let first: long = ks[0];
        expect(first).assertEqual(123);
      }

      // --- [5] Verify keys returns long max key 9223372036854775807 ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let maxLong: long = 9223372036854775807;
        cache.put(maxLong, 6);
        let ks: long[] = cache.keys();
        expect(ks[0]).assertEqual(maxLong);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0050
     * @tc.name testLruCacheKeys005
     * @tc.desc Merged batch (5 tests): [1] Verify keys returns long min key -9223372036854775808 | [2] Verify keys returns byte max key 127 | [3] Verify keys returns short min key -32768 | [4] Verify keys returns...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys returns long min key -9223372036854775808 ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let minLong: long = -9223372036854775807 - 1;
        cache.put(minLong, 7);
        let ks: long[] = cache.keys();
        expect(ks[0]).assertEqual(minLong);
      }

      // --- [2] Verify keys returns byte max key 127 ---
      {
        let cache: util.LRUCache<byte, int> = new util.LRUCache<byte, int>();
        cache.put(127 as byte, 15);
        let ks: byte[] = cache.keys();
        expect(ks[0]).assertEqual(127 as byte);
      }

      // --- [3] Verify keys returns short min key -32768 ---
      {
        let cache: util.LRUCache<short, int> = new util.LRUCache<short, int>();
        cache.put(-32768 as short, 25);
        let ks: short[] = cache.keys();
        expect(ks[0]).assertEqual(-32768 as short);
      }

      // --- [4] Verify keys returns single character string key k ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = 'k';
        cache.put(key, 35);
        let ks: string[] = cache.keys();
        expect(ks.length).assertEqual(1);
        expect(ks[0]).assertEqual(key);
      }

      // --- [5] Verify keys returns float key 1.5 ---
      {
        let cache: util.LRUCache<float, int> = new util.LRUCache<float, int>();
        cache.put(1.5 as float, 45);
        let ks: float[] = cache.keys();
        expect(ks[0]).assertEqual(1.5 as float);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0060
     * @tc.name testLruCacheKeys006
     * @tc.desc Merged batch (5 tests): [1] Verify keys returns boolean key true | [2] Verify keys returns boolean key false | [3] Verify keys on true and false mixed set returns both keys in insertion order | [4]...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys returns boolean key true ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(true, 51);
        let ks: boolean[] = cache.keys();
        expect(ks[0]).assertTrue();
      }

      // --- [2] Verify keys returns boolean key false ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(false, 52);
        let ks: boolean[] = cache.keys();
        expect(ks[0]).assertFalse();
      }

      // --- [3] Verify keys on true and false mixed set returns both keys in insertion order ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(true, 51);
        cache.put(false, 52);
        let ks: boolean[] = cache.keys();
        expect(ks[0]).assertTrue();
        expect(ks[1]).assertFalse();
      }

      // --- [4] Verify keys returns bigint key 1n ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        cache.put(1n, 61);
        let ks: bigint[] = cache.keys();
        expect(ks[0]).assertEqual(1n);
      }

      // --- [5] Verify keys returns huge bigint key beyond long range ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        cache.put(123456789012345678901234567890n, 62);
        let ks: bigint[] = cache.keys();
        expect(ks[0]).assertEqual(123456789012345678901234567890n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0070
     * @tc.name testLruCacheKeys007
     * @tc.desc Merged batch (5 tests): [1] Verify keys returns negative bigint key -1n | [2] Verify keys returns empty string key | [3] Verify keys returns 10000 char long string key | [4] Verify keys returns str...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys returns negative bigint key -1n ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        cache.put(-1n, 64);
        let ks: bigint[] = cache.keys();
        expect(ks[0]).assertEqual(-1n);
      }

      // --- [2] Verify keys returns empty string key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('', 71);
        let ks: string[] = cache.keys();
        expect(ks[0]).assertEqual('');
        expect(ks.length).assertEqual(1);
      }

      // --- [3] Verify keys returns 10000 char long string key ---
      {
        let longKey: string = '';
        for (let i: int = 0; i < 10000; i++) {
          longKey += 'a';
        }
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put(longKey, 72);
        let ks: string[] = cache.keys();
        expect(ks[0]).assertEqual(longKey);
      }

      // --- [4] Verify keys returns string key containing null character ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        expect(cache.isEmpty()).assertTrue();
        cache.put('\0', 73);
        let ks: string[] = cache.keys();
        expect(ks[0]).assertEqual('\0');
      }

      // --- [5] Verify keys returns Chinese string key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let value: int = 74;
        cache.put('你好', value);
        let ks: string[] = cache.keys();
        expect(ks[0]).assertEqual('你好');
        expect(ks.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0080
     * @tc.name testLruCacheKeys008
     * @tc.desc Merged batch (5 tests): [1] Verify keys returns emoji surrogate pair string key | [2] Verify keys returns ordinary string key cache_key | [3] Verify key and Key case different keys returns two keys...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys returns emoji surrogate pair string key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('😀', 75);
        let ks: string[] = cache.keys();
        let first: string = ks[0];
        expect(first).assertEqual('😀');
      }

      // --- [2] Verify keys returns ordinary string key cache_key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = 'cache_key';
        cache.put(key, 76);
        let ks: string[] = cache.keys();
        expect(ks[0]).assertEqual(key);
      }

      // --- [3] Verify key and Key case different keys returns two keys ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('key', 77);
        cache.put('Key', 78);
        let ks: string[] = cache.keys();
        expect(ks.length).assertEqual(2);
        expect(ks[0]).assertEqual('key');
        expect(ks[1]).assertEqual('Key');
      }

      // --- [4] Verify keys returns numeric string key 123 ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('123', 79);
        let ks: string[] = cache.keys();
        expect(ks.length).assertEqual(1);
        expect(ks[0]).assertEqual('123');
      }

      // --- [5] Verify keys returns reference-typed keys ---
      {
        // Date object reference key
        let dateKey: Date = new Date(2024, 5, 15);
        let cacheDate: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cacheDate.put(dateKey, 82);
        let ksDate: Date[] = cacheDate.keys();
        expect(ksDate[0]).assertEqual(dateKey);

        // RegExp object reference key
        let regexKey: RegExp = new RegExp('ab+c', 'g');
        let cacheRegex: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        cacheRegex.put(regexKey, 84);
        let ksRegex: Array<RegExp> = cacheRegex.keys();
        expect(ksRegex[0]).assertEqual(regexKey);

        // Error object reference key
        let errorKey: Error = new Error('boom');
        let cacheError: util.LRUCache<Error, int> = new util.LRUCache<Error, int>();
        cacheError.put(errorKey, 86);
        let ksError: Array<Error> = cacheError.keys();
        expect(ksError[0]).assertEqual(errorKey);

        // Map object reference key
        let mapKey: Map<string, int> = new Map<string, int>();
        mapKey.set('a', 1);
        let cacheMap: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        cacheMap.put(mapKey, 90);
        let ksMap: Array<Map<string, int>> = cacheMap.keys();
        expect(ksMap[0]).assertEqual(mapKey);

        // Set object reference key
        let setKey: Set<int> = new Set<int>();
        setKey.add(1);
        let cacheSet: util.LRUCache<Set<int>, int> = new util.LRUCache<Set<int>, int>();
        cacheSet.put(setKey, 91);
        let ksSet: Array<Set<int>> = cacheSet.keys();
        expect(ksSet[0]).assertEqual(setKey);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0090
     * @tc.name testLruCacheKeys009
     * @tc.desc Merged batch (5 tests): [1] Verify keys returns object literal reference key | [2] Verify keys returns class instance reference key | [3] Verify keys returns Array reference key | [4] Verify keys r...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys returns object literal reference key ---
      {
        let objectKey: TagNode = { tag: 'a' };
        let cache: util.LRUCache<TagNode, int> = new util.LRUCache<TagNode, int>();
        cache.put(objectKey, 81);
        let ks: TagNode[] = cache.keys();
        expect(ks[0]).assertEqual(objectKey);
      }

      // --- [2] Verify keys returns class instance reference key ---
      {
        let pointKey: Point = new Point(1, 2);
        let cache: util.LRUCache<Point, int> = new util.LRUCache<Point, int>();
        cache.put(pointKey, 87);
        let ks: Point[] = cache.keys();
        expect(ks[0]).assertEqual(pointKey);
      }

      // --- [3] Verify keys returns Array reference key ---
      {
        let arrayKey: int[] = [1, 2, 3];
        let cache: util.LRUCache<int[], int> = new util.LRUCache<int[], int>();
        cache.put(arrayKey, 89);
        let ks: int[][] = cache.keys();
        expect(ks[0]).assertEqual(arrayKey);
      }

      // --- [4] Verify keys returns TypedArray reference key ---
      {
        let bytesKey: Uint8Array = new Uint8Array([1, 2, 3]);
        let cache: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        cache.put(bytesKey, 92);
        let ks: Array<Uint8Array> = cache.keys();
        expect(ks[0]).assertEqual(bytesKey);
      }

      // --- [5] Verify two Date keys with same timestamp different reference are two distinct keys ---
      {
        let firstDate: Date = new Date(2024, 5, 15);
        let secondDate: Date = new Date(2024, 5, 15);
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(firstDate, 82);
        cache.put(secondDate, 83);
        let ks: Date[] = cache.keys();
        expect(ks[0]).assertEqual(firstDate);
        expect(ks[1]).assertEqual(secondDate);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0100
     * @tc.name testLruCacheKeys010
     * @tc.desc Merged batch (5 tests): [1] Verify two RegExp keys with same pattern different reference are two distinct keys | [2] Verify keys returns all 64 keys when key set exactly fills default capacity | [3...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two RegExp keys with same pattern different reference are two distinct keys ---
      {
        let firstRegex: RegExp = new RegExp('ab+c', 'g');
        let secondRegex: RegExp = new RegExp('ab+c', 'g');
        let cache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        cache.put(firstRegex, 84);
        cache.put(secondRegex, 85);
        let ks: Array<RegExp> = cache.keys();
        expect(ks[0]).assertEqual(firstRegex);
        expect(ks[1]).assertEqual(secondRegex);
      }

      // --- [2] Verify keys returns all 64 keys when key set exactly fills default capacity ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 64; i++) {
          cache.put(i, i * 2);
        }
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(64);
        expect(ks[0]).assertEqual(0);
        expect(ks[63]).assertEqual(63);
      }

      // --- [3] Verify keys on non empty cache returns array type ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let ks: int[] = cache.keys();
        let isArr: boolean = Array.isArray(ks);
        expect(isArr).assertTrue();
      }

      // --- [4] Verify keys on empty cache returns array type ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let ks: int[] = cache.keys();
        let isArr: boolean = Array.isArray(ks);
        expect(isArr).assertTrue();
      }

      // --- [5] Verify class instance key keys array element is the class instance ---
      {
        let pointKey: Point = new Point(1, 2);
        let cache: util.LRUCache<Point, int> = new util.LRUCache<Point, int>();
        cache.put(pointKey, 10);
        let ks: Point[] = cache.keys();
        expect(cache.keys()[0] instanceof Point).assertTrue();
        expect(ks.length).assertEqual(1);
        expect(ks[0]).assertEqual(pointKey);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0110
     * @tc.name testLruCacheKeys011
     * @tc.desc Merged batch (5 tests): [1] Verify Date key keys array elements all Date instances | [2] Verify RegExp key keys array elements all RegExp instances | [3] Verify string double mixed key cache keys a...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Date key keys array elements all Date instances ---
      {
        let dateKey: Date = new Date(2024, 5, 15);
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(dateKey, 10);
        let ks: Date[] = cache.keys();
        expect(cache.keys()[0] instanceof Date).assertTrue();
        expect(ks.length).assertEqual(1);
        expect(ks[0]).assertEqual(dateKey);
      }

      // --- [2] Verify RegExp key keys array elements all RegExp instances ---
      {
        let regexKey: RegExp = new RegExp('ab+c', 'g');
        let cache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        cache.put(regexKey, 10);
        let ks: RegExp[] = cache.keys();
        expect(cache.keys()[0] instanceof RegExp).assertTrue();
        expect(ks.length).assertEqual(1);
        expect(ks[0]).assertEqual(regexKey);
      }

      // --- [3] Verify string double mixed key cache keys array keeps original type by position ---
      {
        let cache: util.LRUCache<string | double, int> = new util.LRUCache<string | double, int>();
        cache.put('a', 1);
        cache.put(2, 2);
        let ks: Array<string | double> = cache.keys();
        expect(typeof ks[0]).assertEqual('string');
        expect(typeof ks[1]).assertEqual('number');
        expect(ks[0]).assertEqual('a');
        expect(ks[1]).assertEqual(2);
      }

      // --- [4] Verify keys order becomes 1 2 4 6 5 3 after get 5 then get 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.put(4, 4);
        cache.put(5, 5);
        cache.put(6, 6);
        cache.get(5);
        cache.get(3);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(1);
        expect(ks[1]).assertEqual(2);
        expect(ks[2]).assertEqual(4);
        expect(ks[3]).assertEqual(6);
        expect(ks[4]).assertEqual(5);
        expect(ks[5]).assertEqual(3);
      }

      // --- [5] Verify get on oldest key moves it to array tail keys reordered by access ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.get(1);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(3);
        expect(ks[0]).assertEqual(2);
        expect(ks[1]).assertEqual(3);
        expect(ks[2]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0120
     * @tc.name testLruCacheKeys012
     * @tc.desc Merged batch (5 tests): [1] Verify get on newest key leaves keys order unchanged | [2] Verify put overwrite existing key moves it to array tail treated as access | [3] Verify get miss leaves keys o...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get on newest key leaves keys order unchanged ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let before: int[] = cache.keys();
        cache.get(3);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(before.length);
        expect(ks[0]).assertEqual(1);
        expect(ks[1]).assertEqual(2);
        expect(ks[2]).assertEqual(3);
      }

      // --- [2] Verify put overwrite existing key moves it to array tail treated as access ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.put(1, 99);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(2);
        expect(ks[1]).assertEqual(3);
        expect(ks[2]).assertEqual(1);
      }

      // --- [3] Verify get miss leaves keys order unchanged ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.get(99);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(1);
        expect(ks[1]).assertEqual(2);
        expect(ks[2]).assertEqual(3);
      }

      // --- [4] Verify keys array first element is least recently accessed key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(1);
      }

      // --- [5] Verify keys array last element is most recently accessed key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let ks: int[] = cache.keys();
        expect(ks[ks.length - 1]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0130
     * @tc.name testLruCacheKeys013
     * @tc.desc Merged batch (5 tests): [1] Verify keys and values arrays index aligned key value binding synchronized | [2] Verify keys and values arrays length equal | [3] Verify three keys accessed in order key...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys and values arrays index aligned key value binding synchronized ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('a', 'x');
        cache.put('b', 'y');
        cache.put('c', 'z');
        let ks: string[] = cache.keys();
        let vs: string[] = cache.values();
        let ok: boolean = true;
        for (let i: int = 0; i < ks.length; i++) {
          if (ks[i] === 'a' && vs[i] !== 'x') {
            ok = false;
          }
          if (ks[i] === 'b' && vs[i] !== 'y') {
            ok = false;
          }
          if (ks[i] === 'c' && vs[i] !== 'z') {
            ok = false;
          }
        }
        expect(ok).assertTrue();
      }

      // --- [2] Verify keys and values arrays length equal ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'x');
        cache.put(2, 'y');
        cache.put(3, 'z');
        let ks: int[] = cache.keys();
        let vs: string[] = cache.values();
        expect(ks.length).assertEqual(vs.length);
      }

      // --- [3] Verify three keys accessed in order keys reorder to 3 2 1 by recent access ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.get(2);
        cache.get(1);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(3);
        expect(ks[1]).assertEqual(2);
        expect(ks[2]).assertEqual(1);
      }

      // --- [4] Verify repeated get same key promotes once only keys order unchanged by double promotion ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.get(2);
        let afterFirst: int[] = cache.keys();
        cache.get(2);
        let ks: int[] = cache.keys();
        expect(afterFirst[0]).assertEqual(1);
        expect(ks[0]).assertEqual(1);
        expect(ks[1]).assertEqual(3);
        expect(ks[2]).assertEqual(2);
      }

      // --- [5] Verify updateCapacity evicting oldest keys keeps recent keys in LRU order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.get(1);
        cache.updateCapacity(2);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(3);
        expect(ks[1]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0140
     * @tc.name testLruCacheKeys014
     * @tc.desc Merged batch (5 tests): [1] Verify put new key triggering eviction keys only include capacity recent keys | [2] Verify put same key twice different values keys returns single key | [3] Verify remov...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put new key triggering eviction keys only include capacity recent keys ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(2);
        expect(ks[1]).assertEqual(3);
      }

      // --- [2] Verify put same key twice different values keys returns single key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(5, 1);
        cache.put(5, 2);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(5);
      }

      // --- [3] Verify remove middle key keys returns remaining keys in original order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.remove(2);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(2);
        expect(ks[0]).assertEqual(1);
        expect(ks[1]).assertEqual(3);
      }

      // --- [4] Verify remove first key keys new first element is original second key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let removed: int | undefined = cache.remove(1);
        expect(removed).assertEqual(10);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(2);
        expect(ks[1]).assertEqual(3);
      }

      // --- [5] Verify remove last key keys new last element is original second last key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.remove(3);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(1);
        expect(ks[1]).assertEqual(2);
        expect(ks.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0150
     * @tc.name testLruCacheKeys015
     * @tc.desc Merged batch (5 tests): [1] Verify clear then re put keys order resets to new insertion order | [2] Verify single key cache keys array holds that key and its length matches cache length | [3] Verif...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify clear then re put keys order resets to new insertion order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.clear();
        cache.put(4, 40);
        cache.put(5, 50);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(4);
        expect(ks[1]).assertEqual(5);
      }

      // --- [2] Verify single key cache keys array holds that key and its length matches cache length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(7, 70);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(7);
        expect(ks.length).assertEqual(cache.length);
      }

      // --- [3] Verify three keys with interleaved hit and miss lookups give keys array length 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        cache.put(2, 20);
        cache.get(99);
        cache.put(3, 30);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(3);
      }

      // --- [4] Verify repeated put same key keys array length unchanged ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(5, 1);
        cache.put(5, 2);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(1);
      }

      // --- [5] Verify remove existing key keys array length decreases by one ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let removedKey: int = 1;
        cache.put(removedKey, 10);
        cache.put(2, 20);
        cache.remove(removedKey);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0160
     * @tc.name testLruCacheKeys016
     * @tc.desc Merged batch (5 tests): [1] Verify remove non existing key keys array length unchanged | [2] Verify clear keys array length becomes 0 | [3] Verify keys array length 2 after capacity 2 triggering ev...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove non existing key keys array length unchanged ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let absentKey: int = 99;
        cache.put(1, 10);
        cache.put(2, 20);
        cache.remove(absentKey);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(2);
      }

      // --- [2] Verify clear keys array length becomes 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.clear();
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(0);
      }

      // --- [3] Verify keys array length 2 after capacity 2 triggering eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        for (let i: int = 1; i <= 3; i++) {
          cache.put(i, i * 10);
        }
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(2);
      }

      // --- [4] Verify unfilled large capacity keys length equals actual key count not capacity ---
      {
        let bigCapacity: int = 10;
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(bigCapacity);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(3);
      }

      // --- [5] Verify clear then re put single key keys length restores to 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.clear();
        cache.put(2, 20);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0170
     * @tc.name testLruCacheKeys017
     * @tc.desc Merged batch (5 tests): [1] Verify modifying returned keys array element does not alter cache keys | [2] Verify pop on returned keys array does not affect cache key set | [3] Verify push on returne...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify modifying returned keys array element does not alter cache keys ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let ks: int[] = cache.keys();
        ks[0] = 999;
        let secondKeys: int[] = cache.keys();
        expect(secondKeys[0]).assertEqual(1);
      }

      // --- [2] Verify pop on returned keys array does not affect cache key set ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let ks: int[] = cache.keys();
        ks.pop();
        let secondKeys: int[] = cache.keys();
        expect(secondKeys.length).assertEqual(2);
        expect(cache.contains(1)).assertTrue();
        expect(cache.contains(2)).assertTrue();
      }

      // --- [3] Verify push on returned keys array does not add cache key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let ks: int[] = cache.keys();
        ks.push(999);
        let secondKeys: int[] = cache.keys();
        expect(secondKeys.length).assertEqual(1);
        expect(cache.contains(1)).assertTrue();
        expect(cache.contains(999)).assertFalse();
      }

      // --- [4] Verify keys array is snapshot later added key does not change returned array ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let ks: int[] = cache.keys();
        cache.put(2, 20);
        expect(ks.length).assertEqual(1);
        expect(ks[0]).assertEqual(1);
        expect(cache.keys().length).assertEqual(2);
      }

      // --- [5] Verify calling keys cache isEmpty still false ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.keys();
        expect(cache.isEmpty()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0180
     * @tc.name testLruCacheKeys018
     * @tc.desc Merged batch (5 tests): [1] Verify after calling keys original key get still hits | [2] Verify calling keys does not trigger afterRemoval callback | [3] Verify calling keys does not change get miss...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify after calling keys original key get still hits ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.keys();
        let v: int | undefined = cache.get(1);
        expect(v).assertEqual(10);
      }

      // --- [2] Verify calling keys does not trigger afterRemoval callback ---
      {
        let lru: CountingRemovalChild<int, int> = new CountingRemovalChild<int, int>();
        lru.put(1, 10);
        lru.put(2, 20);
        lru.keys();
        expect(lru.removed).assertEqual(0);
      }

      // --- [3] Verify calling keys does not change get miss count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(999);
        let missBefore: long = cache.getMissCount();
        cache.keys();
        expect(cache.getMissCount()).assertEqual(missBefore);
      }

      // --- [4] Verify keys array subscript iteration visits all keys ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let ks: int[] = cache.keys();
        let cnt: int = 0;
        for (let i: int = 0; i < ks.length; i++) {
          cnt++;
        }
        expect(cnt).assertEqual(3);
      }

      // --- [5] Verify keys array join('-') joins keys into hyphen-separated string ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let ks: int[] = cache.keys();
        expect(ks.join('-')).assertEqual('1-2-3');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0190
     * @tc.name testLruCacheKeys019
     * @tc.desc Merged batch (5 tests): [1] Verify keys array element sum equals total of all keys | [2] Verify keys array max element asserted correctly | [3] Verify keys array elements unique deduplicated size e...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys array element sum equals total of all keys ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let ks: int[] = cache.keys();
        let sum: int = 0;
        for (let i: int = 0; i < ks.length; i++) {
          sum += ks[i];
        }
        expect(sum).assertEqual(6);
      }

      // --- [2] Verify keys array max element asserted correctly ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(7, 70);
        cache.put(3, 30);
        cache.put(9, 90);
        let ks: int[] = cache.keys();
        let max: int = -1;
        for (let i: int = 0; i < ks.length; i++) {
          if (ks[i] > max) {
            max = ks[i];
          }
        }
        expect(max).assertEqual(9);
      }

      // --- [3] Verify keys array elements unique deduplicated size equals length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let ks: int[] = cache.keys();
        let s: Set<int> = new Set<int>();
        for (let i: int = 0; i < ks.length; i++) {
          s.add(ks[i]);
        }
        expect(s.size).assertEqual(ks.length);
      }

      // --- [4] Verify every key in keys array can get hit ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('a', 'x');
        cache.put('b', 'y');
        let ks: string[] = cache.keys();
        let allFound: boolean = true;
        for (let i: int = 0; i < ks.length; i++) {
          if (cache.get(ks[i]) === undefined) {
            allFound = false;
          }
        }
        expect(allFound).assertTrue();
      }

      // --- [5] Verify reading keys array in reverse yields MRU to LRU order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let ks: int[] = cache.keys();
        let reversed: int[] = [];
        for (let i: int = ks.length - 1; i >= 0; i--) {
          reversed.push(ks[i]);
        }
        expect(reversed[0]).assertEqual(3);
        expect(reversed[1]).assertEqual(2);
        expect(reversed[2]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0200
     * @tc.name testLruCacheKeys020
     * @tc.desc Merged batch (5 tests): [1] Verify keys order equals entries first-element order after re-put refresh | [2] Verify keys array assertDeepEquals matches expected key sequence | [3] Verify a key writt...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys order equals entries first-element order after re-put refresh ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.put(2, 200);
        let karr: int[] = cache.keys();
        let earr: Array<[int, int]> = Array.from(cache.entries());
        expect(karr.length).assertEqual(earr.length);
        expect(karr[0]).assertEqual(1);
        expect(karr[1]).assertEqual(3);
        expect(karr[2]).assertEqual(2);
        for (let i: int = 0; i < karr.length; i++) {
          expect(karr[i]).assertEqual(earr[i][0]);
        }
      }

      // --- [2] Verify keys array assertDeepEquals matches expected key sequence ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let keyArray: int[] = cache.keys();
        expect(keyArray).assertDeepEquals([1, 2, 3]);
      }

      // --- [3] Verify a key written through an overflowed int (INT_MAX + 1) is reported by keys() as the aliased literal INT_MIN key and occupies a single slot ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        let mx: int = 2147483647;
        let wrappedUp: int = mx + 1;
        cache.put(-2147483648, 11);
        cache.put(wrappedUp, 22);
        let keyArray: int[] = cache.keys();
        expect(keyArray.length).assertEqual(1);
        expect(keyArray).assertDeepEquals([-2147483648]);
      }

      // --- [4] Verify long keys -1 and 4294967295 (2^32 - 1) share the low 32 bits 0xFFFFFFFF yet keys() lists them as two distinct entries ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>(4);
        let lo: long = -1;
        let hi: long = 4294967295;
        cache.put(lo, 11);
        cache.put(hi, 22);
        let keyArray: long[] = cache.keys();
        expect(keyArray.length).assertEqual(2);
        expect(keyArray).assertDeepEquals([lo, hi]);
      }

      // --- [5] Verify keys lists the NUL character key and the maximum BMP 0xFFFF key in insertion order ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('\u0000', 0);
        cache.put('\uFFFF', 1);
        let ks: string[] = cache.keys();
        expect(ks.length).assertEqual(2);
        expect(ks[0]).assertEqual('\u0000');
        expect(ks[0].length).assertEqual(1);
        expect(ks[1]).assertEqual('\uFFFF');
        expect(ks[1].length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_KEYS_0210
     * @tc.name testLruCacheKeys021
     * @tc.desc Merged batch (2 tests): [1] Verify keys lists enum member keys with the accessed member moved to the tail | [2] Verify keys after a grow then shrink lists only the newest keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys lists enum member keys with the accessed member moved to the tail ---
      {
        let cache: util.LRUCache<KeySlot, int> = new util.LRUCache<KeySlot, int>();
        cache.put(KeySlot.First, 11);
        cache.put(KeySlot.Second, 22);
        expect(cache.get(KeySlot.First)).assertEqual(11);
        let ks: KeySlot[] = cache.keys();
        expect(ks.length).assertEqual(2);
        expect(ks[0]).assertEqual(KeySlot.Second);
        expect(ks[1]).assertEqual(KeySlot.First);
      }

      // --- [2] Verify keys after a grow then shrink lists only the newest keys ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.updateCapacity(4);
        cache.put(3, 30);
        cache.updateCapacity(2);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(2);
        expect(ks[0]).assertEqual(2);
        expect(ks[1]).assertEqual(3);
      }
    });

  });
}
