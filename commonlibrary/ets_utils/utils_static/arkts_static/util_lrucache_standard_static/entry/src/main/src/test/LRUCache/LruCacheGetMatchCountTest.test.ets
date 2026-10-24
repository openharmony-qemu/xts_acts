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

class EchoDefaultChild extends util.LRUCache<int, int> {
  constructor() {
    super();
  }
  createDefault(key: int): int {
    return key;
  }
}

class IntPoint {
  x: int = 0;
  y: int = 0;
}

interface ABRec {
  a: int;
  b: int;
}

class RemovalProbe extends util.LRUCache<int, int> {
  constructor() {
    super();
  }
  removals: int = 0;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int): void {
    this.removals = this.removals + 1;
  }
}

class EvictWatchCache<K, V> extends util.LRUCache<K, V> {
  atEvict: long = -1;

  constructor(capacity: int) {
    super(capacity);
  }

  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V): void {
    this.atEvict = this.getMatchCount();
  }
}

class ValHolder {
  v: int = 1;
}

enum MatchRank {
  Low = 0,
  High = 1
}

export default function lruCacheGetMatchCountTest(): void {
  describe('LruCacheGetMatchCountTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0010
     * @tc.name testLruCacheGetMatchCount001
     * @tc.desc Merged batch (5 tests): [1] Verify zero-argument call on fresh cache returns initial match count 0 | [2] Verify reading getMatchCount itself does not raise the match count | [3] Verify single hit a...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify zero-argument call on fresh cache returns initial match count 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(cache.getMatchCount()).assertEqual(0);
      }

      // --- [2] Verify reading getMatchCount itself does not raise the match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.get(2);
        cache.getMatchCount();
        cache.getMatchCount();
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [3] Verify single hit after put increments match count to 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(5, 10);
        expect(cache.getMatchCount()).assertEqual(0);
        cache.get(5);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [4] Verify two distinct keys each hit once gives match count 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.get(1);
        cache.get(2);
        expect(cache.getMatchCount()).assertEqual(2);
      }

      // --- [5] Verify two hits on the same key derived by an expression accumulate match count 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let base: int = 7;
        cache.put(base * 10, 70);
        cache.get(base * 10);
        cache.get(base * 10);
        expect(cache.getMatchCount()).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0020
     * @tc.name testLruCacheGetMatchCount002
     * @tc.desc Merged batch (5 tests): [1] Verify same key hit ten times in a loop accumulates count to 10 | [2] Verify 65536 hits accumulate without capping or overflow for long counter | [3] Verify hit after ov...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify same key hit ten times in a loop accumulates count to 10 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(3, 30);
        for (let i: int = 0; i < 10; i++) {
          cache.get(3);
        }
        expect(cache.getMatchCount()).assertEqual(10);
      }

      // --- [2] Verify 65536 hits accumulate without capping or overflow for long counter ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 65536; i++) {
          cache.put(i, i);
          cache.get(i);
        }
        expect(cache.getMatchCount()).assertEqual(65536);
      }

      // --- [3] Verify hit after overwriting same key twice gives match count 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let key: int = 2;
        cache.put(key, 10);
        cache.put(key, 20);
        let value: int | undefined = cache.get(key);
        expect(value).assertEqual(20);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [4] Verify count keeps accumulating across reads over lifetime ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        cache.get(1);
        cache.getMatchCount();
        cache.put(2, 2);
        cache.get(2);
        expect(cache.getMatchCount()).assertEqual(2);
      }

      // --- [5] Verify hits beyond capacity keep accumulating with no cap on capacity-3 cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 1);
        cache.get(1);
        cache.put(2, 2);
        cache.get(2);
        cache.put(3, 3);
        cache.get(3);
        cache.put(4, 4);
        cache.get(4);
        cache.put(5, 5);
        cache.get(5);
        expect(cache.getMatchCount()).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0030
     * @tc.name testLruCacheGetMatchCount003
     * @tc.desc Merged batch (5 tests): [1] Verify mixed repeated and distinct key hits total exactly the number of hits | [2] Verify single miss on absent key keeps count at 0 | [3] Verify misses on explicitly re...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify mixed repeated and distinct key hits total exactly the number of hits ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        cache.put(2, 2);
        cache.get(1);
        cache.get(1);
        cache.get(2);
        expect(cache.getMatchCount()).assertEqual(3);
      }

      // --- [2] Verify single miss on absent key keeps count at 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(9);
        expect(cache.getMatchCount()).assertEqual(0);
      }

      // --- [3] Verify misses on explicitly removed keys keep match count at 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.remove(1);
        cache.remove(2);
        cache.get(1);
        cache.get(2);
        expect(cache.getMatchCount()).assertEqual(0);
      }

      // --- [4] Verify 256 misses in a loop do not accumulate match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 256; i++) {
          cache.get(i);
        }
        expect(cache.getMatchCount()).assertEqual(0);
      }

      // --- [5] Verify miss whose createDefault returns non-undefined value does not count as match ---
      {
        let cache: EchoDefaultChild = new EchoDefaultChild();
        cache.get(9);
        expect(cache.getMatchCount()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0040
     * @tc.name testLruCacheGetMatchCount004
     * @tc.desc Merged batch (5 tests): [1] Verify hit followed by miss keeps count at 1 | [2] Verify after an undefined-returning miss only the following hit is counted | [3] Verify put only without any get leave...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify hit followed by miss keeps count at 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.get(2);
        cache.get(99);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [2] Verify after an undefined-returning miss only the following hit is counted ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let miss: int | undefined = cache.get(99);
        expect(miss).assertEqual(undefined);
        cache.put(2, 10);
        let hit: int | undefined = cache.get(2);
        expect(hit).assertEqual(10);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [3] Verify put only without any get leaves match count at 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        expect(cache.getMatchCount()).assertEqual(0);
      }

      // --- [4] Verify querying an absent key while other keys present does not count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        cache.put(2, 2);
        let absent: int | undefined = cache.get(8);
        expect(absent).assertEqual(undefined);
        expect(cache.getMatchCount()).assertEqual(0);
      }

      // --- [5] Verify three misses then one hit counts only the final hit ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(10);
        cache.get(11);
        cache.get(12);
        cache.put(1, 1);
        cache.get(1);
        expect(cache.getMatchCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0050
     * @tc.name testLruCacheGetMatchCount005
     * @tc.desc Merged batch (5 tests): [1] Verify hit on key 0 counts into match count | [2] Verify hit on key 1 smallest positive int counts into match count | [3] Verify hit on negative key -1 counts into match...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify hit on key 0 counts into match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let key: int = 0;
        cache.put(key, 10);
        cache.get(key);
        let hits: long = cache.getMatchCount();
        expect(hits).assertEqual(1);
      }

      // --- [2] Verify hit on key 1 smallest positive int counts into match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let value: int | undefined = cache.get(1);
        expect(value).assertEqual(10);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [3] Verify hit on negative key -1 counts into match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(-1, 10);
        cache.get(-1);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [4] Verify hit on int max key counts into match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let key: int = 2147483647;
        cache.put(key, 10);
        cache.get(key);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [5] Verify hit on empty string key counts into match count ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = '';
        cache.put(key, 1);
        cache.get(key);
        expect(cache.getMatchCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0060
     * @tc.name testLruCacheGetMatchCount006
     * @tc.desc Merged batch (5 tests): [1] Verify empty string key miss does not raise match count | [2] Verify concatenated string key equals literal key and counts as a hit | [3] Verify same Date reference key ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify empty string key miss does not raise match count ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('a', 1);
        cache.get('');
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(0);
      }

      // --- [2] Verify concatenated string key equals literal key and counts as a hit ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let sk: string = 'a' + 'b';
        cache.put(sk, 1);
        cache.get('ab');
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [3] Verify same Date reference key hit counts into match count ---
      {
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        let d: Date = new Date(2020, 0, 1);
        cache.put(d, 1);
        cache.get(d);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [4] Verify same-millisecond Date different references are a miss ---
      {
        let cache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache.put(new Date(2020, 0, 1), 1);
        cache.get(new Date(2020, 0, 1));
        expect(cache.getMatchCount()).assertEqual(0);
      }

      // --- [5] Verify same RegExp reference key hit counts into match count ---
      {
        let cache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        let r: RegExp = new RegExp('a', 'g');
        cache.put(r, 1);
        cache.get(r);
        expect(cache.getMatchCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0070
     * @tc.name testLruCacheGetMatchCount007
     * @tc.desc Merged batch (5 tests): [1] Verify same-pattern RegExp different references are a miss | [2] Verify same class instance reference key hit counts into match count | [3] Verify content-equal differen...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify same-pattern RegExp different references are a miss ---
      {
        let cache: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        cache.put(new RegExp('a', 'g'), 1);
        cache.get(new RegExp('a', 'g'));
        expect(cache.getMatchCount()).assertEqual(0);
      }

      // --- [2] Verify same class instance reference key hit counts into match count ---
      {
        let cache: util.LRUCache<IntPoint, int> = new util.LRUCache<IntPoint, int>();
        let p: IntPoint = new IntPoint();
        cache.put(p, 1);
        cache.get(p);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [3] Verify content-equal different class instance references are a miss ---
      {
        let cache: util.LRUCache<IntPoint, int> = new util.LRUCache<IntPoint, int>();
        cache.put(new IntPoint(), 1);
        cache.get(new IntPoint());
        expect(cache.getMatchCount()).assertEqual(0);
      }

      // --- [4] Verify same Array reference key hit counts into match count ---
      {
        let cache: util.LRUCache<Array<int>, int> = new util.LRUCache<Array<int>, int>();
        let arr: Array<int> = [1, 2, 3];
        cache.put(arr, 1);
        cache.get(arr);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [5] Verify content-equal different Array references are a miss ---
      {
        let cache: util.LRUCache<Array<int>, int> = new util.LRUCache<Array<int>, int>();
        cache.put([1, 2, 3], 1);
        cache.get([1, 2, 3]);
        expect(cache.getMatchCount()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0080
     * @tc.name testLruCacheGetMatchCount008
     * @tc.desc Merged batch (5 tests): [1] Verify same Map reference key hit counts into match count | [2] Verify content-equal different Map references are a miss | [3] Verify same object literal interface key r...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify same Map reference key hit counts into match count ---
      {
        let cache: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        cache.put(m, 1);
        cache.get(m);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [2] Verify content-equal different Map references are a miss ---
      {
        let cache: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        let firstMap: Map<string, int> = new Map<string, int>();
        firstMap.set('a', 1);
        let secondMap: Map<string, int> = new Map<string, int>();
        secondMap.set('a', 1);
        cache.put(firstMap, 1);
        cache.get(secondMap);
        expect(cache.getMatchCount()).assertEqual(0);
      }

      // --- [3] Verify same object literal interface key reference hit counts into match count ---
      {
        let cache: util.LRUCache<ABRec, int> = new util.LRUCache<ABRec, int>();
        let o: ABRec = { a: 1, b: 2 };
        cache.put(o, 1);
        cache.get(o);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [4] Verify long max key hit counts into match count ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let lk: long = 9223372036854775807;
        cache.put(lk, 1);
        cache.get(lk);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [5] Verify various typed key hit counts into match count ---
      {
        // bigint key
        let cacheBig: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        let bk: bigint = 9223372036854775807n;
        cacheBig.put(bk, 1);
        cacheBig.get(bk);
        expect(cacheBig.getMatchCount()).assertEqual(1);

        // boolean key
        let cacheBool: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cacheBool.put(true, 1);
        cacheBool.get(true);
        expect(cacheBool.getMatchCount()).assertEqual(1);

        // double key
        let cacheDouble: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        let keyDouble: double = 2.5;
        cacheDouble.put(keyDouble, 1);
        cacheDouble.put(3.5, 2);
        cacheDouble.get(keyDouble);
        let hitsDouble: long = cacheDouble.getMatchCount();
        expect(hitsDouble).assertEqual(1);

        // float key
        let cacheFloat: util.LRUCache<float, int> = new util.LRUCache<float, int>();
        let valueFloat: int = 1;
        cacheFloat.put(1.5, valueFloat);
        cacheFloat.get(1.5);
        let hitsFloat: long = cacheFloat.getMatchCount();
        expect(hitsFloat).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0090
     * @tc.name testLruCacheGetMatchCount009
     * @tc.desc Merged batch (5 tests): [1] Verify byte max key hit counts into match count | [2] Verify short max key hit counts into match count | [3] Verify single character string key hit counts into match cou...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify byte max key hit counts into match count ---
      {
        let cache: util.LRUCache<byte, int> = new util.LRUCache<byte, int>();
        cache.put(127, 1);
        cache.get(127);
        expect(cache.length).assertEqual(1);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [2] Verify short max key hit counts into match count ---
      {
        let cache: util.LRUCache<short, int> = new util.LRUCache<short, int>();
        cache.put(32767, 1);
        cache.get(32767);
        cache.get(32767);
        let hits: long = cache.getMatchCount();
        expect(hits).assertEqual(2);
      }

      // --- [3] Verify single character string key hit counts into match count ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('a', 1);
        let value: int | undefined = cache.get('a');
        expect(value).assertEqual(1);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [4] Verify string-valued cache hit counts into match count ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'abc');
        cache.get(1);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [5] Verify Date-valued cache hit counts into match count ---
      {
        let cache: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        cache.put(1, new Date(0));
        cache.get(1);
        expect(cache.getMatchCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0100
     * @tc.name testLruCacheGetMatchCount010
     * @tc.desc Merged batch (5 tests): [1] Verify boolean-valued cache hit counts into match count | [2] Verify class instance valued cache hit counts into match count | [3] Verify capacity-1 cache eviction then ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify boolean-valued cache hit counts into match count ---
      {
        let cache: util.LRUCache<int, boolean> = new util.LRUCache<int, boolean>();
        cache.put(1, true);
        cache.get(1);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [2] Verify class instance valued cache hit counts into match count ---
      {
        let cache: util.LRUCache<int, ValHolder> = new util.LRUCache<int, ValHolder>();
        let pv: ValHolder = new ValHolder();
        cache.put(1, pv);
        cache.get(1);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [3] Verify capacity-1 cache eviction then new key hit counts both into match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.get(1);
        cache.put(2, 2);
        let value: int | undefined = cache.get(2);
        expect(value).assertEqual(2);
        expect(cache.getMatchCount()).assertEqual(2);
      }

      // --- [4] Verify capacity-1 cache miss then put then hit counts only the hit ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.get(1);
        cache.put(1, 1);
        cache.get(1);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [5] Verify hit key later evicted then re-accessed as miss keeps count at 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.get(1);
        cache.put(2, 2);
        let evicted: int | undefined = cache.get(1);
        expect(evicted).assertEqual(undefined);
        expect(cache.getMatchCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0110
     * @tc.name testLruCacheGetMatchCount011
     * @tc.desc Merged batch (5 tests): [1] Verify evicted key re-put then hit accumulates count to 2 | [2] Verify updateCapacity shrink keeps match count without reset | [3] Verify clear keeps match count without...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify evicted key re-put then hit accumulates count to 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.get(1);
        cache.put(2, 2);
        cache.put(1, 1);
        cache.get(1);
        expect(cache.getMatchCount()).assertEqual(2);
      }

      // --- [2] Verify updateCapacity shrink keeps match count without reset ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        cache.put(1, 1);
        cache.get(1);
        cache.updateCapacity(2);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [3] Verify clear keeps match count without reset ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        cache.get(1);
        cache.clear();
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [4] Verify match count equals manually maintained hit variable ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let h: int = 0;
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.get(1);
        h = h + 1;
        cache.get(2);
        h = h + 1;
        cache.get(3);
        h = h + 1;
        expect(cache.getMatchCount()).assertEqual(h);
      }

      // --- [5] Verify return value after hit can be stored losslessly in a long variable ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.get(2);
        let res: long = cache.getMatchCount();
        expect(res).assertEqual(1);
        expect(cache.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0120
     * @tc.name testLruCacheGetMatchCount012
     * @tc.desc Merged batch (5 tests): [1] Verify return value can directly take part in arithmetic operations | [2] Verify return value after hit assignable to long variable | [3] Verify cache remains usable and...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify return value can directly take part in arithmetic operations ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.get(2);
        expect(cache.getMatchCount() + 1).assertEqual(2);
      }

      // --- [2] Verify return value after hit assignable to long variable ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(4, 40);
        cache.get(4);
        let hitCount: long = cache.getMatchCount();
        let doubled: long = hitCount * 2;
        expect(doubled).assertEqual(2);
      }

      // --- [3] Verify cache remains usable and hit returns original value after reading match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        cache.getMatchCount();
        let v: int | undefined = cache.get(1);
        expect(v).assertEqual(10);
      }

      // --- [4] Verify remove only returns 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.remove(1);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(0);
      }

      // --- [5] Verify updateCapacity resizing only returns 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.updateCapacity(128);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0130
     * @tc.name testLruCacheGetMatchCount013
     * @tc.desc Merged batch (5 tests): [1] Verify clear only returns 0 | [2] Verify get miss only returns 0 | [3] Verify reading other counters only still returns 0 | [4] Verify an explicit remove neither clears ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify clear only returns 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.clear();
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(0);
      }

      // --- [2] Verify get miss only returns 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(5, 50);
        cache.get(6);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(0);
        expect(cache.getMissCount()).assertEqual(1);
      }

      // --- [3] Verify reading other counters only still returns 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.getMissCount();
        cache.getCreateCount();
        cache.getPutCount();
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(0);
      }

      // --- [4] Verify an explicit remove neither clears nor decrements the match count and a re-inserted key raises it on the next hit ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        cache.remove(1);
        let afterRemove: long = cache.getMatchCount();
        expect(afterRemove).assertEqual(1);
        cache.get(1);
        expect(cache.getMatchCount()).assertEqual(1);
        cache.put(1, 99);
        let again: int | undefined = cache.get(1);
        expect(again).assertEqual(99);
        expect(cache.getMatchCount()).assertEqual(2);
      }

      // --- [5] Verify two hits separated by an overwrite of the same key count exactly two ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(9, 90);
        cache.get(9);
        cache.put(9, 91);
        cache.get(9);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0140
     * @tc.name testLruCacheGetMatchCount014
     * @tc.desc Merged batch (5 tests): [1] Verify repeated reads of the counter do not change the match count | [2] Verify two consecutive reads return identical value without self-increment side effect | [3] Ver...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify repeated reads of the counter do not change the match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        let first: long = cache.getMatchCount();
        cache.getMatchCount();
        let second: long = cache.getMatchCount();
        expect(first).assertEqual(1);
        expect(second).assertEqual(1);
      }

      // --- [2] Verify two consecutive reads return identical value without self-increment side effect ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(4, 40);
        cache.get(4);
        let a: long = cache.getMatchCount();
        let b: long = cache.getMatchCount();
        expect(a).assertEqual(b);
      }

      // --- [3] Verify the eviction callback on a capacity-2 cache observes the match count already raised by the earlier hits ---
      {
        let cache: EvictWatchCache<int, int> = new EvictWatchCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.get(1);
        cache.get(2);
        cache.get(1);
        let beforeEvict: long = cache.getMatchCount();
        cache.put(3, 30);
        expect(beforeEvict).assertEqual(3);
        expect(cache.atEvict).assertEqual(3);
        expect(cache.contains(2)).assertFalse();
        expect(cache.getMatchCount()).assertEqual(3);
      }

      // --- [4] Verify second get on same key of insertion-type cache is a hit raising count to 1 ---
      {
        let cache: EchoDefaultChild = new EchoDefaultChild();
        cache.get(1);
        cache.get(1);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(1);
      }

      // --- [5] Verify reading match count does not change cache length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let len: int = cache.length;
        cache.getMatchCount();
        expect(cache.length).assertEqual(len);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0150
     * @tc.name testLruCacheGetMatchCount015
     * @tc.desc Merged batch (5 tests): [1] Verify reading match count does not change cache content | [2] Verify match count stays stable when a put is interleaved between two reads | [3] Verify reading match cou...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify reading match count does not change cache content ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.getMatchCount();
        let v: int | undefined = cache.get(1);
        expect(v).assertEqual(10);
      }

      // --- [2] Verify match count stays stable when a put is interleaved between two reads ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.get(2);
        let a: long = cache.getMatchCount();
        cache.put(1, 10);
        let b: long = cache.getMatchCount();
        expect(a).assertEqual(b);
      }

      // --- [3] Verify reading match count does not change values() iteration order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let before: int[] = cache.values();
        cache.getMatchCount();
        let after: int[] = cache.values();
        expect(after[0]).assertEqual(before[0]);
        expect(after[1]).assertEqual(before[1]);
      }

      // --- [4] Verify reading match count does not change keys() iteration order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let before: int[] = cache.keys();
        cache.getMatchCount();
        let after: int[] = cache.keys();
        expect(after[0]).assertEqual(before[0]);
        expect(after[1]).assertEqual(before[1]);
      }

      // --- [5] Verify reading match count does not trigger afterRemoval callback leaving no removal side effect ---
      {
        let cache: RemovalProbe = new RemovalProbe();
        cache.put(1, 10);
        cache.get(1);
        cache.getMatchCount();
        expect(cache.removals).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0160
     * @tc.name testLruCacheGetMatchCount016
     * @tc.desc Merged batch (5 tests): [1] Verify reading match count does not change cache capacity | [2] Verify hit after hit gives count exactly previous plus 1 | [3] Verify hit-hit-miss-hit sequence counts ex...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify reading match count does not change cache capacity ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(8);
        cache.getMatchCount();
        expect(cache.getCapacity()).assertEqual(8);
      }

      // --- [2] Verify hit after hit gives count exactly previous plus 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        let before: long = cache.getMatchCount();
        cache.get(1);
        let after: long = cache.getMatchCount();
        expect(after).assertEqual(before + 1);
      }

      // --- [3] Verify hit-hit-miss-hit sequence counts exactly 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        cache.get(1);
        cache.get(9);
        cache.get(1);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(3);
      }

      // --- [4] Verify long long instantiation long key hit matchCount is 1 ---
      {
        let cache: util.LRUCache<long, long> = new util.LRUCache<long, long>();
        let k: long = Int.toLong(1);
        cache.put(k, Int.toLong(1));
        cache.get(k);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(1);
      }

      // --- [5] Verify double double instantiation double key hit matchCount is 1 ---
      {
        let cache: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        cache.put(1.5, 2.5);
        let value: double | undefined = cache.get(1.5);
        expect(value).assertEqual(2.5);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0170
     * @tc.name testLruCacheGetMatchCount017
     * @tc.desc Merged batch (5 tests): [1] Verify boolean int instantiation boolean key hit matchCount is 1 | [2] Verify class instance key instantiation hit matchCount is 1 | [3] Verify content-equal different c...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify boolean int instantiation boolean key hit matchCount is 1 ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(false, 7);
        cache.get(false);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(1);
      }

      // --- [2] Verify class instance key instantiation hit matchCount is 1 ---
      {
        let cache: util.LRUCache<ValHolder, ValHolder> = new util.LRUCache<ValHolder, ValHolder>();
        let holderKey: ValHolder = new ValHolder();
        cache.put(holderKey, holderKey);
        cache.get(holderKey);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(1);
      }

      // --- [3] Verify content-equal different class instance references are distinct keys so get is a miss keeping match count 0 ---
      {
        let cache: util.LRUCache<ValHolder, int> = new util.LRUCache<ValHolder, int>();
        let firstHolder: ValHolder = new ValHolder();
        let secondHolder: ValHolder = new ValHolder();
        cache.put(firstHolder, 100);
        cache.get(secondHolder);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(0);
      }

      // --- [4] Verify string to class value instantiation hit matchCount is 1 ---
      {
        let cache: util.LRUCache<string, ValHolder> = new util.LRUCache<string, ValHolder>();
        cache.put('k1', new ValHolder());
        cache.get('k1');
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(1);
      }

      // --- [5] Verify int to class value instantiation hit matchCount is 1 ---
      {
        let cache: util.LRUCache<int, ValHolder> = new util.LRUCache<int, ValHolder>();
        cache.put(2, new ValHolder());
        cache.get(2);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0180
     * @tc.name testLruCacheGetMatchCount018
     * @tc.desc Merged batch (5 tests): [1] Verify Date Date instantiation key and value both Date hit matchCount is 1 | [2] Verify ten thousand hits return exact long value without truncation | [3] Verify count r...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Date Date instantiation key and value both Date hit matchCount is 1 ---
      {
        let cache: util.LRUCache<Date, Date> = new util.LRUCache<Date, Date>();
        let d: Date = new Date(2025, 0, 1);
        cache.put(d, d);
        cache.get(d);
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(1);
      }

      // --- [2] Verify ten thousand hits return exact long value without truncation ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 10000; i++) {
          cache.put(i, i);
          cache.get(i);
        }
        let cnt: long = cache.getMatchCount();
        expect(cnt).assertEqual(10000);
      }

      // --- [3] Verify count retained without truncation across updateCapacity shrink after many hits ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(200);
        for (let i: int = 0; i < 150; i++) {
          cache.put(i, i);
          cache.get(i);
        }
        cache.updateCapacity(50);
        let b: long = cache.getMatchCount();
        expect(b).assertEqual(150);
      }

      // --- [4] Verify contains hit counts one match and contains miss adds no match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let hit: boolean = cache.contains(1);
        expect(hit).assertTrue();
        let absent: boolean = cache.contains(9);
        expect(absent).assertFalse();
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [5] Verify two contains hits on the same key count two matches ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(4, 40);
        expect(cache.contains(4)).assertTrue();
        expect(cache.contains(4)).assertTrue();
        expect(cache.getMatchCount()).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0190
     * @tc.name testLruCacheGetMatchCount019
     * @tc.desc Merged batch (5 tests): [1] Verify a contains hit followed by a get hit on the same key counts exactly two matches | [2] Verify a contains hit promotes the key so it survives eviction while the mat...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a contains hit followed by a get hit on the same key counts exactly two matches ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(5, 50);
        expect(cache.contains(5)).assertTrue();
        let value: int | undefined = cache.get(5);
        expect(value).assertEqual(50);
        expect(cache.getMatchCount()).assertEqual(2);
      }

      // --- [2] Verify a contains hit promotes the key so it survives eviction while the match count rises by one ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.contains(1)).assertTrue();
        cache.put(3, 30);
        expect(cache.keys()).assertDeepEquals([1, 3]);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [3] Verify a fresh hit after clear continues from the accumulated match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        cache.get(1);
        cache.clear();
        expect(cache.getMatchCount()).assertEqual(2);
        cache.put(9, 90);
        cache.get(9);
        expect(cache.getMatchCount()).assertEqual(3);
      }

      // --- [4] Verify a hit after growing the capacity increments the accumulated match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        cache.put(1, 10);
        cache.get(1);
        cache.updateCapacity(8);
        cache.put(2, 20);
        let value: int | undefined = cache.get(2);
        expect(value).assertEqual(20);
        expect(cache.getMatchCount()).assertEqual(2);
      }

      // --- [5] Verify two caches keep independent match counts ---
      {
        let first: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let second: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        first.put(1, 10);
        first.get(1);
        first.get(1);
        second.put(1, 10);
        second.get(1);
        expect(first.getMatchCount()).assertEqual(2);
        expect(second.getMatchCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0200
     * @tc.name testLruCacheGetMatchCount020
     * @tc.desc Merged batch (5 tests): [1] Verify a hit on the int minimum key -2147483648 counts one match | [2] Verify a hit on the long minimum key -9223372036854775808 counts one match | [3] Verify hits on th...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a hit on the int minimum key -2147483648 counts one match ---
      {
        let key: int = -2147483648;
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(key, 7);
        expect(cache.get(key)).assertEqual(7);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [2] Verify a hit on the long minimum key -9223372036854775808 counts one match ---
      {
        let key: long = -9223372036854775807 - 1;
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        cache.put(key, 7);
        expect(cache.get(key)).assertEqual(7);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [3] Verify hits on the NUL character 0x0000 key and the maximum BMP character 0xFFFF key each count one match ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('\u0000', 0);
        cache.put('\uFFFF', 65535);
        expect(cache.get('\u0000')).assertEqual(0);
        expect(cache.get('\uFFFF')).assertEqual(65535);
        expect(cache.getMatchCount()).assertEqual(2);
      }

      // --- [4] Verify a hit on the negative zero double key -0.0 counts one match ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(-0.0, 7);
        expect(cache.get(0.0)).assertEqual(7);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [5] Verify a hit on the positive Infinity double key counts one match ---
      {
        let key: double = Double.POSITIVE_INFINITY;
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(key, 7);
        expect(cache.get(key)).assertEqual(7);
        expect(cache.getMatchCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0210
     * @tc.name testLruCacheGetMatchCount021
     * @tc.desc Merged batch (5 tests): [1] Verify a hit on a NaN double key counts one match | [2] Verify a hit on an emoji surrogate-pair key counts one match | [3] Verify hits on two distinct enum member keys e...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a hit on a NaN double key counts one match ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(Double.NaN, 7);
        expect(cache.get(Double.NaN)).assertEqual(7);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [2] Verify a hit on an emoji surrogate-pair key counts one match ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('😀', 7);
        expect(cache.get('😀')).assertEqual(7);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [3] Verify hits on two distinct enum member keys each count one match ---
      {
        let cache: util.LRUCache<MatchRank, int> = new util.LRUCache<MatchRank, int>();
        cache.put(MatchRank.Low, 7);
        cache.put(MatchRank.High, 8);
        expect(cache.get(MatchRank.Low)).assertEqual(7);
        expect(cache.get(MatchRank.High)).assertEqual(8);
        expect(cache.getMatchCount()).assertEqual(2);
      }

      // --- [4] Verify a failed put with a null key leaves the match count unchanged and a later hit counts one ---
      {
        let cache: util.LRUCache<string | null, int> = new util.LRUCache<string | null, int>();
        cache.put('a', 10);
        try {
          cache.put(null, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.getMatchCount()).assertEqual(0);
        expect(cache.get('a')).assertEqual(10);
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [5] Verify the match count drives a while loop that stops once three hits are accumulated ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let hits: long = 0;
        while (hits < 3) {
          cache.get(1);
          hits = cache.getMatchCount();
        }
        expect(hits).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_MATCH_COUNT_0220
     * @tc.name testLruCacheGetMatchCount022
     * @tc.desc Merged batch (2 tests): [1] Verify a contains miss on an absent key followed by a contains hit on a present key counts exactly one | [2] Verify eviction-triggering puts alone never raise the match ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetMatchCount022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a contains miss on an absent key followed by a contains hit on a present key counts exactly one ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(8, 80);
        expect(cache.contains(9)).assertFalse();
        expect(cache.contains(8)).assertTrue();
        expect(cache.getMatchCount()).assertEqual(1);
      }

      // --- [2] Verify eviction-triggering puts alone never raise the match count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.length).assertEqual(2);
        expect(cache.getMatchCount()).assertEqual(0);
      }
    });

  });
}
