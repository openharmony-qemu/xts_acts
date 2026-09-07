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

class LruCachePoint {
  x: number = 0;
  y: number = 0;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

const KEY_POINT_A: LruCachePoint = new LruCachePoint(1, 2);
const KEY_POINT_B: LruCachePoint = new LruCachePoint(3, 4);
const KEY_POINT_C: LruCachePoint = new LruCachePoint(5, 6);
const VALUE_POINT_A: LruCachePoint = new LruCachePoint(10, 20);
const VALUE_POINT_B: LruCachePoint = new LruCachePoint(30, 40);
const VALUE_POINT_C: LruCachePoint = new LruCachePoint(50, 60);
const SAME_SHAPE_POINT: LruCachePoint = new LruCachePoint(1, 2);

class LruCacheNested {
  inner: LruCachePoint = new LruCachePoint(0, 0);
  tag: string = '';
}

const NESTED_A: LruCacheNested = new LruCacheNested();
NESTED_A.inner = VALUE_POINT_A;
NESTED_A.tag = 'a';
const NESTED_B: LruCacheNested = new LruCacheNested();
NESTED_B.inner = VALUE_POINT_B;
NESTED_B.tag = 'b';

const OBJECT_LRU_KEYS: Array<LruCachePoint> = [KEY_POINT_A, KEY_POINT_B, KEY_POINT_C];

const OBJECT_LRU_VALUES: Array<LruCachePoint> = [VALUE_POINT_A, VALUE_POINT_B, VALUE_POINT_C];

export default function lruCacheObjectTest() {
  describe('LruCacheObjectTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testLruCacheObjectTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_OBJECT_TEST_0100
     * @tc.desc Verify constructor, getCapacity, length and isEmpty with object keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheObjectTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: util.LRUCache<LruCachePoint, LruCachePoint> = new util.LRUCache<LruCachePoint, LruCachePoint>();
      expect(emptyCache.length).assertEqual(0);
      expect(emptyCache.isEmpty()).assertTrue();

      const cache: util.LRUCache<LruCachePoint, LruCachePoint> = new util.LRUCache<LruCachePoint, LruCachePoint>(2);
      cache.put(OBJECT_LRU_KEYS[0], OBJECT_LRU_VALUES[0]);
      expect(cache.length).assertEqual(1);
      expect(cache.isEmpty()).assertFalse();
      expect(cache.getCapacity()).assertEqual(2);
    });

