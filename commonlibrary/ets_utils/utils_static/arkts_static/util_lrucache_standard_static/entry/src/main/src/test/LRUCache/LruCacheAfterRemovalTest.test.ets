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

class RemovalProbe<K, V> extends util.LRUCache<K, V> {
  hook: (cache: util.LRUCache<K, V>, isEvict: boolean, key: K, value: V, newValue: V | undefined) => void =
    (cache: util.LRUCache<K, V>, isEvict: boolean, key: K, value: V, newValue: V | undefined) => {};
  make: (key: K) => V | undefined = (key: K) => undefined;

  constructor(hook: (cache: util.LRUCache<K, V>, isEvict: boolean, key: K, value: V, newValue: V | undefined) =>
    void, make?: (key: K) => V | undefined, capacity?: int) {
      super(capacity);
      this.hook = hook;
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

class ArityClearCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }

  callCount: int = 0;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.callCount++;
  }
}

class NewValDiffCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }

  oldRec: int[] = [];
  newRec: int[] = [];
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.oldRec.push(value);
    if (newValue !== undefined) {
      this.newRec.push(newValue);
    }
  }
}

class NewValEvictEmptyCache extends util.LRUCache<string, string> {
  constructor(capacity?: int) {
    super(capacity);
  }

  newValueEmpty: boolean = false;
  afterRemoval(isEvict: boolean, key: string, value: string, newValue: string | undefined): void {
    if (newValue === undefined) {
      this.newValueEmpty = true;
    }
  }
}

class AftBox {
  name: string = '';
  constructor(n: string) {
    this.name = n;
  }
}

class TypeFlagEvict extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }

  evictType: string = '';
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.evictType = typeof isEvict;
  }
}

class CoverFalseCache2 extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }

  coverFlag: boolean = true;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.coverFlag = isEvict;
  }
}

class NewTypeCls {
  label: string = '';
  constructor(l: string) {
    this.label = l;
  }
}

class NewNullCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }

  evictNew: int | undefined = 0;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.evictNew = newValue;
  }
}

class EvictKeyValue extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }

  goneKey: int = -1;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.goneKey = key;
  }
}

class EvictValueGone extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }

  goneVal: int = -1;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.goneVal = value;
  }
}

class NewValueRef {
  code: int = 0;
  constructor(c: int) {
    this.code = c;
  }
}

class LenEvictCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }

  lenAfter: int = -1;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.lenAfter = this.length;
  }
}

class NestedValEvict extends util.LRUCache<int, util.LRUCache<int, string>> {
  constructor(capacity?: int) {
    super(capacity);
  }

  evictedLen: int = -1;
  evictedInner: string = '';
  afterRemoval(isEvict: boolean, key: int, value: util.LRUCache<int, string>,
    newValue: util.LRUCache<int, string> | undefined): void {
    this.evictedLen = value.length;
    this.evictedInner = value.get(key)!;
  }
}

interface KeyObj {
  id: int;
}

class KeyUnmodCache extends util.LRUCache<KeyObj, int> {
  constructor(capacity?: int) {
    super(capacity);
  }

  seenId: int = -1;
  afterRemoval(isEvict: boolean, key: KeyObj, value: int, newValue: int | undefined): void {
    this.seenId = key.id;
  }
}

interface ValObj {
  label: string;
}

class ReuseCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }

  count: int = 0;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.count = this.count + 1;
  }
}

class NoCallOnNullRemove extends util.LRUCache<string | null, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  count: int = 0;
  afterRemoval(isEvict: boolean, key: string | null, value: int, newValue: int | undefined): void {
    this.count = this.count + 1;
  }
}

class NoCallOnUndefRemove extends util.LRUCache<int | undefined, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  count: int = 0;
  afterRemoval(isEvict: boolean, key: int | undefined, value: int, newValue: int): void {
    this.count = this.count + 1;
  }
}

class ThrowPropagatePut extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    throw new Error('cb-throw');
  }
}

class RecoverAfterThrow extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  count: int = 0;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.count = this.count + 1;
    if (this.count === 1) {
      throw new Error('cb-throw');
    }
  }
}

class SdRmCount extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  countInCall: int = -1;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.countInCall = Long.toInt(this.getRemovalCount());
  }
}

class SdCapStable extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  capInCall: int = -1;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.capInCall = this.getCapacity();
  }
}

class KeyRecCache<K, V> extends util.LRUCache<K, V> {
  constructor(capacity?: int) {
    super(capacity);
  }
  keyRec: K[] = [];
  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V | undefined): void {
    this.keyRec.push(key);
  }
}

class KeyValRecCache<K, V> extends util.LRUCache<K, V> {
  constructor(capacity?: int) {
    super(capacity);
  }
  keyRec: K[] = [];
  valueRec: V[] = [];
  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V | undefined): void {
    this.keyRec.push(key);
    this.valueRec.push(value);
  }
}

class EvictFlagRecCache<K, V> extends util.LRUCache<K, V> {
  constructor(capacity?: int) {
    super(capacity);
  }
  isEvictRec: boolean[] = [];
  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V | undefined): void {
    this.isEvictRec.push(isEvict);
  }
}

class ValRecCache<K, V> extends util.LRUCache<K, V> {
  constructor(capacity?: int) {
    super(capacity);
  }
  valueRec: V[] = [];
  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V | undefined): void {
    this.valueRec.push(value);
  }
}

class NewValRecCache<K, V> extends util.LRUCache<K, V> {
  constructor(capacity?: int) {
    super(capacity);
  }
  newValueRec: V[] = [];
  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V | undefined): void {
    if (newValue !== undefined) {
      this.newValueRec.push(newValue);
    }
  }
}

class KeyKindCache<K, V> extends util.LRUCache<K, V> {
  constructor(capacity?: int) {
    super(capacity);
  }
  keyKind: string = '';
  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V | undefined): void {
    this.keyKind = typeof key;
  }
}

class ValKindCache<K, V> extends util.LRUCache<K, V> {
  constructor(capacity?: int) {
    super(capacity);
  }
  valKind: string = '';
  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V | undefined): void {
    this.valKind = typeof value;
  }
}

class ValCapCache<K, V> extends util.LRUCache<K, V> {
  constructor(capacity?: int) {
    super(capacity);
  }
  cap: V | undefined = undefined;
  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V | undefined): void {
    this.cap = value;
  }
}

