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

type LruCacheFunc = (a: number, b: number) => number;

const addFunc: LruCacheFunc = (a: number, b: number): number => a + b;
const subFunc: LruCacheFunc = (a: number, b: number): number => a - b;
const mulFunc: LruCacheFunc = (a: number, b: number): number => a * b;

const FUNC_LRU_KEYS: Array<LruCacheFunc> = [addFunc, subFunc, mulFunc];
const FUNC_LRU_VALUES: Array<LruCacheFunc> = [subFunc, mulFunc, addFunc];

export default function lruCacheFunctionTest() {
  describe('LruCacheFunctionTest', () => {
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
     * @tc.name testLruCacheFunctionTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_FUNCTION_TEST_0100
     * @tc.desc Verify constructor and getCapacity with function keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheFunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: util.LRUCache<LruCacheFunc, LruCacheFunc> =
        new util.LRUCache<LruCacheFunc, LruCacheFunc>();
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const cache: util.LRUCache<LruCacheFunc, LruCacheFunc> =
        new util.LRUCache<LruCacheFunc, LruCacheFunc>(8);
      expect(cache.getCapacity()).assertEqual(8);
      cache.put(FUNC_LRU_KEYS[0], FUNC_LRU_VALUES[0]);
      expect(cache.isEmpty()).assertFalse();
    });

    /**
     * @tc.name testLruCacheFunctionTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_FUNCTION_TEST_0200
     * @tc.desc Verify put, get and contains with function reference identity keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheFunctionTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<LruCacheFunc, LruCacheFunc> =
        new util.LRUCache<LruCacheFunc, LruCacheFunc>(8);
      const putResult: LruCacheFunc = cache.put(FUNC_LRU_KEYS[0], FUNC_LRU_VALUES[0]);
      expect(putResult === subFunc).assertTrue();

      cache.put(FUNC_LRU_KEYS[1], FUNC_LRU_VALUES[1]);
      const getResult: LruCacheFunc | undefined = cache.get(FUNC_LRU_KEYS[0]);
      expect(getResult === subFunc).assertTrue();
      expect(cache.get(FUNC_LRU_KEYS[1]) === mulFunc).assertTrue();

      const sameBodyFunc: LruCacheFunc = (a: number, b: number): number => a + b;
      expect(cache.contains(sameBodyFunc)).assertFalse();
      expect(cache.get(FUNC_LRU_KEYS[2])).assertUndefined();
    });

    /**
     * @tc.name testLruCacheFunctionTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_FUNCTION_TEST_0300
     * @tc.desc Verify removed function value stays callable and shrink works
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheFunctionTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<LruCacheFunc, LruCacheFunc> =
        new util.LRUCache<LruCacheFunc, LruCacheFunc>(8);
      cache.put(FUNC_LRU_KEYS[0], FUNC_LRU_VALUES[0]);
      cache.put(FUNC_LRU_KEYS[1], FUNC_LRU_VALUES[1]);

      const removed: LruCacheFunc | undefined = cache.remove(FUNC_LRU_KEYS[0]);
      expect(removed === subFunc).assertTrue();
      expect(removed!(3, 4)).assertEqual(-1);
      expect(cache.contains(FUNC_LRU_KEYS[0])).assertFalse();
      expect(cache.length).assertEqual(1);

      expect(cache.remove(FUNC_LRU_KEYS[2])).assertUndefined();
    });

    /**
     * @tc.name testLruCacheFunctionTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_FUNCTION_TEST_0400
     * @tc.desc Verify eviction and updateCapacity keep most recent function entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheFunctionTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<LruCacheFunc, LruCacheFunc> =
        new util.LRUCache<LruCacheFunc, LruCacheFunc>(2);
      cache.put(FUNC_LRU_KEYS[0], FUNC_LRU_VALUES[0]);
      cache.put(FUNC_LRU_KEYS[1], FUNC_LRU_VALUES[1]);
      cache.put(FUNC_LRU_KEYS[2], FUNC_LRU_VALUES[2]);

      expect(cache.contains(FUNC_LRU_KEYS[0])).assertFalse();
      expect(cache.get(FUNC_LRU_KEYS[1]) === mulFunc).assertTrue();
      expect(cache.length).assertEqual(2);

      cache.updateCapacity(1);
      expect(cache.get(FUNC_LRU_KEYS[1]) === mulFunc).assertTrue();
      expect(cache.contains(FUNC_LRU_KEYS[2])).assertFalse();
      expect(cache.getCapacity()).assertEqual(1);
    });

    /**
     * @tc.name testLruCacheFunctionTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_FUNCTION_TEST_0500
     * @tc.desc Verify keys, values and entries preserve function references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheFunctionTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<LruCacheFunc, LruCacheFunc> =
        new util.LRUCache<LruCacheFunc, LruCacheFunc>(8);
      cache.put(FUNC_LRU_KEYS[0], FUNC_LRU_VALUES[0]);
      cache.put(FUNC_LRU_KEYS[1], FUNC_LRU_VALUES[1]);
      cache.put(FUNC_LRU_KEYS[2], FUNC_LRU_VALUES[2]);

      const keys: Array<LruCacheFunc> = cache.keys();
      expect(keys[0] === addFunc).assertTrue();
      expect(keys[2] === mulFunc).assertTrue();

      const values: Array<LruCacheFunc> = cache.values();
      expect(values[2] === addFunc).assertTrue();

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0] === addFunc).assertTrue();
      expect(firstPair.value[1] === subFunc).assertTrue();
    });

    /**
     * @tc.name testLruCacheFunctionTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_FUNCTION_TEST_0600
     * @tc.desc Verify clear, statistics and createDefault with function types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheFunctionTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<LruCacheFunc, LruCacheFunc> =
        new util.LRUCache<LruCacheFunc, LruCacheFunc>(8);
      cache.put(FUNC_LRU_KEYS[0], FUNC_LRU_VALUES[0]);
      cache.get(FUNC_LRU_KEYS[0]);
      cache.get(FUNC_LRU_KEYS[1]);
      expect(cache.getMatchCount()).assertEqual(1);
      expect(cache.getMissCount()).assertEqual(1);
      expect(cache.getPutCount()).assertEqual(1);

      class ChildFuncLruCache extends util.LRUCache<LruCacheFunc, LruCacheFunc> {
        createDefault(key: LruCacheFunc): LruCacheFunc {
          return key;
        }
      }
      const childCache: ChildFuncLruCache = new ChildFuncLruCache();
      const created: LruCacheFunc | undefined = childCache.get(addFunc);
      expect(created === addFunc).assertTrue();
      expect(childCache.getCreateCount()).assertEqual(1);

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
    });
  });
}
