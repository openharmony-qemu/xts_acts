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

@Sendable
class SendablePoint {
  x: number = 0;
  y: number = 0;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

const KEY_SP_A: SendablePoint = new SendablePoint(1, 2);
const KEY_SP_B: SendablePoint = new SendablePoint(3, 4);
const KEY_SP_C: SendablePoint = new SendablePoint(5, 6);
const VALUE_SP_A: SendablePoint = new SendablePoint(10, 20);
const VALUE_SP_B: SendablePoint = new SendablePoint(30, 40);
const VALUE_SP_C: SendablePoint = new SendablePoint(50, 60);

export default function sendableLruCacheSendableTest() {
  describe('SendableLruCacheSendableTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testSendableLruCacheSendableTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_SENDABLE_TEST_0100
     * @tc.desc Verify constructor, getCapacity and isEmpty with Sendable object keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheSendableTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: ArkTSUtils.SendableLruCache<SendablePoint, SendablePoint> = new ArkTSUtils.SendableLruCache<
        SendablePoint,
        SendablePoint
      >();
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const cache: ArkTSUtils.SendableLruCache<SendablePoint, SendablePoint> = new ArkTSUtils.SendableLruCache<
        SendablePoint,
        SendablePoint
      >(4);
      cache.put(KEY_SP_A, VALUE_SP_A);
      expect(cache.isEmpty()).assertFalse();
    });

    /**
     * @tc.name testSendableLruCacheSendableTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_SENDABLE_TEST_0200
     * @tc.desc Verify put, get, contains and remove with Sendable object reference identity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheSendableTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<SendablePoint, SendablePoint> = new ArkTSUtils.SendableLruCache<
        SendablePoint,
        SendablePoint
      >();

      const putResult: SendablePoint = cache.put(KEY_SP_A, VALUE_SP_A);
      expect(putResult.x).assertEqual(10);

      const getResult: SendablePoint | undefined = cache.get(KEY_SP_A);
      expect(getResult !== undefined).assertTrue();
      expect(getResult!.x).assertEqual(10);
      expect(getResult!.y).assertEqual(20);

      const sameShapeKey: SendablePoint = new SendablePoint(1, 2);
      expect(cache.contains(sameShapeKey)).assertFalse();

      cache.put(KEY_SP_B, VALUE_SP_B);
      const removed: SendablePoint | undefined = cache.remove(KEY_SP_A);
      expect(removed!.x).assertEqual(10);
      expect(cache.contains(KEY_SP_A)).assertFalse();
      expect(cache.remove(sameShapeKey)).assertUndefined();
    });

    /**
     * @tc.name testSendableLruCacheSendableTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_SENDABLE_TEST_0300
     * @tc.desc Verify overwrite, eviction and updateCapacity with Sendable object entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheSendableTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<SendablePoint, SendablePoint> = new ArkTSUtils.SendableLruCache<
        SendablePoint,
        SendablePoint
      >(4);
      cache.put(KEY_SP_A, VALUE_SP_A);
      cache.put(KEY_SP_A, VALUE_SP_C);
      expect(cache.length).assertEqual(1);
      expect(cache.get(KEY_SP_A)!.x).assertEqual(50);

      cache.put(KEY_SP_B, VALUE_SP_B);
      cache.put(KEY_SP_C, VALUE_SP_C);
      const extraKey: SendablePoint = new SendablePoint(7, 8);
      cache.put(extraKey, VALUE_SP_A);
      expect(cache.length).assertEqual(4);

      const extraKey2: SendablePoint = new SendablePoint(9, 10);
      cache.put(extraKey2, VALUE_SP_B);
      expect(cache.contains(KEY_SP_A)).assertFalse();
      expect(cache.getRemoveCount()).assertEqual(1);

      cache.updateCapacity(2);
      expect(cache.getCapacity()).assertEqual(2);
      expect(cache.length).assertEqual(2);
    });

    /**
     * @tc.name testSendableLruCacheSendableTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_SENDABLE_TEST_0400
     * @tc.desc Verify keys, values, entries content plus clear with Sendable object entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheSendableTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<SendablePoint, SendablePoint> = new ArkTSUtils.SendableLruCache<
        SendablePoint,
        SendablePoint
      >(8);
      cache.put(KEY_SP_A, VALUE_SP_A);
      cache.put(KEY_SP_B, VALUE_SP_B);
      cache.put(KEY_SP_C, VALUE_SP_C);

      const keys: Array<SendablePoint> = cache.keys();
      expect(keys[0].x).assertEqual(1);
      expect(keys[1].x).assertEqual(3);
      expect(keys[2].x).assertEqual(5);

      cache.get(KEY_SP_A);
      const accessedKeys: Array<SendablePoint> = cache.keys();
      expect(accessedKeys[0].x).assertEqual(3);
      expect(accessedKeys[2].x).assertEqual(1);

      const values: Array<SendablePoint> = cache.values();
      expect(values[0].y).assertEqual(40);

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0].x).assertEqual(3);
      expect(firstPair.value[1].y).assertEqual(40);

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
      expect(cache.values().length).assertEqual(0);
    });

    /**
     * @tc.name testSendableLruCacheSendableTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_SENDABLE_TEST_0500
     * @tc.desc Verify statistics and toString with Sendable object entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheSendableTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<SendablePoint, SendablePoint> = new ArkTSUtils.SendableLruCache<
        SendablePoint,
        SendablePoint
      >(8);
      cache.put(KEY_SP_A, VALUE_SP_A);
      cache.get(KEY_SP_A);
      cache.get(KEY_SP_B);

      expect(cache.getPutCount()).assertEqual(1);
      expect(cache.getMatchCount()).assertEqual(1);
      expect(cache.getMissCount()).assertEqual(1);

      const text: string = cache.toString();
      expect(text.includes('maxSize = 8')).assertTrue();
      expect(text.includes('hits = 1')).assertTrue();
    });

    /**
     * @tc.name testSendableLruCacheSendableTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_SENDABLE_TEST_0600
     * @tc.desc Verify capacity equals size boundary and shrink to 1 keeps most recent entry
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheSendableTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<SendablePoint, SendablePoint> = new ArkTSUtils.SendableLruCache<
        SendablePoint,
        SendablePoint
      >(2);
      cache.put(KEY_SP_A, VALUE_SP_A);
      cache.put(KEY_SP_B, VALUE_SP_B);

      cache.updateCapacity(2);
      expect(cache.getCapacity()).assertEqual(2);
      expect(cache.length).assertEqual(2);

      cache.get(KEY_SP_A);
      cache.updateCapacity(1);
      expect(cache.getCapacity()).assertEqual(1);
      expect(cache.length).assertEqual(1);
      expect(cache.get(KEY_SP_A)!.y).assertEqual(20);
      expect(cache.contains(KEY_SP_B)).assertFalse();

      cache.updateCapacity(10);
      cache.put(KEY_SP_C, VALUE_SP_C);
      expect(cache.length).assertEqual(2);
    });
  });
}