export default function lruCacheAfterRemovalTest(): void {
  describe('LruCacheAfterRemovalTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0010
     * @tc.name testLruCacheAfterRemoval001
     * @tc.desc Merged batch (5 tests): [1] Verify capacity one put eviction triggers afterRemoval with evicted key and value | [2] Verify remove triggers afterRemoval with removed key and value | [3] Verify clear...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify capacity one put eviction triggers afterRemoval with evicted key and value ---
      {
        let cache: KeyValRecCache<int, int> = new KeyValRecCache<int, int>(1);
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.keyRec[0]).assertEqual(1);
        expect(cache.valueRec[0]).assertEqual(10);
      }

      // --- [2] Verify remove triggers afterRemoval with removed key and value ---
      {
        let cache: KeyValRecCache<int, int> = new KeyValRecCache<int, int>();
        cache.put(1, 10);
        cache.remove(1);
        expect(cache.keyRec[0]).assertEqual(1);
        expect(cache.valueRec[0]).assertEqual(10);
      }

      // --- [3] Verify clear triggers afterRemoval once per cleared entry ---
      {
        let cache: ArityClearCache = new ArityClearCache(4);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.clear();
        expect(cache.callCount).assertEqual(2);
      }

      // --- [4] Verify updateCapacity shrink triggers afterRemoval once per removed entry ---
      {
        let cache: ArityClearCache = new ArityClearCache(4);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.put(4, 40);
        cache.updateCapacity(2);
        expect(cache.callCount).assertEqual(2);
      }

      // --- [5] Verify get-miss createDefault insertion does not invoke afterRemoval (no key recorded) ---
      {
        let keyRec: int[] = [];
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            keyRec.push(key);
          }, (key: int) => 99);
        let v: int | undefined = cache.get(9);
        expect(v).assertEqual(99);
        expect(keyRec.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0020
     * @tc.name testLruCacheAfterRemoval002
     * @tc.desc Merged batch (5 tests): [1] Verify put within capacity does not trigger afterRemoval | [2] Verify get hit does not trigger afterRemoval and returns stored value | [3] Verify put overwriting existin...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put within capacity does not trigger afterRemoval ---
      {
        let cache: ArityClearCache = new ArityClearCache();
        cache.put(1, 10);
        expect(cache.callCount).assertEqual(0);
      }

      // --- [2] Verify get hit does not trigger afterRemoval and returns stored value ---
      {
        let cache: ArityClearCache = new ArityClearCache();
        cache.put(1, 10);
        expect(cache.get(1)).assertEqual(10);
        expect(cache.callCount).assertEqual(0);
      }

      // --- [3] Verify put overwriting existing key triggers afterRemoval exactly once ---
      {
        let cache: ArityClearCache = new ArityClearCache();
        cache.put(1, 10);
        cache.put(1, 20);
        expect(cache.callCount).assertEqual(1);
        expect(cache.length).assertEqual(1);
      }

      // --- [4] Verify put eviction sets isEvict parameter to true ---
      {
        let cache: EvictFlagRecCache<int, int> = new EvictFlagRecCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        expect(cache.isEvictRec[0]).assertTrue();
      }

      // --- [5] Verify multiple put evictions all report isEvict true ---
      {
        let cache: EvictFlagRecCache<int, int> = new EvictFlagRecCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.put(4, 4);
        cache.put(5, 5);
        expect(cache.isEvictRec.length).assertEqual(3);
        expect(cache.isEvictRec[0]).assertTrue();
        expect(cache.isEvictRec[1]).assertTrue();
        expect(cache.isEvictRec[2]).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0030
     * @tc.name testLruCacheAfterRemoval003
     * @tc.desc Merged batch (5 tests): [1] Verify put overwrite without capacity pressure sets isEvict false | [2] Verify remove sets isEvict parameter to false | [3] Verify clear reports isEvict false for every ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put overwrite without capacity pressure sets isEvict false ---
      {
        let cache: EvictFlagRecCache<int, int> = new EvictFlagRecCache<int, int>();
        cache.put(1, 1);
        cache.put(1, 11);
        expect(cache.isEvictRec[0]).assertFalse();
      }

      // --- [2] Verify remove sets isEvict parameter to false ---
      {
        let cache: EvictFlagRecCache<string, string> = new EvictFlagRecCache<string, string>();
        cache.put('a', 'x');
        cache.remove('a');
        expect(cache.isEvictRec[0]).assertFalse();
      }

      // --- [3] Verify clear reports isEvict false for every removed entry ---
      {
        let cache: EvictFlagRecCache<string, string> = new EvictFlagRecCache<string, string>(3);
        cache.put('a', 'x');
        cache.put('b', 'y');
        cache.clear();
        expect(cache.isEvictRec.length).assertEqual(2);
        expect(cache.isEvictRec[0]).assertFalse();
        expect(cache.isEvictRec[1]).assertFalse();
      }

      // --- [4] Verify updateCapacity shrink reports isEvict true for each removed entry ---
      {
        let cache: EvictFlagRecCache<string, string> = new EvictFlagRecCache<string, string>(4);
        cache.put('a', 'x');
        cache.put('b', 'y');
        cache.put('c', 'z');
        cache.put('d', 'w');
        cache.updateCapacity(2);
        expect(cache.isEvictRec[0]).assertTrue();
        expect(cache.isEvictRec[1]).assertTrue();
      }

      // --- [5] Verify createDefault insertion does not invoke afterRemoval (isEvict list stays empty) ---
      {
        let isEvictRec: boolean[] = [];
        let cache: RemovalProbe<string, string> = new RemovalProbe<string, string>(
          (self: util.LRUCache<string, string>, isEvict: boolean, key: string, value: string, newValue: string | undefined) => {
            isEvictRec.push(isEvict);
          }, (key: string) => 'default');
        let v: string | undefined = cache.get('miss');
        expect(v).assertEqual('default');
        expect(isEvictRec.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0040
     * @tc.name testLruCacheAfterRemoval004
     * @tc.desc Merged batch (5 tests): [1] Verify mixed overwrite then evict yields isEvict sequence false then true | [2] Verify int key eviction passes earliest inserted key | [3] Verify zero int key is passed ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify mixed overwrite then evict yields isEvict sequence false then true ---
      {
        let cache: EvictFlagRecCache<int, int> = new EvictFlagRecCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(1, 11);
        cache.put(3, 30);
        expect(cache.isEvictRec.length).assertEqual(2);
        expect(cache.isEvictRec[0]).assertFalse();
        expect(cache.isEvictRec[1]).assertTrue();
      }

      // --- [2] Verify int key eviction passes earliest inserted key ---
      {
        let cache: KeyRecCache<int, int> = new KeyRecCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        expect(cache.keyRec[0]).assertEqual(1);
      }

      // --- [3] Verify zero int key is passed through eviction callback ---
      {
        let cache: KeyRecCache<int, int> = new KeyRecCache<int, int>(1);
        cache.put(0, 10);
        cache.put(1, 20);
        let recorded: int = cache.keyRec[0];
        expect(recorded).assertEqual(0);
      }

      // --- [4] Verify negative int key is passed through eviction callback ---
      {
        let cache: KeyRecCache<int, int> = new KeyRecCache<int, int>(2);
        cache.put(-1, 10);
        cache.put(1, 20);
        cache.updateCapacity(1);
        expect(cache.keyRec.length).assertEqual(1);
        expect(cache.keyRec[0]).assertEqual(-1);
      }

      // --- [5] Verify int max key is passed through eviction callback ---
      {
        let cache: KeyRecCache<int, int> = new KeyRecCache<int, int>(1);
        cache.put(2147483647, 10);
        cache.put(1, 20);
        expect(cache.keyRec.length).assertEqual(1);
        expect(cache.keyRec[0]).assertEqual(2147483647);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0050
     * @tc.name testLruCacheAfterRemoval005
     * @tc.desc Merged batch (5 tests): [1] Verify int min key is passed through eviction callback | [2] Verify get reorder makes key two the least recently used evicted key | [3] Verify empty string key is passed...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify int min key is passed through eviction callback ---
      {
        let cache: KeyRecCache<int, int> = new KeyRecCache<int, int>(1);
        cache.put(-2147483648, 10);
        cache.put(1, 20);
        let minKey: int = cache.keyRec[0];
        expect(cache.keyRec.length).assertEqual(1);
        expect(minKey).assertEqual(-2147483648);
      }

      // --- [2] Verify get reorder makes key two the least recently used evicted key ---
      {
        let cache: KeyRecCache<int, int> = new KeyRecCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.get(1);
        cache.put(3, 30);
        expect(cache.keyRec[0]).assertEqual(2);
      }

      // --- [3] Verify empty string key is passed through eviction callback ---
      {
        let cache: KeyRecCache<string, string> = new KeyRecCache<string, string>(1);
        cache.put('', 'x');
        cache.put('b', 'y');
        expect(cache.keyRec[0]).assertEqual('');
      }

      // --- [4] Verify single character string key is passed through eviction callback ---
      {
        let cache: KeyRecCache<string, string> = new KeyRecCache<string, string>(1);
        cache.put('a', 'x');
        cache.put('b', 'y');
        expect(cache.keyRec[0]).assertEqual('a');
      }

      // --- [5] Verify long string key is passed through eviction callback unchanged ---
      {
        let cache: KeyRecCache<string, string> = new KeyRecCache<string, string>(1);
        let longKey: string = 'k';
        for (let i: int = 0; i < 100; i++) {
          longKey = longKey + 'x';
        }
        cache.put(longKey, 'v');
        cache.put('b', 'y');
        expect(cache.keyRec[0]).assertEqual(longKey);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0060
     * @tc.name testLruCacheAfterRemoval006
     * @tc.desc Merged batch (5 tests): [1] Verify floating key three point one four is passed through eviction callback | [2] Verify boolean true key is passed through eviction callback | [3] Verify createDefault...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify floating key three point one four is passed through eviction callback ---
      {
        let cache: KeyRecCache<double, string> = new KeyRecCache<double, string>(1);
        cache.put(3.14, 'x');
        cache.put(2, 'y');
        expect(cache.keyRec[0]).assertEqual(3.14);
      }

      // --- [2] Verify boolean true key is passed through eviction callback ---
      {
        let cache: KeyRecCache<boolean, string> = new KeyRecCache<boolean, string>(1);
        cache.put(true, 'x');
        cache.put(false, 'y');
        expect(cache.keyRec[0]).assertTrue();
      }

      // --- [3] Verify createDefault receives the queried key while get miss fires no afterRemoval ---
      {
        let defaultKey: int = -1;
        let removalKey: int = -1;
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            removalKey = key;
          }, (key: int) => {
            defaultKey = key;
            return 77;
          });

        let v: int | undefined = cache.get(42);
        expect(v).assertEqual(77);
        expect(defaultKey).assertEqual(42);
        expect(removalKey).assertEqual(-1);
      }

      // --- [4] Verify int value eviction passes value of earliest inserted key ---
      {
        let cache: ValRecCache<int, int> = new ValRecCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        expect(cache.valueRec[0]).assertEqual(1);
      }

      // --- [5] Verify zero int value is passed through eviction callback ---
      {
        let cache: ValRecCache<int, int> = new ValRecCache<int, int>(1);
        cache.put(1, 0);
        cache.put(2, 20);
        let firstValue: int = cache.valueRec[0];
        expect(firstValue).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0070
     * @tc.name testLruCacheAfterRemoval007
     * @tc.desc Merged batch (5 tests): [1] Verify negative int value is passed through eviction callback | [2] Verify int max value is passed through eviction callback | [3] Verify empty string value is passed th...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify negative int value is passed through eviction callback ---
      {
        let cache: ValRecCache<int, int> = new ValRecCache<int, int>(1);
        cache.put(1, -1);
        cache.put(2, 20);
        expect(cache.valueRec[0]).assertEqual(-1);
      }

      // --- [2] Verify int max value is passed through eviction callback ---
      {
        let cache: ValRecCache<int, int> = new ValRecCache<int, int>(1);
        cache.put(1, 2147483647);
        cache.put(2, 20);
        let recordedValues: int[] = cache.valueRec;
        expect(recordedValues.length).assertEqual(1);
        expect(recordedValues[0]).assertEqual(2147483647);
      }

      // --- [3] Verify empty string value is passed through eviction callback ---
      {
        let cache: ValRecCache<int, string> = new ValRecCache<int, string>(1);
        cache.put(1, '');
        cache.put(2, 'y');
        expect(cache.valueRec[0]).assertEqual('');
      }

      // --- [4] Verify Chinese string value is passed through eviction callback ---
      {
        let cache: ValRecCache<int, string> = new ValRecCache<int, string>(1);
        cache.put(1, '你好');
        cache.put(2, 'y');
        expect(cache.valueRec[0]).assertEqual('你好');
      }

      // --- [5] Verify floating value two point five is passed through eviction callback ---
      {
        let cache: ValRecCache<int, double> = new ValRecCache<int, double>(1);
        cache.put(1, 2.5);
        cache.put(2, 3);
        let rec: double = cache.valueRec[0];
        expect(rec).assertEqual(2.5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0080
     * @tc.name testLruCacheAfterRemoval008
     * @tc.desc Merged batch (5 tests): [1] Verify boolean false value is passed through eviction callback | [2] Verify put overwrite passes new int value through newValue parameter | [3] Verify put overwrite pass...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify boolean false value is passed through eviction callback ---
      {
        let cache: ValRecCache<int, boolean> = new ValRecCache<int, boolean>(1);
        cache.put(1, false);
        cache.put(2, true);
        expect(cache.valueRec[0]).assertFalse();
      }

      // --- [2] Verify put overwrite passes new int value through newValue parameter ---
      {
        let cache: NewValRecCache<int, int> = new NewValRecCache<int, int>();
        cache.put(1, 10);
        cache.put(1, 20);
        expect(cache.newValueRec[0]).assertEqual(20);
      }

      // --- [3] Verify put overwrite passes new string value through newValue parameter ---
      {
        let cache: NewValRecCache<string, string> = new NewValRecCache<string, string>();
        cache.put('a', 'x');
        cache.put('a', 'y');
        expect(cache.newValueRec[0]).assertEqual('y');
      }

      // --- [4] Verify overwrite callback reads distinct old value and new value together ---
      {
        let cache: NewValDiffCache = new NewValDiffCache();
        cache.put(1, 10);
        cache.put(1, 30);
        expect(cache.oldRec[0]).assertEqual(10);
        expect(cache.newRec[0]).assertEqual(30);
      }

      // --- [5] Verify two overwrites report intermediate and last new values on second callback ---
      {
        let cache: NewValDiffCache = new NewValDiffCache();
        cache.put(1, 10);
        cache.put(1, 20);
        cache.put(1, 30);
        expect(cache.newRec.length).assertEqual(2);
        expect(cache.oldRec[1]).assertEqual(20);
        expect(cache.newRec[1]).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0090
     * @tc.name testLruCacheAfterRemoval009
     * @tc.desc Merged batch (5 tests): [1] Verify eviction passes empty newValue parameter | [2] Verify remove passes empty newValue parameter | [3] Verify clear passes empty newValue parameter | [4] Verify updat...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify eviction passes empty newValue parameter ---
      {
        let cache: NewValEvictEmptyCache = new NewValEvictEmptyCache(1);
        cache.put('a', 'x');
        cache.put('b', 'y');
        expect(cache.newValueEmpty).assertTrue();
      }

      // --- [2] Verify remove passes empty newValue parameter ---
      {
        let cache: NewValEvictEmptyCache = new NewValEvictEmptyCache();
        cache.put('a', 'x');
        cache.remove('a');
        expect(cache.newValueEmpty).assertTrue();
      }

      // --- [3] Verify clear passes empty newValue parameter ---
      {
        let cache: NewValEvictEmptyCache = new NewValEvictEmptyCache(3);
        cache.put('a', 'x');
        cache.put('b', 'y');
        cache.clear();
        expect(cache.newValueEmpty).assertTrue();
      }

      // --- [4] Verify updateCapacity shrink passes empty newValue parameter ---
      {
        let cache: NewValEvictEmptyCache = new NewValEvictEmptyCache(4);
        cache.put('a', 'x');
        cache.put('b', 'y');
        cache.put('c', 'z');
        cache.put('d', 'w');
        cache.updateCapacity(2);
        expect(cache.newValueEmpty).assertTrue();
      }

      // --- [5] Verify createDefault insertion fires no afterRemoval (newValue probe stays false) ---
      {
        let newValueEmpty: boolean = false;
        let cache: RemovalProbe<string, string> = new RemovalProbe<string, string>(
          (self: util.LRUCache<string, string>, isEvict: boolean, key: string, value: string, newValue: string | undefined) => {
            if (newValue === undefined) {
              newValueEmpty = true;
            }
          }, (key: string) => 'dflt');

        let v: string | undefined = cache.get('miss');
        expect(v).assertEqual('dflt');
        expect(newValueEmpty).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0100
     * @tc.name testLruCacheAfterRemoval010
     * @tc.desc Merged batch (5 tests): [1] Verify long typed key and value are passed through eviction callback | [2] Verify byte typed key is passed through eviction callback | [3] Verify short typed key is pass...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify long typed key and value are passed through eviction callback ---
      {
        let cache: KeyValRecCache<long, long> = new KeyValRecCache<long, long>(1);
        cache.put(Int.toLong(100), Int.toLong(200));
        cache.put(Int.toLong(300), Int.toLong(400));
        expect(cache.keyRec[0]).assertEqual(Int.toLong(100));
        expect(cache.valueRec[0]).assertEqual(Int.toLong(200));
      }

      // --- [2] Verify byte typed key is passed through eviction callback ---
      {
        let cache: KeyRecCache<byte, byte> = new KeyRecCache<byte, byte>(1);
        cache.put(10 as byte, 20 as byte);
        cache.put(30 as byte, 40 as byte);
        let firstKey: byte = cache.keyRec[0];
        expect(firstKey).assertEqual(10 as byte);
      }

      // --- [3] Verify short typed key is passed through eviction callback ---
      {
        let cache: KeyRecCache<short, short> = new KeyRecCache<short, short>(1);
        cache.put(10 as short, 20 as short);
        cache.put(30 as short, 40 as short);
        expect(cache.keyRec.length).assertEqual(1);
        expect(cache.keyRec[0]).assertEqual(10 as short);
      }

      // --- [4] Verify float typed key is passed through eviction callback ---
      {
        let cache: KeyRecCache<float, float> = new KeyRecCache<float, float>(1);
        cache.put(1.5 as float, 2.5 as float);
        cache.put(3.5 as float, 4.5 as float);
        expect(cache.keyRec[0]).assertEqual(1.5 as float);
      }

      // --- [5] Verify an evicting <bigint,bigint> cache passes the evicted bigint key to afterRemoval as string ---
      {
        let keyRec: string[] = [];
        let cache: RemovalProbe<bigint, bigint> = new RemovalProbe<bigint, bigint>(
          (self: util.LRUCache<bigint, bigint>, isEvict: boolean, key: bigint, value: bigint, newValue: bigint | undefined) => {
            keyRec.push(String(key));
          }, undefined, 1);
        cache.put(10n, 20n);
        cache.put(30n, 40n);
        expect(keyRec[0]).assertEqual('10');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0110
     * @tc.name testLruCacheAfterRemoval011
     * @tc.desc Merged batch (5 tests): [1] Verify Date key timestamp and value timestamp are passed through eviction callback | [2] Verify RegExp key source form is passed through eviction callback | [3] Verify E...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Date key timestamp and value timestamp are passed through eviction callback ---
      {
        let keyTimeRec: long[] = [];
        let valueTimeRec: long[] = [];
        let cache: RemovalProbe<Date, Date> = new RemovalProbe<Date, Date>(
          (self: util.LRUCache<Date, Date>, isEvict: boolean, key: Date, value: Date, newValue: Date | undefined) => {
            keyTimeRec.push(key.getTime());
            valueTimeRec.push(value.getTime());
          }, undefined, 1);

        cache.put(new Date(100), new Date(200));
        cache.put(new Date(300), new Date(400));
        expect(keyTimeRec[0]).assertEqual(100);
        expect(valueTimeRec[0]).assertEqual(200);
      }

      // --- [2] Verify RegExp key source form is passed through eviction callback ---
      {
        let keySrcRec: string[] = [];
        let cache: RemovalProbe<RegExp, RegExp> = new RemovalProbe<RegExp, RegExp>(
          (self: util.LRUCache<RegExp, RegExp>, isEvict: boolean, key: RegExp, value: RegExp, newValue: RegExp | undefined) => {
            keySrcRec.push(key.toString());
          }, undefined, 1);

        cache.put(new RegExp('a+', 'g'), new RegExp('v+', 'g'));
        cache.put(new RegExp('c+', 'g'), new RegExp('d+', 'g'));
        expect(keySrcRec[0]).assertEqual('/a+/g');
      }

      // --- [3] Verify Error key message is passed through eviction callback ---
      {
        let keyMsgRec: string[] = [];
        let cache: RemovalProbe<Error, Error> = new RemovalProbe<Error, Error>(
          (self: util.LRUCache<Error, Error>, isEvict: boolean, key: Error, value: Error, newValue: Error | undefined) => {
            keyMsgRec.push(key.message);
          }, undefined, 1);

        cache.put(new Error('keyA'), new Error('valA'));
        cache.put(new Error('keyB'), new Error('valB'));
        expect(keyMsgRec[0]).assertEqual('keyA');
      }

      // --- [4] Verify custom class instance key property is passed through eviction callback ---
      {
        let keyNameRec: string[] = [];
        let cache: RemovalProbe<AftBox, AftBox> = new RemovalProbe<AftBox, AftBox>(
          (self: util.LRUCache<AftBox, AftBox>, isEvict: boolean, key: AftBox, value: AftBox, newValue: AftBox | undefined) => {
            keyNameRec.push(key.name);
          }, undefined, 1);

        cache.put(new AftBox('k1'), new AftBox('v1'));
        cache.put(new AftBox('k2'), new AftBox('v2'));
        expect(keyNameRec[0]).assertEqual('k1');
      }

      // --- [5] Verify int array key first element is passed through eviction callback ---
      {
        let keyFirstRec: int[] = [];
        let cache: RemovalProbe<int[], int[]> = new RemovalProbe<int[], int[]>(
          (self: util.LRUCache<int[], int[]>, isEvict: boolean, key: int[], value: int[], newValue: int[] | undefined) => {
            keyFirstRec.push(key[0]);
          }, undefined, 1);

        cache.put([1, 2], [3, 4]);
        cache.put([5, 6], [7, 8]);
        expect(keyFirstRec[0]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0120
     * @tc.name testLruCacheAfterRemoval012
     * @tc.desc Merged batch (5 tests): [1] Verify Map key size is passed through eviction callback | [2] Verify Set key size is passed through eviction callback | [3] Verify Uint8Array key first byte is passed th...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Map key size is passed through eviction callback ---
      {
        let keySizeRec: int[] = [];
        let cache: RemovalProbe<Map<string, int>, Map<string, int>> = new RemovalProbe<Map<string, int>, Map<string, int>>(
          (self: util.LRUCache<Map<string, int>, Map<string, int>>, isEvict: boolean, key: Map<string, int>, value: Map<string, int>, newValue: Map<string, int> | undefined) => {
            keySizeRec.push(key.size);
          }, undefined, 1);

        let firstMap: Map<string, int> = new Map<string, int>();
        firstMap.set('a', 1);
        let secondMap: Map<string, int> = new Map<string, int>();
        secondMap.set('b', 2);
        let mEmpty: Map<string, int> = new Map<string, int>();
        cache.put(firstMap, mEmpty);
        cache.put(secondMap, mEmpty);
        expect(keySizeRec[0]).assertEqual(1);
      }

      // --- [2] Verify Set key size is passed through eviction callback ---
      {
        let keySizeRec: int[] = [];
        let cache: RemovalProbe<Set<int>, Set<int>> = new RemovalProbe<Set<int>, Set<int>>(
          (self: util.LRUCache<Set<int>, Set<int>>, isEvict: boolean, key: Set<int>, value: Set<int>, newValue: Set<int> | undefined) => {
            keySizeRec.push(key.size);
          }, undefined, 1);

        let firstSet: Set<int> = new Set<int>();
        firstSet.add(1);
        let secondSet: Set<int> = new Set<int>();
        secondSet.add(2);
        let sEmpty: Set<int> = new Set<int>();
        cache.put(firstSet, sEmpty);
        cache.put(secondSet, sEmpty);
        expect(keySizeRec[0]).assertEqual(1);
      }

      // --- [3] Verify Uint8Array key first byte is passed through eviction callback ---
      {
        let keyFirstRec: double[] = [];
        let cache: RemovalProbe<Uint8Array, Uint8Array> = new RemovalProbe<Uint8Array, Uint8Array>(
          (self: util.LRUCache<Uint8Array, Uint8Array>, isEvict: boolean, key: Uint8Array, value: Uint8Array, newValue: Uint8Array | undefined) => {
            keyFirstRec.push(key[0]);
          }, undefined, 1);
        cache.put(new Uint8Array([1]), new Uint8Array([2]));
        cache.put(new Uint8Array([3]), new Uint8Array([4]));
        expect(keyFirstRec[0]).assertEqual(1);
      }

      // --- [4] Verify Record key full capacity eviction triggers callback once ---
      {
        let callCount: int = 0;
        let cache: RemovalProbe<Record<string, int>, Record<string, int>> = new RemovalProbe<Record<string, int>, Record<string, int>>(
          (self: util.LRUCache<Record<string, int>, Record<string, int>>, isEvict: boolean, key: Record<string, int>, value: Record<string, int>, newValue: Record<string, int> | undefined) => {
            callCount++;
          }, undefined, 1);
        let firstRecord: Record<string, int> = { 'a': 1 };
        let secondRecord: Record<string, int> = { 'b': 2 };
        let thirdRecord: Record<string, int> = { 'c': 3 };
        cache.put(firstRecord, thirdRecord);
        cache.put(secondRecord, thirdRecord);
        expect(callCount).assertEqual(1);
      }

      // --- [5] Verify Promise key full capacity eviction triggers callback once ---
      {
        let callCount: int = 0;
        let cache: RemovalProbe<Promise<int>, Promise<int>> = new RemovalProbe<Promise<int>, Promise<int>>(
          (self: util.LRUCache<Promise<int>, Promise<int>>, isEvict: boolean, key: Promise<int>, value: Promise<int>, newValue: Promise<int> | undefined) => {
            callCount++;
          }, undefined, 1);
        let firstPromise: Promise<int> = Promise.resolve<int>(1);
        let secondPromise: Promise<int> = Promise.resolve<int>(2);
        let thirdPromise: Promise<int> = Promise.resolve<int>(3);
        cache.put(firstPromise, thirdPromise);
        cache.put(secondPromise, thirdPromise);
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0130
     * @tc.name testLruCacheAfterRemoval013
     * @tc.desc Merged batch (5 tests): [1] Verify same timestamp distinct Date keys evict rather than overwrite | [2] Verify same pattern distinct RegExp keys evict rather than overwrite | [3] Verify same propert...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify same timestamp distinct Date keys evict rather than overwrite ---
      {
        let firstDate: Date = new Date(1000);
        let secondDate: Date = new Date(1000);
        let cache: EvictFlagRecCache<Date, string> = new EvictFlagRecCache<Date, string>(1);
        cache.put(firstDate, 'a');
        cache.put(secondDate, 'b');
        expect(cache.isEvictRec[0]).assertTrue();
      }

      // --- [2] Verify same pattern distinct RegExp keys evict rather than overwrite ---
      {
        let firstRegex: RegExp = new RegExp('ab', 'g');
        let secondRegex: RegExp = new RegExp('ab', 'g');
        let cache: EvictFlagRecCache<RegExp, string> = new EvictFlagRecCache<RegExp, string>(1);
        cache.put(firstRegex, 'a');
        cache.put(secondRegex, 'b');
        expect(cache.isEvictRec[0]).assertTrue();
      }

      // --- [3] Verify same property distinct class instance keys evict rather than overwrite ---
      {
        let firstRef: NewValueRef = new NewValueRef(5);
        let secondRef: NewValueRef = new NewValueRef(5);
        let isEvictRec: boolean[] = [];
        let cache: RemovalProbe<NewValueRef, string> = new RemovalProbe<NewValueRef, string>(
          (self: util.LRUCache<NewValueRef, string>, isEvict: boolean, key: NewValueRef, value: string, newValue: string | undefined) => {
            isEvictRec.push(isEvict);
          }, undefined, 1);
        cache.put(firstRef, 'a');
        cache.put(secondRef, 'b');
        expect(isEvictRec[0]).assertTrue();
      }

      // --- [4] Verify double floating key and value are passed through eviction callback ---
      {
        let cache: KeyValRecCache<double, double> = new KeyValRecCache<double, double>(1);
        cache.put(1.5, 10.5);
        cache.put(2.5, 20.5);
        expect(cache.keyRec[0]).assertEqual(1.5);
        expect(cache.valueRec[0]).assertEqual(10.5);
      }

      // --- [5] Verify boolean key and value are passed through eviction callback ---
      {
        let cache: KeyValRecCache<boolean, boolean> = new KeyValRecCache<boolean, boolean>(1);
        cache.put(true, false);
        cache.put(false, true);
        expect(cache.keyRec[0]).assertTrue();
        expect(cache.valueRec[0]).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0140
     * @tc.name testLruCacheAfterRemoval014
     * @tc.desc Merged batch (5 tests): [1] Verify mixed string key int value are passed through eviction callback | [2] Verify isEvict captured type is boolean when capacity eviction triggers callback | [3] Verif...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify mixed string key int value are passed through eviction callback ---
      {
        let cache: KeyValRecCache<string, int> = new KeyValRecCache<string, int>(1);
        cache.put('one', 1);
        cache.put('two', 2);
        expect(cache.keyRec[0]).assertEqual('one');
        expect(cache.valueRec[0]).assertEqual(1);
      }

      // --- [2] Verify isEvict captured type is boolean when capacity eviction triggers callback ---
      {
        let cache: TypeFlagEvict = new TypeFlagEvict(1);
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.evictType).assertEqual('boolean');
      }

      // --- [3] Verify createDefault insertion fires no afterRemoval (isEvict typeof probe stays empty) ---
      {
        let dfltType: string = '';
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            dfltType = typeof isEvict;
          }, (key: int) => key + 100);
        let v: int | undefined = cache.get(5);
        expect(v).assertEqual(105);
        expect(dfltType).assertEqual('');
      }

      // --- [4] Verify isEvict is true when capacity eviction triggers callback ---
      {
        let evictFlag: boolean = false;
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            evictFlag = isEvict;
          }, undefined, 1);
        cache.put(1, 10);
        cache.put(2, 20);
        expect(evictFlag).assertTrue();
      }

      // --- [5] Verify isEvict is false when overwrite triggers callback ---
      {
        let cache: CoverFalseCache2 = new CoverFalseCache2();
        cache.put(1, 10);
        cache.put(1, 20);
        expect(cache.coverFlag).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0150
     * @tc.name testLruCacheAfterRemoval015
     * @tc.desc Merged batch (5 tests): [1] Verify isEvict is false when remove triggers callback | [2] Verify isEvict is false when clear triggers callback | [3] Verify updateCapacity shrink invokes afterRemoval ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isEvict is false when remove triggers callback ---
      {
        let cache: CoverFalseCache2 = new CoverFalseCache2();
        cache.put(1, 10);
        cache.remove(1);
        expect(cache.coverFlag).assertFalse();
      }

      // --- [2] Verify isEvict is false when clear triggers callback ---
      {
        let cache: CoverFalseCache2 = new CoverFalseCache2();
        cache.put(1, 10);
        cache.clear();
        expect(cache.coverFlag).assertFalse();
      }

      // --- [3] Verify updateCapacity shrink invokes afterRemoval with isEvict true ---
      {
        let cache: CoverFalseCache2 = new CoverFalseCache2(3);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.updateCapacity(1);
        expect(cache.coverFlag).assertTrue();
      }

      // --- [4] Verify get-miss createDefault fires no afterRemoval (isEvict flag stays sentinel true) ---
      {
        let dfltFlag: boolean = true;
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            dfltFlag = isEvict;
          }, (key: int) => 999);
        let v: int | undefined = cache.get(7);
        expect(v).assertEqual(999);
        expect(dfltFlag).assertTrue();
      }

      // --- [5] Verify captured key type is int when K is int ---
      {
        let cache: KeyKindCache<int, string> = new KeyKindCache<int, string>(1);
        cache.put(1, 'a');
        cache.put(2, 'b');
        expect(cache.keyKind).assertEqual('int');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0160
     * @tc.name testLruCacheAfterRemoval016
     * @tc.desc Merged batch (5 tests): [1] Verify captured key type is string when K is string | [2] Verify captured key is instance of referenced class when remove triggers callback | [3] Verify captured key is ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify captured key type is string when K is string ---
      {
        let cache: KeyKindCache<string, int> = new KeyKindCache<string, int>();
        cache.put('k1', 1);
        cache.put('k1', 2);
        expect(cache.keyKind).assertEqual('string');
      }

      // --- [2] Verify captured key is instance of referenced class when remove triggers callback ---
      {
        let k: AftBox = new AftBox('rk');
        let isRef: boolean = false;
        let cache: RemovalProbe<AftBox, int> = new RemovalProbe<AftBox, int>(
          (self: util.LRUCache<AftBox, int>, isEvict: boolean, key: AftBox, value: int, newValue: int | undefined) => {
            isRef = key instanceof AftBox;
          });
        cache.put(k, 1);
        cache.remove(k);
        expect(isRef).assertTrue();
      }

      // --- [3] Verify captured key is instance of Date when eviction triggers callback ---
      {
        let firstDate: Date = new Date(1600000000000);
        let secondDate: Date = new Date(1600000001000);
        let isDate: boolean = false;
        let cache: RemovalProbe<Date, int> = new RemovalProbe<Date, int>(
          (self: util.LRUCache<Date, int>, isEvict: boolean, key: Date, value: int, newValue: int | undefined) => {
            isDate = key instanceof Date;
          }, undefined, 1);
        cache.put(firstDate, 1);
        cache.put(secondDate, 2);
        expect(isDate).assertTrue();
      }

      // --- [4] Verify captured value type is int when V is int ---
      {
        let cache: ValKindCache<int, int> = new ValKindCache<int, int>(1);
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.valKind).assertEqual('int');
      }

      // --- [5] Verify captured value type is string when V is string ---
      {
        let cache: ValKindCache<int, string> = new ValKindCache<int, string>();
        cache.put(1, 'x');
        cache.remove(1);
        expect(cache.valKind).assertEqual('string');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0170
     * @tc.name testLruCacheAfterRemoval017
     * @tc.desc Merged batch (5 tests): [1] Verify captured value is instance of class type when eviction triggers callback | [2] Verify captured newValue type is int on overwrite | [3] Verify captured newValue is...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify captured value is instance of class type when eviction triggers callback ---
      {
        let v: AftBox = new AftBox('vc');
        let isCls: boolean = false;
        let cache: RemovalProbe<int, AftBox> = new RemovalProbe<int, AftBox>(
          (self: util.LRUCache<int, AftBox>, isEvict: boolean, key: int, value: AftBox, newValue: AftBox | undefined) => {
            isCls = value instanceof AftBox;
          }, undefined, 1);
        cache.put(1, v);
        cache.put(2, new AftBox('vd'));
        expect(isCls).assertTrue();
      }

      // --- [2] Verify captured newValue type is int on overwrite ---
      {
        let newKind: string = '';
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            newKind = typeof newValue;
          });
        cache.put(1, 10);
        cache.put(1, 20);
        expect(newKind).assertEqual('int');
      }

      // --- [3] Verify captured newValue is instance of class type on overwrite ---
      {
        let isNewCls: boolean = false;
        let cache: RemovalProbe<int, NewTypeCls> = new RemovalProbe<int, NewTypeCls>(
          (self: util.LRUCache<int, NewTypeCls>, isEvict: boolean, key: int, value: NewTypeCls, newValue: NewTypeCls | undefined) => {
            if (newValue !== undefined) {
              isNewCls = newValue instanceof NewTypeCls;
            }
          });
        cache.put(1, new NewTypeCls('old'));
        cache.put(1, new NewTypeCls('new'));
        expect(isNewCls).assertTrue();
      }

      // --- [4] Verify captured newValue is undefined when eviction triggers callback ---
      {
        let cache: NewNullCache = new NewNullCache(1);
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.evictNew).assertEqual(undefined);
      }

      // --- [5] Verify captured newValue is undefined when remove triggers callback ---
      {
        let cache: NewNullCache = new NewNullCache();
        cache.put(1, 10);
        cache.remove(1);
        expect(cache.evictNew).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0180
     * @tc.name testLruCacheAfterRemoval018
     * @tc.desc Merged batch (5 tests): [1] Verify captured key equals evicted key on capacity eviction | [2] Verify captured key equals overwritten key on overwrite | [3] Verify captured key equals removed key on...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify captured key equals evicted key on capacity eviction ---
      {
        let cache: EvictKeyValue = new EvictKeyValue(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.goneKey).assertEqual(1);
        expect(cache.length).assertEqual(2);
      }

      // --- [2] Verify captured key equals overwritten key on overwrite ---
      {
        let cache: EvictKeyValue = new EvictKeyValue();
        cache.put(1, 10);
        cache.put(1, 20);
        let recordedKey: int = cache.goneKey;
        expect(recordedKey).assertEqual(1);
      }

      // --- [3] Verify captured key equals removed key on remove ---
      {
        let cache: EvictKeyValue = new EvictKeyValue();
        cache.put(1, 10);
        cache.remove(1);
        let removedKey: int = cache.goneKey;
        expect(removedKey).assertEqual(1);
      }

      // --- [4] Verify createDefault insertion fires no afterRemoval (captured key stays sentinel) ---
      {
        let dfltKey: int = -1;
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            dfltKey = key;
          }, (key: int) => key * 2);
        let v: int | undefined = cache.get(4);
        expect(v).assertEqual(8);
        expect(dfltKey).assertEqual(-1);
      }

      // --- [5] Verify captured value equals evicted value on capacity eviction ---
      {
        let cache: EvictValueGone = new EvictValueGone(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let evicted: int = cache.goneVal;
        expect(evicted).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0190
     * @tc.name testLruCacheAfterRemoval019
     * @tc.desc Merged batch (5 tests): [1] Verify captured value equals original old value on overwrite | [2] Verify captured value equals current value on remove | [3] Verify createDefault insertion fires no aft...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify captured value equals original old value on overwrite ---
      {
        let cache: EvictValueGone = new EvictValueGone();
        cache.put(1, 10);
        cache.put(1, 20);
        expect(cache.goneVal).assertEqual(10);
        expect(cache.get(1)).assertEqual(20);
      }

      // --- [2] Verify captured value equals current value on remove ---
      {
        let cache: EvictValueGone = new EvictValueGone();
        cache.put(1, 10);
        cache.remove(1);
        expect(cache.goneVal).assertEqual(10);
        expect(cache.length).assertEqual(0);
      }

      // --- [3] Verify createDefault insertion fires no afterRemoval (captured value stays sentinel) ---
      {
        let dfltVal: int = -1;
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            dfltVal = value;
          }, (key: int) => key * 3);
        let v: int | undefined = cache.get(4);
        expect(v).assertEqual(12);
        expect(dfltVal).assertEqual(-1);
      }

      // --- [4] Verify captured newValue equals written new value on overwrite ---
      {
        let freshVal: int = -1;
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            if (newValue !== undefined) {
              freshVal = newValue;
            }
          });
        cache.put(1, 10);
        cache.put(1, 20);
        expect(freshVal).assertEqual(20);
      }

      // --- [5] Verify captured newValue equals written fresh string on overwrite ---
      {
        let freshStr: string = '';
        let cache: RemovalProbe<int, string> = new RemovalProbe<int, string>(
          (self: util.LRUCache<int, string>, isEvict: boolean, key: int, value: string, newValue: string | undefined) => {
            if (newValue !== undefined) {
              freshStr = newValue;
            }
          });
        cache.put(1, 'old');
        cache.put(1, 'fresh');
        expect(freshStr).assertEqual('fresh');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0200
     * @tc.name testLruCacheAfterRemoval020
     * @tc.desc Merged batch (5 tests): [1] Verify captured newValue attribute equals new instance attribute on overwrite | [2] Verify captured newValue equals written double value on overwrite | [3] Verify evicti...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify captured newValue attribute equals new instance attribute on overwrite ---
      {
        let seenCode: int = 0;
        let cache: RemovalProbe<int, NewValueRef> = new RemovalProbe<int, NewValueRef>(
          (self: util.LRUCache<int, NewValueRef>, isEvict: boolean, key: int, value: NewValueRef, newValue: NewValueRef | undefined) => {
            if (newValue !== undefined) {
              seenCode = newValue.code;
            }
          });
        cache.put(1, new NewValueRef(1));
        cache.put(1, new NewValueRef(7));
        expect(seenCode).assertEqual(7);
      }

      // --- [2] Verify captured newValue equals written double value on overwrite ---
      {
        let freshDbl: double = 0.0;
        let cache: RemovalProbe<int, double> = new RemovalProbe<int, double>(
          (self: util.LRUCache<int, double>, isEvict: boolean, key: int, value: double, newValue: double | undefined) => {
            if (newValue !== undefined) {
              freshDbl = newValue;
            }
          });
        cache.put(1, 1.5);
        cache.put(1, 2.25);
        expect(freshDbl).assertEqual(2.25);
      }

      // --- [3] Verify eviction callback observes transient length 3 before removal on capacity-2 cache ---
      {
        let cache: LenEvictCache = new LenEvictCache(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.lenAfter).assertEqual(3);
        expect(cache.length).assertEqual(2);
      }

      // --- [4] Verify clear callback observes length 2 (entries not yet removed) ---
      {
        let cache: LenEvictCache = new LenEvictCache();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.clear();
        expect(cache.lenAfter).assertEqual(2);
      }

      // --- [5] Verify length decreases to one when remove triggers callback ---
      {
        let cache: LenEvictCache = new LenEvictCache();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.remove(1);
        expect(cache.lenAfter).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0210
     * @tc.name testLruCacheAfterRemoval021
     * @tc.desc Merged batch (5 tests): [1] Verify shrink callback observes pre-shrink length 3 (capacity 3 to 2) | [2] Verify overwrite callback observes length 1 (old entry dropped before re-insert) | [3] Verify...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify shrink callback observes pre-shrink length 3 (capacity 3 to 2) ---
      {
        let cache: LenEvictCache = new LenEvictCache(3);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.updateCapacity(2);
        expect(cache.lenAfter).assertEqual(3);
      }

      // --- [2] Verify overwrite callback observes length 1 (old entry dropped before re-insert) ---
      {
        let cache: LenEvictCache = new LenEvictCache();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(1, 30);
        expect(cache.lenAfter).assertEqual(1);
      }

      // --- [3] Verify eviction callback observes transient length 3 during continuous puts on capacity-2 cache ---
      {
        let cache: LenEvictCache = new LenEvictCache(2);
        for (let i: int = 0; i < 6; i++) {
          cache.put(i, i);
        }
        expect(cache.lenAfter).assertEqual(3);
      }

      // --- [4] Verify referenced key object attribute is not modified after eviction ---
      {
        let firstKey: KeyObj = { id: 1 };
        let secondKey: KeyObj = { id: 2 };
        let cache: KeyUnmodCache = new KeyUnmodCache(1);
        cache.put(firstKey, 10);
        cache.put(secondKey, 20);
        expect(firstKey.id).assertEqual(1);
      }

      // --- [5] Verify referenced value object attribute is not modified after eviction ---
      {
        let firstValue: ValObj = { label: 'alpha' };
        let secondValue: ValObj = { label: 'beta' };
        let cache: RemovalProbe<int, ValObj> = new RemovalProbe<int, ValObj>(
          (self: util.LRUCache<int, ValObj>, isEvict: boolean, key: int, value: ValObj, newValue: ValObj | undefined) => {
          }, undefined, 1);
        cache.put(1, firstValue);
        cache.put(2, secondValue);
        expect(firstValue.label).assertEqual('alpha');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0220
     * @tc.name testLruCacheAfterRemoval022
     * @tc.desc Merged batch (5 tests): [1] Verify cache accepts new puts after multiple callback triggers | [2] Verify callback invoked twice after two capacity evictions | [3] Verify nested put inside callback i...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify cache accepts new puts after multiple callback triggers ---
      {
        let cache: ReuseCache = new ReuseCache(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.put(4, 40);
        cache.put(5, 50);
        expect(cache.get(5)).assertEqual(50);
      }

      // --- [2] Verify callback invoked twice after two capacity evictions ---
      {
        let cache: ReuseCache = new ReuseCache(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.put(4, 40);
        expect(cache.count).assertEqual(2);
      }

      // --- [3] Verify nested put inside callback inserts readable key ---
      {
        let reentered: boolean = false;
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            if (!reentered) {
              reentered = true;
              self.put(9, 99);
            }
          }, undefined, 2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.get(9)).assertEqual(99);
      }

      // --- [4] Verify nested remove inside callback removes target key ---
      {
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            self.remove(2);
          }, undefined, 2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.get(2)).assertEqual(undefined);
      }

      // --- [5] Verify nested get inside callback returns surviving value ---
      {
        let innerGot: int = -1;
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            innerGot = self.get(2)!;
          }, undefined, 2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(innerGot).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0230
     * @tc.name testLruCacheAfterRemoval023
     * @tc.desc Merged batch (5 tests): [1] Verify contains inside eviction callback still returns true for the key being evicted | [2] Verify captured key equals evicted key for int string key value combo | [3] V...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains inside eviction callback still returns true for the key being evicted ---
      {
        let stillThere: boolean = true;
        let cache: RemovalProbe<int, int> = new RemovalProbe<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            stillThere = self.contains(1);
          }, undefined, 2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(stillThere).assertTrue();
      }

      // --- [2] Verify captured key equals evicted key for int string key value combo ---
      {
        let comboKey: int = -1;
        let cache: RemovalProbe<int, string> = new RemovalProbe<int, string>(
          (self: util.LRUCache<int, string>, isEvict: boolean, key: int, value: string, newValue: string | undefined) => {
            comboKey = key;
          }, undefined, 1);
        cache.put(1, 'aa');
        cache.put(2, 'bb');
        expect(comboKey).assertEqual(1);
      }

      // --- [3] Verify captured value equals evicted value for int string key value combo ---
      {
        let comboVal: string = '';
        let cache: RemovalProbe<int, string> = new RemovalProbe<int, string>(
          (self: util.LRUCache<int, string>, isEvict: boolean, key: int, value: string, newValue: string | undefined) => {
            comboVal = value;
          }, undefined, 1);
        cache.put(1, 'aa');
        cache.put(2, 'bb');
        expect(comboVal).assertEqual('aa');
      }

      // --- [4] Verify captured newValue equals written value for string int key value combo ---
      {
        let fresh: int = -1;
        let cache: RemovalProbe<string, int> = new RemovalProbe<string, int>(
          (self: util.LRUCache<string, int>, isEvict: boolean, key: string, value: int, newValue: int | undefined) => {
            if (newValue !== undefined) {
              fresh = newValue;
            }
          });
        cache.put('k1', 1);
        cache.put('k1', 2);
        expect(fresh).assertEqual(2);
      }

      // --- [5] Verify captured value equals double old value for long double key value combo ---
      {
        let dblVal: double = 0.0;
        let cache: RemovalProbe<long, double> = new RemovalProbe<long, double>(
          (self: util.LRUCache<long, double>, isEvict: boolean, key: long, value: double, newValue: double | undefined) => {
            dblVal = value;
          }, undefined, 1);
        cache.put(Int.toLong(1), 1.5);
        cache.put(Int.toLong(2), 2.5);
        expect(dblVal).assertEqual(1.5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_AFTER_REMOVAL_0240
     * @tc.name testLruCacheAfterRemoval024
     * @tc.desc Merged batch (5 tests): [1] Verify captured newValue is true for boolean boolean key value combo | [2] Verify captured key is instance of class for class class key value combo | [3] Verify Date str...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheAfterRemoval024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify captured newValue is true for boolean boolean key value combo ---
      {
        let newBool: boolean = false;
        let cache: RemovalProbe<boolean, boolean> = new RemovalProbe<boolean, boolean>(
          (self: util.LRUCache<boolean, boolean>, isEvict: boolean, key: boolean, value: boolean, newValue: boolean | undefined) => {
            if (newValue !== undefined) {
              newBool = newValue;
            }
          });
        cache.put(true, false);
        cache.put(true, true);
        expect(newBool).assertTrue();
      }

      // --- [2] Verify captured key is instance of class for class class key value combo ---
      {
        let k: AftBox = new AftBox('ka');
        let isCombo: boolean = false;
        let cache: RemovalProbe<AftBox, AftBox> = new RemovalProbe<AftBox, AftBox>(
          (self: util.LRUCache<AftBox, AftBox>, isEvict: boolean, key: AftBox, value: AftBox, newValue: AftBox | undefined) => {
            isCombo = key instanceof AftBox;
          });
        cache.put(k, new AftBox('va'));
        cache.remove(k);
        expect(isCombo).assertTrue();
      }

      // --- [3] Verify Date string key value combo eviction captures the Date key and the string value ---
      {
        let firstDate: Date = new Date(1500000000000);
        let secondDate: Date = new Date(1500000001000);
        let keyIsDate: boolean = false;
        let evictedValue: string = '';
        let cache: RemovalProbe<Date, string> = new RemovalProbe<Date, string>(
          (self: util.LRUCache<Date, string>, isEvict: boolean, key: Date, value: string, newValue: string | undefined) => {
            keyIsDate = key instanceof Date;
            evictedValue = value;
          }, undefined, 1);
        cache.put(firstDate, 'a');
        cache.put(secondDate, 'b');
        expect(keyIsDate).assertTrue();
        expect(evictedValue).assertEqual('a');
      }

      // --- [4] Verify captured newValue is instance of Date for string Date key value combo ---
      {
        let newIsDate: boolean = false;
        let cache: RemovalProbe<string, Date> = new RemovalProbe<string, Date>(
          (self: util.LRUCache<string, Date>, isEvict: boolean, key: string, value: Date, newValue: Date | undefined) => {
            if (newValue !== undefined) {
              newIsDate = newValue instanceof Date;
            }
          });
        cache.put('k', new Date(1000));
        cache.put('k', new Date(2000));
        expect(newIsDate).assertTrue();
      }

      // --- [5] Verify captured key attribute equals 11 for object literal key value combo ---
      {
        let firstKey: KeyObj = { id: 11 };
        let secondKey: KeyObj = { id: 22 };
        let gotId: int = -1;
        let cache: RemovalProbe<KeyObj, KeyObj> = new RemovalProbe<KeyObj, KeyObj>(
          (self: util.LRUCache<KeyObj, KeyObj>, isEvict: boolean, key: KeyObj, value: KeyObj, newValue: KeyObj | undefined) => {
            gotId = key.id;
          }, undefined, 1);
        cache.put(firstKey, firstKey);
        cache.put(secondKey, secondKey);
        expect(gotId).assertEqual(11);
      }
    });

  });
}
