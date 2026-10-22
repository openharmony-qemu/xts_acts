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

class Point {
  x: int = 0;
  y: int = 0;
  constructor(x: int, y: int) {
    this.x = x;
    this.y = y;
  }
}

class Dot {
  x: int = 0;
  constructor(x: int) {
    this.x = x;
  }
}

interface Label {
  name: string;
}

enum IterSlot {
  First = 0,
  Second = 1
}
class IterDefaultCache<K, V> extends util.LRUCache<K, V> {
  make: (key: K) => V | undefined = (key: K) => undefined;

  constructor(make?: (key: K) => V | undefined, capacity?: int) {
    super(capacity);
    if (make !== undefined) {
      this.make = make;
    }
  }

  createDefault(key: K): V | undefined {
    return this.make(key);
  }
}

export default function lruCacheIteratorTest(): void {
  describe('LruCacheIteratorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0010
     * @tc.name testLruCacheIterator001
     * @tc.desc Merged batch (5 tests): [1] Verify iterator of empty cache is exhausted on first next | [2] Verify iterator of single pair cache returns that pair | [3] Verify iterator of three pairs yields the ke...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator of empty cache is exhausted on first next ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let first: IteratorResult<[int, int]> = it.next();
        expect(first.done).assertTrue();
      }

      // --- [2] Verify iterator of single pair cache returns that pair ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let pairs: Array<[int, int]> = Array.from(it);
        expect(pairs.length).assertEqual(1);
        expect(pairs[0][0]).assertEqual(2);
        expect(pairs[0][1]).assertEqual(10);
      }

      // --- [3] Verify iterator of three pairs yields the keys 2 and 3 and 4 in insertion order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.put(3, 15);
        cache.put(4, 20);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let pairs: Array<[int, int]> = Array.from(it);
        let seen: int[] = [];
        for (let p of pairs) {
          seen.push(p[0]);
        }
        expect(seen.join(',')).assertEqual('2,3,4');
      }

      // --- [4] Verify iterator of cache filled to default capacity 64 returns all pairs ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 64; i++) {
          cache.put(i, i * 2);
        }
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let pairs: Array<[int, int]> = Array.from(it);
        expect(pairs.length).assertEqual(64);
        expect(pairs[63][0]).assertEqual(63);
        expect(pairs[63][1]).assertEqual(126);
      }

      // --- [5] Verify iterator returns pair with int key max value 2147483647 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2147483647, 500);
        let pairs: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(pairs[0][0]).assertEqual(2147483647);
        expect(pairs[0][1]).assertEqual(500);
        expect(pairs.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0020
     * @tc.name testLruCacheIterator002
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns pair with int key min value -2147483648 | [2] Verify iterator of mixed boundary int keys returns all pairs in insertion order | [3] Verify iterat...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns pair with int key min value -2147483648 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let minKey: int = -2147483648;
        cache.put(minKey, 600);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let pairs: Array<[int, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(minKey);
        expect(pairs[0][1]).assertEqual(600);
      }

      // --- [2] Verify iterator of mixed boundary int keys returns all pairs in insertion order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(0, 100);
        cache.put(-1, 200);
        cache.put(1, 300);
        cache.put(2147483647, 500);
        cache.put(-2147483648, 600);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let pairs: Array<[int, int]> = Array.from(it);
        expect(pairs.length).assertEqual(5);
        expect(pairs[4][0]).assertEqual(-2147483648);
        expect(pairs[4][1]).assertEqual(600);
      }

      // --- [3] Verify iterator returns pair whose double key is NaN ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.NaN, 11);
        let it: IterableIterator<[double, int]> = cache.$_iterator();
        let pairs: Array<[double, int]> = Array.from(it);
        expect(pairs.length).assertEqual(1);
        expect(isNaN(pairs[0][0])).assertTrue();
        expect(pairs[0][1]).assertEqual(11);
      }

      // --- [4] Verify iterator returns pair with double key Infinity ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.POSITIVE_INFINITY, 22);
        let it: IterableIterator<[double, int]> = cache.$_iterator();
        let pairs: Array<[double, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(Double.POSITIVE_INFINITY);
        expect(pairs[0][1]).assertEqual(22);
      }

      // --- [5] Verify iterator returns pair with double key -Infinity ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.NEGATIVE_INFINITY, 33);
        let it: IterableIterator<[double, int]> = cache.$_iterator();
        let pairs: Array<[double, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(Double.NEGATIVE_INFINITY);
        expect(pairs[0][1]).assertEqual(33);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0030
     * @tc.name testLruCacheIterator003
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns normalized key 0 when stored key is -0 | [2] Verify iterator returns pair with double key 0.1 | [3] Verify iterator returns pair with double key ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns normalized key 0 when stored key is -0 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(-0, 44);
        let it: IterableIterator<[double, int]> = cache.$_iterator();
        let pairs: Array<[double, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(0);
        expect(pairs[0][1]).assertEqual(44);
      }

      // --- [2] Verify iterator returns pair with double key 0.1 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        let key: double = 0.1;
        cache.put(key, 55);
        let it: IterableIterator<[double, int]> = cache.$_iterator();
        let pairs: Array<[double, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(key);
        expect(pairs[0][1]).assertEqual(55);
      }

      // --- [3] Verify iterator returns pair with double key Number.MAX_VALUE ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Number.MAX_VALUE, 66);
        let it: IterableIterator<[double, int]> = cache.$_iterator();
        let pairs: Array<[double, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(Number.MAX_VALUE);
        expect(pairs[0][1]).assertEqual(66);
      }

      // --- [4] Verify iterator returns pair with double key Number.MIN_VALUE ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Number.MIN_VALUE, 77);
        let it: IterableIterator<[double, int]> = cache.$_iterator();
        let pairs: Array<[double, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(Number.MIN_VALUE);
        expect(pairs[0][1]).assertEqual(77);
      }

      // --- [5] Verify iterator returns pair with double key -Number.MAX_VALUE ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(-Number.MAX_VALUE, 88);
        let it: IterableIterator<[double, int]> = cache.$_iterator();
        let pairs: Array<[double, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(-Number.MAX_VALUE);
        expect(pairs[0][1]).assertEqual(88);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0040
     * @tc.name testLruCacheIterator004
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns pair with long key 123 | [2] Verify iterator returns pair with long key max value | [3] Verify iterator returns pair with long key min value | [4...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns pair with long key 123 ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        cache.put(123, 5);
        let it: IterableIterator<[long, int]> = cache.$_iterator();
        let pairs: Array<[long, int]> = Array.from(it);
        expect(pairs.length).assertEqual(1);
        expect(pairs[0][0]).assertEqual(123);
        expect(pairs[0][1]).assertEqual(5);
      }

      // --- [2] Verify iterator returns pair with long key max value ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let maxLong: long = 9223372036854775807;
        cache.put(maxLong, 6);
        let it: IterableIterator<[long, int]> = cache.$_iterator();
        let pairs: Array<[long, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(maxLong);
        expect(pairs[0][1]).assertEqual(6);
      }

      // --- [3] Verify iterator returns pair with long key min value ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let minLong: long = -9223372036854775807 - 1;
        cache.put(minLong, 7);
        let it: IterableIterator<[long, int]> = cache.$_iterator();
        let pairs: Array<[long, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(minLong);
        expect(pairs[0][1]).assertEqual(7);
      }

      // --- [4] Verify iterator returns pair with byte max key 127 ---
      {
        let cache: util.LRUCache<byte, int> = new util.LRUCache<byte, int>();
        cache.put(127 as byte, 15);
        let it: IterableIterator<[byte, int]> = cache.$_iterator();
        let pairs: Array<[byte, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(127 as byte);
        expect(pairs[0][1]).assertEqual(15);
      }

      // --- [5] Verify iterator returns pair with short min key -32768 ---
      {
        let cache: util.LRUCache<short, int> = new util.LRUCache<short, int>();
        cache.put(-32768 as short, 25);
        let it: IterableIterator<[short, int]> = cache.$_iterator();
        let pairs: Array<[short, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(-32768 as short);
        expect(pairs[0][1]).assertEqual(25);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0050
     * @tc.name testLruCacheIterator005
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns pair with single character string key k | [2] Verify iterator returns pair with float key 1.5 | [3] Verify iterator of mixed boolean keys returns...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns pair with single character string key k ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = 'k';
        let value: int = 35;
        cache.put(key, value);
        let it: IterableIterator<[string, int]> = cache.$_iterator();
        let pairs: Array<[string, int]> = Array.from(it);
        expect(pairs.length).assertEqual(1);
        expect(pairs[0][0]).assertEqual(key);
        expect(pairs[0][1]).assertEqual(value);
      }

      // --- [2] Verify iterator returns pair with float key 1.5 ---
      {
        let cache: util.LRUCache<float, int> = new util.LRUCache<float, int>();
        cache.put(1.5 as float, 45);
        let it: IterableIterator<[float, int]> = cache.$_iterator();
        let pairs: Array<[float, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(1.5 as float);
        expect(pairs[0][1]).assertEqual(45);
      }

      // --- [3] Verify iterator of mixed boolean keys returns two pairs in insertion order ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(true, 51);
        cache.put(false, 52);
        let it: IterableIterator<[boolean, int]> = cache.$_iterator();
        let pairs: Array<[boolean, int]> = Array.from(it);
        expect(pairs.length).assertEqual(2);
        expect(pairs[1][0]).assertFalse();
        expect(pairs[1][1]).assertEqual(52);
      }

      // --- [4] Verify iterator returns pair with bigint key 1n ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        let key: bigint = 1n;
        cache.put(key, 61);
        let it: IterableIterator<[bigint, int]> = cache.$_iterator();
        let pairs: Array<[bigint, int]> = Array.from(it);
        expect(pairs.length).assertEqual(1);
        expect(pairs[0][0]).assertEqual(key);
        expect(pairs[0][1]).assertEqual(61);
      }

      // --- [5] Verify iterator returns pair with bigint key beyond long range ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        cache.put(123456789012345678901234567890n, 62);
        let pairs: Array<[bigint, int]> = Array.from(cache.$_iterator());
        expect(pairs.length).assertEqual(1);
        expect(pairs[0][0]).assertEqual(123456789012345678901234567890n);
        expect(pairs[0][1]).assertEqual(62);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0060
     * @tc.name testLruCacheIterator006
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns pair with negative bigint key -1n | [2] Verify iterator returns pair with empty string key | [3] Verify iterator returns pair with 10000-char str...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns pair with negative bigint key -1n ---
      {
        let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        cache.put(-1n, 64);
        let it: IterableIterator<[bigint, int]> = cache.$_iterator();
        let pairs: Array<[bigint, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(-1n);
        expect(pairs[0][1]).assertEqual(64);
      }

      // --- [2] Verify iterator returns pair with empty string key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('', 71);
        let it: IterableIterator<[string, int]> = cache.$_iterator();
        let pairs: Array<[string, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual('');
        expect(pairs[0][1]).assertEqual(71);
        expect(pairs.length).assertEqual(1);
      }

      // --- [3] Verify iterator returns pair with 10000-char string key ---
      {
        let longKey: string = '';
        for (let i: int = 0; i < 10000; i++) {
          longKey += 'a';
        }
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put(longKey, 72);
        let it: IterableIterator<[string, int]> = cache.$_iterator();
        let pairs: Array<[string, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(longKey);
        expect(pairs[0][1]).assertEqual(72);
      }

      // --- [4] Verify iterator returns pair with Chinese string key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let it: IterableIterator<[string, int]> = cache.$_iterator();
        let before: Array<[string, int]> = Array.from(it);
        expect(before.length).assertEqual(0);
        cache.put('你好', 74);
        let pairs: Array<[string, int]> = Array.from(cache.$_iterator());
        expect(pairs[0][0]).assertEqual('你好');
        expect(pairs[0][1]).assertEqual(74);
      }

      // --- [5] Verify iterator returns pair with emoji surrogate-pair string key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = '😀';
        cache.put(key, 75);
        let it: IterableIterator<[string, int]> = cache.$_iterator();
        let pairs: Array<[string, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(key);
        expect(pairs[0][1]).assertEqual(75);
        expect(pairs.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0070
     * @tc.name testLruCacheIterator007
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns two pairs for case-distinct string keys | [2] Verify iterator returns pair with numeric string key | [3] Verify iterator returns pair whose key i...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns two pairs for case-distinct string keys ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('key', 77);
        cache.put('Key', 78);
        let it: IterableIterator<[string, int]> = cache.$_iterator();
        let pairs: Array<[string, int]> = Array.from(it);
        expect(pairs.length).assertEqual(2);
        expect(pairs[1][0]).assertEqual('Key');
        expect(pairs[1][1]).assertEqual(78);
      }

      // --- [2] Verify iterator returns pair with numeric string key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = '123';
        cache.put(key, 79);
        let pairs: Array<[string, int]> = Array.from(cache.$_iterator());
        expect(pairs.length).assertEqual(1);
        expect(pairs[0][0]).assertEqual(key);
        expect(pairs[0][1]).assertEqual(79);
      }

      // --- [3] Verify iterator returns pair whose key is a Date object reference ---
      {
        let dateKey: Date = new Date(2024, 5, 15);
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(dateKey, 82);
        let it: IterableIterator<[Date, int]> = cache.$_iterator();
        let pairs: Array<[Date, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(dateKey);
        expect(pairs[0][1]).assertEqual(82);
      }

      // --- [4] Verify iterator returns pair whose key is a RegExp object reference ---
      {
        let regexKey: RegExp = new RegExp('ab+c', 'g');
        let cache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        cache.put(regexKey, 84);
        let it: IterableIterator<[RegExp, int]> = cache.$_iterator();
        let pairs: Array<[RegExp, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(regexKey);
        expect(pairs[0][1]).assertEqual(84);
      }

      // --- [5] Verify iterator returns pair whose key is an Error object reference ---
      {
        let errorKey: Error = new Error('boom');
        let cache: util.LRUCache<Error, int> = new util.LRUCache<Error, int>();
        cache.put(errorKey, 86);
        let it: IterableIterator<[Error, int]> = cache.$_iterator();
        let pairs: Array<[Error, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(errorKey);
        expect(pairs[0][1]).assertEqual(86);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0080
     * @tc.name testLruCacheIterator008
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns pair whose key is an object literal reference | [2] Verify iterator returns pair whose key is a class instance reference | [3] Verify iterator re...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns pair whose key is an object literal reference ---
      {
        let objectKey: Label = { name: 'a' };
        let cache: util.LRUCache<Label, int> = new util.LRUCache<Label, int>();
        cache.put(objectKey, 81);
        let it: IterableIterator<[Label, int]> = cache.$_iterator();
        let pairs: Array<[Label, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(objectKey);
        expect(pairs[0][1]).assertEqual(81);
      }

      // --- [2] Verify iterator returns pair whose key is a class instance reference ---
      {
        let pointKey: Point = new Point(1, 2);
        let cache: util.LRUCache<Point, int> = new util.LRUCache<Point, int>();
        cache.put(pointKey, 87);
        let it: IterableIterator<[Point, int]> = cache.$_iterator();
        let pairs: Array<[Point, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(pointKey);
        expect(pairs[0][1]).assertEqual(87);
      }

      // --- [3] Verify iterator returns pair whose key is an int array reference ---
      {
        let arrayKey: int[] = [1, 2, 3];
        let cache: util.LRUCache<int[], int> = new util.LRUCache<int[], int>();
        cache.put(arrayKey, 89);
        let it: IterableIterator<[int[], int]> = cache.$_iterator();
        let pairs: Array<[int[], int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(arrayKey);
        expect(pairs[0][1]).assertEqual(89);
      }

      // --- [4] Verify iterator returns pair whose key is a Map reference ---
      {
        let mapKey: Map<string, int> = new Map<string, int>();
        mapKey.set('a', 1);
        let cache: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        cache.put(mapKey, 90);
        let it: IterableIterator<[Map<string, int>, int]> = cache.$_iterator();
        let pairs: Array<[Map<string, int>, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(mapKey);
        expect(pairs[0][1]).assertEqual(90);
      }

      // --- [5] Verify iterator returns pair whose key is a Set reference ---
      {
        let setKey: Set<int> = new Set<int>();
        setKey.add(1);
        let cache: util.LRUCache<Set<int>, int> = new util.LRUCache<Set<int>, int>();
        cache.put(setKey, 91);
        let it: IterableIterator<[Set<int>, int]> = cache.$_iterator();
        let pairs: Array<[Set<int>, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(setKey);
        expect(pairs[0][1]).assertEqual(91);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0090
     * @tc.name testLruCacheIterator009
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns pair whose key is a TypedArray reference | [2] Verify two Date keys with same timestamp but different references both iterated | [3] Verify itera...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns pair whose key is a TypedArray reference ---
      {
        let bytesKey: Uint8Array = new Uint8Array([1, 2, 3]);
        let cache: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        cache.put(bytesKey, 92);
        let it: IterableIterator<[Uint8Array, int]> = cache.$_iterator();
        let pairs: Array<[Uint8Array, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(bytesKey);
        expect(pairs[0][1]).assertEqual(92);
      }

      // --- [2] Verify two Date keys with same timestamp but different references both iterated ---
      {
        let firstDate: Date = new Date(2024, 5, 15);
        let secondDate: Date = new Date(2024, 5, 15);
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(firstDate, 82);
        cache.put(secondDate, 83);
        let it: IterableIterator<[Date, int]> = cache.$_iterator();
        let pairs: Array<[Date, int]> = Array.from(it);
        expect(pairs.length).assertEqual(2);
        expect(pairs[1][0]).assertEqual(secondDate);
        expect(pairs[1][1]).assertEqual(83);
      }

      // --- [3] Verify iterator returns pair with value 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(10, 0);
        let pairs: Array<[int, int]> = Array.from(cache.$_iterator());
        let first: [int, int] = pairs[0];
        expect(first[0]).assertEqual(10);
        expect(first[1]).assertEqual(0);
      }

      // --- [4] Verify iterator returns pair with value int max 2147483647 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let key: int = 12;
        let value: int = 2147483647;
        cache.put(key, value);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let pairs: Array<[int, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(key);
        expect(pairs[0][1]).assertEqual(value);
      }

      // --- [5] Verify iterator returns pair with value int min -2147483648 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let minValue: int = -2147483648;
        cache.put(13, minValue);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let pairs: Array<[int, int]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(13);
        expect(pairs[0][1]).assertEqual(minValue);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0100
     * @tc.name testLruCacheIterator010
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns pair with NaN value | [2] Verify iterator returns pair with Infinity value | [3] Verify iterator returns pair with -Infinity value | [4] Verify i...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns pair with NaN value ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(14, Double.NaN);
        let it: IterableIterator<[int, double]> = cache.$_iterator();
        let pairs: Array<[int, double]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(14);
        expect(isNaN(pairs[0][1])).assertTrue();
      }

      // --- [2] Verify iterator returns pair with Infinity value ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(15, Double.POSITIVE_INFINITY);
        let it: IterableIterator<[int, double]> = cache.$_iterator();
        let pairs: Array<[int, double]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(15);
        expect(pairs[0][1]).assertEqual(Double.POSITIVE_INFINITY);
      }

      // --- [3] Verify iterator returns pair with -Infinity value ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(16, Double.NEGATIVE_INFINITY);
        let it: IterableIterator<[int, double]> = cache.$_iterator();
        let pairs: Array<[int, double]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(16);
        expect(pairs[0][1]).assertEqual(Double.NEGATIVE_INFINITY);
      }

      // --- [4] Verify iterator returns normalized value 0 when stored value is -0 ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(17, -0);
        let it: IterableIterator<[int, double]> = cache.$_iterator();
        let pairs: Array<[int, double]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(17);
        expect(pairs[0][1]).assertEqual(0);
      }

      // --- [5] Verify iterator returns pair with value Number.MAX_VALUE ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(18, Number.MAX_VALUE);
        let it: IterableIterator<[int, double]> = cache.$_iterator();
        let pairs: Array<[int, double]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(18);
        expect(pairs[0][1]).assertEqual(Number.MAX_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0110
     * @tc.name testLruCacheIterator011
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns pair with value long max 9223372036854775807 | [2] Verify iterator returns pair with empty string value | [3] Verify iterator returns pair with C...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns pair with value long max 9223372036854775807 ---
      {
        let cache: util.LRUCache<int, long> = new util.LRUCache<int, long>();
        let maxLong: long = 9223372036854775807;
        cache.put(19, maxLong);
        let it: IterableIterator<[int, long]> = cache.$_iterator();
        let pairs: Array<[int, long]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(19);
        expect(pairs[0][1]).assertEqual(maxLong);
      }

      // --- [2] Verify iterator returns pair with empty string value ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        let it: IterableIterator<[int, string]> = cache.$_iterator();
        let before: Array<[int, string]> = Array.from(it);
        expect(before.length).assertEqual(0);
        cache.put(20, '');
        let pairs: Array<[int, string]> = Array.from(cache.$_iterator());
        expect(pairs[0][0]).assertEqual(20);
        expect(pairs[0][1]).assertEqual('');
      }

      // --- [3] Verify iterator returns pair with Chinese string value ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(21, '你好');
        let it: IterableIterator<[int, string]> = cache.$_iterator();
        let pairs: Array<[int, string]> = Array.from(it);
        expect(pairs.length).assertEqual(1);
        expect(pairs[0][0]).assertEqual(21);
        expect(pairs[0][1]).assertEqual('你好');
      }

      // --- [4] Verify iterator returns pair with emoji surrogate-pair string value ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        let value: string = '😀';
        cache.put(22, value);
        let it: IterableIterator<[int, string]> = cache.$_iterator();
        let pairs: Array<[int, string]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(22);
        expect(pairs[0][1]).assertEqual(value);
      }

      // --- [5] Verify iterator returns pair with 10000-char string value ---
      {
        let longVal: string = '';
        for (let i: int = 0; i < 10000; i++) {
          longVal += 'b';
        }
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(23, longVal);
        let it: IterableIterator<[int, string]> = cache.$_iterator();
        let pairs: Array<[int, string]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(23);
        expect(pairs[0][1]).assertEqual(longVal);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0120
     * @tc.name testLruCacheIterator012
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns pair whose value is a Date object reference | [2] Verify iterator returns pair whose value is a class instance reference | [3] Verify iterator re...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns pair whose value is a Date object reference ---
      {
        let dv: Date = new Date(2020, 1, 1);
        let cache: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        cache.put(24, dv);
        let it: IterableIterator<[int, Date]> = cache.$_iterator();
        let pairs: Array<[int, Date]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(24);
        expect(pairs[0][1]).assertEqual(dv);
      }

      // --- [2] Verify iterator returns pair whose value is a class instance reference ---
      {
        let dotValue: Dot = new Dot(9);
        let cache: util.LRUCache<int, Dot> = new util.LRUCache<int, Dot>();
        cache.put(25, dotValue);
        let it: IterableIterator<[int, Dot]> = cache.$_iterator();
        let pairs: Array<[int, Dot]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(25);
        expect(pairs[0][1]).assertEqual(dotValue);
      }

      // --- [3] Verify iterator returns pair whose value is an object literal reference ---
      {
        let lb: Label = { name: 'node' };
        let cache: util.LRUCache<int, Label> = new util.LRUCache<int, Label>();
        cache.put(26, lb);
        let it: IterableIterator<[int, Label]> = cache.$_iterator();
        let pairs: Array<[int, Label]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(26);
        expect(pairs[0][1]).assertEqual(lb);
      }

      // --- [4] Verify iterator returns pair whose value is an int array reference ---
      {
        let av: int[] = [4, 5, 6];
        let cache: util.LRUCache<int, int[]> = new util.LRUCache<int, int[]>();
        cache.put(27, av);
        let it: IterableIterator<[int, int[]]> = cache.$_iterator();
        let pairs: Array<[int, int[]]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(27);
        expect(pairs[0][1]).assertEqual(av);
      }

      // --- [5] Verify iterator returns pair whose value is a Map reference ---
      {
        let mv: Map<string, string> = new Map<string, string>();
        mv.set('x', 'y');
        let cache: util.LRUCache<int, Map<string, string>> = new util.LRUCache<int, Map<string, string>>();
        cache.put(28, mv);
        let it: IterableIterator<[int, Map<string, string>]> = cache.$_iterator();
        let pairs: Array<[int, Map<string, string>]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(28);
        expect(pairs[0][1]).assertEqual(mv);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0130
     * @tc.name testLruCacheIterator013
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns pair with boolean value true | [2] Verify iterator returns pair with bigint value beyond long range | [3] Verify iterator returns pair with byte ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns pair with boolean value true ---
      {
        let cache: util.LRUCache<int, boolean> = new util.LRUCache<int, boolean>();
        cache.put(29, true);
        let it: IterableIterator<[int, boolean]> = cache.$_iterator();
        let pairs: Array<[int, boolean]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(29);
        expect(pairs[0][1]).assertTrue();
      }

      // --- [2] Verify iterator returns pair with bigint value beyond long range ---
      {
        let cache: util.LRUCache<int, bigint> = new util.LRUCache<int, bigint>();
        cache.put(31, 99999999999999999999999n);
        let it: IterableIterator<[int, bigint]> = cache.$_iterator();
        let pairs: Array<[int, bigint]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(31);
        expect(pairs[0][1]).assertEqual(99999999999999999999999n);
      }

      // --- [3] Verify iterator returns pair with byte max value 127 ---
      {
        let cache: util.LRUCache<int, byte> = new util.LRUCache<int, byte>();
        cache.put(32, 127 as byte);
        let it: IterableIterator<[int, byte]> = cache.$_iterator();
        let pairs: Array<[int, byte]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(32);
        expect(pairs[0][1]).assertEqual(127 as byte);
      }

      // --- [4] Verify iterator returns pair when K and V are both string ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('a', 'b');
        let it: IterableIterator<[string, string]> = cache.$_iterator();
        let pairs: Array<[string, string]> = Array.from(it);
        expect(pairs[0][0]).assertEqual('a');
        expect(pairs[0][1]).assertEqual('b');
      }

      // --- [5] Verify iterator returns pair for various K and V type combinations ---
      {
        // K=int V=string
        let cache1: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache1.put(100, 'value');
        let pairs1: Array<[int, string]> = Array.from(cache1.$_iterator());
        let first1: [int, string] = pairs1[0];
        expect(first1[0]).assertEqual(100);
        expect(first1[1]).assertEqual('value');

        // K=string V=int
        let cache2: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache2.put('key1', 200);
        let it2: IterableIterator<[string, int]> = cache2.$_iterator();
        let pairs2: Array<[string, int]> = Array.from(it2);
        expect(pairs2[0][0]).assertEqual('key1');
        expect(pairs2[0][1]).assertEqual(200);

        // K=bigint V=double
        let cache3: util.LRUCache<bigint, double> = new util.LRUCache<bigint, double>();
        let key3: bigint = 7n;
        cache3.put(key3, 3.14);
        let it3: IterableIterator<[bigint, double]> = cache3.$_iterator();
        let pairs3: Array<[bigint, double]> = Array.from(it3);
        expect(pairs3[0][0]).assertEqual(key3);
        expect(pairs3[0][1]).assertEqual(3.14);
        expect(pairs3.length).assertEqual(1);

        // K=double V=bigint
        let cache4: util.LRUCache<double, bigint> = new util.LRUCache<double, bigint>();
        cache4.put(2.5, 8n);
        let it4: IterableIterator<[double, bigint]> = cache4.$_iterator();
        let pairs4: Array<[double, bigint]> = Array.from(it4);
        expect(pairs4[0][0]).assertEqual(2.5);
        expect(pairs4[0][1]).assertEqual(8n);

        // K=boolean V=string
        let cache5: util.LRUCache<boolean, string> = new util.LRUCache<boolean, string>();
        cache5.put(true, 'yes');
        let it5: IterableIterator<[boolean, string]> = cache5.$_iterator();
        let pairs5: Array<[boolean, string]> = Array.from(it5);
        expect(pairs5[0][0]).assertTrue();
        expect(pairs5[0][1]).assertEqual('yes');

        // K=long V=boolean
        let cache6: util.LRUCache<long, boolean> = new util.LRUCache<long, boolean>();
        let bigKey6: long = 9000000000;
        cache6.put(bigKey6, false);
        let it6: IterableIterator<[long, boolean]> = cache6.$_iterator();
        let pairs6: Array<[long, boolean]> = Array.from(it6);
        expect(pairs6[0][0]).assertEqual(bigKey6);
        expect(pairs6[0][1]).assertFalse();

        // K=string V=long
        let cache7: util.LRUCache<string, long> = new util.LRUCache<string, long>();
        let bigVal7: long = 1234567890123;
        cache7.put('z', bigVal7);
        let it7: IterableIterator<[string, long]> = cache7.$_iterator();
        let pairs7: Array<[string, long]> = Array.from(it7);
        expect(pairs7[0][0]).assertEqual('z');
        expect(pairs7[0][1]).assertEqual(bigVal7);

        // K=Date V=RegExp
        let dk8: Date = new Date(2021, 3, 9);
        let rv8: RegExp = new RegExp('x+', 'i');
        let cache8: util.LRUCache<Date, RegExp> = new util.LRUCache<Date, RegExp>();
        cache8.put(dk8, rv8);
        let it8: IterableIterator<[Date, RegExp]> = cache8.$_iterator();
        let pairs8: Array<[Date, RegExp]> = Array.from(it8);
        expect(pairs8[0][0]).assertEqual(dk8);
        expect(pairs8[0][1]).assertEqual(rv8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0140
     * @tc.name testLruCacheIterator014
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns pair when both K and V are class instances | [2] Verify re-putting same int key overwrites value and iterator yields single latest pair | [3] Ver...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns pair when both K and V are class instances ---
      {
        let nk: Dot = new Dot(5);
        let nv: Dot = new Dot(6);
        let cache: util.LRUCache<Dot, Dot> = new util.LRUCache<Dot, Dot>();
        cache.put(nk, nv);
        let it: IterableIterator<[Dot, Dot]> = cache.$_iterator();
        let pairs: Array<[Dot, Dot]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(nk);
        expect(pairs[0][1]).assertEqual(nv);
      }

      // --- [2] Verify re-putting same int key overwrites value and iterator yields single latest pair ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(15, 80);
        cache.put(15, 90);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let pairs: Array<[int, int]> = Array.from(it);
        expect(pairs.length).assertEqual(1);
        expect(pairs[0][0]).assertEqual(15);
        expect(pairs[0][1]).assertEqual(90);
      }

      // --- [3] Verify Array.from collection of iterator is an Array ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(Array.isArray(arr)).assertTrue();
      }

      // --- [4] Verify collected key-value element is a two-length tuple, not an Array instance ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr[0][0]).assertEqual(1);
        expect(arr[0][1]).assertEqual(10);
        expect(arr[0].length).assertEqual(2);
        expect(Array.isArray(arr[0])).assertFalse();
      }

      // --- [5] Verify for..of over the iterator traverses all key-value pairs ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let count: int = 0;
        let total: int = 0;
        for (let p of cache.$_iterator()) {
          count = count + 1;
          total = total + p[0] + p[1];
        }
        expect(count).assertEqual(2);
        expect(total).assertEqual(33);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0150
     * @tc.name testLruCacheIterator015
     * @tc.desc Merged batch (5 tests): [1] Verify first next on non-empty cache returns a result carrying a value | [2] Verify consecutive next calls return pairs in insertion order | [3] Verify every element of ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify first next on non-empty cache returns a result carrying a value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(5, 55);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let firstResult: IteratorResult<[int, int]> = it.next();
        expect(firstResult.done).assertFalse();
        let secondResult: IteratorResult<[int, int]> = it.next();
        expect(secondResult.done).assertTrue();
      }

      // --- [2] Verify consecutive next calls return pairs in insertion order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 20);
        cache.put(3, 30);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let firstResult: IteratorResult<[int, int]> = it.next();
        expect(firstResult.done).assertFalse();
        let arr: Array<[int, int]> = Array.from(it);
        expect(arr.length).assertEqual(1);
        expect(arr[0][0]).assertEqual(3);
        expect(arr[0][1]).assertEqual(30);
      }

      // --- [3] Verify every element of multi-pair collection is a two-element tuple ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr[0][0]).assertEqual(1);
        expect(arr[0][1]).assertEqual(10);
        expect(arr[1][0]).assertEqual(2);
        expect(arr[1][1]).assertEqual(20);
      }

      // --- [4] Verify collection length is 0 for empty cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr.length).assertEqual(0);
      }

      // --- [5] Verify collection length equals remaining pairs after capacity eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0160
     * @tc.name testLruCacheIterator016
     * @tc.desc Merged batch (5 tests): [1] Verify collection length stays unchanged when existing key is overwritten | [2] Verify calling $_iterator does not change cache length | [3] Verify get returns original ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify collection length stays unchanged when existing key is overwritten ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(1, 99);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr.length).assertEqual(2);
      }

      // --- [2] Verify calling $_iterator does not change cache length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let before: int = cache.length;
        cache.$_iterator();
        let after: int = cache.length;
        expect(after).assertEqual(before);
      }

      // --- [3] Verify get returns original value after calling $_iterator ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(3, 30);
        cache.$_iterator();
        expect(cache.get(3)).assertEqual(30);
      }

      // --- [4] Verify contains still true after calling $_iterator ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(3, 30);
        cache.$_iterator();
        expect(cache.contains(3)).assertTrue();
      }

      // --- [5] Verify traversing a full cache causes no extra eviction and length unchanged ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        Array.from(cache.$_iterator());
        expect(cache.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0170
     * @tc.name testLruCacheIterator017
     * @tc.desc Merged batch (5 tests): [1] Verify traversal does not change getMatchCount | [2] Verify value read back by get matches collected value | [3] Verify cache can still accept new pairs after traversal ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify traversal does not change getMatchCount ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 42);
        let before: long = cache.getMatchCount();
        Array.from(cache.$_iterator());
        let after: long = cache.getMatchCount();
        expect(after).assertEqual(before);
      }

      // --- [2] Verify value read back by get matches collected value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(9, 90);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(cache.get(9)).assertEqual(arr[0][1]);
      }

      // --- [3] Verify cache can still accept new pairs after traversal ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        cache.put(2, 20);
        expect(arr[0][0]).assertEqual(1);
        expect(cache.get(2)).assertEqual(20);
      }

      // --- [4] Verify iterator reflects new order after get hit changes LRU order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.get(1);
        cache.put(3, 30);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr[0][0]).assertEqual(1);
        expect(arr[1][0]).assertEqual(3);
      }

      // --- [5] Verify two Date values with same time but different references are both iterated ---
      {
        let da: Date = new Date(2024, 5, 15);
        let db: Date = new Date(2024, 5, 15);
        let cache: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        cache.put(1, da);
        cache.put(2, db);
        let arr: Array<[int, Date]> = Array.from(cache.$_iterator());
        expect(arr[0][1]).assertEqual(da);
        expect(arr[1][1]).assertEqual(db);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0180
     * @tc.name testLruCacheIterator018
     * @tc.desc Merged batch (5 tests): [1] Verify two independent iterators from $_iterator collect identical pairs | [2] Verify a fresh iterator starts from beginning after another is fully consumed | [3] Verify...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two independent iterators from $_iterator collect identical pairs ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let firstIter: IterableIterator<[int, int]> = cache.$_iterator();
        let secondIter: IterableIterator<[int, int]> = cache.$_iterator();
        let firstPairs: Array<[int, int]> = Array.from(firstIter);
        let secondPairs: Array<[int, int]> = Array.from(secondIter);
        expect(firstPairs.length).assertEqual(2);
        expect(firstPairs.length).assertEqual(secondPairs.length);
        expect(firstPairs[0][0]).assertEqual(secondPairs[0][0]);
        expect(firstPairs[0][1]).assertEqual(secondPairs[0][1]);
        expect(firstPairs[1][0]).assertEqual(secondPairs[1][0]);
        expect(firstPairs[1][1]).assertEqual(secondPairs[1][1]);
      }

      // --- [2] Verify a fresh iterator starts from beginning after another is fully consumed ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let firstIter: IterableIterator<[int, int]> = cache.$_iterator();
        let first: Array<[int, int]> = Array.from(firstIter);
        expect(first.length).assertEqual(2);
        let secondIter: IterableIterator<[int, int]> = cache.$_iterator();
        let again: Array<[int, int]> = Array.from(secondIter);
        expect(again[0][0]).assertEqual(1);
        expect(again[0][1]).assertEqual(10);
      }

      // --- [3] Verify next after partial consumption returns the following key-value pair ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        it.next();
        let arr: Array<[int, int]> = Array.from(it);
        expect(arr.length).assertEqual(2);
        expect(arr[0][0]).assertEqual(2);
        expect(arr[0][1]).assertEqual(20);
      }

      // --- [4] Verify half-consumed iterator does not affect a fresh iterator collection count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        it.next();
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr.length).assertEqual(3);
        expect(arr[2][0]).assertEqual(3);
        expect(arr[2][1]).assertEqual(30);
      }

      // --- [5] Verify cache length grows after put following $_iterator call ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.$_iterator();
        cache.put(2, 20);
        expect(cache.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0190
     * @tc.name testLruCacheIterator019
     * @tc.desc Merged batch (5 tests): [1] Verify cache length returns to 0 after clear following $_iterator call | [2] Verify iterator returns pair with float value 0.5 | [3] Verify iterator returns pair with sh...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify cache length returns to 0 after clear following $_iterator call ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.$_iterator();
        cache.clear();
        expect(cache.length).assertEqual(0);
      }

      // --- [2] Verify iterator returns pair with float value 0.5 ---
      {
        let cache: util.LRUCache<int, float> = new util.LRUCache<int, float>();
        cache.put(40, 0.5 as float);
        let it: IterableIterator<[int, float]> = cache.$_iterator();
        let pairs: Array<[int, float]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(40);
        expect(pairs[0][1]).assertEqual(0.5 as float);
      }

      // --- [3] Verify iterator returns pair with short min value -32768 ---
      {
        let cache: util.LRUCache<int, short> = new util.LRUCache<int, short>();
        cache.put(41, -32768 as short);
        let it: IterableIterator<[int, short]> = cache.$_iterator();
        let pairs: Array<[int, short]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(41);
        expect(pairs[0][1]).assertEqual(-32768 as short);
      }

      // --- [4] Verify iterator returns pair with Number.MIN_VALUE value ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(42, Number.MIN_VALUE);
        let it: IterableIterator<[int, double]> = cache.$_iterator();
        let pairs: Array<[int, double]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(42);
        expect(pairs[0][1]).assertEqual(Number.MIN_VALUE);
      }

      // --- [5] Verify iterator returns pair with negative Number.MAX_VALUE value ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(43, -Number.MAX_VALUE);
        let it: IterableIterator<[int, double]> = cache.$_iterator();
        let pairs: Array<[int, double]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(43);
        expect(pairs[0][1]).assertEqual(-Number.MAX_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0200
     * @tc.name testLruCacheIterator020
     * @tc.desc Merged batch (5 tests): [1] Verify iterator returns pair with long min value | [2] Verify iterator returns pair whose value is a RegExp object reference | [3] Verify iterator returns pair whose val...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator returns pair with long min value ---
      {
        let cache: util.LRUCache<int, long> = new util.LRUCache<int, long>();
        let minLong: long = -9223372036854775807 - 1;
        cache.put(44, minLong);
        let it: IterableIterator<[int, long]> = cache.$_iterator();
        let pairs: Array<[int, long]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(44);
        expect(pairs[0][1]).assertEqual(minLong);
      }

      // --- [2] Verify iterator returns pair whose value is a RegExp object reference ---
      {
        let rv: RegExp = new RegExp('xy', 'g');
        let cache: util.LRUCache<int, RegExp> = new util.LRUCache<int, RegExp>();
        cache.put(45, rv);
        let it: IterableIterator<[int, RegExp]> = cache.$_iterator();
        let pairs: Array<[int, RegExp]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(45);
        expect(pairs[0][1]).assertEqual(rv);
      }

      // --- [3] Verify iterator returns pair whose value is a Set reference ---
      {
        let sv: Set<int> = new Set<int>();
        sv.add(7);
        let cache: util.LRUCache<int, Set<int>> = new util.LRUCache<int, Set<int>>();
        cache.put(46, sv);
        let it: IterableIterator<[int, Set<int>]> = cache.$_iterator();
        let pairs: Array<[int, Set<int>]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(46);
        expect(pairs[0][1]).assertEqual(sv);
      }

      // --- [4] Verify iterator returns pair whose value is a Uint8Array reference ---
      {
        let uv: Uint8Array = new Uint8Array([5, 6]);
        let cache: util.LRUCache<int, Uint8Array> = new util.LRUCache<int, Uint8Array>();
        cache.put(47, uv);
        let it: IterableIterator<[int, Uint8Array]> = cache.$_iterator();
        let pairs: Array<[int, Uint8Array]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(47);
        expect(pairs[0][1]).assertEqual(uv);
      }

      // --- [5] Verify iterator returns pair whose value is an Error object reference ---
      {
        let ev: Error = new Error('iter-err');
        let cache: util.LRUCache<int, Error> = new util.LRUCache<int, Error>();
        cache.put(48, ev);
        let it: IterableIterator<[int, Error]> = cache.$_iterator();
        let pairs: Array<[int, Error]> = Array.from(it);
        expect(pairs[0][0]).assertEqual(48);
        expect(pairs[0][1]).assertEqual(ev);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0210
     * @tc.name testLruCacheIterator021
     * @tc.desc Merged batch (5 tests): [1] Verify iterator excludes a removed key and keeps remaining pairs in order | [2] Verify iterator yields only surviving pairs after updateCapacity shrinks cache | [3] Veri...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator excludes a removed key and keeps remaining pairs in order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.remove(2);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let pairs: Array<[int, int]> = Array.from(it);
        expect(pairs.length).assertEqual(2);
        expect(pairs[0][0]).assertEqual(1);
        expect(pairs[0][1]).assertEqual(10);
        expect(pairs[1][0]).assertEqual(3);
        expect(pairs[1][1]).assertEqual(30);
      }

      // --- [2] Verify iterator yields only surviving pairs after updateCapacity shrinks cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.updateCapacity(2);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let pairs: Array<[int, int]> = Array.from(it);
        let hasKey1: boolean = false;
        let hasKey2: boolean = false;
        let hasKey3: boolean = false;
        for (let p of pairs) {
          if (p[0] == 1) {
            hasKey1 = true;
          } else if (p[0] == 2) {
            hasKey2 = true;
          } else if (p[0] == 3) {
            hasKey3 = true;
          }
        }
        expect(pairs.length).assertEqual(2);
        expect(hasKey1).assertFalse();
        expect(hasKey2).assertTrue();
        expect(hasKey3).assertTrue();
      }

      // --- [3] Verify iterator of capacity 1 cache yields only the newest pair after eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 10);
        cache.put(2, 20);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let pairs: Array<[int, int]> = Array.from(it);
        expect(pairs.length).assertEqual(1);
        expect(pairs[0][0]).assertEqual(2);
        expect(pairs[0][1]).assertEqual(20);
      }

      // --- [4] Verify re-putting an existing key advances its recency so the next put evicts the oldest other key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(1, 99);
        cache.put(3, 30);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let pairs: Array<[int, int]> = Array.from(it);
        let hasKey1: boolean = false;
        let hasKey2: boolean = false;
        let hasKey3: boolean = false;
        let foundValue: int = 0;
        for (let p of pairs) {
          if (p[0] == 1) {
            hasKey1 = true;
            foundValue = p[1];
          } else if (p[0] == 2) {
            hasKey2 = true;
          } else if (p[0] == 3) {
            hasKey3 = true;
          }
        }
        expect(pairs.length).assertEqual(2);
        expect(hasKey1).assertTrue();
        expect(foundValue).assertEqual(99);
        expect(hasKey2).assertFalse();
        expect(hasKey3).assertTrue();
      }

      // --- [5] Verify while loop over the raw iterator accumulates all three pairs and ends at done ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let visited: int = 0;
        let keySum: int = 0;
        let valueSum: int = 0;
        let result: IteratorResult<[int, int]> = it.next();
        while (!result.done) {
          let pair: [int, int] | undefined = result.value;
          if (pair !== undefined) {
            visited++;
            keySum = keySum + pair[0];
            valueSum = valueSum + pair[1];
          }
          result = it.next();
        }
        expect(visited).assertEqual(3);
        expect(keySum).assertEqual(6);
        expect(valueSum).assertEqual(60);
        expect(result.done).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0220
     * @tc.name testLruCacheIterator022
     * @tc.desc Merged batch (5 tests): [1] Verify iterator yields the pairs inserted by get-miss createDefault in creation order | [2] Verify iterator yields only the pair created after clear when createDefault r...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator yields the pairs inserted by get-miss createDefault in creation order ---
      {
        let cache: IterDefaultCache<int, int> = new IterDefaultCache<int, int>((key: int) => key * 100, 5);
        cache.get(1);
        cache.get(2);
        cache.get(3);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr.length).assertEqual(3);
        expect(arr[0][0]).assertEqual(1);
        expect(arr[0][1]).assertEqual(100);
        expect(arr[2][0]).assertEqual(3);
        expect(arr[2][1]).assertEqual(300);
      }

      // --- [2] Verify iterator yields only the pair created after clear when createDefault reinserts on a miss ---
      {
        let cache: IterDefaultCache<int, int> = new IterDefaultCache<int, int>((key: int) => key + 1, 5);
        cache.get(4);
        cache.get(5);
        cache.clear();
        cache.get(9);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr.length).assertEqual(1);
        expect(arr[0][0]).assertEqual(9);
        expect(arr[0][1]).assertEqual(10);
      }

      // --- [3] Verify iterator over enum member keys yields both pairs in insertion order ---
      {
        let cache: util.LRUCache<IterSlot, int> = new util.LRUCache<IterSlot, int>();
        cache.put(IterSlot.First, 11);
        cache.put(IterSlot.Second, 22);
        let arr: Array<[IterSlot, int]> = Array.from(cache.$_iterator());
        expect(arr.length).assertEqual(2);
        expect(arr[0][0]).assertEqual(IterSlot.First);
        expect(arr[0][1]).assertEqual(11);
        expect(arr[1][0]).assertEqual(IterSlot.Second);
        expect(arr[1][1]).assertEqual(22);
      }

      // --- [4] Verify an evicted key reinserted afterwards is iterated last with its new value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.put(1, 11);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr.length).assertEqual(2);
        expect(arr[0][0]).assertEqual(3);
        expect(arr[0][1]).assertEqual(30);
        expect(arr[1][0]).assertEqual(1);
        expect(arr[1][1]).assertEqual(11);
      }

      // --- [5] Verify iterator after a capacity grow then shrink yields the newest three pairs in order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.updateCapacity(4);
        cache.put(3, 30);
        cache.put(4, 40);
        cache.updateCapacity(3);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr.length).assertEqual(3);
        expect(arr[0][0]).assertEqual(2);
        expect(arr[0][1]).assertEqual(20);
        expect(arr[2][0]).assertEqual(4);
        expect(arr[2][1]).assertEqual(40);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_ITERATOR_0230
     * @tc.name testLruCacheIterator023
     * @tc.desc Merged batch (5 tests): [1] Verify a key removed then re-put with a new value is iterated at the tail | [2] Verify next calls after the iterator is exhausted keep done true and value undefined | [3...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a key removed then re-put with a new value is iterated at the tail ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.remove(1)).assertEqual(10);
        cache.put(1, 11);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr.length).assertEqual(3);
        expect(arr[0][0]).assertEqual(2);
        expect(arr[1][0]).assertEqual(3);
        expect(arr[2][0]).assertEqual(1);
        expect(arr[2][1]).assertEqual(11);
      }

      // --- [2] Verify next calls after the iterator is exhausted keep done true and value undefined ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let it: IterableIterator<[int, int]> = cache.$_iterator();
        let first: IteratorResult<[int, int]> = it.next();
        let second: IteratorResult<[int, int]> = it.next();
        let third: IteratorResult<[int, int]> = it.next();
        expect(first.done).assertFalse();
        expect(second.done).assertTrue();
        expect(third.done).assertTrue();
        expect(third.value).assertEqual(undefined);
      }

      // --- [3] Verify an iterator taken from one cache is unaffected by puts into a second cache ---
      {
        let first: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        first.put(1, 10);
        let firstIt: IterableIterator<[int, int]> = first.$_iterator();
        let second: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        second.put(7, 70);
        second.put(8, 80);
        let arr: Array<[int, int]> = Array.from(firstIt);
        expect(arr.length).assertEqual(1);
        expect(arr[0][0]).assertEqual(1);
        expect(arr[0][1]).assertEqual(10);
      }

      // --- [4] Verify iterator yields both the NUL character key and the emoji surrogate pair key in order ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('\u0000', 0);
        cache.put('😀', 1);
        let arr: Array<[string, int]> = Array.from(cache.$_iterator());
        expect(arr.length).assertEqual(2);
        expect(arr[0][0]).assertEqual('\u0000');
        expect(arr[1][0]).assertEqual('😀');
        expect(arr[1][0].length).assertEqual(2);
      }

      // --- [5] Verify removing the middle createDefault entry leaves the other two iterated in order ---
      {
        let cache: IterDefaultCache<int, int> = new IterDefaultCache<int, int>((key: int) => key + 50, 6);
        cache.get(1);
        cache.get(2);
        cache.get(3);
        expect(cache.remove(2)).assertEqual(52);
        let arr: Array<[int, int]> = Array.from(cache.$_iterator());
        expect(arr.length).assertEqual(2);
        expect(arr[0][0]).assertEqual(1);
        expect(arr[0][1]).assertEqual(51);
        expect(arr[1][0]).assertEqual(3);
        expect(arr[1][1]).assertEqual(53);
      }
    });

  });
}
