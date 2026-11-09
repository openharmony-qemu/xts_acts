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

class IdKeyObjA {
  id: int;
  constructor(id: int) {
    this.id = id;
  }
}

class EmptyKeyObj {
  id: int = 0;
}

class ChildDefaultLRU extends util.LRUCache<int, int> {
  constructor() {
    super();
  }
  createDefault(key: int): int {
    return key;
  }
}

class ChildCreateThrows extends util.LRUCache<int, int> {
  constructor() {
    super();
  }
  createDefault(key: int): int {
    throw new Error('boom');
  }
}

enum ConSlot {
  First = 0,
  Second = 1
}

export default function lruCacheContainsTest(): void {
  describe('LruCacheContainsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0010
     * @tc.name testLruCacheContains001
     * @tc.desc Merged batch (5 tests): [1] Verify contains returns true for an int key derived by an expression and for the equal literal key | [2] Verify contains on empty cache returns false for single int key ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains returns true for an int key derived by an expression and for the equal literal key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let base: int = 2;
        let key: int = base * 2;
        cache.put(key, 100);
        expect(cache.contains(key)).assertTrue();
        expect(cache.contains(base * 2)).assertTrue();
        expect(cache.get(4)).assertEqual(100);
      }

      // --- [2] Verify contains on empty cache returns false for single int key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let result: boolean = cache.contains(1);
        expect(result).assertFalse();
      }

      // --- [3] Verify contains returns true for single int array key by same reference ---
      {
        let key: int[] = [1, 2, 3];
        let cache: util.LRUCache<int[], int> = new util.LRUCache<int[], int>();
        cache.put(key, 1);
        let result: boolean = cache.contains(key);
        expect(result).assertTrue();
      }

      // --- [4] Verify contains returns false for ordinary absent key 3 when key 2 stored ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        let result: boolean = cache.contains(3);
        expect(result).assertFalse();
      }

      // --- [5] Verify contains returns false for opposite boolean key false when true stored ---
      {
        let cache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache.put(true, 100);
        let result: boolean = cache.contains(false);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0020
     * @tc.name testLruCacheContains002
     * @tc.desc Merged batch (5 tests): [1] Verify contains returns true for padded string key with leading and trailing spaces stored | [2] Verify contains returns true for Uint8Array key by same reference | [3] ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains returns true for padded string key with leading and trailing spaces stored ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = " key ";
        cache.put(key, 100);
        let probe: boolean = cache.contains(key);
        expect(probe).assertTrue();
        expect(cache.length).assertEqual(1);
      }

      // --- [2] Verify contains returns true for Uint8Array key by same reference ---
      {
        let key: Uint8Array = new Uint8Array([1, 2, 3]);
        let cache: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        cache.put(key, 100);
        let result: boolean = cache.contains(key);
        expect(result).assertTrue();
      }

      // --- [3] Verify contains returns true for sole key in capacity 1 cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(2, 10);
        let result: boolean = cache.contains(2);
        expect(result).assertTrue();
      }

      // --- [4] Verify contains returns false for evicted key after second put in capacity 1 cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(2, 10);
        cache.put(3, 20);
        let result: boolean = cache.contains(2);
        expect(result).assertFalse();
      }

      // --- [5] Verify contains returns true for newest key after eviction and length stays one in capacity 1 cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(2, 10);
        cache.put(3, 20);
        let result: boolean = cache.contains(3);
        expect(result).assertTrue();
        expect(cache.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0030
     * @tc.name testLruCacheContains003
     * @tc.desc Merged batch (5 tests): [1] Verify contains returns true for key whose value was overwritten | [2] Verify contains returns false for key removed from cache | [3] Verify contains returns true for ke...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains returns true for key whose value was overwritten ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.put(2, 20);
        let result: boolean = cache.contains(2);
        expect(result).assertTrue();
      }

      // --- [2] Verify contains returns false for key removed from cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.remove(2);
        let result: boolean = cache.contains(2);
        expect(result).assertFalse();
      }

      // --- [3] Verify contains returns true for key re-put after removal ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.remove(2);
        cache.put(2, 20);
        let result: boolean = cache.contains(2);
        expect(result).assertTrue();
      }

      // --- [4] Verify contains returns false for former key after clear empties cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.clear();
        let result: boolean = cache.contains(2);
        expect(result).assertFalse();
      }

      // --- [5] Verify contains returns true for each of three keys put in a loop ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let all: boolean = true;
        let i: int;
        for (i = 1; i <= 3; i++) {
          all = all && cache.contains(i);
        }
        expect(all).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0040
     * @tc.name testLruCacheContains004
     * @tc.desc Merged batch (5 tests): [1] Verify contains matches the decomposed e plus combining acute key but rejects the canonically equivalent precomposed key | [2] Verify contains returns true for key acces...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains matches the decomposed e plus combining acute key but rejects the canonically equivalent precomposed key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('e\u0301', 10);
        let decomposed: boolean = cache.contains('e\u0301');
        expect(decomposed).assertTrue();
        let composed: boolean = cache.contains('\u00E9');
        expect(composed).assertFalse();
        expect(cache.length).assertEqual(1);
      }

      // --- [2] Verify contains returns true for key accessed via get ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.get(2);
        let result: boolean = cache.contains(2);
        expect(result).assertTrue();
      }

      // --- [3] Verify contains still returns true for LRU-far key after accessing other key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.get(2);
        let result: boolean = cache.contains(1);
        expect(result).assertTrue();
      }

      // --- [4] Verify contains returns false for evicted key after updateCapacity shrinks cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(2, 10);
        cache.put(3, 20);
        cache.updateCapacity(1);
        let result: boolean = cache.contains(2);
        expect(result).assertFalse();
      }

      // --- [5] Verify contains returns true for trailing key 3 in cache of three keys ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let result: boolean = cache.contains(3);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0050
     * @tc.name testLruCacheContains005
     * @tc.desc Merged batch (5 tests): [1] Verify contains returns true for each of 64 keys filling default capacity cache | [2] Verify contains hit and miss each keep cache length unchanged | [3] Verify contains...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains returns true for each of 64 keys filling default capacity cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let i: int;
        for (i = 0; i < 64; i++) {
          cache.put(i, i);
        }
        let all: boolean = true;
        for (i = 0; i < 64; i++) {
          all = all && cache.contains(i);
        }
        expect(all).assertTrue();
      }

      // --- [2] Verify contains hit and miss each keep cache length unchanged ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        let before: int = cache.length;
        cache.contains(2);
        cache.contains(99);
        let after: int = cache.length;
        expect(after).assertEqual(before);
      }

      // --- [3] Verify contains on empty cache leaves length at 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.contains(1);
        let len: int = cache.length;
        expect(len).assertEqual(0);
      }

      // --- [4] Verify contains hit keeps capacity 1 cache length equal to an identical cache with no hit ---
      {
        let reference: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        let probed: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        reference.put(2, 10);
        probed.put(2, 10);
        expect(probed.contains(2)).assertTrue();
        expect(probed.length).assertEqual(reference.length);
        expect(probed.length).assertEqual(1);
      }

      // --- [5] Verify contains hit moves the key to the MRU position in keys ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.contains(2);
        let klist: Array<int> = cache.keys();
        expect(klist.length).assertEqual(3);
        expect(klist[0]).assertEqual(1);
        expect(klist[1]).assertEqual(3);
        expect(klist[2]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0060
     * @tc.name testLruCacheContains006
     * @tc.desc Merged batch (5 tests): [1] Verify contains hit moves the entry to the MRU position in values | [2] Verify contains hit and miss are reflected in toString hits and misses counts | [3] Verify contai...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains hit moves the entry to the MRU position in values ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.contains(1);
        let vlist: Array<int> = cache.values();
        expect(vlist.length).assertEqual(3);
        expect(vlist[0]).assertEqual(20);
        expect(vlist[1]).assertEqual(30);
        expect(vlist[2]).assertEqual(10);
      }

      // --- [2] Verify contains hit and miss are reflected in toString hits and misses counts ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.contains(2);
        cache.contains(99);
        expect(cache.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 1, hitRate = 50% ]');
      }

      // --- [3] Verify contains miss introduces no insertion side effect as second contains still returns false ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        cache.contains(5);
        let again: boolean = cache.contains(5);
        expect(again).assertFalse();
      }

      // --- [4] Verify contains twice on same hit key returns consistent true ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        let first: boolean = cache.contains(2);
        let second: boolean = cache.contains(2);
        let same: boolean = first === second;
        expect(same).assertTrue();
        expect(first).assertTrue();
      }

      // --- [5] Verify contains twice on same miss key returns consistent false ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        let first: boolean = cache.contains(99);
        let second: boolean = cache.contains(99);
        let same: boolean = first === second;
        expect(same).assertTrue();
        expect(first).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0070
     * @tc.name testLruCacheContains007
     * @tc.desc Merged batch (5 tests): [1] Verify contains result flips from false to true after key is put | [2] Verify boolean expression combining two present keys with and returns true | [3] Verify boolean ex...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains result flips from false to true after key is put ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let before: boolean = cache.contains(6);
        cache.put(6, 60);
        let after: boolean = cache.contains(6);
        expect(before).assertFalse();
        expect(after).assertTrue();
      }

      // --- [2] Verify boolean expression combining two present keys with and returns true ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let both: boolean = cache.contains(1) && cache.contains(2);
        expect(both).assertTrue();
      }

      // --- [3] Verify boolean expression combining a present and an absent key returns false ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let both: boolean = cache.contains(1) && cache.contains(99);
        expect(both).assertFalse();
      }

      // --- [4] Verify negated contains of an unadded key returns true ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let notPresent: boolean = !cache.contains(5);
        expect(notPresent).assertTrue();
      }

      // --- [5] Verify contains result in ternary expression selects branch 1 on hit ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(2, 10);
        let flag: boolean = cache.contains(2);
        let value: int = flag ? 1 : 0;
        expect(value).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0080
     * @tc.name testLruCacheContains008
     * @tc.desc Merged batch (5 tests): [1] Verify contains returns true for key passed through a variable | [2] Verify contains used as a loop condition ends the fill loop once the probed key is present | [3] Ver...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains returns true for key passed through a variable ---
      {
        let key: int = 8;
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(key, 80);
        let result: boolean = cache.contains(key);
        expect(result).assertTrue();
      }

      // --- [2] Verify contains used as a loop condition ends the fill loop once the probed key is present ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let target: int = 3;
        let nextKey: int = 1;
        while (!cache.contains(target)) {
          cache.put(nextKey, nextKey * 10);
          nextKey++;
        }
        expect(nextKey).assertEqual(4);
        expect(cache.contains(target)).assertTrue();
        expect(cache.get(target)).assertEqual(30);
        expect(cache.length).assertEqual(3);
      }

      // --- [3] Verify contains still returns true for key promoted by get hit ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.get(1);
        let r: boolean = pro.contains(1);
        expect(r).assertTrue();
      }

      // --- [4] Verify contains with null key throws BusinessError on a nullable-key cache ---
      {
        let pro: util.LRUCache<string | null, int> = new util.LRUCache<string | null, int>();
        pro.put('a', 1);
        try {
          pro.contains(null);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }

      // --- [5] Verify contains with undefined key throws BusinessError on a nullable-key cache ---
      {
        let pro: util.LRUCache<string | undefined, int> = new util.LRUCache<string | undefined, int>();
        pro.put('a', 1);
        try {
          pro.contains(undefined);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0090
     * @tc.name testLruCacheContains009
     * @tc.desc Merged batch (5 tests): [1] Verify rejected null key put throws BusinessError leaving key a still contained | [2] Verify contains 2.0 returns true when double key 2 is stored | [3] Verify contains ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify rejected null key put throws BusinessError leaving key a still contained ---
      {
        let pro: util.LRUCache<string | null, int> = new util.LRUCache<string | null, int>();
        pro.put('a', 1);
        try {
          pro.put(null, 5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(pro.contains('a')).assertTrue();
      }

      // --- [2] Verify contains 2.0 returns true when double key 2 is stored ---
      {
        let cache: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        cache.put(2, 10);
        expect(cache.contains(2.0)).assertTrue();
        expect(cache.get(2)).assertEqual(10);
      }

      // --- [3] Verify contains 2.5 returns false when double key 2 is stored ---
      {
        let pro: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        pro.put(2, 10);
        let r: boolean = pro.contains(2.5);
        expect(r).assertFalse();
      }

      // --- [4] Verify contains 3.14 returns true for stored double key 3.14 ---
      {
        let cache: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        let key: double = 3.14;
        cache.put(key, 10);
        expect(cache.contains(key)).assertTrue();
      }

      // --- [5] Verify contains returns true for RegExp key by same reference ---
      {
        let pro: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        let regexKey: RegExp = new RegExp('a');
        pro.put(regexKey, 10);
        let r: boolean = pro.contains(regexKey);
        expect(r).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0100
     * @tc.name testLruCacheContains010
     * @tc.desc Merged batch (5 tests): [1] Verify contains miss returns false on subclass whose createDefault throws without triggering callback | [2] Verify contains hit does not trigger createDefault keeping ge...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains miss returns false on subclass whose createDefault throws without triggering callback ---
      {
        let pro: ChildCreateThrows = new ChildCreateThrows();
        pro.put(1, 10);
        let r: boolean = pro.contains(2);
        expect(r).assertFalse();
      }

      // --- [2] Verify contains hit does not trigger createDefault keeping getCreateCount at 0 ---
      {
        let pro: ChildDefaultLRU = new ChildDefaultLRU();
        pro.put(1, 10);
        pro.contains(1);
        let n: long = pro.getCreateCount();
        expect(n).assertEqual(0);
      }

      // --- [3] Verify contains returns false for evicted key and true for new key in full capacity 2 cache ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);

        let result1: boolean = pro.contains(1);
        expect(result1).assertFalse();
        let result2: boolean = pro.contains(3);
        expect(result2).assertTrue();
      }

      // --- [4] Verify contains returns false for an unstored bigint key BigInt(11) in a <bigint,int> cache ---
      {
        let pro: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
            pro.put(BigInt(10), 10);
            let r: boolean = pro.contains(BigInt(11));
            expect(r).assertFalse();
      }

      // --- [5] Verify contains returns false for the earliest key evicted when 65 keys overflow the default capacity 64 cache ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let i: int;
        for (i = 0; i <= 64; i++) {
          pro.put(i, i * 10);
        }
        expect(pro.contains(0)).assertFalse();
        expect(pro.contains(1)).assertTrue();
        expect(pro.contains(64)).assertTrue();
        expect(pro.length).assertEqual(64);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0110
     * @tc.name testLruCacheContains011
     * @tc.desc Merged batch (5 tests): [1] Verify contains reports only the newest 3 keys of a sliding window in a capacity 3 cache after 6 puts | [2] Verify contains returns false for the LRU key evicted when up...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains reports only the newest 3 keys of a sliding window in a capacity 3 cache after 6 puts ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        let i: int;
        for (i = 0; i <= 5; i++) {
          pro.put(i, i);
        }
        expect(pro.contains(0)).assertFalse();
        expect(pro.contains(1)).assertFalse();
        expect(pro.contains(2)).assertFalse();
        expect(pro.contains(3)).assertTrue();
        expect(pro.contains(4)).assertTrue();
        expect(pro.contains(5)).assertTrue();
        expect(pro.length).assertEqual(3);
      }

      // --- [2] Verify contains returns false for the LRU key evicted when updateCapacity shrinks a capacity 3 cache to 2 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.updateCapacity(2);
        expect(pro.contains(1)).assertFalse();
        expect(pro.contains(2)).assertTrue();
        expect(pro.contains(3)).assertTrue();
      }

      // --- [3] Verify a previously evicted key becomes present again after being re-put and causes eviction of the current LRU key ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.put(1, 10);
        expect(pro.contains(1)).assertTrue();
        expect(pro.contains(3)).assertTrue();
        expect(pro.contains(2)).assertFalse();
        expect(pro.length).assertEqual(2);
      }

      // --- [4] Verify contains still returns true for the remaining two keys after the middle key is removed from a three-key cache ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.remove(2);
        expect(pro.contains(1)).assertTrue();
        expect(pro.contains(3)).assertTrue();
        expect(pro.contains(2)).assertFalse();
        expect(pro.length).assertEqual(2);
      }

      // --- [5] Verify after clear a reused cache contains only a newly re-put key and none of the former keys ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.clear();
        pro.put(3, 30);
        expect(pro.contains(3)).assertTrue();
        expect(pro.contains(1)).assertFalse();
        expect(pro.contains(2)).assertFalse();
        expect(pro.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0120
     * @tc.name testLruCacheContains012
     * @tc.desc Merged batch (5 tests): [1] Verify two independent caches holding the same int key do not affect each other's contains results | [2] Verify contains returns true for a class instance key by referen...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two independent caches holding the same int key do not affect each other's contains results ---
      {
        let proA: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let proB: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        proA.put(1, 10);
        expect(proB.contains(1)).assertFalse();
        proB.put(1, 100);
        expect(proB.contains(1)).assertTrue();
        expect(proA.contains(1)).assertTrue();
        expect(proA.length).assertEqual(1);
        expect(proB.length).assertEqual(1);
        proA.clear();
        expect(proA.contains(1)).assertFalse();
        expect(proB.contains(1)).assertTrue();
      }

      // --- [2] Verify contains returns true for a class instance key by reference even after its field is mutated after put ---
      {
        let k: IdKeyObjA = new IdKeyObjA(1);
        let pro: util.LRUCache<IdKeyObjA, int> = new util.LRUCache<IdKeyObjA, int>();
        pro.put(k, 10);
        k.id = 99;
        expect(pro.contains(k)).assertTrue();
        let otherKey: IdKeyObjA = new IdKeyObjA(99);
        expect(pro.contains(otherKey)).assertFalse();
      }

      // --- [3] Verify repeated contains hits and misses accumulate in getMatchCount and getMissCount without inserting and without corrupting contents ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        expect(pro.contains(2)).assertTrue();
        expect(pro.contains(2)).assertTrue();
        expect(pro.contains(99)).assertFalse();
        expect(pro.contains(100)).assertFalse();
        let match: long = pro.getMatchCount();
        let miss: long = pro.getMissCount();
        expect(match).assertEqual(2);
        expect(miss).assertEqual(2);
        expect(pro.getPutCount()).assertEqual(3);
        expect(pro.getRemovalCount()).assertEqual(0);
        expect(pro.length).assertEqual(3);
        expect(pro.contains(1)).assertTrue();
        expect(pro.contains(3)).assertTrue();
      }

      // --- [4] Verify contains result combined with OR is true when either operand is a hit and false only when both are misses ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        let disj: boolean = pro.contains(1) || pro.contains(99);
        expect(disj).assertTrue();
        let neither: boolean = pro.contains(8) || pro.contains(99);
        expect(neither).assertFalse();
      }

      // --- [5] Verify contains still returns true and the cache keeps a single entry when the sole key is overwritten at capacity 1 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        pro.put(1, 10);
        pro.put(1, 20);
        expect(pro.contains(1)).assertTrue();
        expect(pro.length).assertEqual(1);
        let v: int | undefined = pro.get(1);
        expect(v).assertEqual(20);
        expect(pro.contains(99)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0130
     * @tc.name testLruCacheContains013
     * @tc.desc Merged batch (5 tests): [1] Verify toString after a single contains hit reports hits 1, misses 0 and hitRate 100 percent | [2] Verify contains misses on an empty double cache before the NaN key is ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify toString after a single contains hit reports hits 1, misses 0 and hitRate 100 percent ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(2, 10);
        pro.contains(2);
        expect(pro.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 0, hitRate = 100% ]');
      }

      // --- [2] Verify contains misses on an empty double cache before the NaN key is stored and hits afterwards ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        expect(cache.contains(Double.NaN)).assertFalse();
        cache.put(Double.NaN, 5);
        expect(cache.contains(Double.NaN)).assertTrue();
        expect(cache.get(Double.NaN)).assertEqual(5);
      }

      // --- [3] Verify contains returns true for the zero key when negative zero was the stored key ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache.put(-0.0, 7);
        expect(cache.contains(0.0)).assertTrue();
        expect(cache.get(0.0)).assertEqual(7);
      }

      // --- [4] Verify contains returns true for the minimum long key stored ---
      {
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let minLong: long = -9223372036854775807 - 1;
        cache.put(minLong, 3);
        expect(cache.contains(minLong)).assertTrue();
        expect(cache.contains(minLong + 1)).assertFalse();
      }

      // --- [5] Verify contains is true only for the stored enum member of two ---
      {
        let cache: util.LRUCache<ConSlot, int> = new util.LRUCache<ConSlot, int>(2);
        cache.put(ConSlot.First, 1);
        expect(cache.contains(ConSlot.First)).assertTrue();
        expect(cache.contains(ConSlot.Second)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0140
     * @tc.name testLruCacheContains014
     * @tc.desc Merged batch (5 tests): [1] Verify three one-character invisible keys NUL zero width space and byte order mark are all present at capacity three | [2] Verify a contains hit promotes the key so the ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three one-character invisible keys NUL zero width space and byte order mark are all present at capacity three ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(3);
        cache.put('\u0000', 1);
        cache.put('\u200B', 2);
        cache.put('\uFEFF', 3);
        expect(cache.length).assertEqual(3);
        expect(cache.contains('\uFEFF')).assertTrue();
        expect(cache.contains('\u200B')).assertTrue();
        expect(cache.contains('\u0000')).assertTrue();
      }

      // --- [2] Verify a contains hit promotes the key so the untouched sibling becomes the overflow victim ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.contains(1)).assertTrue();
        cache.put(3, 30);
        expect(cache.contains(2)).assertFalse();
        expect(cache.contains(1)).assertTrue();
        expect(cache.contains(3)).assertTrue();
      }

      // --- [3] Verify contains matches a cache instance key by reference and misses a lookalike instance ---
      {
        let realKey: util.LRUCache<string, int> = new util.LRUCache<string, int>(2);
        realKey.put('k', 1);
        let lookalike: util.LRUCache<string, int> = new util.LRUCache<string, int>(2);
        lookalike.put('k', 1);
        let pool: util.LRUCache<util.LRUCache<string, int>, int> =
          new util.LRUCache<util.LRUCache<string, int>, int>(3);
        pool.put(realKey, 7);
        expect(pool.contains(realKey)).assertTrue();
        expect(pool.contains(lookalike)).assertFalse();
        expect(pool.getMatchCount()).assertEqual(1);
        expect(pool.getMissCount()).assertEqual(1);
      }

      // --- [4] Verify contains returns true for various int boundary keys (0, ±1, 2, 65536, INT_MAX, INT_MIN) ---
      {
        let keys: int[] = [0, -1, 2, 65536, 2147483647, -2147483648, -2147483647];
        for (let i: int = 0; i < keys.length; i++) {
          let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
          cache.put(keys[i], 100);
          expect(cache.contains(keys[i])).assertTrue();
          expect(cache.get(keys[i])).assertEqual(100);
        }
      }

      // --- [5] Verify contains returns true for bigint keys (0n, 1n, -1n, 2n, max, min) ---
      {
        let keys: bigint[] = [0n, 1n, -1n, 2n, 9223372036854775807n, -9223372036854775808n];
        for (let i: int = 0; i < keys.length; i++) {
          let cache: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
          cache.put(keys[i], 100);
          expect(cache.contains(keys[i])).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0150
     * @tc.name testLruCacheContains015
     * @tc.desc Merged batch (5 tests): [1] Verify contains returns true for double keys including special values (Infinity, NaN, MAX_VALUE) | [2] Verify contains returns true for boolean keys and false for absent...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains returns true for double keys including special values (Infinity, NaN, MAX_VALUE) ---
      {
        let hitKeys: double[] = [3.5, -0.5, Number.MAX_VALUE, -Number.MAX_VALUE, Number.MIN_VALUE,
          Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY, 0.1 + 0.2];
        for (let i: int = 0; i < hitKeys.length; i++) {
          let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>();
          cache.put(hitKeys[i], 100);
          expect(cache.contains(hitKeys[i])).assertTrue();
        }
        let cache2: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache2.put(1.5, 100);
        expect(cache2.contains(Double.NaN)).assertFalse();
        expect(cache2.contains(0.3)).assertFalse();
      }

      // --- [2] Verify contains returns true for boolean keys and false for absent opposite ---
      {
        let cache1: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache1.put(true, 100);
        expect(cache1.contains(true)).assertTrue();
        expect(cache1.contains(false)).assertFalse();
        let cache2: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        cache2.put(false, 100);
        expect(cache2.contains(false)).assertTrue();
      }

      // --- [3] Verify contains returns true for various string keys (empty, CJK, emoji, NUL, long, hex) ---
      {
        let keys: string[] = ['', 'abc', '你好', '😀', '\u0000', 'KEY', '0x10', 'x'];
        for (let i: int = 0; i < keys.length; i++) {
          let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
          cache.put(keys[i], 100);
          expect(cache.contains(keys[i])).assertTrue();
        }
        let longKey: string = 'a'.repeat(10000);
        let cacheLong: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cacheLong.put(longKey, 1);
        expect(cacheLong.contains(longKey)).assertTrue();
      }

      // --- [4] Verify contains returns false for string keys differing by case, space, or content ---
      {
        let cache1: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache1.put('KEY', 100);
        expect(cache1.contains('key')).assertFalse();
        let cache2: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache2.put(' key ', 100);
        expect(cache2.contains('key')).assertFalse();
        let cache3: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache3.put('10', 100);
        expect(cache3.contains('0x10')).assertFalse();
        let cache4: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache4.put('abc', 100);
        expect(cache4.contains('abd')).assertFalse();
        let cache5: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache5.put('', 100);
        expect(cache5.contains(' ')).assertFalse();
      }

      // --- [5] Verify contains returns true for reference type keys by same reference (class, Date, Array, Map, Set, Error, Int32Array) ---
      {
        let obj: EmptyKeyObj = new EmptyKeyObj();
        let cache1: util.LRUCache<EmptyKeyObj, int> = new util.LRUCache<EmptyKeyObj, int>();
        cache1.put(obj, 100);
        expect(cache1.contains(obj)).assertTrue();
        let d: Date = new Date(0);
        let cache2: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache2.put(d, 100);
        expect(cache2.contains(d)).assertTrue();
        let arr: int[] = [];
        let cache3: util.LRUCache<int[], int> = new util.LRUCache<int[], int>();
        cache3.put(arr, 100);
        expect(cache3.contains(arr)).assertTrue();
        let m: Map<string, int> = new Map<string, int>();
        let cache4: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        cache4.put(m, 100);
        expect(cache4.contains(m)).assertTrue();
        let s: Set<int> = new Set<int>();
        let cache5: util.LRUCache<Set<int>, int> = new util.LRUCache<Set<int>, int>();
        cache5.put(s, 100);
        expect(cache5.contains(s)).assertTrue();
        let e: Error = new Error('test');
        let cache6: util.LRUCache<Error, int> = new util.LRUCache<Error, int>();
        cache6.put(e, 100);
        expect(cache6.contains(e)).assertTrue();
        let ia: Int32Array = new Int32Array(2);
        let cache7: util.LRUCache<Int32Array, int> = new util.LRUCache<Int32Array, int>();
        cache7.put(ia, 100);
        expect(cache7.contains(ia)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONTAINS_0160
     * @tc.name testLruCacheContains016
     * @tc.desc Merged batch (5 tests): [1] Verify contains returns false for reference type keys of same content but different reference | [2] Verify contains returns true for numeric type keys (long max/min, byt...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheContains016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify contains returns false for reference type keys of same content but different reference ---
      {
        let cache1: util.LRUCache<EmptyKeyObj, int> = new util.LRUCache<EmptyKeyObj, int>();
        cache1.put(new EmptyKeyObj(), 100);
        expect(cache1.contains(new EmptyKeyObj())).assertFalse();
        let cache2: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        cache2.put(new Date(0), 100);
        expect(cache2.contains(new Date(0))).assertFalse();
        let cache3: util.LRUCache<int[], int> = new util.LRUCache<int[], int>();
        cache3.put([1, 2], 100);
        expect(cache3.contains([1, 2])).assertFalse();
        let cache4: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        cache4.put(new Map<string, int>(), 100);
        expect(cache4.contains(new Map<string, int>())).assertFalse();
        let cache5: util.LRUCache<Error, int> = new util.LRUCache<Error, int>();
        cache5.put(new Error('boom'), 100);
        expect(cache5.contains(new Error('boom'))).assertFalse();
        let cache6: util.LRUCache<Int32Array, int> = new util.LRUCache<Int32Array, int>();
        cache6.put(new Int32Array(2), 100);
        expect(cache6.contains(new Int32Array(2))).assertFalse();
      }

      // --- [2] Verify contains returns true for numeric type keys (long max/min, byte, short) ---
      {
        let cache1: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        cache1.put(9223372036854775807, 1);
        expect(cache1.contains(9223372036854775807)).assertTrue();
        let cache2: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        cache2.put(-9223372036854775808, 1);
        expect(cache2.contains(-9223372036854775808)).assertTrue();
        let cache3: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache3.put(Int.toByte(5), 1);
        expect(cache3.contains(Int.toByte(5))).assertTrue();
        let cache4: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache4.put(Int.toShort(9), 1);
        expect(cache4.contains(Int.toShort(9))).assertTrue();
      }

      // --- [3] Verify contains returns false for absent int keys out of stored range ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(5, 50);
        expect(cache.contains(-1)).assertFalse();
        expect(cache.contains(-2147483648)).assertFalse();
        expect(cache.contains(2147483647)).assertFalse();
      }

      // --- [4] Verify contains returns false for absent numeric type keys (byte, short, float, double) ---
      {
        let cache1: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache1.put(Int.toByte(5), 1);
        expect(cache1.contains(Int.toByte(6))).assertFalse();
        let cache2: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache2.put(Int.toShort(9), 1);
        expect(cache2.contains(Int.toShort(10))).assertFalse();
        let cache3: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        cache3.put(2.25, 1);
        expect(cache3.contains(2.5)).assertFalse();
      }

      // --- [5] Verify toString after contains hit and miss reports correct counts ---
      {
        let cache1: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache1.put(1, 10);
        cache1.contains(1);
        expect(cache1.toString().indexOf('hits = 1') !== -1).assertTrue();
        expect(cache1.toString().indexOf('hitRate = 100%') !== -1).assertTrue();
        let cache2: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache2.put(1, 10);
        cache2.contains(2);
        expect(cache2.toString().indexOf('misses = 1') !== -1).assertTrue();
        expect(cache2.toString().indexOf('hitRate = 0%') !== -1).assertTrue();
      }
    });

  });
}