    /**
     * @tc.name testLruCacheObjectTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_OBJECT_TEST_0200
     * @tc.desc Verify put, get, contains and remove with object reference identity keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheObjectTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<LruCachePoint, LruCachePoint> = new util.LRUCache<LruCachePoint, LruCachePoint>();

      const putResult: LruCachePoint = cache.put(OBJECT_LRU_KEYS[0], OBJECT_LRU_VALUES[0]);
      expect(putResult === VALUE_POINT_A).assertTrue();

      const getResult: LruCachePoint | undefined = cache.get(OBJECT_LRU_KEYS[0]);
      expect(getResult === VALUE_POINT_A).assertTrue();

      expect(cache.contains(SAME_SHAPE_POINT)).assertFalse();

      cache.put(OBJECT_LRU_KEYS[1], OBJECT_LRU_VALUES[1]);
      const removed: LruCachePoint | undefined = cache.remove(OBJECT_LRU_KEYS[0]);
      expect(removed === VALUE_POINT_A).assertTrue();
      expect(cache.contains(OBJECT_LRU_KEYS[0])).assertFalse();

      expect(cache.remove(SAME_SHAPE_POINT)).assertUndefined();
    });

    /**
     * @tc.name testLruCacheObjectTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_OBJECT_TEST_0300
     * @tc.desc Verify duplicate key overwrite, eviction and updateCapacity with object entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheObjectTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<LruCachePoint, LruCachePoint> = new util.LRUCache<LruCachePoint, LruCachePoint>(4);
      cache.put(OBJECT_LRU_KEYS[0], OBJECT_LRU_VALUES[0]);
      cache.put(OBJECT_LRU_KEYS[0], OBJECT_LRU_VALUES[2]);
      expect(cache.length).assertEqual(1);
      expect(cache.get(OBJECT_LRU_KEYS[0]) === VALUE_POINT_C).assertTrue();

      cache.put(OBJECT_LRU_KEYS[1], OBJECT_LRU_VALUES[1]);
      cache.put(OBJECT_LRU_KEYS[2], OBJECT_LRU_VALUES[2]);
      const extraKey: LruCachePoint = new LruCachePoint(7, 8);
      cache.put(extraKey, VALUE_POINT_A);
      expect(cache.length).assertEqual(4);

      const extraKey2: LruCachePoint = new LruCachePoint(9, 10);
      cache.put(extraKey2, VALUE_POINT_B);
      expect(cache.length).assertEqual(4);
      expect(cache.contains(OBJECT_LRU_KEYS[0])).assertFalse();
      expect(cache.getRemovalCount()).assertEqual(1);

      cache.updateCapacity(2);
      expect(cache.getCapacity()).assertEqual(2);
      expect(cache.length).assertEqual(2);
    });

    /**
     * @tc.name testLruCacheObjectTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_OBJECT_TEST_0400
     * @tc.desc Verify keys and values order, shared references and clear with object entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheObjectTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<LruCachePoint, LruCachePoint> = new util.LRUCache<LruCachePoint, LruCachePoint>(8);
      cache.put(OBJECT_LRU_KEYS[0], OBJECT_LRU_VALUES[0]);
      cache.put(OBJECT_LRU_KEYS[1], OBJECT_LRU_VALUES[1]);
      cache.put(OBJECT_LRU_KEYS[2], OBJECT_LRU_VALUES[2]);

      const initialKeys: Array<LruCachePoint> = cache.keys();
      expect(initialKeys[0] === KEY_POINT_A).assertTrue();

      cache.get(OBJECT_LRU_KEYS[0]);
      const accessedKeys: Array<LruCachePoint> = cache.keys();
      expect(accessedKeys[2] === KEY_POINT_A).assertTrue();
      expect(accessedKeys[0] === KEY_POINT_B).assertTrue();

      const accessedValues: Array<LruCachePoint> = cache.values();
      expect(accessedValues[2] === VALUE_POINT_A).assertTrue();

      cache.put(OBJECT_LRU_KEYS[1], VALUE_POINT_A);
      expect(cache.get(OBJECT_LRU_KEYS[1]) === VALUE_POINT_A).assertTrue();

      cache.clear();
      expect(cache.length).assertEqual(0);
    });

    /**
     * @tc.name testLruCacheObjectTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_OBJECT_TEST_0500
     * @tc.desc Verify entries and for-of iteration with object entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheObjectTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<LruCachePoint, LruCachePoint> = new util.LRUCache<LruCachePoint, LruCachePoint>(8);
      cache.put(OBJECT_LRU_KEYS[0], OBJECT_LRU_VALUES[0]);
      cache.put(OBJECT_LRU_KEYS[1], OBJECT_LRU_VALUES[1]);

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0] === KEY_POINT_A).assertTrue();
      expect(firstPair.value[1] === VALUE_POINT_A).assertTrue();

      let iteratedCount: number = 0;
      let lastKey: LruCachePoint | null = null;
      for (const pair of cache) {
        iteratedCount++;
        lastKey = pair[0];
      }
      expect(iteratedCount).assertEqual(2);
      expect(lastKey === KEY_POINT_B).assertTrue();
    });

    /**
     * @tc.name testLruCacheObjectTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_OBJECT_TEST_0600
     * @tc.desc Verify afterRemoval hook and count statistics with object entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheObjectTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let removalCount: number = 0;
      let lastRemovedKey: LruCachePoint | null = null;
      let lastRemovedValue: LruCachePoint | null = null;
      let lastIsEvict: boolean = false;

      class HookLruCache extends util.LRUCache<LruCachePoint, LruCachePoint> {
        afterRemoval(isEvict: boolean, key: LruCachePoint, value: LruCachePoint, newValue: LruCachePoint): void {
          removalCount++;
          lastRemovedKey = key;
          lastRemovedValue = value;
          lastIsEvict = isEvict;
        }
      }

      const cache: HookLruCache = new HookLruCache(2);
      cache.put(OBJECT_LRU_KEYS[0], OBJECT_LRU_VALUES[0]);
      cache.put(OBJECT_LRU_KEYS[1], OBJECT_LRU_VALUES[1]);
      cache.put(OBJECT_LRU_KEYS[2], OBJECT_LRU_VALUES[2]);
      expect(removalCount).assertEqual(1);
      expect(lastIsEvict).assertTrue();
      expect(lastRemovedKey === KEY_POINT_A).assertTrue();
      expect(lastRemovedValue === VALUE_POINT_A).assertTrue();

      cache.remove(OBJECT_LRU_KEYS[1]);
      expect(removalCount).assertEqual(2);

      cache.clear();
      expect(removalCount).assertEqual(3);
      expect(cache.getMissCount()).assertEqual(0);
      expect(cache.getPutCount()).assertEqual(3);
    });

    /**
     * @tc.name testLruCacheObjectTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_OBJECT_TEST_0700
     * @tc.desc Verify object keys keep reference identity in cache operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheObjectTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyA: LruCachePoint = new LruCachePoint(11, 12);
      const keyB: LruCachePoint = new LruCachePoint(13, 14);
      const cache: util.LRUCache<LruCachePoint, LruCachePoint> = new util.LRUCache<LruCachePoint, LruCachePoint>(4);

      cache.put(keyA, VALUE_POINT_A);
      expect(cache.get(keyA) === VALUE_POINT_A).assertTrue();
      expect(cache.contains(keyA)).assertTrue();

      cache.put(keyB, VALUE_POINT_B);
      expect(cache.length).assertEqual(2);

      const removed: LruCachePoint | undefined = cache.remove(keyA);
      expect(removed === VALUE_POINT_A).assertTrue();
      expect(cache.contains(keyB)).assertTrue();
      expect(cache.length).assertEqual(1);
    });

    /**
     * @tc.name testLruCacheObjectTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_OBJECT_TEST_0800
     * @tc.desc Verify nested object keys with shared inner references keep identity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheObjectTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<LruCacheNested, LruCachePoint> = new util.LRUCache<LruCacheNested, LruCachePoint>(4);

      cache.put(NESTED_A, VALUE_POINT_A);
      cache.put(NESTED_B, VALUE_POINT_B);
      expect(cache.length).assertEqual(2);

      expect(cache.get(NESTED_A) === VALUE_POINT_A).assertTrue();
      expect(cache.get(NESTED_B) === VALUE_POINT_B).assertTrue();
      expect(cache.get(NESTED_A) === VALUE_POINT_B).assertFalse();

      const sameShapeNested: LruCacheNested = new LruCacheNested();
      sameShapeNested.inner = VALUE_POINT_A;
      sameShapeNested.tag = 'a';
      expect(cache.contains(sameShapeNested)).assertFalse();

      const keys: Array<LruCacheNested> = cache.keys();
      expect(keys.length).assertEqual(2);
      expect(keys[0] === NESTED_A || keys[0] === NESTED_B).assertTrue();
    });
  });
}
