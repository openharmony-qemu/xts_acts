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

class ReturnKeyChild<V> extends util.LRUCache<V, V> {
  createDefault(key: V): V | undefined {
    return key;
  }
}

class CountingGetCCSub<K, V> extends util.LRUCache<K, V> {
  callCount: long = 0;
  getCreateCount(): long {
    this.callCount = this.callCount + 1;
    return super.getCreateCount();
  }
}

class ConstValChild extends util.LRUCache<int, int> {
  createDefault(key: int): int | undefined {
    return 42;
  }
}

class UndefValChild extends util.LRUCache<int, int> {
  createDefault(key: int): int | undefined {
    return undefined;
  }
}

class DoubleKeyChild extends util.LRUCache<int, int> {
  createDefault(key: int): int | undefined {
    return key * 2;
  }
}

class CapFixedTwoChild extends util.LRUCache<int, int> {
  constructor() {
    super(2);
  }
  createDefault(key: int): int | undefined {
    return key;
  }
}

class StrConstChild extends util.LRUCache<string, int> {
  createDefault(key: string): int | undefined {
    return 100;
  }
}

class RefTagValue {
  tag: string = 'rv';
}

interface LabeledKey {
  id: int;
  label: string;
}

class StrLenKeyChild extends util.LRUCache<string, int> {
  createDefault(key: string): int {
    return key.length;
  }
}

class CapParamChildOne extends util.LRUCache<int, int> {
  constructor(capacity: int) {
    super(capacity);
  }
  createDefault(key: int): int {
    return key;
  }
}

class HolderCls {
  v: int = 1;
}

enum CreateRank {
  Low = 0,
  High = 1
}

