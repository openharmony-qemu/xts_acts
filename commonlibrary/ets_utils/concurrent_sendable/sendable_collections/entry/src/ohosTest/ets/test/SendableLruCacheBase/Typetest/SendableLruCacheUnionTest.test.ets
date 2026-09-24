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

const UNION_SLRU_KEYS: Array<number> = [1, 2, 3, 4, 5, 6];
const UNION_SLRU_VALUES: Array<string> = ['num1', 'str2', 'bool3', 'bigint4', 'num5', 'num6'];

function coerceKey(input: number | null | undefined): number {
  return input as number;
}

export default function sendableLruCacheUnionTest() {
  describe('SendableLruCacheUnionTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testSendableLruCacheUnionTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_UNION_TEST_0100
     * @tc.desc Verify constructor and put with mixed union type keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheUnionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>(16);
      expect(cache.isEmpty()).assertTrue();

      cache.put(UNION_SLRU_KEYS[0], UNION_SLRU_VALUES[0]);
      cache.put(UNION_SLRU_KEYS[1], UNION_SLRU_VALUES[1]);
      cache.put(UNION_SLRU_KEYS[2], UNION_SLRU_VALUES[2]);
      expect(cache.length).assertEqual(3);
      expect(cache.isEmpty()).assertFalse();
      expect(cache.getCapacity()).assertEqual(16);
    });

    /**
     * @tc.name testSendableLruCacheUnionTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_UNION_TEST_0200
     * @tc.desc Verify get, contains, and null/undefined key rejection with union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheUnionTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>(16);
      cache.put(UNION_SLRU_KEYS[0], UNION_SLRU_VALUES[0]);
      cache.put(UNION_SLRU_KEYS[1], UNION_SLRU_VALUES[1]);
      cache.put(UNION_SLRU_KEYS[2], UNION_SLRU_VALUES[2]);

      expect(cache.get(UNION_SLRU_KEYS[0])).assertEqual(UNION_SLRU_VALUES[0]);
      expect(cache.get(UNION_SLRU_KEYS[1])).assertEqual(UNION_SLRU_VALUES[1]);
      expect(cache.contains(UNION_SLRU_KEYS[0])).assertTrue();
      expect(cache.contains(99)).assertFalse();

      let caughtNull: boolean = false;
      try {
        const nullKey: number | null | undefined = null;
        cache.put(coerceKey(nullKey), 'val');
      } catch (e) {
        caughtNull = true;
      }
      expect(caughtNull).assertTrue();

      let caughtUndefined: boolean = false;
      try {
        const undefKey: number | null | undefined = undefined;
        cache.put(coerceKey(undefKey), 'val');
      } catch (e) {
        caughtUndefined = true;
      }
      expect(caughtUndefined).assertTrue();
    });

    /**
     * @tc.name testSendableLruCacheUnionTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_UNION_TEST_0300
     * @tc.desc Verify remove, overwrite value and eviction with union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheUnionTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>(4);
      cache.put(UNION_SLRU_KEYS[0], UNION_SLRU_VALUES[0]);
      cache.put(UNION_SLRU_KEYS[0], UNION_SLRU_VALUES[1]);
      expect(cache.length).assertEqual(1);
      expect(cache.get(UNION_SLRU_KEYS[0])).assertEqual(UNION_SLRU_VALUES[1]);

      cache.put(UNION_SLRU_KEYS[1], UNION_SLRU_VALUES[2]);
      cache.put(UNION_SLRU_KEYS[2], UNION_SLRU_VALUES[3]);
      cache.put(UNION_SLRU_KEYS[3], UNION_SLRU_VALUES[4]);
      cache.put(UNION_SLRU_KEYS[4], UNION_SLRU_VALUES[5]);
      expect(cache.contains(UNION_SLRU_KEYS[0])).assertFalse();
      expect(cache.getRemoveCount()).assertEqual(1);

      const removed: string | undefined = cache.remove(UNION_SLRU_KEYS[1]);
      expect(removed).assertEqual(UNION_SLRU_VALUES[2]);
      expect(cache.remove(88)).assertUndefined();
    });

    /**
     * @tc.name testSendableLruCacheUnionTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_UNION_TEST_0400
     * @tc.desc Verify keys, values, entries order plus clear with union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheUnionTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>(8);
      cache.put(UNION_SLRU_KEYS[0], UNION_SLRU_VALUES[0]);
      cache.put(UNION_SLRU_KEYS[1], UNION_SLRU_VALUES[1]);
      cache.put(UNION_SLRU_KEYS[2], UNION_SLRU_VALUES[2]);
      cache.put(UNION_SLRU_KEYS[3], UNION_SLRU_VALUES[3]);

      cache.get(UNION_SLRU_KEYS[0]);
      const accessedKeys: Array<number> = cache.keys();
      expect(accessedKeys[0]).assertEqual(UNION_SLRU_KEYS[1]);
      expect(accessedKeys[3]).assertEqual(UNION_SLRU_KEYS[0]);

      const accessedValues: Array<string> = cache.values();
      expect(accessedValues[0]).assertEqual(UNION_SLRU_VALUES[1]);

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
    });

    /**
     * @tc.name testSendableLruCacheUnionTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_UNION_TEST_0500
     * @tc.desc Verify string values including emoji and boundary numbers 10-12 as keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheUnionTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>(16);
      cache.put(10, 'bigint_val');
      cache.put(11, 'emoji_val');
      cache.put(12, 'max_safe');

      expect(cache.get(10)).assertEqual('bigint_val');
      expect(cache.get(11)).assertEqual('emoji_val');
      expect(cache.get(12)).assertEqual('max_safe');
      expect(cache.contains(10)).assertTrue();
    });

    /**
     * @tc.name testSendableLruCacheUnionTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_UNION_TEST_0600
     * @tc.desc Verify count statistics and toString with union values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheUnionTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>(16);
      cache.put(UNION_SLRU_KEYS[0], UNION_SLRU_VALUES[0]);
      cache.put(UNION_SLRU_KEYS[1], UNION_SLRU_VALUES[1]);
      cache.get(UNION_SLRU_KEYS[0]);
      cache.get(99);

      expect(cache.getPutCount()).assertEqual(2);
      expect(cache.getMatchCount()).assertEqual(1);
      expect(cache.getMissCount()).assertEqual(1);

      const text: string = cache.toString();
      expect(text.includes('maxSize = 16')).assertTrue();
      expect(text.includes('hits = 1')).assertTrue();
      expect(text.includes('misses = 1')).assertTrue();
    });
  });
}
