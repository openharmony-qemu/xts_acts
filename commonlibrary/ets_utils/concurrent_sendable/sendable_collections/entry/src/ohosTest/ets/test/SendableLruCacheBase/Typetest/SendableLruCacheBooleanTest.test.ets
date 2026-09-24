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

const BOOLEAN_SLRU_KEYS: Array<boolean> = [true, false];
const BOOLEAN_SLRU_VALUES: Array<boolean> = [false, true];

export default function sendableLruCacheBooleanTest() {
  describe('SendableLruCacheBooleanTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testSendableLruCacheBooleanTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_BOOLEAN_TEST_0100
     * @tc.desc Verify constructor, getCapacity and isEmpty with boolean keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheBooleanTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: ArkTSUtils.SendableLruCache<boolean, boolean> = new ArkTSUtils.SendableLruCache<
        boolean,
        boolean
      >();
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const cache: ArkTSUtils.SendableLruCache<boolean, boolean> = new ArkTSUtils.SendableLruCache<boolean, boolean>(2);
      cache.put(BOOLEAN_SLRU_KEYS[0], BOOLEAN_SLRU_VALUES[0]);
      cache.put(BOOLEAN_SLRU_KEYS[1], BOOLEAN_SLRU_VALUES[1]);
      expect(cache.isEmpty()).assertFalse();
      expect(cache.getCapacity()).assertEqual(2);
    });

    /**
     * @tc.name testSendableLruCacheBooleanTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_BOOLEAN_TEST_0200
     * @tc.desc Verify put, get, contains and remove with boolean keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheBooleanTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<boolean, boolean> = new ArkTSUtils.SendableLruCache<boolean, boolean>();

      const putResult: boolean = cache.put(BOOLEAN_SLRU_KEYS[0], BOOLEAN_SLRU_VALUES[0]);
      expect(putResult).assertEqual(BOOLEAN_SLRU_VALUES[0]);

      cache.put(BOOLEAN_SLRU_KEYS[1], BOOLEAN_SLRU_VALUES[1]);
      expect(cache.get(BOOLEAN_SLRU_KEYS[0])).assertEqual(BOOLEAN_SLRU_VALUES[0]);
      expect(cache.get(BOOLEAN_SLRU_KEYS[1])).assertEqual(BOOLEAN_SLRU_VALUES[1]);

      expect(cache.contains(BOOLEAN_SLRU_KEYS[0])).assertTrue();

      const removed: boolean | undefined = cache.remove(BOOLEAN_SLRU_KEYS[1]);
      expect(removed).assertEqual(BOOLEAN_SLRU_VALUES[1]);
      expect(cache.contains(BOOLEAN_SLRU_KEYS[1])).assertFalse();
    });

    /**
     * @tc.name testSendableLruCacheBooleanTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_BOOLEAN_TEST_0300
     * @tc.desc Verify overwrite, eviction and updateCapacity with boolean entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheBooleanTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<boolean, boolean> = new ArkTSUtils.SendableLruCache<boolean, boolean>(4);
      cache.put(BOOLEAN_SLRU_KEYS[0], BOOLEAN_SLRU_VALUES[0]);
      cache.put(BOOLEAN_SLRU_KEYS[0], BOOLEAN_SLRU_KEYS[0]);
      expect(cache.length).assertEqual(1);
      expect(cache.get(BOOLEAN_SLRU_KEYS[0])).assertEqual(BOOLEAN_SLRU_KEYS[0]);

      const evictCache: ArkTSUtils.SendableLruCache<boolean, boolean> = new ArkTSUtils.SendableLruCache<
        boolean,
        boolean
      >(1);
      evictCache.put(BOOLEAN_SLRU_KEYS[0], BOOLEAN_SLRU_VALUES[0]);
      evictCache.put(BOOLEAN_SLRU_KEYS[1], BOOLEAN_SLRU_VALUES[1]);
      expect(evictCache.contains(BOOLEAN_SLRU_KEYS[0])).assertFalse();
      expect(evictCache.getRemoveCount()).assertEqual(1);

      cache.updateCapacity(1);
      expect(cache.getCapacity()).assertEqual(1);
      cache.updateCapacity(8);
      expect(cache.getCapacity()).assertEqual(8);
    });

    /**
     * @tc.name testSendableLruCacheBooleanTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_BOOLEAN_TEST_0400
     * @tc.desc Verify keys, values, entries order plus clear with boolean entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheBooleanTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<boolean, boolean> = new ArkTSUtils.SendableLruCache<boolean, boolean>(4);
      cache.put(BOOLEAN_SLRU_KEYS[0], BOOLEAN_SLRU_VALUES[0]);
      cache.put(BOOLEAN_SLRU_KEYS[1], BOOLEAN_SLRU_VALUES[1]);

      cache.get(BOOLEAN_SLRU_KEYS[0]);
      const accessedKeys: Array<boolean> = cache.keys();
      expect(accessedKeys[0]).assertEqual(BOOLEAN_SLRU_KEYS[1]);
      expect(accessedKeys[1]).assertEqual(BOOLEAN_SLRU_KEYS[0]);

      const accessedValues: Array<boolean> = cache.values();
      expect(accessedValues[0]).assertEqual(BOOLEAN_SLRU_VALUES[1]);

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0]).assertEqual(BOOLEAN_SLRU_KEYS[1]);
      expect(firstPair.value[1]).assertEqual(BOOLEAN_SLRU_VALUES[1]);

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
    });

    /**
     * @tc.name testSendableLruCacheBooleanTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_BOOLEAN_TEST_0500
     * @tc.desc Verify count statistics and toString with boolean entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheBooleanTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<boolean, boolean> = new ArkTSUtils.SendableLruCache<boolean, boolean>(8);
      cache.put(BOOLEAN_SLRU_KEYS[0], BOOLEAN_SLRU_VALUES[0]);
      cache.get(BOOLEAN_SLRU_KEYS[0]);
      cache.get(BOOLEAN_SLRU_KEYS[1]);

      expect(cache.getPutCount()).assertEqual(1);
      expect(cache.getMatchCount()).assertEqual(1);
      expect(cache.getMissCount()).assertEqual(1);

      const text: string = cache.toString();
      expect(text.includes('maxSize = 8')).assertTrue();
      expect(text.includes('hits = 1')).assertTrue();
    });
  });
}
