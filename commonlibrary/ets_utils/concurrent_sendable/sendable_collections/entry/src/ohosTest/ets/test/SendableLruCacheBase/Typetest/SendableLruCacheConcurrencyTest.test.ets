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
import { taskpool } from '@kit.ArkTS';
import { beforeAll, beforeEach, afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Sendable
class ConcurrentPoint {
  x: number = 0;
  y: number = 0;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

const CONC_KEY_A: ConcurrentPoint = new ConcurrentPoint(1, 2);
const CONC_KEY_B: ConcurrentPoint = new ConcurrentPoint(3, 4);
const CONC_VAL_A: ConcurrentPoint = new ConcurrentPoint(10, 20);
const CONC_VAL_B: ConcurrentPoint = new ConcurrentPoint(30, 40);

@Concurrent
function concurrentReader(cache: ArkTSUtils.SendableLruCache<number, number>, key: number, expected: number): boolean {
  const value: number | undefined = cache.get(key);
  cache.put(key * 100, value === undefined ? -1 : value + expected);
  return cache.contains(key);
}

@Concurrent
function concurrentWriter(cache: ArkTSUtils.SendableLruCache<number, number>, key: number, value: number): number {
  return cache.put(key, value);
}

export default function sendableLruCacheConcurrencyTest() {
  describe('SendableLruCacheConcurrencyTest', () => {
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
     * @tc.name testSendableLruCacheConcurrencyTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_CONCURRENCY_TEST_0100
     * @tc.desc Verify SendableLruCache passed to two sequential worker tasks preserves put and get consistency
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheConcurrencyTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const sendableCache: ArkTSUtils.SendableLruCache<number, number> =
        new ArkTSUtils.SendableLruCache<number, number>(16);
      sendableCache.put(1, 11);
      sendableCache.put(2, 22);

      const taskA: taskpool.Task = new taskpool.Task(concurrentReader, sendableCache, 1, 11);
      const taskB: taskpool.Task = new taskpool.Task(concurrentReader, sendableCache, 2, 22);

      const resultA: boolean = (await taskpool.execute(taskA)) as boolean;
      const resultB: boolean = (await taskpool.execute(taskB)) as boolean;

      expect(resultA).assertTrue();
      expect(resultB).assertTrue();
      expect(sendableCache.contains(100)).assertTrue();
      expect(sendableCache.contains(200)).assertTrue();
      expect(sendableCache.length).assertEqual(4);
      await sleep(30);
    });

    /**
     * @tc.name testSendableLruCacheConcurrencyTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_CONCURRENCY_TEST_0200
     * @tc.desc Verify concurrent writers updating distinct keys keep total entry count consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheConcurrencyTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const sendableCache: ArkTSUtils.SendableLruCache<number, number> =
        new ArkTSUtils.SendableLruCache<number, number>(32);

      const taskA: taskpool.Task = new taskpool.Task(concurrentWriter, sendableCache, 1, 11);
      const taskB: taskpool.Task = new taskpool.Task(concurrentWriter, sendableCache, 2, 22);
      const taskC: taskpool.Task = new taskpool.Task(concurrentWriter, sendableCache, 3, 33);

      const resultA: number = (await taskpool.execute(taskA)) as number;
      const resultB: number = (await taskpool.execute(taskB)) as number;
      const resultC: number = (await taskpool.execute(taskC)) as number;

      expect(resultA).assertEqual(11);
      expect(resultB).assertEqual(22);
      expect(resultC).assertEqual(33);
      expect(sendableCache.length).assertEqual(3);
      expect(sendableCache.contains(1)).assertTrue();
      expect(sendableCache.contains(2)).assertTrue();
      expect(sendableCache.contains(3)).assertTrue();
      await sleep(30);
    });

    /**
     * @tc.name testSendableLruCacheConcurrencyTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENDABLE_LRU_CACHE_CONCURRENCY_TEST_0300
     * @tc.desc Verify Sendable object values retain field values when read in the main thread
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSendableLruCacheConcurrencyTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: ArkTSUtils.SendableLruCache<ConcurrentPoint, ConcurrentPoint> =
        new ArkTSUtils.SendableLruCache<ConcurrentPoint, ConcurrentPoint>(8);
      cache.put(CONC_KEY_A, CONC_VAL_A);
      cache.put(CONC_KEY_B, CONC_VAL_B);

      const getA: ConcurrentPoint | undefined = cache.get(CONC_KEY_A);
      expect(getA !== undefined).assertTrue();
      expect(getA!.x).assertEqual(10);
      expect(getA!.y).assertEqual(20);

      const getB: ConcurrentPoint | undefined = cache.get(CONC_KEY_B);
      expect(getB !== undefined).assertTrue();
      expect(getB!.x).assertEqual(30);
      expect(getB!.y).assertEqual(40);

      const keys: Array<ConcurrentPoint> = cache.keys();
      expect(keys.length).assertEqual(2);
      expect(cache.length).assertEqual(2);
    });
  });
}