export default function lruCacheGetCreateCountTest(): void {
  describe('LruCacheGetCreateCountTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0010
     * @tc.name testLruCacheGetCreateCount001
     * @tc.desc Merged batch (5 tests): [1] Verify getCreateCount without argument on fresh default cache returns 0 | [2] Verify getCreateCount returns 0 after put then remove | [3] Verify getCreateCount returns 0...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCreateCount without argument on fresh default cache returns 0 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(lru.getCreateCount()).assertEqual(0);
      }

      // --- [2] Verify getCreateCount returns 0 after put then remove ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.remove(1);
        expect(lru.getCreateCount()).assertEqual(0);
      }

      // --- [3] Verify getCreateCount returns 0 after updateCapacity resizing ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(128);
        expect(lru.getCreateCount()).assertEqual(0);
      }

      // --- [4] Verify two consecutive getCreateCount calls return identical results ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let first: long = lru.getCreateCount();
        let second: long = lru.getCreateCount();
        expect(first).assertEqual(second);
      }

      // --- [5] Verify calling getCreateCount itself does not raise the creation count ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.getCreateCount();
        lru.get(3);
        expect(lru.getCreateCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0020
     * @tc.name testLruCacheGetCreateCount002
     * @tc.desc Merged batch (5 tests): [1] Verify isEmpty still holds true after calling getCreateCount | [2] Verify cache is still writable and readable after calling getCreateCount | [3] Verify getCreateCount r...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isEmpty still holds true after calling getCreateCount ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.getCreateCount();
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [2] Verify cache is still writable and readable after calling getCreateCount ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.getCreateCount();
        lru.put(3, 30);
        expect(lru.get(3)).assertEqual(30);
      }

      // --- [3] Verify getCreateCount returns 0 after eviction happens on one-capacity cache ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        lru.put(1, 10);
        lru.put(2, 20);
        expect(lru.getCreateCount()).assertEqual(0);
      }

      // --- [4] Verify length stays 0 after calling getCreateCount ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.getCreateCount();
        expect(lru.length).assertEqual(0);
      }

      // --- [5] Verify getCreateCount return value plus 0 still equals 0 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(lru.getCreateCount() + 0).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0030
     * @tc.name testLruCacheGetCreateCount003
     * @tc.desc Merged batch (5 tests): [1] Verify getCreateCount returns 0 after bulk put without any lookup | [2] Verify createDefault misses on a capacity 1 cache increment the count and evict the earlier creat...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCreateCount returns 0 after bulk put without any lookup ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 64; i++) {
          lru.put(i, i * 10);
        }
        expect(lru.getCreateCount()).assertEqual(0);
      }

      // --- [2] Verify createDefault misses on a capacity 1 cache increment the count and evict the earlier created entry ---
      {
        let lru: CapParamChildOne = new CapParamChildOne(1);
        expect(lru.getCreateCount()).assertEqual(0);
        let first: int | undefined = lru.get(1);
        expect(first).assertEqual(1);
        let second: int | undefined = lru.get(2);
        expect(second).assertEqual(2);
        expect(lru.getCreateCount()).assertEqual(2);
        expect(lru.contains(1)).assertFalse();
        expect(lru.length).assertEqual(1);
      }

      // --- [3] Verify overriding subclass forwards to super and increments its own call counter ---
      {
        let lru: CountingGetCCSub<int, int> = new CountingGetCCSub<int, int>();
        lru.getCreateCount();
        expect(lru.callCount).assertEqual(1);
      }

      // --- [4] Verify creation count reports one after one miss and three after three misses ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.get(1);
        let cntAfterOneMiss: long = lru.getCreateCount();
        lru.get(2);
        lru.get(3);
        let cntAfterThreeMisses: long = lru.getCreateCount();
        expect(cntAfterOneMiss).assertEqual(1);
        expect(cntAfterThreeMisses).assertEqual(3);
      }

      // --- [5] Verify repeated get on same key only counts once since second access is a hit ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.get(3);
        lru.get(3);
        expect(lru.getCreateCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0040
     * @tc.name testLruCacheGetCreateCount004
     * @tc.desc Merged batch (5 tests): [1] Verify hit followed by miss on new key yields creation count 1 | [2] Verify miss on zero key increments creation count to 1 | [3] Verify miss on int max key increments c...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify hit followed by miss on new key yields creation count 1 ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.put(1, 100);
        lru.get(1);
        lru.get(2);
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [2] Verify miss on zero key increments creation count to 1 ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        let key: int = 0;
        lru.get(key);
        let created: long = lru.getCreateCount();
        expect(created).assertEqual(1);
      }

      // --- [3] Verify miss on int max key increments creation count to 1 ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        expect(lru.getCreateCount()).assertEqual(0);
        lru.get(2147483647);
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [4] Verify miss on large key increments creation count to 1 ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.get(100000);
        let created: long = lru.getCreateCount();
        expect(created).assertEqual(1);
        expect(lru.length).assertEqual(1);
      }

      // --- [5] Verify miss does not count when createDefault explicitly returns undefined ---
      {
        let lru: UndefValChild = new UndefValChild();
        lru.get(3);
        expect(lru.getCreateCount()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0050
     * @tc.name testLruCacheGetCreateCount005
     * @tc.desc Merged batch (5 tests): [1] Verify miss counts once when createDefault returns twice the key | [2] Verify get hit after put returns the stored value without raising creation count | [3] Verify repe...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify miss counts once when createDefault returns twice the key ---
      {
        let lru: DoubleKeyChild = new DoubleKeyChild();
        lru.get(4);
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [2] Verify get hit after put returns the stored value without raising creation count ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        let hit: int | undefined = lru.get(1);
        expect(hit).assertEqual(100);
        expect(lru.getCreateCount()).assertEqual(0);
      }

      // --- [3] Verify repeated hits on mutlple same keys do not raise creation count ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.get(1);
        lru.get(1);
        lru.get(1);
        expect(lru.getCreateCount()).assertEqual(0);
      }

      // --- [4] Verify consecutive eviction callbacks during get miss creation see the creation count rise by one ---
      {
        let evictCalls: int = 0;
        let atFirstEvict: long = 0;
        let atSecondEvict: long = 0;
        let lru: ProbeCache<int, int> = new ProbeCache<int, int>(
          (cache: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            if (isEvict) {
              if (evictCalls === 0) {
                atFirstEvict = cache.getCreateCount();
              } else {
                atSecondEvict = cache.getCreateCount();
              }
              evictCalls = evictCalls + 1;
            }
          },
          (key: int) => key * 10,
          2);
        expect(lru.get(1)).assertEqual(10);
        expect(lru.get(2)).assertEqual(20);
        expect(lru.get(3)).assertEqual(30);
        expect(lru.get(4)).assertEqual(40);
        expect(evictCalls).assertEqual(2);
        expect(atSecondEvict - atFirstEvict).assertEqual(1);
        expect(lru.getCreateCount()).assertEqual(4);
      }

      // --- [5] Verify hitting a put key after creation does not add to the count ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.get(3);
        lru.put(5, 50);
        lru.get(5);
        expect(lru.getCreateCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0060
     * @tc.name testLruCacheGetCreateCount006
     * @tc.desc Merged batch (5 tests): [1] Verify hit after overwriting an existing key leaves creation count 0 | [2] Verify count 2 return value plus 1 equals 3 | [3] Verify count 2 return value multiplied by 3 ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify hit after overwriting an existing key leaves creation count 0 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.put(1, 99);
        lru.get(1);
        expect(lru.getCreateCount()).assertEqual(0);
      }

      // --- [2] Verify count 2 return value plus 1 equals 3 ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.get(3);
        lru.get(5);
        expect(lru.getCreateCount() + 1).assertEqual(3);
      }

      // --- [3] Verify count 2 return value multiplied by 3 equals 6 ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.get(3);
        lru.get(5);
        expect(lru.getCreateCount() * 3).assertEqual(6);
      }

      // --- [4] Verify count 2 return value minus 2 equals 0 ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.get(3);
        lru.get(5);
        expect(lru.getCreateCount() - 2).assertEqual(0);
      }

      // --- [5] Verify zero count as while-loop upper bound iterates zero times ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let c: long = lru.getCreateCount();
        let n: int = 0;
        while (c > 0) {
          n = n + 1;
          c = c - 1;
        }
        expect(n).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0070
     * @tc.name testLruCacheGetCreateCount007
     * @tc.desc Merged batch (5 tests): [1] Verify three consecutive reads all return stable count 2 | [2] Verify clear does not reset accumulated creation count | [3] Verify remove does not reset accumulated crea...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three consecutive reads all return stable count 2 ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.get(3);
        lru.get(5);
        let a: long = lru.getCreateCount();
        let b: long = lru.getCreateCount();
        let c: long = lru.getCreateCount();
        expect(a).assertEqual(2);
        expect(b).assertEqual(2);
        expect(c).assertEqual(2);
      }

      // --- [2] Verify clear does not reset accumulated creation count ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.get(3);
        lru.clear();
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [3] Verify remove does not reset accumulated creation count ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.get(3);
        lru.remove(3);
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [4] Verify a hit on the older created key makes the next default creation evict the newer key ---
      {
        let seq: int = 0;
        let lru: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => {
            seq = seq + 1;
            return seq * 10;
          },
          2);
        let older: int = 1;
        let newer: int = 2;
        let extra: int = 3;
        let firstRead: int | undefined = lru.get(older);
        let secondRead: int | undefined = lru.get(newer);
        let refreshedRead: int | undefined = lru.get(older);
        let thirdRead: int | undefined = lru.get(extra);
        expect(firstRead).assertEqual(10);
        expect(secondRead).assertEqual(20);
        expect(refreshedRead).assertEqual(10);
        expect(thirdRead).assertEqual(30);
        expect(lru.contains(older)).assertTrue();
        expect(lru.contains(newer)).assertFalse();
        expect(lru.getCreateCount()).assertEqual(3);
      }

      // --- [5] Verify creation count keeps accumulating to 2 across repeated evictions ---
      {
        let lru: CapFixedTwoChild = new CapFixedTwoChild();
        lru.put(1, 10);
        lru.put(2, 20);
        lru.get(3);
        lru.get(4);
        expect(lru.getCreateCount()).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0080
     * @tc.name testLruCacheGetCreateCount008
     * @tc.desc Merged batch (5 tests): [1] Verify updateCapacity does not affect accumulated creation count | [2] Verify same key misses again after remove raising count to 2 | [3] Verify double floating key type...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify updateCapacity does not affect accumulated creation count ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.get(3);
        lru.updateCapacity(128);
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [2] Verify same key misses again after remove raising count to 2 ---
      {
        let lru: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        lru.get(3);
        lru.remove(3);
        lru.get(3);
        expect(lru.getCreateCount()).assertEqual(2);
      }

      // --- [3] Verify double floating key type miss increments creation count to 1 ---
      {
        let lru: ProbeCache<double, int> = new ProbeCache<double, int>(
          undefined,
          (key: double) => 7);
        lru.get(3.5);
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [4] Verify boolean key type miss increments creation count to 1 ---
      {
        let lru: ReturnKeyChild<boolean> = new ReturnKeyChild<boolean>();
        lru.get(false);
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [5] Verify long key type miss increments creation count to 1 ---
      {
        let lru: ReturnKeyChild<long> = new ReturnKeyChild<long>();
        let k: long = 9000000000;
        lru.get(k);
        expect(lru.getCreateCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0090
     * @tc.name testLruCacheGetCreateCount009
     * @tc.desc Merged batch (5 tests): [1] Verify double key type miss creates the double key itself and counts one creation | [2] Verify bigint key type miss increments creation count to 1 | [3] Verify Date refe...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify double key type miss creates the double key itself and counts one creation ---
      {
        let lru: ReturnKeyChild<double> = new ReturnKeyChild<double>();
        let created: double | undefined = lru.get(3.14);
        expect(created).assertEqual(3.14);
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [2] Verify bigint key type miss increments creation count to 1 ---
      {
        let lru: ReturnKeyChild<bigint> = new ReturnKeyChild<bigint>();
        lru.get(123456789n);
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [3] Verify Date reference key type miss increments creation count to 1 ---
      {
        let lru: ReturnKeyChild<Date> = new ReturnKeyChild<Date>();
        lru.get(new Date(1700000000000));
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [4] Verify two same-millisecond distinct Date reference key misses count 2 ---
      {
        let lru: ReturnKeyChild<Date> = new ReturnKeyChild<Date>();
        lru.get(new Date(1000));
        lru.get(new Date(1000));
        expect(lru.getCreateCount()).assertEqual(2);
      }

      // --- [5] Verify boolean value createDefault miss increments creation count to 1 ---
      {
        let lru: ProbeCache<int, boolean> = new ProbeCache<int, boolean>(
          undefined,
          (key: int) => true);
        lru.get(5);
        expect(lru.getCreateCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0100
     * @tc.name testLruCacheGetCreateCount010
     * @tc.desc Merged batch (5 tests): [1] Verify class instance value createDefault miss increments creation count to 1 | [2] Verify overlong string key miss increments creation count to 1 | [3] Verify two objec...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify class instance value createDefault miss increments creation count to 1 ---
      {
        let lru: ProbeCache<int, RefTagValue> = new ProbeCache<int, RefTagValue>(
          undefined,
          (key: int) => new RefTagValue());
        lru.get(5);
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [2] Verify overlong string key miss increments creation count to 1 ---
      {
        let lru: StrConstChild = new StrConstChild();
        let longKey: string = '';
        for (let i: int = 0; i < 1000; i++) {
          longKey = longKey + 'a';
        }
        lru.get(longKey);
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [3] Verify two object keys with identical properties but different instances count 2 ---
      {
        let lru: ProbeCache<LabeledKey, int> = new ProbeCache<LabeledKey, int>(
          undefined,
          (key: LabeledKey) => key.id);
        let a: LabeledKey = { id: 1, label: 'x' };
        let b: LabeledKey = { id: 1, label: 'x' };
        lru.get(a);
        lru.get(b);
        expect(lru.getCreateCount()).assertEqual(2);
      }

      // --- [4] Verify Map container reference key miss increments creation count to 1 ---
      {
        let lru: ProbeCache<Map<string, int>, int> = new ProbeCache<Map<string, int>, int>(
          undefined,
          (key: Map<string, int>) => 1);
        let m: Map<string, int> = new Map<string, int>();
        lru.get(m);
        expect(lru.getCreateCount()).assertEqual(1);
      }

      // --- [5] Verify twenty then one hundred distinct misses accumulate creation count to 20 then 100 ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        for (let i: int = 0; i < 20; i++) {
          cache.get(i);
        }
        let cntAtTwenty: long = cache.getCreateCount();
        for (let i: int = 20; i < 100; i++) {
          cache.get(i);
        }
        let cntAtHundred: long = cache.getCreateCount();
        expect(cntAtTwenty).assertEqual(20);
        expect(cntAtHundred).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0110
     * @tc.name testLruCacheGetCreateCount011
     * @tc.desc Merged batch (5 tests): [1] Verify hit on put key then two misses return 2 | [2] Verify constant-valued createDefault counts each miss once returning 2 | [3] Verify twice-key createDefault count ma...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify hit on put key then two misses return 2 ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.put(10, 100);
        cache.get(10);
        cache.get(20);
        cache.get(30);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(2);
      }

      // --- [2] Verify constant-valued createDefault counts each miss once returning 2 ---
      {
        let cache: ConstValChild = new ConstValChild();
        cache.get(1);
        cache.get(2);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(2);
      }

      // --- [3] Verify twice-key createDefault count matches number of creations returning 2 ---
      {
        let cache: DoubleKeyChild = new DoubleKeyChild();
        cache.get(5);
        cache.get(6);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(2);
      }

      // --- [4] Verify clear then access same key recreates and accumulates to 2 ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(1);
        cache.clear();
        cache.get(1);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(2);
      }

      // --- [5] Verify repeated hits on two created keys keep count at 2 ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(1);
        cache.get(2);
        cache.get(1);
        cache.get(2);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0120
     * @tc.name testLruCacheGetCreateCount012
     * @tc.desc Merged batch (5 tests): [1] Verify put overwrite after creation then hit keeps count at 1 | [2] Verify twenty consecutive hits on same created key keep count at 1 | [3] Verify reading count does no...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put overwrite after creation then hit keeps count at 1 ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(1);
        cache.put(1, 99);
        cache.get(1);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [2] Verify twenty consecutive hits on same created key keep count at 1 ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(1);
        for (let i: int = 0; i < 20; i++) {
          cache.get(1);
        }
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [3] Verify reading count does not raise itself and next miss yields previous plus 1 ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(1);
        let before: long = cache.getCreateCount();
        cache.get(2);
        let after: long = cache.getCreateCount();
        expect(after).assertEqual(before + 1);
      }

      // --- [4] Verify reading count does not trigger createDefault so re-access is still a hit ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(1);
        cache.getCreateCount();
        cache.get(1);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [5] Verify created value still hit-returned unchanged after reading count ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(3);
        cache.getCreateCount();
        let v: int | undefined = cache.get(3);
        expect(v).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0130
     * @tc.name testLruCacheGetCreateCount013
     * @tc.desc Merged batch (5 tests): [1] Verify reading count on one-capacity cache does not evict original key | [2] Verify count stays stable across an interleaved put between two reads | [3] Verify count sta...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify reading count on one-capacity cache does not evict original key ---
      {
        let cache: CapParamChildOne = new CapParamChildOne(1);
        cache.get(1);
        cache.getCreateCount();
        let v: int | undefined = cache.get(1);
        expect(v).assertEqual(1);
      }

      // --- [2] Verify count stays stable across an interleaved put between two reads ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let a: long = cache.getCreateCount();
        cache.put(2, 20);
        let b: long = cache.getCreateCount();
        expect(a).assertEqual(b);
      }

      // --- [3] Verify count stays stable across an interleaved remove between two reads ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(1);
        cache.get(2);
        let a: long = cache.getCreateCount();
        cache.remove(1);
        let b: long = cache.getCreateCount();
        expect(a).assertEqual(b);
      }

      // --- [4] Verify updateCapacity resizing does not reset count to original accumulation ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(1);
        cache.get(2);
        cache.updateCapacity(100);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(2);
      }

      // --- [5] Verify capacity-1 a/b/a recreation after each eviction counts 3 ---
      {
        let cache: CapParamChildOne = new CapParamChildOne(1);
        cache.get(1);
        cache.get(2);
        cache.get(1);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0140
     * @tc.name testLruCacheGetCreateCount014
     * @tc.desc Merged batch (5 tests): [1] Verify capacity-2 a/b/c/a recreation after eviction counts 4 | [2] Verify three puts with eviction on capacity-2 do not trigger creation | [3] Verify shrink to capacity ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify capacity-2 a/b/c/a recreation after eviction counts 4 ---
      {
        let cache: CapParamChildOne = new CapParamChildOne(2);
        cache.get(1);
        cache.get(2);
        cache.get(3);
        cache.get(1);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(4);
      }

      // --- [2] Verify three puts with eviction on capacity-2 do not trigger creation ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(0);
      }

      // --- [3] Verify shrink to capacity 1 then miss on new key gives exact count 3 ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(1);
        cache.get(2);
        cache.updateCapacity(1);
        cache.get(3);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(3);
      }

      // --- [4] Verify capacity-2 a/b/c/a/b recreation counts 2 creations after fill then 5 after two evicted keys are recreated ---
      {
        let cache: CapParamChildOne = new CapParamChildOne(2);
        cache.get(1);
        cache.get(2);
        let afterFill: long = cache.getCreateCount();
        cache.get(3);
        cache.get(1);
        cache.get(2);
        let afterRecreate: long = cache.getCreateCount();
        expect(afterFill).assertEqual(2);
        expect(afterRecreate).assertEqual(5);
      }

      // --- [5] Verify removing a created key does not decrease the accumulated count ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(1);
        cache.get(2);
        cache.remove(2);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0150
     * @tc.name testLruCacheGetCreateCount015
     * @tc.desc Merged batch (5 tests): [1] Verify creation count stays 0 when reading getMatchCount after a hit | [2] Verify creation count stays 1 when reading getMissCount after a miss | [3] Verify creation cou...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify creation count stays 0 when reading getMatchCount after a hit ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.put(1, 10);
        cache.get(1);
        cache.getMatchCount();
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(0);
      }

      // --- [2] Verify creation count stays 1 when reading getMissCount after a miss ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(1);
        cache.getMissCount();
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [3] Verify creation count exact 2 when reading getRemovalCount in capacity-1 eviction ---
      {
        let cache: CapParamChildOne = new CapParamChildOne(1);
        cache.get(1);
        cache.get(2);
        cache.getRemovalCount();
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(2);
      }

      // --- [4] Verify creation count still accumulates to 2 when reading getMatchCount between misses ---
      {
        let cache: ReturnKeyChild<int> = new ReturnKeyChild<int>();
        cache.get(1);
        cache.getMatchCount();
        cache.get(2);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(2);
      }

      // --- [5] Verify two misses on default cache with undefined createDefault return 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(1);
        cache.get(2);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0160
     * @tc.name testLruCacheGetCreateCount016
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault returning falsy 0 still counts one creation | [2] Verify createDefault returning negative value still counts one creation | [3] Verify key-squared c...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault returning falsy 0 still counts one creation ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => 0);
        cache.get(1);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [2] Verify createDefault returning negative value still counts one creation ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => -1);
        cache.get(1);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [3] Verify key-squared createDefault counts 2 after two misses ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => key * key);
        cache.get(4);
        cache.get(9);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(2);
      }

      // --- [4] Verify that while length stays pinned at capacity, later string key misses keep raising the creation count ---
      {
        let cache: ProbeCache<string, int> = new ProbeCache<string, int>(
          undefined, (key: string) => key.length, 2);
        let keys: string[] = ['ab', 'cde', 'fghi', 'jklmn'];
        let next: int = 0;
        while (cache.length < 2) {
          cache.get(keys[next]);
          next = next + 1;
        }
        let filled: long = cache.getCreateCount();
        cache.get('extra');
        cache.get('extraTwo');
        expect(filled).assertEqual(2);
        expect(cache.length).assertEqual(2);
        expect(cache.getCreateCount()).assertEqual(4);
      }

      // --- [5] Verify string int instantiation empty string key miss counts 1 ---
      {
        let cache: StrLenKeyChild = new StrLenKeyChild();
        cache.get('');
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0170
     * @tc.name testLruCacheGetCreateCount017
     * @tc.desc Merged batch (5 tests): [1] Verify empty string second access becomes hit and count stays 1 | [2] Verify two string key misses accumulate count to 2 | [3] Verify int string instantiation with strin...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify empty string second access becomes hit and count stays 1 ---
      {
        let cache: StrLenKeyChild = new StrLenKeyChild();
        cache.get('');
        cache.get('');
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [2] Verify two string key misses accumulate count to 2 ---
      {
        let cache: StrLenKeyChild = new StrLenKeyChild();
        cache.get('ab');
        cache.get('cde');
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(2);
      }

      // --- [3] Verify int string instantiation with string-valued createDefault counts 1 ---
      {
        let cache: ProbeCache<int, string> = new ProbeCache<int, string>(
          undefined,
          (key: int) => 'v' + key);
        cache.get(5);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [4] Verify double double instantiation with double createDefault counts 1 ---
      {
        let cache: ProbeCache<double, double> = new ProbeCache<double, double>(
          undefined,
          (key: double) => key * 0.5);
        cache.get(8);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [5] Verify float float instantiation float key miss counts 1 ---
      {
        let cache: ProbeCache<float, float> = new ProbeCache<float, float>(
          undefined,
          (key: float) => key);
        cache.get(1.5);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0180
     * @tc.name testLruCacheGetCreateCount018
     * @tc.desc Merged batch (5 tests): [1] Verify boolean boolean instantiation boolean key miss counts 1 | [2] Verify class instance key instantiation miss counts 1 | [3] Verify string key mapping class value in...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify boolean boolean instantiation boolean key miss counts 1 ---
      {
        let cache: ProbeCache<boolean, boolean> = new ProbeCache<boolean, boolean>(
          undefined,
          (key: boolean) => true);
        cache.get(true);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [2] Verify class instance key instantiation miss counts 1 ---
      {
        let cache: ProbeCache<HolderCls, HolderCls> = new ProbeCache<HolderCls, HolderCls>(
          undefined,
          (key: HolderCls) => new HolderCls());
        let key: HolderCls = new HolderCls();
        cache.get(key);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [3] Verify string key mapping class value instantiation miss counts 1 ---
      {
        let cache: ProbeCache<string, HolderCls> = new ProbeCache<string, HolderCls>(
          undefined,
          (key: string) => new HolderCls());
        cache.get('k1');
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [4] Verify int long instantiation with long-extreme createDefault counts 1 ---
      {
        let cache: ProbeCache<int, long> = new ProbeCache<int, long>(
          undefined,
          (key: int) => 9223372036854775807);
        cache.get(1);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [5] Verify long int instantiation long key miss counts 1 ---
      {
        let cache: ProbeCache<long, int> = new ProbeCache<long, int>(
          undefined,
          (key: long) => 1);
        let k: long = 10000000000;
        cache.get(k);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0190
     * @tc.name testLruCacheGetCreateCount019
     * @tc.desc Merged batch (5 tests): [1] Verify int bigint instantiation createDefault returning bigint counts 1 | [2] Verify contains miss does not invoke createDefault while a later get miss creates once | [3...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify int bigint instantiation createDefault returning bigint counts 1 ---
      {
        let cache: ProbeCache<int, bigint> = new ProbeCache<int, bigint>(
          undefined,
          (key: int) => BigInt(key));
        cache.get(3);
        let cnt: long = cache.getCreateCount();
        expect(cnt).assertEqual(1);
      }

      // --- [2] Verify contains miss does not invoke createDefault while a later get miss creates once ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => key + 100);
        let absent: boolean = cache.contains(7);
        expect(absent).assertFalse();
        expect(cache.getCreateCount()).assertEqual(0);
        let value: int | undefined = cache.get(7);
        expect(value).assertEqual(107);
        expect(cache.getCreateCount()).assertEqual(1);
      }

      // --- [3] Verify a contains hit does not invoke createDefault so the creation count stays 0 ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => key);
        cache.put(4, 40);
        expect(cache.contains(4)).assertTrue();
        expect(cache.getCreateCount()).assertEqual(0);
      }

      // --- [4] Verify a miss on a full cache creates the default entry, evicts the oldest key and counts one ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => key * 10,
          2);
        cache.put(1, 10);
        cache.put(2, 20);
        let created: int | undefined = cache.get(3);
        expect(created).assertEqual(30);
        expect(cache.contains(1)).assertFalse();
        expect(cache.length).assertEqual(2);
        expect(cache.getCreateCount()).assertEqual(1);
      }

      // --- [5] Verify two caches keep independent creation counts ---
      {
        let first: ProbeCache<int, int> = new ProbeCache<int, int>(undefined, (key: int) => key);
        let second: ProbeCache<int, int> = new ProbeCache<int, int>(undefined, (key: int) => key);
        first.get(1);
        first.get(2);
        second.get(1);
        expect(first.getCreateCount()).assertEqual(2);
        expect(second.getCreateCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0200
     * @tc.name testLruCacheGetCreateCount020
     * @tc.desc Merged batch (5 tests): [1] Verify the creation count drives a while loop that stops once three default entries exist | [2] Verify a NaN double key creates once and a repeated NaN lookup is a hit |...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the creation count drives a while loop that stops once three default entries exist ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(undefined, (key: int) => key);
        let created: long = 0;
        let probe: int = 0;
        while (created < 3) {
          cache.get(probe);
          probe = probe + 1;
          created = cache.getCreateCount();
        }
        expect(created).assertEqual(3);
      }

      // --- [2] Verify a NaN double key creates once and a repeated NaN lookup is a hit ---
      {
        let cache: ProbeCache<double, int> = new ProbeCache<double, int>(undefined, (key: double) => 7);
        cache.get(Double.NaN);
        expect(cache.length).assertEqual(1);
        cache.get(Double.NaN);
        expect(cache.getCreateCount()).assertEqual(1);
      }

      // --- [3] Verify positive Infinity and negative Infinity double keys each create one entry ---
      {
        let cache: ProbeCache<double, int> = new ProbeCache<double, int>(undefined, (key: double) => 7);
        cache.get(Double.POSITIVE_INFINITY);
        cache.get(Double.NEGATIVE_INFINITY);
        expect(cache.getCreateCount()).assertEqual(2);
      }

      // --- [4] Verify a miss on the int minimum key -2147483648 and on zero creates two entries ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(undefined, (key: int) => key);
        cache.get(-2147483648);
        cache.get(0);
        expect(cache.getCreateCount()).assertEqual(2);
      }

      // --- [5] Verify a miss on the long minimum key -9223372036854775808 creates one entry ---
      {
        let key: long = -9223372036854775807 - 1;
        let cache: ProbeCache<long, int> = new ProbeCache<long, int>(undefined, (key: long) => 7);
        cache.get(key);
        expect(cache.getCreateCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0210
     * @tc.name testLruCacheGetCreateCount021
     * @tc.desc Merged batch (5 tests): [1] Verify a negative zero key -0.0 creates once and a zero lookup then hits the same entry | [2] Verify an emoji surrogate-pair key creates one entry through createDefault ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a negative zero key -0.0 creates once and a zero lookup then hits the same entry ---
      {
        let cache: ProbeCache<double, double> = new ProbeCache<double, double>(undefined, (key: double) => key);
        let created: double | undefined = cache.get(-0.0);
        expect(created).assertEqual(0.0);
        let hit: double | undefined = cache.get(0.0);
        expect(hit).assertEqual(0.0);
        expect(cache.getCreateCount()).assertEqual(1);
      }

      // --- [2] Verify an emoji surrogate-pair key creates one entry through createDefault ---
      {
        let cache: ProbeCache<string, int> = new ProbeCache<string, int>(undefined, (key: string) => key.length);
        let created: int | undefined = cache.get('😀');
        expect(created).assertEqual(2);
        expect(cache.getCreateCount()).assertEqual(1);
      }

      // --- [3] Verify an enum member key creates one entry through createDefault ---
      {
        let cache: ProbeCache<CreateRank, int> = new ProbeCache<CreateRank, int>(undefined, (key: CreateRank) => 1);
        cache.get(CreateRank.High);
        expect(cache.getCreateCount()).assertEqual(1);
      }

      // --- [4] Verify the NUL character 0x0000 key and the maximum BMP character 0xFFFF key each create one entry ---
      {
        let cache: ProbeCache<string, int> = new ProbeCache<string, int>(undefined, (key: string) => key.charCodeAt(0));
        cache.get('\u0000');
        cache.get('\uFFFF');
        expect(cache.getCreateCount()).assertEqual(2);
      }

      // --- [5] Verify a failed put with a null key leaves the creation count unchanged and a later miss creates once ---
      {
        let cache: ProbeCache<string | null, int> = new ProbeCache<string | null, int>(undefined, (key: string | null) => 1);
        cache.put('a', 10);
        try {
          cache.put(null, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.getCreateCount()).assertEqual(0);
        let created: int | undefined = cache.get('missing');
        expect(created).assertEqual(1);
        expect(cache.getCreateCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CREATE_COUNT_0220
     * @tc.name testLruCacheGetCreateCount022
     * @tc.desc Merged batch (2 tests): [1] Verify iterating keys and values does not invoke createDefault | [2] Verify isEmpty, getCapacity and length reads do not invoke createDefault
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCreateCount022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterating keys and values does not invoke createDefault ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(undefined, (key: int) => key);
        cache.put(1, 10);
        let keys: int[] = cache.keys();
        let values: int[] = cache.values();
        expect(keys.length).assertEqual(1);
        expect(values[0]).assertEqual(10);
        expect(cache.getCreateCount()).assertEqual(0);
      }

      // --- [2] Verify isEmpty, getCapacity and length reads do not invoke createDefault ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(undefined, (key: int) => key);
        cache.put(1, 10);
        expect(cache.isEmpty()).assertFalse();
        expect(cache.getCapacity()).assertEqual(64);
        expect(cache.length).assertEqual(1);
        expect(cache.getCreateCount()).assertEqual(0);
      }
    });

  });
}
