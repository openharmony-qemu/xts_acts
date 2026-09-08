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
import * as nonSendableHelper from './NonSendableCacheHelper';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

function makeObjValue(id: number): number {
  return nonSendableHelper.toNumber(nonSendableHelper.makeNonSendableObj(id)) as number;
}

function makeFunctionValue(): number {
  return nonSendableHelper.toNumber(nonSendableHelper.buildNonSendableValues()[1]) as number;
}

function makeMapValue(): number {
  return nonSendableHelper.toNumber(nonSendableHelper.buildNonSendableValues()[2]) as number;
}

function makeSetValue(): number {
  return nonSendableHelper.toNumber(nonSendableHelper.buildNonSendableValues()[3]) as number;
}

function makeDateValue(): number {
  return nonSendableHelper.toNumber(nonSendableHelper.buildNonSendableValues()[4]) as number;
}

function makeRegexValue(): number {
  return nonSendableHelper.toNumber(nonSendableHelper.buildNonSendableValues()[5]) as number;
}

export default function sendableLruCacheNonSendableTest() {
  describe('SendableLruCacheNonSendableTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testSendableLruCacheNonSendableTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_NON_SENDABLE_TEST_0100
     * @tc.desc Verify put rejects non-Sendable plain object as key or value with runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheNonSendableTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();

      let keyThrew: boolean = false;
      try {
        cache.put(makeObjValue(1), 10);
      } catch (e) {
        keyThrew = true;
      }
      expect(keyThrew).assertTrue();

      let valueThrew: boolean = false;
      try {
        cache.put(1, makeObjValue(2));
      } catch (e) {
        valueThrew = true;
      }
      expect(valueThrew).assertTrue();

      expect(cache.length).assertEqual(0);
      expect(cache.isEmpty()).assertTrue();
    });

    /**
     * @tc.name testSendableLruCacheNonSendableTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_NON_SENDABLE_TEST_0200
     * @tc.desc Verify put rejects non-Sendable function as key and value with runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheNonSendableTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();

      let keyThrew: boolean = false;
      try {
        cache.put(makeFunctionValue(), 10);
      } catch (e) {
        keyThrew = true;
      }
      expect(keyThrew).assertTrue();

      let valueThrew: boolean = false;
      try {
        cache.put(1, makeFunctionValue());
      } catch (e) {
        valueThrew = true;
      }
      expect(valueThrew).assertTrue();
      expect(cache.length).assertEqual(0);
    });

    /**
     * @tc.name testSendableLruCacheNonSendableTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_NON_SENDABLE_TEST_0300
     * @tc.desc Verify put rejects non-Sendable Map and Set as key and value with runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheNonSendableTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();

      let mapValueThrew: boolean = false;
      try {
        cache.put(1, makeMapValue());
      } catch (e) {
        mapValueThrew = true;
      }
      expect(mapValueThrew).assertTrue();

      let setValueThrew: boolean = false;
      try {
        cache.put(2, makeSetValue());
      } catch (e) {
        setValueThrew = true;
      }
      expect(setValueThrew).assertTrue();

      let mapKeyThrew: boolean = false;
      try {
        cache.put(makeMapValue(), 3);
      } catch (e) {
        mapKeyThrew = true;
      }
      expect(mapKeyThrew).assertTrue();

      let setKeyThrew: boolean = false;
      try {
        cache.put(makeSetValue(), 4);
      } catch (e) {
        setKeyThrew = true;
      }
      expect(setKeyThrew).assertTrue();
      expect(cache.length).assertEqual(0);
    });

    /**
     * @tc.name testSendableLruCacheNonSendableTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_NON_SENDABLE_TEST_0400
     * @tc.desc Verify put rejects non-Sendable Date and RegExp as key and value with runtime error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheNonSendableTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();

      let dateValueThrew: boolean = false;
      try {
        cache.put(1, makeDateValue());
      } catch (e) {
        dateValueThrew = true;
      }
      expect(dateValueThrew).assertTrue();

      let regexpValueThrew: boolean = false;
      try {
        cache.put(2, makeRegexValue());
      } catch (e) {
        regexpValueThrew = true;
      }
      expect(regexpValueThrew).assertTrue();

      let dateKeyThrew: boolean = false;
      try {
        cache.put(makeDateValue(), 3);
      } catch (e) {
        dateKeyThrew = true;
      }
      expect(dateKeyThrew).assertTrue();

      let regexpKeyThrew: boolean = false;
      try {
        cache.put(makeRegexValue(), 4);
      } catch (e) {
        regexpKeyThrew = true;
      }
      expect(regexpKeyThrew).assertTrue();
      expect(cache.length).assertEqual(0);
    });

    /**
     * @tc.name testSendableLruCacheNonSendableTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_NON_SENDABLE_TEST_0500
     * @tc.desc Verify get, contains and remove with non-Sendable key return miss semantics without throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheNonSendableTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
      cache.put(1, 10);

      const nonSendableKey: number = makeObjValue(3);

      let getThrew: boolean = false;
      let getResult: number | undefined;
      try {
        getResult = cache.get(nonSendableKey);
      } catch (e) {
        getThrew = true;
      }
      expect(getThrew).assertFalse();
      expect(getResult).assertUndefined();

      let containsThrew: boolean = false;
      let containsResult: boolean = false;
      try {
        containsResult = cache.contains(nonSendableKey);
      } catch (e) {
        containsThrew = true;
      }
      expect(containsThrew).assertFalse();
      expect(containsResult).assertFalse();

      let removeThrew: boolean = false;
      let removeResult: number | undefined;
      try {
        removeResult = cache.remove(nonSendableKey);
      } catch (e) {
        removeThrew = true;
      }
      expect(removeThrew).assertFalse();
      expect(removeResult).assertUndefined();

      expect(cache.length).assertEqual(1);
      expect(cache.get(1)).assertEqual(10);
    });
  });
}
