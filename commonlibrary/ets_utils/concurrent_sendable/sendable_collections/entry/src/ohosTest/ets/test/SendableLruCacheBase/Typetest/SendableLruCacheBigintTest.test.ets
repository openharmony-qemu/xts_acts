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

import { ArkTSUtils } from '@kit.ArkTS';
import { beforeAll, beforeEach, afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

const BIGINT_SLRU_KEYS: Array<bigint> = [
  1n,
  -1n,
  0n,
  123n,
  -999n,
  99999999999999999999n,
  -99999999999999999999n,
  9223372036854775807n,
  -9223372036854775808n,
  0x10n,
  0b101n,
  18446744073709551616n,
  -18446744073709551616n,
  4294967296n,
  65536n,
  9007199254740991n,
  -9007199254740991n,
  123456789012345678901234567890n,
];

const BIGINT_SLRU_VALUES: Array<bigint> = [
  10n,
  -10n,
  0n,
  456n,
  -888n,
  88888888888888888888n,
  -88888888888888888888n,
  9223372036854775806n,
  -9223372036854775807n,
  0x20n,
  0b110n,
  18446744073709551617n,
  -18446744073709551615n,
  4294967297n,
  65537n,
  9007199254740990n,
  -9007199254740990n,
  987654321098765432109876543210n,
  BigInt('9007199254740991'),
  BigInt(Number.MAX_SAFE_INTEGER),
  BigInt('0'),
];

export default function sendableLruCacheBigintTest() {
  describe('SendableLruCacheBigintTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testSendableLruCacheBigintTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_BIGINT_TEST_0100
     * @tc.desc Verify constructor, getCapacity and isEmpty with bigint keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheBigintTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: ArkTSUtils.SendableLruCache<bigint, bigint> = new ArkTSUtils.SendableLruCache<bigint, bigint>();
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const cache: ArkTSUtils.SendableLruCache<bigint, bigint> = new ArkTSUtils.SendableLruCache<bigint, bigint>(2);
      cache.put(BIGINT_SLRU_KEYS[0], BIGINT_SLRU_VALUES[0]);
      cache.put(BIGINT_SLRU_KEYS[8], BIGINT_SLRU_VALUES[8]);
      expect(cache.isEmpty()).assertFalse();
    });

    /**
     * @tc.name testSendableLruCacheBigintTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_BIGINT_TEST_0200
     * @tc.desc Verify put, get, contains and remove with bigint keys including boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheBigintTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<bigint, bigint> = new ArkTSUtils.SendableLruCache<bigint, bigint>();

      const putResult: bigint = cache.put(BIGINT_SLRU_KEYS[0], BIGINT_SLRU_VALUES[0]);
      expect(putResult).assertEqual(BIGINT_SLRU_VALUES[0]);

      cache.put(BIGINT_SLRU_KEYS[7], BIGINT_SLRU_VALUES[7]);
      expect(cache.get(BIGINT_SLRU_KEYS[7])).assertEqual(BIGINT_SLRU_VALUES[7]);

      cache.put(BIGINT_SLRU_KEYS[11], BIGINT_SLRU_VALUES[11]);
      expect(cache.get(BIGINT_SLRU_KEYS[11])).assertEqual(BIGINT_SLRU_VALUES[11]);

      expect(cache.contains(BIGINT_SLRU_KEYS[2])).assertFalse();

      const removed: bigint | undefined = cache.remove(BIGINT_SLRU_KEYS[0]);
      expect(removed).assertEqual(BIGINT_SLRU_VALUES[0]);
      expect(cache.remove(BIGINT_SLRU_KEYS[4])).assertUndefined();
    });

    /**
     * @tc.name testSendableLruCacheBigintTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_BIGINT_TEST_0300
     * @tc.desc Verify overwrite, eviction and updateCapacity with bigint entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheBigintTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<bigint, bigint> = new ArkTSUtils.SendableLruCache<bigint, bigint>(4);
      cache.put(BIGINT_SLRU_KEYS[0], BIGINT_SLRU_VALUES[0]);
      cache.put(BIGINT_SLRU_KEYS[0], BIGINT_SLRU_VALUES[3]);
      expect(cache.length).assertEqual(1);
      expect(cache.get(BIGINT_SLRU_KEYS[0])).assertEqual(BIGINT_SLRU_VALUES[3]);

      cache.put(BIGINT_SLRU_KEYS[1], BIGINT_SLRU_VALUES[1]);
      cache.put(BIGINT_SLRU_KEYS[2], BIGINT_SLRU_VALUES[2]);
      cache.put(BIGINT_SLRU_KEYS[3], BIGINT_SLRU_VALUES[3]);
      cache.put(BIGINT_SLRU_KEYS[4], BIGINT_SLRU_VALUES[4]);
      expect(cache.contains(BIGINT_SLRU_KEYS[0])).assertFalse();
      expect(cache.getRemoveCount()).assertEqual(1);

      cache.updateCapacity(2);
      expect(cache.getCapacity()).assertEqual(2);
      expect(cache.length).assertEqual(2);

      cache.updateCapacity(16);
      expect(cache.getCapacity()).assertEqual(16);
    });

    /**
     * @tc.name testSendableLruCacheBigintTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_BIGINT_TEST_0400
     * @tc.desc Verify keys, values, entries order plus clear with bigint entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheBigintTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<bigint, bigint> = new ArkTSUtils.SendableLruCache<bigint, bigint>(8);
      cache.put(BIGINT_SLRU_KEYS[0], BIGINT_SLRU_VALUES[0]);
      cache.put(BIGINT_SLRU_KEYS[1], BIGINT_SLRU_VALUES[1]);
      cache.put(BIGINT_SLRU_KEYS[2], BIGINT_SLRU_VALUES[2]);

      cache.get(BIGINT_SLRU_KEYS[0]);
      const accessedKeys: Array<bigint> = cache.keys();
      expect(accessedKeys[0]).assertEqual(BIGINT_SLRU_KEYS[1]);
      expect(accessedKeys[2]).assertEqual(BIGINT_SLRU_KEYS[0]);

      const accessedValues: Array<bigint> = cache.values();
      expect(accessedValues[0]).assertEqual(BIGINT_SLRU_VALUES[1]);

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0]).assertEqual(BIGINT_SLRU_KEYS[1]);
      expect(firstPair.value[1]).assertEqual(BIGINT_SLRU_VALUES[1]);

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
    });

    /**
     * @tc.name testSendableLruCacheBigintTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_BIGINT_TEST_0500
     * @tc.desc Verify safe-integer boundary, snowflake-scale keys and statistics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheBigintTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<bigint, bigint> = new ArkTSUtils.SendableLruCache<bigint, bigint>(8);
      cache.put(BIGINT_SLRU_KEYS[15], BIGINT_SLRU_VALUES[15]);
      cache.put(BIGINT_SLRU_KEYS[16], BIGINT_SLRU_VALUES[16]);
      cache.put(BIGINT_SLRU_KEYS[17], BIGINT_SLRU_VALUES[17]);

      expect(cache.get(BIGINT_SLRU_KEYS[15])).assertEqual(BIGINT_SLRU_VALUES[15]);
      expect(cache.get(BIGINT_SLRU_KEYS[17])).assertEqual(BIGINT_SLRU_VALUES[17]);
      expect(cache.contains(9007199254740992n)).assertFalse();

      const removed: bigint | undefined = cache.remove(BIGINT_SLRU_KEYS[17]);
      expect(removed).assertEqual(BIGINT_SLRU_VALUES[17]);

      cache.get(BIGINT_SLRU_KEYS[0]);
      expect(cache.getMatchCount()).assertEqual(2);
      expect(cache.getMissCount()).assertEqual(2);
      expect(cache.getPutCount()).assertEqual(3);
    });
  });
}
