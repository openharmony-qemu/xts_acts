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

class ConstDefaultCache extends util.LRUCache<string, int> {
  constructor() {
    super();
  }
  createDefault(key: string): int {
    return -1;
  }
}

interface EmptyKV {
  a: int;
  b: string;
}

class EmptyDefInt extends util.LRUCache<int, string> {
  constructor() {
    super();
  }
  createDefault(key: int): string {
    return 'default-int';
  }
}

enum EmptySlot {
  First = 0,
  Second = 1
}

export default function lruCacheIsEmptyTest(): void {
  describe('LruCacheIsEmptyTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_IS_EMPTY_0010
     * @tc.name testLruCacheIsEmpty001
     * @tc.desc Merged batch (5 tests): [1] Verify isEmpty returns true on fresh empty cache | [2] Verify isEmpty returns false after adding entries | [3] Verify isEmpty returns false when still some key remains a...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIsEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isEmpty returns true on fresh empty cache ---
      {
        let lru1: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        expect(lru1.isEmpty()).assertTrue();

        let lru2: util.LRUCache<int, string> = new util.LRUCache<int, string>(32);
        expect(lru2.isEmpty()).assertTrue();
      }

      // --- [2] Verify isEmpty returns false after adding entries ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('a', 1);
        cache.put('b', 2);
        cache.put('c', 3);
        expect(cache.isEmpty()).assertFalse();
      }

      // --- [3] Verify isEmpty returns false when still some key remains after remove ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('a', 1);
        cache.put('b', 2);
        cache.remove('a');
        expect(cache.isEmpty()).assertFalse();
      }

      // --- [4] Verify isEmpty returns true after removing all keys ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('a', 1);
        cache.put('b', 2);
        cache.remove('a');
        cache.remove('b');
        expect(cache.isEmpty()).assertTrue();
      }

      // --- [5] Verify isEmpty returns true after clear of populated cache ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'a');
        cache.put(2, 'b');
        cache.clear();
        expect(cache.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_IS_EMPTY_0020
     * @tc.name testLruCacheIsEmpty002
     * @tc.desc Merged batch (5 tests): [1] Verify remove of never-matching NaN key on empty cache keeps isEmpty true | [2] Verify remove of absent key keeps populated cache non-empty | [3] Verify capacity one cac...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIsEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove of never-matching NaN key on empty cache keeps isEmpty true ---
      {
        let cache: util.LRUCache<double, string> = new util.LRUCache<double, string>();
        cache.remove(Double.NaN);
        expect(cache.isEmpty()).assertTrue();
      }

      // --- [2] Verify remove of absent key keeps populated cache non-empty ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'a');
        cache.remove(99);
        expect(cache.isEmpty()).assertFalse();
      }

      // --- [3] Verify capacity one cache stays non-empty after eviction ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>(1);
        cache.put(1, 'a');
        cache.put(2, 'b');
        expect(cache.isEmpty()).assertFalse();
      }

      // --- [4] Verify default inserted on miss by overridden createDefault makes cache non-empty ---
      {
        let cache: ConstDefaultCache = new ConstDefaultCache();
        cache.get('absent');
        expect(cache.isEmpty()).assertFalse();
      }

      // --- [5] Verify default createDefault does not insert on miss keeping isEmpty true ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.get('missing');
        expect(cache.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_IS_EMPTY_0030
     * @tc.name testLruCacheIsEmpty003
     * @tc.desc Merged batch (5 tests): [1] Verify isEmpty agrees with length zero on empty cache | [2] Verify isEmpty agrees with length zero on populated cache | [3] Verify evicting capacity one cache cleared th...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIsEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isEmpty agrees with length zero on empty cache ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        let emptyFlag: boolean = cache.isEmpty();
        let zeroLen: boolean = cache.length === 0;
        expect(emptyFlag).assertEqual(zeroLen);
        expect(emptyFlag).assertTrue();
      }

      // --- [2] Verify isEmpty agrees with length zero on populated cache ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'a');
        let emptyFlag: boolean = cache.isEmpty();
        let zeroLen: boolean = cache.length === 0;
        expect(emptyFlag).assertEqual(zeroLen);
        expect(emptyFlag).assertFalse();
      }

      // --- [3] Verify evicting capacity one cache cleared then get miss keeps it empty ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>(1);
        cache.put(1, 'a');
        cache.put(2, 'b');
        expect(cache.isEmpty()).assertFalse();
        cache.clear();
        expect(cache.isEmpty()).assertTrue();
        cache.get(1);
        expect(cache.isEmpty()).assertTrue();
      }

      // --- [4] Verify isEmpty returns false after adding entries with various key/value types ---
      {
        let c1: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        c1.put('a', 1); c1.put('b', 2);
        expect(c1.isEmpty()).assertFalse();
        let c2: util.LRUCache<double, string> = new util.LRUCache<double, string>();
        c2.put(0.5, 'x');
        expect(c2.isEmpty()).assertFalse();
        let c3: util.LRUCache<boolean, bigint> = new util.LRUCache<boolean, bigint>();
        c3.put(true, 1n);
        expect(c3.isEmpty()).assertFalse();
        let c4: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        c4.put(1, new Date(0));
        expect(c4.isEmpty()).assertFalse();
        let c5: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        c5.put(Int.toLong(1), 10);
        expect(c5.isEmpty()).assertFalse();
      }

      // --- [5] Verify isEmpty returns true after removing all entries with various capacities ---
      {
        let c1: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        c1.put(1, 'a'); c1.remove(1);
        expect(c1.isEmpty()).assertTrue();
        let c2: util.LRUCache<int, string> = new util.LRUCache<int, string>(2);
        c2.put(1, 'a'); c2.put(2, 'b'); c2.remove(1); c2.remove(2);
        expect(c2.isEmpty()).assertTrue();
        let c3: util.LRUCache<int, int> = new util.LRUCache<int, int>(64);
        for (let i: int = 0; i < 50; i++) { c3.put(i, i); }
        for (let i: int = 49; i >= 0; i--) { c3.remove(i); }
        expect(c3.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_IS_EMPTY_0040
     * @tc.name testLruCacheIsEmpty004
     * @tc.desc Merged batch (5 tests): [1] Verify isEmpty returns true after clear with various cache states | [2] Verify isEmpty stays false after eviction in various capacity caches | [3] Verify isEmpty agrees ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIsEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isEmpty returns true after clear with various cache states ---
      {
        let c1: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        c1.clear();
        expect(c1.isEmpty()).assertTrue();
        let c2: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        for (let i: int = 0; i < 3; i++) { c2.put(i, i); }
        c2.clear();
        expect(c2.isEmpty()).assertTrue();
        let c3: util.LRUCache<int, int> = new util.LRUCache<int, int>(64);
        for (let i: int = 0; i < 100; i++) { c3.put(i, i); }
        c3.clear();
        expect(c3.isEmpty()).assertTrue();
        let c4: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        c4.put('a', 1); c4.clear(); c4.put('b', 2); c4.clear();
        expect(c4.isEmpty()).assertTrue();
      }

      // --- [2] Verify isEmpty stays false after eviction in various capacity caches ---
      {
        let c1: util.LRUCache<int, string> = new util.LRUCache<int, string>(1);
        c1.put(1, 'a'); c1.put(2, 'b');
        expect(c1.isEmpty()).assertFalse();
        let c2: util.LRUCache<int, string> = new util.LRUCache<int, string>(2);
        c2.put(1, 'a'); c2.put(2, 'b'); c2.put(3, 'c');
        expect(c2.isEmpty()).assertFalse();
        let c3: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        for (let i: int = 0; i < 6; i++) { c3.put(i, i); }
        expect(c3.isEmpty()).assertFalse();
      }

      // --- [3] Verify isEmpty agrees with length===0 across cache states ---
      {
        let c: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        expect(c.isEmpty()).assertEqual(c.length === 0);
        c.put(1, 'a');
        expect(c.isEmpty()).assertEqual(c.length === 0);
        c.put(2, 'b');
        expect(c.isEmpty()).assertEqual(c.length === 0);
        c.remove(1);
        expect(c.isEmpty()).assertEqual(c.length === 0);
        c.remove(2);
        expect(c.isEmpty()).assertEqual(c.length === 0);
        c.put(3, 'c');
        expect(c.isEmpty()).assertEqual(c.length === 0);
        c.clear();
        expect(c.isEmpty()).assertEqual(c.length === 0);
      }

      // --- [4] Verify createDefault miss makes cache non-empty while default createDefault keeps empty ---
      {
        let c1: ConstDefaultCache = new ConstDefaultCache();
        c1.get('absent');
        expect(c1.isEmpty()).assertFalse();
        let c2: EmptyDefInt = new EmptyDefInt();
        c2.get(5);
        expect(c2.isEmpty()).assertFalse();
        let c3: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        c3.get('missing');
        expect(c3.isEmpty()).assertTrue();
      }

      // --- [5] Verify updateCapacity shrink/grow affects isEmpty correctly ---
      {
        let c1: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        for (let i: int = 0; i < 5; i++) { c1.put(i, i); }
        c1.updateCapacity(2);
        expect(c1.isEmpty()).assertFalse();
        c1.updateCapacity(1);
        expect(c1.isEmpty()).assertFalse();
        let c2: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        c2.put(1, 10);
        c2.updateCapacity(3);
        expect(c2.isEmpty()).assertFalse();
        c2.put(2, 20); c2.put(3, 30);
        expect(c2.isEmpty()).assertFalse();
        let c3: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        c3.updateCapacity(1000);
        expect(c3.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_IS_EMPTY_0050
     * @tc.name testLruCacheIsEmpty005
     * @tc.desc Merged batch (5 tests): [1] Verify isEmpty returns false with object-typed keys and after overwrite | [2] Verify isEmpty for string keys with special content (empty, CJK, emoji, numeric) | [3] Veri...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIsEmpty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isEmpty returns false with object-typed keys and after overwrite ---
      {
        let c1: util.LRUCache<Date, string> = new util.LRUCache<Date, string>();
        c1.put(new Date(0), 'a');
        expect(c1.isEmpty()).assertFalse();
        let c2: util.LRUCache<string, EmptyKV> = new util.LRUCache<string, EmptyKV>();
        let rec: EmptyKV = { a: 1, b: 'x' };
        c2.put('k', rec);
        expect(c2.isEmpty()).assertFalse();
        let c3: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 10; i++) { c3.put(9, i); }
        expect(c3.isEmpty()).assertFalse();
        expect(c3.length).assertEqual(1);
        c3.remove(9);
        expect(c3.isEmpty()).assertTrue();
      }

      // --- [2] Verify isEmpty for string keys with special content (empty, CJK, emoji, numeric) ---
      {
        let c1: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        c1.put('', 1);
        expect(c1.isEmpty()).assertFalse();
        c1.remove('');
        expect(c1.isEmpty()).assertTrue();
        let c2: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        c2.put('你好', 1); c2.put('😀', 2);
        expect(c2.isEmpty()).assertFalse();
        c2.clear();
        expect(c2.isEmpty()).assertTrue();
        let c3: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        c3.put('123', 1);
        expect(c3.isEmpty()).assertFalse();
      }

      // --- [3] Verify isEmpty for bigint values and boolean keys ---
      {
        let c1: util.LRUCache<int, bigint> = new util.LRUCache<int, bigint>();
        c1.put(1, 100n);
        expect(c1.isEmpty()).assertFalse();
        c1.remove(1);
        expect(c1.isEmpty()).assertTrue();
        let c2: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>();
        c2.put(true, false); c2.put(false, true);
        expect(c2.isEmpty()).assertFalse();
        c2.clear();
        expect(c2.isEmpty()).assertTrue();
      }

      // --- [4] Verify two independent caches have independent isEmpty states ---
      {
        let a: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let b: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(a.isEmpty()).assertTrue();
        expect(b.isEmpty()).assertTrue();
        a.put(1, 10);
        expect(a.isEmpty()).assertFalse();
        expect(b.isEmpty()).assertTrue();
        b.put(1, 20);
        expect(a.isEmpty()).assertFalse();
        expect(b.isEmpty()).assertFalse();
        a.clear();
        expect(a.isEmpty()).assertTrue();
        expect(b.isEmpty()).assertFalse();
      }

      // --- [5] Verify isEmpty with enum member keys and negative/fractional double keys ---
      {
        let c1: util.LRUCache<EmptySlot, int> = new util.LRUCache<EmptySlot, int>();
        c1.put(EmptySlot.First, 1);
        expect(c1.isEmpty()).assertFalse();
        c1.put(EmptySlot.Second, 2);
        expect(c1.isEmpty()).assertFalse();
        c1.clear();
        expect(c1.isEmpty()).assertTrue();
        let c2: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        c2.put(-0.5, 1); c2.put(0.25, 2);
        expect(c2.isEmpty()).assertFalse();
        c2.remove(-0.5); c2.remove(0.25);
        expect(c2.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_IS_EMPTY_0060
     * @tc.name testLruCacheIsEmpty006
     * @tc.desc Merged batch (3 tests): [1] Verify isEmpty for capacity 1 put-remove cycle and large capacity fill | [2] Verify isEmpty for createDefault with string and int keys independently | [3] Verify isEmpty...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheIsEmpty006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isEmpty for capacity 1 put-remove cycle and large capacity fill ---
      {
        let c1: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        for (let i: int = 0; i < 5; i++) {
          c1.put(i, i);
          expect(c1.isEmpty()).assertFalse();
          c1.remove(i);
          expect(c1.isEmpty()).assertTrue();
        }
        let c2: util.LRUCache<int, int> = new util.LRUCache<int, int>(100);
        for (let i: int = 0; i < 100; i++) { c2.put(i, i); }
        expect(c2.isEmpty()).assertFalse();
        for (let i: int = 0; i < 100; i++) { c2.remove(i); }
        expect(c2.isEmpty()).assertTrue();
      }

      // --- [2] Verify isEmpty for createDefault with string and int keys independently ---
      {
        let c1: EmptyDefInt = new EmptyDefInt();
        c1.get(1); c1.get(2); c1.get(3);
        expect(c1.isEmpty()).assertFalse();
        c1.remove(1); c1.remove(2); c1.remove(3);
        expect(c1.isEmpty()).assertTrue();
        let c2: ConstDefaultCache = new ConstDefaultCache();
        c2.get('a'); c2.get('b');
        expect(c2.isEmpty()).assertFalse();
        c2.clear();
        expect(c2.isEmpty()).assertTrue();
      }

      // --- [3] Verify isEmpty for while-loop draining and non-sequential removal ---
      {
        let c: util.LRUCache<int, int> = new util.LRUCache<int, int>(8);
        c.put(1, 10); c.put(2, 20); c.put(3, 30); c.put(4, 40);
        let sum: int = 0;
        while (!c.isEmpty()) {
          let ks: Array<int> = c.keys();
          let v: int | undefined = c.remove(ks[0]);
          if (v !== undefined) {
            sum += v;
          }
        }
        expect(c.isEmpty()).assertTrue();
        expect(sum).assertEqual(100);
        let c2: util.LRUCache<int, int> = new util.LRUCache<int, int>(8);
        c2.put(1, 1); c2.put(2, 2); c2.put(3, 3); c2.put(4, 4); c2.put(5, 5);
        c2.remove(3); c2.remove(1); c2.remove(5); c2.remove(2); c2.remove(4);
        expect(c2.isEmpty()).assertTrue();
      }
    });

  });
}
