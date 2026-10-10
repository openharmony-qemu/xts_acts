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

function coerceString(input: string | null | undefined): string {
  return input as string;
}

const STRING_SLRU_KEYS: Array<string> = [
  'key', '', ' ', 'hello world', 'AbC', '123', '0', 'true', 'null_key', 'undefined_key',
  'NaN_key', 'Infinity_key', '-1', '0.5', '#@!',
  'a-b_c', '中文', '日本語', '한국어', 'Ω≈ç√',
  'emoji😀', 'line\nbreak', 'tab\tsep', 'test', '测试',
  '␣', 'a\r\nb', '<script>alert(1)</script>', 'https://test.com',
  '13800138000', 'test@example.com', '310101199001011234', '138****8000', '2026-03-05',
];

const STRING_SLRU_VALUES: Array<string> = [
  'value', '', ' ', 'foo bar', 'AbC_v', '456', '0_v', 'false', 'null_v', 'undefined_v',
  'NaN_v', 'Infinity_v', '-99', '1.5', '#@!_v',
  'x-y_z', '数值', '日本語_v', '한국어_v', 'Ω≈ç√_v',
  'emoji😀_v', 'line\nbreak2', 'tab\tsep2', 'val_test', 'val_测试',
  'test', '测试', '0', 'NaN', 'true', 'null', 'undefined',
  '   ', '\u200B', '\u0000', 'a', '13800138000', 'test@example.com',
  '<script>alert(1)</script>', 'https://test.com', '2026-03-05', '138****8000',
];

