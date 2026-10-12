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
import { beforeAll, beforeEach, afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

const NUMBER_SLRU_KEYS: Array<number> = [
  1, -1, 0, 123, -999, 0.5, -0.5, NaN, Infinity, -Infinity,
  Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, 4294967296, 256, -99.5,
  -0, 1.2e3, 2.5e-2, 0x12, 0b1010,
  Number.MAX_VALUE, Number.MIN_VALUE, Number.EPSILON, 999999.99, 13800138000,
];

const NUMBER_SLRU_VALUES: Array<number> = [
  10, -10, 0, 456, -888, 1.5, -1.5, NaN, Infinity, -Infinity,
  Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, 65536, 512, -88.5,
  -0, 2.4e3, 5e-3, 0x20, 0b1100,
  Number.MAX_VALUE, Number.MIN_VALUE, Number.EPSILON, -999999.99, 13900139000,
  1, 100.5, -99.9, Math.floor(1.5), 123.456, 0xcafebabe, 2 ** 3, 1.2e3, 1e3,
  2.5e-2, 0x12, 0x0102, 0x01020304, 0x3, 0o12, 0b1010,
  -128, 127, -32768, 32767, -2147483648, 2147483647, 65535,
  -1, 123456, -100.5, 13800138000,
];

export default function sendableLruCacheNumberTest() {
  describe('SendableLruCacheNumberTest', () => {
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
     * @tc.name testSendableLruCacheNumberTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_NUMBER_TEST_0100
     * @tc.desc Verify constructor, getCapacity and isEmpty with number keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheNumberTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: ArkTSUtils.SendableLruCache<number, number> =
        new ArkTSUtils.SendableLruCache<number, number>();
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const smallCache: ArkTSUtils.SendableLruCache<number, number> =
        new ArkTSUtils.SendableLruCache<number, number>(1);
      expect(smallCache.getCapacity()).assertEqual(1);
      expect(smallCache.isEmpty()).assertTrue();

      smallCache.put(NUMBER_SLRU_KEYS[0], NUMBER_SLRU_VALUES[0]);
      expect(smallCache.isEmpty()).assertFalse();
      expect(smallCache.length).assertEqual(1);
    });

    /**
     * @tc.name testSendableLruCacheNumberTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_NUMBER_TEST_0200
     * @tc.desc Verify put, get, contains and remove with number keys including NaN and -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheNumberTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, number> =
        new ArkTSUtils.SendableLruCache<number, number>();

      const putResult: number = cache.put(NUMBER_SLRU_KEYS[0], NUMBER_SLRU_VALUES[0]);
      expect(putResult).assertEqual(NUMBER_SLRU_VALUES[0]);

      const getResult: number | undefined = cache.get(NUMBER_SLRU_KEYS[0]);
      expect(getResult).assertEqual(NUMBER_SLRU_VALUES[0]);

      cache.put(NUMBER_SLRU_KEYS[7], NUMBER_SLRU_VALUES[7]);
      const nanResult: number | undefined = cache.get(NUMBER_SLRU_KEYS[7]);
      expect(Number.isNaN(nanResult)).assertTrue();

      cache.put(NUMBER_SLRU_KEYS[15], NUMBER_SLRU_VALUES[15]);
      const negativeZeroResult: number | undefined = cache.get(NUMBER_SLRU_KEYS[15]);
      expect(negativeZeroResult === 0 && 1 / negativeZeroResult === -Infinity).assertTrue();
      expect(cache.contains(-0)).assertTrue();

      expect(cache.contains(NUMBER_SLRU_KEYS[1])).assertFalse();

      const removedValue: number | undefined = cache.remove(NUMBER_SLRU_KEYS[0]);
      expect(removedValue).assertEqual(NUMBER_SLRU_VALUES[0]);
      expect(cache.contains(NUMBER_SLRU_KEYS[0])).assertFalse();

      const missingRemoved: number | undefined = cache.remove(NUMBER_SLRU_KEYS[3]);
      expect(missingRemoved).assertUndefined();
    });

    /**
     * @tc.name testSendableLruCacheNumberTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_NUMBER_TEST_0300
     * @tc.desc Verify eviction, updateCapacity shrink and getRemoveCount with number entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheNumberTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, number> =
        new ArkTSUtils.SendableLruCache<number, number>(2);
      cache.put(NUMBER_SLRU_KEYS[0], NUMBER_SLRU_VALUES[0]);
      cache.put(NUMBER_SLRU_KEYS[1], NUMBER_SLRU_VALUES[1]);
      cache.put(NUMBER_SLRU_KEYS[2], NUMBER_SLRU_VALUES[2]);

      expect(cache.contains(NUMBER_SLRU_KEYS[0])).assertFalse();
      expect(cache.get(NUMBER_SLRU_KEYS[1])).assertEqual(NUMBER_SLRU_VALUES[1]);
      expect(cache.length).assertEqual(2);
      expect(cache.getRemoveCount()).assertEqual(1);

      const bigCache: ArkTSUtils.SendableLruCache<number, number> =
        new ArkTSUtils.SendableLruCache<number, number>(8);
      bigCache.put(NUMBER_SLRU_KEYS[0], NUMBER_SLRU_VALUES[0]);
      bigCache.put(NUMBER_SLRU_KEYS[1], NUMBER_SLRU_VALUES[1]);
      bigCache.put(NUMBER_SLRU_KEYS[2], NUMBER_SLRU_VALUES[2]);
      bigCache.updateCapacity(1);
      expect(bigCache.getCapacity()).assertEqual(1);
      expect(bigCache.length).assertEqual(1);

      bigCache.updateCapacity(16);
      expect(bigCache.getCapacity()).assertEqual(16);
    });

    /**
     * @tc.name testSendableLruCacheNumberTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_NUMBER_TEST_0400
     * @tc.desc Verify keys, values and entries ordered from most to least recently used
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheNumberTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, number> =
        new ArkTSUtils.SendableLruCache<number, number>(8);
      cache.put(NUMBER_SLRU_KEYS[0], NUMBER_SLRU_VALUES[0]);
      cache.put(NUMBER_SLRU_KEYS[1], NUMBER_SLRU_VALUES[1]);
      cache.put(NUMBER_SLRU_KEYS[2], NUMBER_SLRU_VALUES[2]);

      const initialKeys: Array<number> = cache.keys();
      expect(initialKeys[0]).assertEqual(NUMBER_SLRU_KEYS[0]);
      expect(initialKeys[2]).assertEqual(NUMBER_SLRU_KEYS[2]);

      cache.get(NUMBER_SLRU_KEYS[0]);
      const accessedKeys: Array<number> = cache.keys();
      expect(accessedKeys[0]).assertEqual(NUMBER_SLRU_KEYS[1]);
      expect(accessedKeys[2]).assertEqual(NUMBER_SLRU_KEYS[0]);

      const accessedValues: Array<number> = cache.values();
      expect(accessedValues[0]).assertEqual(NUMBER_SLRU_VALUES[1]);
      expect(accessedValues[2]).assertEqual(NUMBER_SLRU_VALUES[0]);

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0]).assertEqual(NUMBER_SLRU_KEYS[1]);
      expect(firstPair.value[1]).assertEqual(NUMBER_SLRU_VALUES[1]);

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
      expect(cache.keys().length).assertEqual(0);
    });

    /**
     * @tc.name testSendableLruCacheNumberTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_NUMBER_TEST_0500
     * @tc.desc Verify count statistics and toString with number entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheNumberTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, number> =
        new ArkTSUtils.SendableLruCache<number, number>();
      expect(cache.getCreateCount()).assertEqual(0);
      expect(cache.getMatchCount()).assertEqual(0);
      expect(cache.getMissCount()).assertEqual(0);
      expect(cache.getPutCount()).assertEqual(0);
      expect(cache.getRemoveCount()).assertEqual(0);

      cache.put(NUMBER_SLRU_KEYS[0], NUMBER_SLRU_VALUES[0]);
      cache.get(NUMBER_SLRU_KEYS[0]);
      expect(cache.getPutCount()).assertEqual(1);
      expect(cache.getMatchCount()).assertEqual(1);

      cache.get(NUMBER_SLRU_KEYS[1]);
      expect(cache.getMissCount()).assertEqual(1);

      const text: string = cache.toString();
      expect(text.includes('maxSize = 64')).assertTrue();
      expect(text.includes('hits = 1')).assertTrue();
      expect(text.includes('misses = 1')).assertTrue();
    });

    /**
     * @tc.name testSendableLruCacheNumberTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_NUMBER_TEST_0600
     * @tc.desc Verify constructor and updateCapacity throw on 0, negative and fractional capacity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheNumberTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const invalidCapacities: Array<number> = [0, -1, -99, 0.5, -0.5, NaN, Infinity, -Infinity];

      for (const capacity of invalidCapacities) {
        let constructorThrew: boolean = false;
        try {
          const invalidCache: ArkTSUtils.SendableLruCache<number, number> =
            new ArkTSUtils.SendableLruCache<number, number>(capacity);
        } catch (e) {
          constructorThrew = true;
        }
        expect(constructorThrew).assertTrue();
      }

      const cache: ArkTSUtils.SendableLruCache<number, number> =
        new ArkTSUtils.SendableLruCache<number, number>(4);
      cache.put(NUMBER_SLRU_KEYS[0], NUMBER_SLRU_VALUES[0]);
      for (const capacity of invalidCapacities) {
        let updateThrew: boolean = false;
        try {
          cache.updateCapacity(capacity);
        } catch (e) {
          updateThrew = true;
        }
        expect(updateThrew).assertTrue();
      }
      expect(cache.getCapacity()).assertEqual(4);
      expect(cache.get(NUMBER_SLRU_KEYS[0])).assertEqual(NUMBER_SLRU_VALUES[0]);
    });

    /**
     * @tc.name testSendableLruCacheNumberTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_NUMBER_TEST_0700
     * @tc.desc Verify createDefault hook creates and inserts missing number entries counted by getCreateCount
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheNumberTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      @Sendable class ChildNumberSlruCache extends ArkTSUtils.SendableLruCache<number, number> {
        createDefault(key: number): number {
          return key;
        }
      }

      const childCache: ChildNumberSlruCache = new ChildNumberSlruCache();
      childCache.put(NUMBER_SLRU_KEYS[0], NUMBER_SLRU_VALUES[0]);

      const createdValue: number | undefined = childCache.get(NUMBER_SLRU_KEYS[1]);
      expect(createdValue).assertEqual(NUMBER_SLRU_KEYS[1]);
      expect(childCache.contains(NUMBER_SLRU_KEYS[1])).assertTrue();

      const createdValue2: number | undefined = childCache.get(NUMBER_SLRU_KEYS[2]);
      expect(createdValue2).assertEqual(NUMBER_SLRU_KEYS[2]);
      expect(childCache.getCreateCount()).assertEqual(2);

      const existingValue: number | undefined = childCache.get(NUMBER_SLRU_KEYS[0]);
      expect(existingValue).assertEqual(NUMBER_SLRU_VALUES[0]);
      expect(childCache.getCreateCount()).assertEqual(2);
      expect(childCache.getMatchCount()).assertEqual(2);
    });
  });
}
