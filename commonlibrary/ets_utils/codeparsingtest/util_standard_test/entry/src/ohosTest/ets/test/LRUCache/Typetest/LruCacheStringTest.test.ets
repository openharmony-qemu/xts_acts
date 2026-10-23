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

function coerceString(input: string | null | undefined): string {
  return input as string;
}

const STRING_LRU_KEYS: Array<string> = [
  'key', '', ' ', 'hello world', 'AbC', '123', '0', 'true', 'null_key', 'undefined_key',
  'NaN_key', 'Infinity_key', '-1', '0.5', '#@!',
  'a-b_c', '中文', '日本語', '한국어', 'Ω≈ç√',
  'emoji😀', 'line\nbreak', 'tab\tsep', '\\0', '\\undef',
  '␣', 'a\r\nb', '<script>alert(1)</script>', 'https://test.com',
  '13800138000', 'test@example.com', '310101199001011234', '138****8000', '2026-03-05',
  'test', '测试', 'x', '#@!dup', 'test😀混合',
];

const STRING_LRU_VALUES: Array<string> = [
  'value', '', ' ', 'foo bar', 'AbC_v', '456', '0_v', 'false', 'null_v', 'undefined_v',
  'NaN_v', 'Infinity_v', '-99', '1.5', '#@!_v',
  'x-y_z', '数值', '日本語_v', '한국어_v', 'Ω≈ç√_v',
  'emoji😀_v', 'line\nbreak2', 'tab\tsep2', '\\0_v', '\\undef_v',
  'test', '测试', '0', 'NaN', 'true', 'null', 'undefined',
  '   ', '\u200B', '\u0000', 'a', '13800138000', 'test@example.com',
  '<script>alert(1)</script>', 'https://test.com', '2026-03-05', '138****8000',
];

