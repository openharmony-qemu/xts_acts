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

import { util } from '@kit.ArkTS';
import { beforeAll, beforeEach, afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

const BIGINT_LRU_KEYS: Array<bigint> = [
  1n, -1n, 0n, 123n, -999n, 99999999999999999999n, -99999999999999999999n,
  9223372036854775807n, -9223372036854775808n, 0x10n, 0b101n,
  18446744073709551616n, -18446744073709551616n, 4294967296n, 65536n,
  9007199254740991n, -9007199254740991n, 123456789012345678901234567890n,
];

const BIGINT_LRU_VALUES: Array<bigint> = [
  10n, -10n, 0n, 456n, -888n, 88888888888888888888n, -88888888888888888888n,
  9223372036854775806n, -9223372036854775807n, 0x20n, 0b110n,
  18446744073709551617n, -18446744073709551615n, 4294967297n, 65537n,
  9007199254740990n, -9007199254740990n, 987654321098765432109876543210n,
  BigInt('9007199254740991'), BigInt(Number.MAX_SAFE_INTEGER), BigInt('0'),
];

export default function lruCacheBigintTest() {
  describe('LruCacheBigintTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.name testLruCacheBigintTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BIGINT_TEST_0100
     * @tc.desc Verify constructor, getCapacity, length and isEmpty with bigint keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBigintTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>();
      expect(emptyCache.length).assertEqual(0);
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const cache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>(2);
      cache.put(BIGINT_LRU_KEYS[0], BIGINT_LRU_VALUES[0]);
      cache.put(BIGINT_LRU_KEYS[8], BIGINT_LRU_VALUES[8]);
      expect(cache.length).assertEqual(2);
      expect(cache.isEmpty()).assertFalse();

      const evictCache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>(1);
      evictCache.put(BIGINT_LRU_KEYS[0], BIGINT_LRU_VALUES[0]);
      evictCache.put(BIGINT_LRU_KEYS[1], BIGINT_LRU_VALUES[1]);
      expect(evictCache.length).assertEqual(1);
    });

    /**
     * @tc.name testLruCacheBigintTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BIGINT_TEST_0200
     * @tc.desc Verify put, get, contains and remove with bigint keys including boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBigintTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>();

      const putResult: bigint = cache.put(BIGINT_LRU_KEYS[0], BIGINT_LRU_VALUES[0]);
      expect(putResult).assertEqual(BIGINT_LRU_VALUES[0]);

      cache.put(BIGINT_LRU_KEYS[7], BIGINT_LRU_VALUES[7]);
      expect(cache.get(BIGINT_LRU_KEYS[7])).assertEqual(BIGINT_LRU_VALUES[7]);

      cache.put(BIGINT_LRU_KEYS[11], BIGINT_LRU_VALUES[11]);
      expect(cache.get(BIGINT_LRU_KEYS[11])).assertEqual(BIGINT_LRU_VALUES[11]);

      expect(cache.contains(BIGINT_LRU_KEYS[2])).assertFalse();

      const removed: bigint | undefined = cache.remove(BIGINT_LRU_KEYS[0]);
      expect(removed).assertEqual(BIGINT_LRU_VALUES[0]);
      expect(cache.remove(BIGINT_LRU_KEYS[4])).assertUndefined();
    });

    /**
     * @tc.name testLruCacheBigintTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BIGINT_TEST_0300
     * @tc.desc Verify duplicate key overwrite, eviction and updateCapacity with bigint entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBigintTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>(4);
      cache.put(BIGINT_LRU_KEYS[0], BIGINT_LRU_VALUES[0]);
      cache.put(BIGINT_LRU_KEYS[0], BIGINT_LRU_VALUES[3]);
      expect(cache.length).assertEqual(1);
      expect(cache.get(BIGINT_LRU_KEYS[0])).assertEqual(BIGINT_LRU_VALUES[3]);

      cache.put(BIGINT_LRU_KEYS[1], BIGINT_LRU_VALUES[1]);
      cache.put(BIGINT_LRU_KEYS[2], BIGINT_LRU_VALUES[2]);
      cache.put(BIGINT_LRU_KEYS[3], BIGINT_LRU_VALUES[3]);
      cache.put(BIGINT_LRU_KEYS[4], BIGINT_LRU_VALUES[4]);
      expect(cache.length).assertEqual(4);
      expect(cache.contains(BIGINT_LRU_KEYS[0])).assertFalse();
      expect(cache.getRemovalCount()).assertEqual(1);

      cache.updateCapacity(2);
      expect(cache.getCapacity()).assertEqual(2);
      expect(cache.length).assertEqual(2);

      cache.updateCapacity(16);
      expect(cache.getCapacity()).assertEqual(16);
    });

    /**
     * @tc.name testLruCacheBigintTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BIGINT_TEST_0400
     * @tc.desc Verify keys and values access order plus clear with bigint entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBigintTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>(8);
      cache.put(BIGINT_LRU_KEYS[0], BIGINT_LRU_VALUES[0]);
      cache.put(BIGINT_LRU_KEYS[1], BIGINT_LRU_VALUES[1]);
      cache.put(BIGINT_LRU_KEYS[2], BIGINT_LRU_VALUES[2]);

      const initialKeys: Array<bigint> = cache.keys();
      expect(initialKeys[0]).assertEqual(BIGINT_LRU_KEYS[0]);

      cache.get(BIGINT_LRU_KEYS[0]);
      const accessedKeys: Array<bigint> = cache.keys();
      expect(accessedKeys[2]).assertEqual(BIGINT_LRU_KEYS[0]);

      const accessedValues: Array<bigint> = cache.values();
      expect(accessedValues[2]).assertEqual(BIGINT_LRU_VALUES[0]);

      cache.clear();
      expect(cache.length).assertEqual(0);
      expect(cache.isEmpty()).assertTrue();
    });

    /**
     * @tc.name testLruCacheBigintTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BIGINT_TEST_0500
     * @tc.desc Verify entries and for-of iteration with bigint entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBigintTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>(8);
      cache.put(BIGINT_LRU_KEYS[0], BIGINT_LRU_VALUES[0]);
      cache.put(BIGINT_LRU_KEYS[1], BIGINT_LRU_VALUES[1]);

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0]).assertEqual(BIGINT_LRU_KEYS[0]);
      expect(firstPair.value[1]).assertEqual(BIGINT_LRU_VALUES[0]);

      let iteratedCount: number = 0;
      let lastKey: bigint = 0n;
      for (const pair of cache) {
        iteratedCount++;
        lastKey = pair[0];
      }
      expect(iteratedCount).assertEqual(2);
      expect(lastKey).assertEqual(BIGINT_LRU_KEYS[1]);
    });

    /**
     * @tc.name testLruCacheBigintTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BIGINT_TEST_0600
     * @tc.desc Verify count statistics, toString and createDefault with bigint keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBigintTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>(8);
      expect(cache.createDefault(BIGINT_LRU_KEYS[0])).assertUndefined();

      cache.put(BIGINT_LRU_KEYS[0], BIGINT_LRU_VALUES[0]);
      cache.get(BIGINT_LRU_KEYS[0]);
      expect(cache.getPutCount()).assertEqual(1);
      expect(cache.getMatchCount()).assertEqual(1);

      cache.get(BIGINT_LRU_KEYS[3]);
      expect(cache.getMissCount()).assertEqual(1);

      const text: string = cache.toString();
      expect(text.includes('maxSize = 8')).assertTrue();
      expect(text.includes('hits = 1')).assertTrue();
      expect(text.includes('misses = 1')).assertTrue();

      class ChildBigintLruCache extends util.LRUCache<bigint, bigint> {
        createDefault(key: bigint): bigint {
          return key;
        }
      }
      const childCache: ChildBigintLruCache = new ChildBigintLruCache();
      expect(childCache.get(BIGINT_LRU_KEYS[5])).assertEqual(BIGINT_LRU_KEYS[5]);
      expect(childCache.getCreateCount()).assertEqual(1);
    });

    /**
     * @tc.name testLruCacheBigintTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BIGINT_TEST_0700
     * @tc.desc Verify safe-integer boundary and snowflake-scale bigint keys as distinct entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBigintTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>(8);
      cache.put(BIGINT_LRU_KEYS[15], BIGINT_LRU_VALUES[15]);
      cache.put(BIGINT_LRU_KEYS[16], BIGINT_LRU_VALUES[16]);
      cache.put(BIGINT_LRU_KEYS[17], BIGINT_LRU_VALUES[17]);
      expect(cache.length).assertEqual(3);

      expect(cache.get(BIGINT_LRU_KEYS[15])).assertEqual(BIGINT_LRU_VALUES[15]);
      expect(cache.get(BIGINT_LRU_KEYS[16])).assertEqual(BIGINT_LRU_VALUES[16]);
      expect(cache.get(BIGINT_LRU_KEYS[17])).assertEqual(BIGINT_LRU_VALUES[17]);

      expect(cache.contains(9007199254740991n)).assertTrue();
      expect(cache.contains(9007199254740992n)).assertFalse();

      const removed: bigint | undefined = cache.remove(BIGINT_LRU_KEYS[17]);
      expect(removed).assertEqual(BIGINT_LRU_VALUES[17]);
      expect(cache.length).assertEqual(2);
    });
  });
}
