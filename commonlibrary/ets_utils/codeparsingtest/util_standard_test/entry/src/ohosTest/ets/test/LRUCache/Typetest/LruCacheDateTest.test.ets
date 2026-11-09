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

const DATE_LRU_KEYS: Array<Date> = [
  new Date(0),
  new Date('2026-03-05'),
  new Date(2026, 0, 1),
  new Date(Number.MAX_SAFE_INTEGER),
  new Date(-86400000),
  new Date('2000-02-29'),
];

const DATE_LRU_VALUES: Array<Date> = [
  new Date(1000),
  new Date('2026-03-06'),
  new Date(2026, 5, 15),
  new Date(86400000),
  new Date(-172800000),
  new Date('2024-02-29'),
];

export default function lruCacheDateTest() {
  describe('LruCacheDateTest', () => {
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
     * @tc.name testLruCacheDateTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_DATE_TEST_0100
     * @tc.desc Verify constructor and getCapacity with default and explicit capacity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheDateTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: util.LRUCache<Date, Date> = new util.LRUCache<Date, Date>();
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const cache: util.LRUCache<Date, Date> = new util.LRUCache<Date, Date>(8);
      cache.put(DATE_LRU_KEYS[0], DATE_LRU_VALUES[0]);
      expect(cache.isEmpty()).assertFalse();
      expect(cache.getCapacity()).assertEqual(8);
    });

    /**
     * @tc.name testLruCacheDateTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_DATE_TEST_0200
     * @tc.desc Verify put, get and contains with Date reference identity keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheDateTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Date, Date> = new util.LRUCache<Date, Date>(8);
      cache.put(DATE_LRU_KEYS[0], DATE_LRU_VALUES[0]);
      cache.put(DATE_LRU_KEYS[5], DATE_LRU_VALUES[5]);

      const getResult: Date | undefined = cache.get(DATE_LRU_KEYS[0]);
      expect(getResult === DATE_LRU_VALUES[0]).assertTrue();
      expect(cache.get(DATE_LRU_KEYS[5]) === DATE_LRU_VALUES[5]).assertTrue();

      expect(cache.contains(DATE_LRU_KEYS[0])).assertTrue();

      const sameTimeKey: Date = new Date(DATE_LRU_KEYS[0].getTime());
      expect(cache.contains(sameTimeKey)).assertFalse();
      expect(cache.get(sameTimeKey)).assertUndefined();
    });

    /**
     * @tc.name testLruCacheDateTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_DATE_TEST_0300
     * @tc.desc Verify remove returns the associated Date value and shrinks the count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheDateTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Date, Date> = new util.LRUCache<Date, Date>(8);
      cache.put(DATE_LRU_KEYS[1], DATE_LRU_VALUES[1]);
      cache.put(DATE_LRU_KEYS[2], DATE_LRU_VALUES[2]);

      const removed: Date | undefined = cache.remove(DATE_LRU_KEYS[1]);
      expect(removed === DATE_LRU_VALUES[1]).assertTrue();
      expect(cache.contains(DATE_LRU_KEYS[1])).assertFalse();
      expect(cache.length).assertEqual(1);

      expect(cache.remove(DATE_LRU_KEYS[3])).assertUndefined();
      expect(cache.length).assertEqual(1);
    });

    /**
     * @tc.name testLruCacheDateTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_DATE_TEST_0400
     * @tc.desc Verify eviction order and updateCapacity shrink keep the most recent Date entry
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheDateTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Date, Date> = new util.LRUCache<Date, Date>(2);
      cache.put(DATE_LRU_KEYS[0], DATE_LRU_VALUES[0]);
      cache.put(DATE_LRU_KEYS[1], DATE_LRU_VALUES[1]);
      cache.put(DATE_LRU_KEYS[2], DATE_LRU_VALUES[2]);

      expect(cache.contains(DATE_LRU_KEYS[0])).assertFalse();
      expect(cache.get(DATE_LRU_KEYS[1]) === DATE_LRU_VALUES[1]).assertTrue();
      expect(cache.get(DATE_LRU_KEYS[2]) === DATE_LRU_VALUES[2]).assertTrue();
      expect(cache.length).assertEqual(2);

      cache.updateCapacity(1);
      expect(cache.get(DATE_LRU_KEYS[2]) === DATE_LRU_VALUES[2]).assertTrue();
      expect(cache.contains(DATE_LRU_KEYS[1])).assertFalse();
    });

    /**
     * @tc.name testLruCacheDateTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_DATE_TEST_0500
     * @tc.desc Verify keys, values and entries content with Date references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheDateTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Date, Date> = new util.LRUCache<Date, Date>(8);
      cache.put(DATE_LRU_KEYS[0], DATE_LRU_VALUES[0]);
      cache.put(DATE_LRU_KEYS[1], DATE_LRU_VALUES[1]);
      cache.put(DATE_LRU_KEYS[2], DATE_LRU_VALUES[2]);

      const keys: Array<Date> = cache.keys();
      expect(keys[0] === DATE_LRU_KEYS[0]).assertTrue();
      expect(keys[2] === DATE_LRU_KEYS[2]).assertTrue();

      const values: Array<Date> = cache.values();
      expect(values[2] === DATE_LRU_VALUES[2]).assertTrue();

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0] === DATE_LRU_KEYS[0]).assertTrue();
      expect(firstPair.value[1] === DATE_LRU_VALUES[0]).assertTrue();
    });

    /**
     * @tc.name testLruCacheDateTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_DATE_TEST_0600
     * @tc.desc Verify clear, statistics and afterRemoval hook with Date entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheDateTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let removalCount: number = 0;
      let lastRemovedKey: Date | null = null;

      class HookDateLruCache extends util.LRUCache<Date, Date> {
        afterRemoval(isEvict: boolean, key: Date, value: Date, newValue: Date): void {
          removalCount++;
          lastRemovedKey = key;
        }
      }

      const cache: HookDateLruCache = new HookDateLruCache(2);
      cache.put(DATE_LRU_KEYS[0], DATE_LRU_VALUES[0]);
      cache.put(DATE_LRU_KEYS[1], DATE_LRU_VALUES[1]);
      cache.get(DATE_LRU_KEYS[0]);
      cache.put(DATE_LRU_KEYS[2], DATE_LRU_VALUES[2]);

      expect(removalCount).assertEqual(1);
      expect(lastRemovedKey === DATE_LRU_KEYS[1]).assertTrue();
      expect(cache.getMatchCount()).assertEqual(1);
      expect(cache.getPutCount()).assertEqual(3);

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
      expect(removalCount).assertEqual(3);
    });
  });
}