export default function lruCacheStringTest() {
  describe('LruCacheStringTest', () => {
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
     * @tc.name testLruCacheStringTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_STRING_TEST_0100
     * @tc.desc Verify constructor, getCapacity, length and isEmpty with string keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheStringTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: util.LRUCache<string, string> =
        new util.LRUCache<string, string>();
      expect(emptyCache.length).assertEqual(0);
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const smallCache: util.LRUCache<string, string> =
        new util.LRUCache<string, string>(2);
      smallCache.put(STRING_LRU_KEYS[0], STRING_LRU_VALUES[0]);
      expect(smallCache.length).assertEqual(1);
      expect(smallCache.isEmpty()).assertFalse();
      expect(smallCache.getCapacity()).assertEqual(2);

      const evictCache: util.LRUCache<string, string> =
        new util.LRUCache<string, string>(1);
      evictCache.put(STRING_LRU_KEYS[1], STRING_LRU_VALUES[1]);
      evictCache.put(STRING_LRU_KEYS[2], STRING_LRU_VALUES[2]);
      expect(evictCache.length).assertEqual(1);
    });

    /**
     * @tc.name testLruCacheStringTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_STRING_TEST_0200
     * @tc.desc Verify put, get, contains and remove with string keys including empty and unicode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheStringTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<string, string> =
        new util.LRUCache<string, string>();

      const putResult: string = cache.put(STRING_LRU_KEYS[0], STRING_LRU_VALUES[0]);
      expect(putResult).assertEqual(STRING_LRU_VALUES[0]);

      cache.put(STRING_LRU_KEYS[1], STRING_LRU_VALUES[1]);
      expect(cache.get(STRING_LRU_KEYS[1])).assertEqual(STRING_LRU_VALUES[1]);

      cache.put(STRING_LRU_KEYS[17], STRING_LRU_VALUES[17]);
      expect(cache.get(STRING_LRU_KEYS[17])).assertEqual(STRING_LRU_VALUES[17]);

      cache.put(STRING_LRU_KEYS[23], STRING_LRU_VALUES[23]);
      expect(cache.get(STRING_LRU_KEYS[23])).assertEqual(STRING_LRU_VALUES[23]);

      cache.put(STRING_LRU_KEYS[24], STRING_LRU_VALUES[24]);
      expect(cache.get(STRING_LRU_KEYS[24])).assertEqual(STRING_LRU_VALUES[24]);

      cache.put(STRING_LRU_KEYS[25], '␣_val');
      expect(cache.get(STRING_LRU_KEYS[25])).assertEqual('␣_val');

      cache.put(STRING_LRU_KEYS[27], STRING_LRU_KEYS[27]);
      expect(cache.get(STRING_LRU_KEYS[27])).assertEqual(STRING_LRU_KEYS[27]);

      cache.put(STRING_LRU_KEYS[28], STRING_LRU_KEYS[28]);
      expect(cache.get(STRING_LRU_KEYS[28])).assertEqual(STRING_LRU_KEYS[28]);

      expect(cache.contains('missing')).assertFalse();
      const removed: string | undefined = cache.remove(STRING_LRU_KEYS[0]);
      expect(removed).assertEqual(STRING_LRU_VALUES[0]);
      expect(cache.remove('missing')).assertUndefined();
    });

    /**
     * @tc.name testLruCacheStringTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_STRING_TEST_0300
     * @tc.desc Verify duplicate key overwrite, updateCapacity shrink and getRemovalCount
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheStringTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<string, string> =
        new util.LRUCache<string, string>(4);
      cache.put(STRING_LRU_KEYS[0], STRING_LRU_VALUES[0]);
      cache.put(STRING_LRU_KEYS[0], STRING_LRU_VALUES[3]);
      expect(cache.length).assertEqual(1);
      expect(cache.get(STRING_LRU_KEYS[0])).assertEqual(STRING_LRU_VALUES[3]);

      cache.put(STRING_LRU_KEYS[1], STRING_LRU_VALUES[1]);
      cache.put(STRING_LRU_KEYS[2], STRING_LRU_VALUES[2]);
      cache.put(STRING_LRU_KEYS[3], STRING_LRU_VALUES[3]);
      expect(cache.length).assertEqual(4);

      cache.put(STRING_LRU_KEYS[4], STRING_LRU_VALUES[4]);
      expect(cache.length).assertEqual(4);
      expect(cache.contains(STRING_LRU_KEYS[0])).assertFalse();
      expect(cache.getRemovalCount()).assertEqual(1);

      cache.updateCapacity(2);
      expect(cache.getCapacity()).assertEqual(2);
      expect(cache.length).assertEqual(2);

      cache.updateCapacity(8);
      expect(cache.getCapacity()).assertEqual(8);
      expect(cache.length).assertEqual(2);
    });

    /**
     * @tc.name testLruCacheStringTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_STRING_TEST_0400
     * @tc.desc Verify keys and values access order plus clear with string entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheStringTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<string, string> =
        new util.LRUCache<string, string>(8);
      cache.put(STRING_LRU_KEYS[0], STRING_LRU_VALUES[0]);
      cache.put(STRING_LRU_KEYS[1], STRING_LRU_VALUES[1]);
      cache.put(STRING_LRU_KEYS[2], STRING_LRU_VALUES[2]);

      const initialKeys: Array<string> = cache.keys();
      expect(initialKeys[0]).assertEqual(STRING_LRU_KEYS[0]);
      expect(initialKeys.length).assertEqual(3);

      cache.get(STRING_LRU_KEYS[0]);
      const accessedKeys: Array<string> = cache.keys();
      expect(accessedKeys[0]).assertEqual(STRING_LRU_KEYS[1]);
      expect(accessedKeys[2]).assertEqual(STRING_LRU_KEYS[0]);

      const accessedValues: Array<string> = cache.values();
      expect(accessedValues[2]).assertEqual(STRING_LRU_VALUES[0]);

      cache.clear();
      expect(cache.length).assertEqual(0);
      expect(cache.isEmpty()).assertTrue();
    });

    /**
     * @tc.name testLruCacheStringTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_STRING_TEST_0500
     * @tc.desc Verify entries and for-of iteration order with string entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheStringTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<string, string> =
        new util.LRUCache<string, string>(8);
      cache.put(STRING_LRU_KEYS[0], STRING_LRU_VALUES[0]);
      cache.put(STRING_LRU_KEYS[1], STRING_LRU_VALUES[1]);
      cache.put(STRING_LRU_KEYS[2], STRING_LRU_VALUES[2]);

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0]).assertEqual(STRING_LRU_KEYS[0]);
      expect(firstPair.value[1]).assertEqual(STRING_LRU_VALUES[0]);

      const secondPair = pairIterator.next();
      expect(secondPair.value[0]).assertEqual(STRING_LRU_KEYS[1]);

      let iteratedCount: number = 0;
      let lastKey: string = '';
      for (const pair of cache) {
        iteratedCount++;
        lastKey = pair[0];
      }
      expect(iteratedCount).assertEqual(3);
      expect(lastKey).assertEqual(STRING_LRU_KEYS[2]);
    });

    /**
     * @tc.name testLruCacheStringTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_STRING_TEST_0600
     * @tc.desc Verify count statistics, toString and createDefault with string keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheStringTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<string, string> =
        new util.LRUCache<string, string>(16);
      expect(cache.createDefault(STRING_LRU_KEYS[0])).assertUndefined();

      cache.put(STRING_LRU_KEYS[0], STRING_LRU_VALUES[0]);
      cache.get(STRING_LRU_KEYS[0]);
      expect(cache.getPutCount()).assertEqual(1);
      expect(cache.getMatchCount()).assertEqual(1);

      cache.get('missing1');
      cache.get('missing2');
      expect(cache.getMissCount()).assertEqual(2);

      const text: string = cache.toString();
      expect(text.includes('maxSize = 16')).assertTrue();
      expect(text.includes('hits = 1')).assertTrue();
      expect(text.includes('misses = 2')).assertTrue();

      class ChildStringLruCache extends util.LRUCache<string, string> {
        createDefault(key: string): string {
          return 'default';
        }
      }
      const childCache: ChildStringLruCache = new ChildStringLruCache();
      expect(childCache.get('absent')).assertEqual('default');
      expect(childCache.getCreateCount()).assertEqual(1);

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
    });

    /**
     * @tc.name testLruCacheStringTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_STRING_TEST_0700
     * @tc.desc Verify null and undefined key/value rejection with proper error handling
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheStringTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<string, string> =
        new util.LRUCache<string, string>(16);
      cache.put(STRING_LRU_KEYS[29], STRING_LRU_KEYS[29]);
      cache.put(STRING_LRU_KEYS[30], STRING_LRU_KEYS[30]);
      cache.put(STRING_LRU_KEYS[31], STRING_LRU_KEYS[31]);
      cache.put(STRING_LRU_KEYS[32], STRING_LRU_KEYS[32]);
      cache.put(STRING_LRU_KEYS[33], STRING_LRU_KEYS[33]);
      expect(cache.length).assertEqual(5);

      expect(cache.get(STRING_LRU_KEYS[29])).assertEqual(STRING_LRU_KEYS[29]);
      expect(cache.get(STRING_LRU_KEYS[30])).assertEqual(STRING_LRU_KEYS[30]);
      expect(cache.get(STRING_LRU_KEYS[31])).assertEqual(STRING_LRU_KEYS[31]);
      expect(cache.contains(STRING_LRU_KEYS[32])).assertTrue();

      expect(cache.contains('1380013800')).assertFalse();
      expect(cache.contains('TEST@EXAMPLE.COM')).assertFalse();

      let caughtNullKey: boolean = false;
      try {
        const nullKey: string | null | undefined = null;
        cache.put(coerceString(nullKey), 'val');
      } catch (e) {
        caughtNullKey = true;
      }
      expect(caughtNullKey).assertTrue();

      let caughtUndefinedVal: boolean = false;
      try {
        const undefVal: string | null | undefined = undefined;
        cache.put('key_undef', coerceString(undefVal));
      } catch (e) {
        caughtUndefinedVal = true;
      }
      expect(caughtUndefinedVal).assertTrue();
    });

    /**
     * @tc.name testLruCacheStringTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_STRING_TEST_0800
     * @tc.desc Verify empty, whitespace and escaped string keys as distinct cache entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheStringTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<string, string> =
        new util.LRUCache<string, string>(16);
      cache.put(STRING_LRU_KEYS[1], 'empty');
      cache.put(STRING_LRU_KEYS[2], 'space');
      cache.put(STRING_LRU_KEYS[25], '␣_val');
      cache.put(STRING_LRU_KEYS[26], 'crlf');
      expect(cache.length).assertEqual(4);

      expect(cache.get('')).assertEqual('empty');
      expect(cache.get(' ')).assertEqual('space');
      expect(cache.get(STRING_LRU_KEYS[25])).assertEqual('␣_val');
      expect(cache.get(STRING_LRU_KEYS[26])).assertEqual('crlf');

      expect(cache.remove(STRING_LRU_KEYS[2])).assertEqual('space');
      expect(cache.length).assertEqual(3);
    });
  });
}