export default function sendableLruCacheStringTest() {
  describe('SendableLruCacheStringTest', () => {
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
     * @tc.name testSendableLruCacheStringTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_STRING_TEST_0100
     * @tc.desc Verify constructor, getCapacity and isEmpty with string keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheStringTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (): void => {
      const emptyCache: ArkTSUtils.SendableLruCache<string, string> =
        new ArkTSUtils.SendableLruCache<string, string>();
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const smallCache: ArkTSUtils.SendableLruCache<string, string> =
        new ArkTSUtils.SendableLruCache<string, string>(2);
      smallCache.put(STRING_SLRU_KEYS[0], STRING_SLRU_VALUES[0]);
      expect(smallCache.isEmpty()).assertFalse();
      expect(smallCache.getCapacity()).assertEqual(2);

      const evictCache: ArkTSUtils.SendableLruCache<string, string> =
        new ArkTSUtils.SendableLruCache<string, string>(1);
      evictCache.put(STRING_SLRU_KEYS[1], STRING_SLRU_VALUES[1]);
      evictCache.put(STRING_SLRU_KEYS[2], STRING_SLRU_VALUES[2]);
      expect(evictCache.length).assertEqual(1);
    });

    /**
     * @tc.name testSendableLruCacheStringTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_STRING_TEST_0200
     * @tc.desc Verify put, get, contains and remove with string keys including empty and unicode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheStringTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<string, string> =
        new ArkTSUtils.SendableLruCache<string, string>();

      const putResult: string = cache.put(STRING_SLRU_KEYS[0], STRING_SLRU_VALUES[0]);
      expect(putResult).assertEqual(STRING_SLRU_VALUES[0]);

      cache.put(STRING_SLRU_KEYS[1], STRING_SLRU_VALUES[1]);
      expect(cache.get(STRING_SLRU_KEYS[1])).assertEqual(STRING_SLRU_VALUES[1]);

      cache.put(STRING_SLRU_KEYS[17], STRING_SLRU_VALUES[17]);
      expect(cache.get(STRING_SLRU_KEYS[17])).assertEqual(STRING_SLRU_VALUES[17]);

      cache.put(STRING_SLRU_KEYS[23], STRING_SLRU_VALUES[23]);
      expect(cache.get(STRING_SLRU_KEYS[23])).assertEqual(STRING_SLRU_VALUES[23]);

      cache.put(STRING_SLRU_KEYS[24], STRING_SLRU_VALUES[24]);
      expect(cache.get(STRING_SLRU_KEYS[24])).assertEqual(STRING_SLRU_VALUES[24]);

      cache.put(STRING_SLRU_KEYS[25], '␣_val');
      expect(cache.get(STRING_SLRU_KEYS[25])).assertEqual('␣_val');

      cache.put(STRING_SLRU_KEYS[27], STRING_SLRU_KEYS[27]);
      expect(cache.get(STRING_SLRU_KEYS[27])).assertEqual(STRING_SLRU_KEYS[27]);

      cache.put(STRING_SLRU_KEYS[28], STRING_SLRU_KEYS[28]);
      expect(cache.get(STRING_SLRU_KEYS[28])).assertEqual(STRING_SLRU_KEYS[28]);

      expect(cache.contains('missing')).assertFalse();
      const removed: string | undefined = cache.remove(STRING_SLRU_KEYS[0]);
      expect(removed).assertEqual(STRING_SLRU_VALUES[0]);
      expect(cache.remove('missing')).assertUndefined();

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
     * @tc.name testSendableLruCacheStringTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_STRING_TEST_0300
     * @tc.desc Verify duplicate key overwrite, eviction and updateCapacity with string entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheStringTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<string, string> =
        new ArkTSUtils.SendableLruCache<string, string>(4);
      cache.put(STRING_SLRU_KEYS[0], STRING_SLRU_VALUES[0]);
      cache.put(STRING_SLRU_KEYS[0], STRING_SLRU_VALUES[3]);
      expect(cache.length).assertEqual(1);
      expect(cache.get(STRING_SLRU_KEYS[0])).assertEqual(STRING_SLRU_VALUES[3]);

      cache.put(STRING_SLRU_KEYS[1], STRING_SLRU_VALUES[1]);
      cache.put(STRING_SLRU_KEYS[2], STRING_SLRU_VALUES[2]);
      cache.put(STRING_SLRU_KEYS[3], STRING_SLRU_VALUES[3]);
      cache.put(STRING_SLRU_KEYS[4], STRING_SLRU_VALUES[4]);
      expect(cache.length).assertEqual(4);
      expect(cache.contains(STRING_SLRU_KEYS[0])).assertFalse();
      expect(cache.getRemoveCount()).assertEqual(1);

      cache.updateCapacity(2);
      expect(cache.getCapacity()).assertEqual(2);
      expect(cache.length).assertEqual(2);

      cache.updateCapacity(8);
      expect(cache.getCapacity()).assertEqual(8);
    });

    /**
     * @tc.name testSendableLruCacheStringTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_STRING_TEST_0400
     * @tc.desc Verify keys, values, entries order plus clear with string entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheStringTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<string, string> =
        new ArkTSUtils.SendableLruCache<string, string>(8);
      cache.put(STRING_SLRU_KEYS[0], STRING_SLRU_VALUES[0]);
      cache.put(STRING_SLRU_KEYS[1], STRING_SLRU_VALUES[1]);
      cache.put(STRING_SLRU_KEYS[2], STRING_SLRU_VALUES[2]);

      const initialKeys: Array<string> = cache.keys();
      expect(initialKeys[0]).assertEqual(STRING_SLRU_KEYS[0]);
      expect(initialKeys[1]).assertEqual(STRING_SLRU_KEYS[1]);
      expect(initialKeys[2]).assertEqual(STRING_SLRU_KEYS[2]);

      cache.get(STRING_SLRU_KEYS[0]);
      const accessedKeys: Array<string> = cache.keys();
      expect(accessedKeys[0]).assertEqual(STRING_SLRU_KEYS[1]);
      expect(accessedKeys[2]).assertEqual(STRING_SLRU_KEYS[0]);

      const accessedValues: Array<string> = cache.values();
      expect(accessedValues[0]).assertEqual(STRING_SLRU_VALUES[1]);

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0]).assertEqual(STRING_SLRU_KEYS[1]);
      expect(firstPair.value[1]).assertEqual(STRING_SLRU_VALUES[1]);

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
    });

    /**
     * @tc.name testSendableLruCacheStringTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_STRING_TEST_0500
     * @tc.desc Verify special character and business string keys are distinct entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheStringTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<string, string> =
        new ArkTSUtils.SendableLruCache<string, string>(32);
      cache.put(STRING_SLRU_KEYS[25], 'zwsp');
      cache.put(STRING_SLRU_KEYS[26], 'nul');
      cache.put(STRING_SLRU_KEYS[27], 'crlf');
      cache.put(STRING_SLRU_KEYS[28], 'xss');
      cache.put(STRING_SLRU_KEYS[29], 'url');
      cache.put(STRING_SLRU_KEYS[30], 'phone');
      cache.put(STRING_SLRU_KEYS[31], 'email');
      cache.put(STRING_SLRU_KEYS[32], 'idcard');
      cache.put(STRING_SLRU_KEYS[33], 'masked');

      expect(cache.get(STRING_SLRU_KEYS[25])).assertEqual('zwsp');
      expect(cache.get(STRING_SLRU_KEYS[27])).assertEqual('crlf');
      expect(cache.get(STRING_SLRU_KEYS[28])).assertEqual('xss');
      expect(cache.get(STRING_SLRU_KEYS[30])).assertEqual('phone');
      expect(cache.get(STRING_SLRU_KEYS[32])).assertEqual('idcard');

      expect(cache.contains('1380013800')).assertFalse();
      expect(cache.contains('TEST@EXAMPLE.COM')).assertFalse();
    });

    /**
     * @tc.name testSendableLruCacheStringTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_STRING_TEST_0600
     * @tc.desc Verify count statistics and toString with string entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheStringTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<string, string> =
        new ArkTSUtils.SendableLruCache<string, string>(16);
      cache.put(STRING_SLRU_KEYS[0], STRING_SLRU_VALUES[0]);
      cache.get(STRING_SLRU_KEYS[0]);
      cache.get('missing1');
      cache.get('missing2');

      expect(cache.getPutCount()).assertEqual(1);
      expect(cache.getMatchCount()).assertEqual(1);
      expect(cache.getMissCount()).assertEqual(2);

      const text: string = cache.toString();
      expect(text.includes('maxSize = 16')).assertTrue();
      expect(text.includes('hits = 1')).assertTrue();
      expect(text.includes('misses = 2')).assertTrue();
    });

    /**
     * @tc.name testSendableLruCacheStringTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_STRING_TEST_0700
     * @tc.desc Verify createDefault hook returns undefined by default and custom value when overridden
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheStringTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const defaultCache: ArkTSUtils.SendableLruCache<string, string> =
        new ArkTSUtils.SendableLruCache<string, string>();
      const missValue: string | undefined = defaultCache.get('absent');
      expect(missValue).assertUndefined();
      expect(defaultCache.getMissCount()).assertEqual(1);
      expect(defaultCache.getCreateCount()).assertEqual(0);

      @Sendable class ChildStringSlruCache extends ArkTSUtils.SendableLruCache<string, string> {
        createDefault(key: string): string {
          return 'default';
        }
      }

      const childCache: ChildStringSlruCache = new ChildStringSlruCache();
      const createdValue: string | undefined = childCache.get('absent');
      expect(createdValue).assertEqual('default');
      expect(childCache.contains('absent')).assertTrue();
      expect(childCache.getCreateCount()).assertEqual(1);
      expect(childCache.getMissCount()).assertEqual(1);

      const createdValue2: string | undefined = childCache.get('absent2');
      expect(createdValue2).assertEqual('default');
      expect(childCache.getCreateCount()).assertEqual(2);
    });
  });
}
