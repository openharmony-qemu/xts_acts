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

const REGEX_LRU_KEYS: Array<RegExp> = [
  /abc/gi,
  /^\d+$/,
  new RegExp('特殊', 'u'),
];

const REGEX_LRU_VALUES: Array<RegExp> = [
  /\d{4}-\d{2}-\d{2}/,
  /(?:https?:\/\/).*/s,
  new RegExp('[\u4e00-\u9fa5]+'),
];

export default function lruCacheRegExpTest() {
  describe('LruCacheRegExpTest', () => {
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
     * @tc.name testLruCacheRegExpTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REGEXP_TEST_0100
     * @tc.desc Verify constructor and getCapacity with RegExp keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheRegExpTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: util.LRUCache<RegExp, RegExp> = new util.LRUCache<RegExp, RegExp>();
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const cache: util.LRUCache<RegExp, RegExp> = new util.LRUCache<RegExp, RegExp>(4);
      cache.put(REGEX_LRU_KEYS[0], REGEX_LRU_VALUES[0]);
      expect(cache.isEmpty()).assertFalse();
      expect(cache.getCapacity()).assertEqual(4);
    });

    /**
     * @tc.name testLruCacheRegExpTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REGEXP_TEST_0200
     * @tc.desc Verify put, get and contains with RegExp reference identity keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheRegExpTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<RegExp, RegExp> = new util.LRUCache<RegExp, RegExp>(8);

      const putResult: RegExp = cache.put(REGEX_LRU_KEYS[0], REGEX_LRU_VALUES[0]);
      expect(putResult === REGEX_LRU_VALUES[0]).assertTrue();

      const getResult: RegExp | undefined = cache.get(REGEX_LRU_KEYS[0]);
      expect(getResult === REGEX_LRU_VALUES[0]).assertTrue();
      expect(getResult!.test('2026-03-05')).assertTrue();

      const samePatternKey: RegExp = /abc/gi;
      expect(cache.contains(samePatternKey)).assertFalse();
      expect(cache.get(REGEX_LRU_KEYS[1])).assertUndefined();
    });

    /**
     * @tc.name testLruCacheRegExpTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REGEXP_TEST_0300
     * @tc.desc Verify removed RegExp value stays testable and unicode patterns work
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheRegExpTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<RegExp, RegExp> = new util.LRUCache<RegExp, RegExp>(8);
      cache.put(REGEX_LRU_KEYS[1], REGEX_LRU_VALUES[1]);
      cache.put(REGEX_LRU_KEYS[2], REGEX_LRU_VALUES[2]);

      const unicodeValue: RegExp | undefined = cache.get(REGEX_LRU_KEYS[2]);
      expect(unicodeValue === REGEX_LRU_VALUES[2]).assertTrue();
      expect(unicodeValue!.test('中文')).assertTrue();
      expect(unicodeValue!.test('abc')).assertFalse();

      const removed: RegExp | undefined = cache.remove(REGEX_LRU_KEYS[1]);
      expect(removed === REGEX_LRU_VALUES[1]).assertTrue();
      expect(removed!.test('https://test.com')).assertTrue();
      expect(cache.length).assertEqual(1);
      expect(cache.remove(REGEX_LRU_KEYS[0])).assertUndefined();
    });

    /**
     * @tc.name testLruCacheRegExpTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REGEXP_TEST_0400
     * @tc.desc Verify eviction and updateCapacity shrink with RegExp entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheRegExpTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<RegExp, RegExp> = new util.LRUCache<RegExp, RegExp>(2);
      cache.put(REGEX_LRU_KEYS[0], REGEX_LRU_VALUES[0]);
      cache.put(REGEX_LRU_KEYS[1], REGEX_LRU_VALUES[1]);
      cache.put(REGEX_LRU_KEYS[2], REGEX_LRU_VALUES[2]);

      expect(cache.contains(REGEX_LRU_KEYS[0])).assertFalse();
      expect(cache.get(REGEX_LRU_KEYS[1]) === REGEX_LRU_VALUES[1]).assertTrue();
      expect(cache.length).assertEqual(2);

      cache.updateCapacity(1);
      expect(cache.get(REGEX_LRU_KEYS[1]) === REGEX_LRU_VALUES[1]).assertTrue();
      expect(cache.contains(REGEX_LRU_KEYS[2])).assertFalse();
    });

    /**
     * @tc.name testLruCacheRegExpTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REGEXP_TEST_0500
     * @tc.desc Verify keys, values and entries preserve RegExp references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheRegExpTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<RegExp, RegExp> = new util.LRUCache<RegExp, RegExp>(8);
      cache.put(REGEX_LRU_KEYS[0], REGEX_LRU_VALUES[0]);
      cache.put(REGEX_LRU_KEYS[1], REGEX_LRU_VALUES[1]);
      cache.put(REGEX_LRU_KEYS[2], REGEX_LRU_VALUES[2]);

      const keys: Array<RegExp> = cache.keys();
      expect(keys[0] === REGEX_LRU_KEYS[0]).assertTrue();
      expect(keys[2] === REGEX_LRU_KEYS[2]).assertTrue();

      const values: Array<RegExp> = cache.values();
      expect(values[1] === REGEX_LRU_VALUES[1]).assertTrue();

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0] === REGEX_LRU_KEYS[0]).assertTrue();
      expect(firstPair.value[1] === REGEX_LRU_VALUES[0]).assertTrue();
    });

    /**
     * @tc.name testLruCacheRegExpTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REGEXP_TEST_0600
     * @tc.desc Verify statistics, createDefault and clear with RegExp types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheRegExpTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<RegExp, RegExp> = new util.LRUCache<RegExp, RegExp>(8);
      expect(cache.createDefault(REGEX_LRU_KEYS[0])).assertUndefined();

      cache.put(REGEX_LRU_KEYS[0], REGEX_LRU_VALUES[0]);
      cache.get(REGEX_LRU_KEYS[0]);
      cache.get(REGEX_LRU_KEYS[1]);
      expect(cache.getMatchCount()).assertEqual(1);
      expect(cache.getMissCount()).assertEqual(1);
      expect(cache.getPutCount()).assertEqual(1);

      const text: string = cache.toString();
      expect(text.includes('maxSize = 8')).assertTrue();

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
    });
  });
}
