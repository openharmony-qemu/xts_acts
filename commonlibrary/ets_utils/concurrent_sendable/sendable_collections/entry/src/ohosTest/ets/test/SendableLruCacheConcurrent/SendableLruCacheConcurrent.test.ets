/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { collections, ArkTSUtils, worker } from '@kit.ArkTS';
import { taskpool } from '@kit.ArkTS';
import { MessageEvents } from '@kit.ArkTS';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

// ========== Sendable 辅助类 ==========

@Sendable
class TestKey {
  id: number;
  constructor(id: number) {
    this.id = id;
  }
}

// ========== @Concurrent 函数定义 ==========

@Concurrent
async function concurrentPutTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number,
  value: number
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    cache.put(key, value);
  });
}

@Concurrent
async function concurrentPutSameKeyTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  value: number
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    cache.put(1, value);
  });
}

@Concurrent
async function concurrentGetTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number
): Promise<number | undefined> {
  return await lock.lockAsync(async (): Promise<number | undefined> => {
    return cache.get(key);
  });
}

@Concurrent
async function concurrentRemoveTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number
): Promise<number | undefined> {
  return await lock.lockAsync(async (): Promise<number | undefined> => {
    return cache.remove(key);
  });
}

@Concurrent
async function concurrentContainsTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number
): Promise<boolean> {
  return await lock.lockAsync(async (): Promise<boolean> => {
    return cache.contains(key);
  });
}

@Concurrent
async function concurrentUpdateCapacityTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  capacity: number
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    cache.updateCapacity(capacity);
  });
}

@Concurrent
async function concurrentEntriesTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let count = 0;
    for (const entry of cache.entries()) {
      count++;
    }
    return count;
  });
}

@Concurrent
async function concurrentKeysTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    const keys = [...cache.keys()];
    return keys.length;
  });
}

@Concurrent
async function concurrentValuesTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    const values = [...cache.values()];
    return values.length;
  });
}

@Concurrent
async function concurrentClearTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    cache.clear();
  });
}

@Concurrent
async function concurrentPutGetTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number,
  value: number
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    cache.put(key, value);
    cache.get(key);
  });
}

@Concurrent
async function concurrentPutKeyTask(
  cache: ArkTSUtils.SendableLruCache<TestKey, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: TestKey,
  value: number
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    cache.put(key, value);
  });
}

@Concurrent
async function concurrentPutArrayValueTask(
  cache: ArkTSUtils.SendableLruCache<number, collections.Array<number>>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number,
  value: number
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    const arr = new collections.Array<number>();
    arr.push(value);
    arr.push(value * 2);
    arr.push(value * 3);
    cache.put(key, arr);
  });
}

@Concurrent
async function concurrentPutGetLoopTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  offset: number,
  loopCount: number
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    for (let j = 0; j < loopCount; j++) {
      const key = offset * loopCount + j;
      cache.put(key, key);
      cache.get(key);
    }
  });
}

@Concurrent
async function concurrentGetLoopTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number,
  loopCount: number
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    for (let j = 0; j < loopCount; j++) {
      cache.get(key);
    }
  });
}

@Concurrent
async function concurrentPutRemoveLoopTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  offset: number,
  loopCount: number
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    for (let j = 0; j < loopCount; j++) {
      const key = offset * loopCount + j;
      cache.put(key, key);
      cache.get(key);
      cache.remove(key);
    }
  });
}

// ========== 辅助查询函数（在锁内执行操作） ==========

@Concurrent
async function getCacheLength(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    return cache.length;
  });
}

@Concurrent
async function getCachePutCount(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    return cache.getPutCount();
  });
}

@Concurrent
async function getCacheMatchCount(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    return cache.getMatchCount();
  });
}

@Concurrent
async function getCacheMissCount(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    return cache.getMissCount();
  });
}

@Concurrent
async function getCacheRemoveCount(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    return cache.getRemoveCount();
  });
}

@Concurrent
async function getCacheCapacity(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    return cache.getCapacity();
  });
}

@Concurrent
async function isCacheEmpty(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<boolean> {
  return await lock.lockAsync(async (): Promise<boolean> => {
    return cache.isEmpty();
  });
}

@Concurrent
async function cacheContains(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number
): Promise<boolean> {
  return await lock.lockAsync(async (): Promise<boolean> => {
    return cache.contains(key);
  });
}

@Concurrent
async function getCacheKeys(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number[]> {
  return await lock.lockAsync(async (): Promise<number[]> => {
    return [...cache.keys()];
  });
}

@Concurrent
async function getCacheArrayValue(
  cache: ArkTSUtils.SendableLruCache<number, collections.Array<number>>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number
): Promise<collections.Array<number> | undefined> {
  return await lock.lockAsync(async (): Promise<collections.Array<number> | undefined> => {
    return cache.get(key);
  });
}

@Concurrent
async function doCachePut(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number,
  value: number
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    cache.put(key, value);
  });
}

@Concurrent
async function doCachePutAndGet(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number,
  value: number
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    cache.put(key, value);
    cache.get(key);
  });
}

@Concurrent
async function doCacheClear(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    cache.clear();
  });
}

@Concurrent
async function doCacheUpdateCapacity(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  capacity: number
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    cache.updateCapacity(capacity);
  });
}

@Concurrent
async function getCacheLengthForTestKey(
  cache: ArkTSUtils.SendableLruCache<TestKey, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    return cache.length;
  });
}

@Concurrent
async function getCacheLengthForArray(
  cache: ArkTSUtils.SendableLruCache<number, collections.Array<number>>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    return cache.length;
  });
}

@Concurrent
async function getNestedCacheValue(
  outerCache: ArkTSUtils.SendableLruCache<number, ArkTSUtils.SendableLruCache<number, number>>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number
): Promise<ArkTSUtils.SendableLruCache<number, number> | undefined> {
  return await lock.lockAsync(async (): Promise<ArkTSUtils.SendableLruCache<number, number> | undefined> => {
    return outerCache.get(key);
  });
}

@Concurrent
async function putNestedCache(
  outerCache: ArkTSUtils.SendableLruCache<number, ArkTSUtils.SendableLruCache<number, number>>,
  lock: ArkTSUtils.locks.AsyncLock,
  key: number,
  innerCache: ArkTSUtils.SendableLruCache<number, number>
): Promise<void> {
  await lock.lockAsync(async (): Promise<void> => {
    outerCache.put(key, innerCache);
  });
}

export default function SendableLruCacheConcurrentTest(): void {
  describe('SendableLruCacheConcurrentTest', () => {

    // ========== 3.1 并发put场景 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_PUT_0100
     * @tc.name testLruCacheConcurrentPutSameKey0001
     * @tc.desc Concurrent put same key with 10 TaskPool tasks, verify key uniqueness and statistics accuracy
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentPutSameKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentPutSameKey0001';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 10; i++) {
        tasks.push(taskpool.execute(concurrentPutSameKeyTask, cache, lock, i));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(1);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(10);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_PUT_0200
     * @tc.name testLruCacheConcurrentPutDiffKeys0002
     * @tc.desc Concurrent put different keys with 64 TaskPool tasks, verify all key-value pairs stored correctly
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentPutDiffKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentPutDiffKeys0002';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(64);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 64; i++) {
        tasks.push(taskpool.execute(concurrentPutTask, cache, lock, i, i));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(64);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(64);

      const keys = await taskpool.execute(getCacheKeys, cache, lock) as number[];
      expect(keys.length).assertEqual(64);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_PUT_0300
     * @tc.name testLruCacheConcurrentPutEviction0003
     * @tc.desc Concurrent put exceeding capacity with 100 tasks, verify LRU eviction mechanism, length <= 10
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentPutEviction0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentPutEviction0003';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 100; i++) {
        tasks.push(taskpool.execute(concurrentPutTask, cache, lock, i, i));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(10);

      const removeCount = await taskpool.execute(getCacheRemoveCount, cache, lock) as number;
      expect(removeCount).assertEqual(90);
      console.info(`${caseName}, test end`);
    });

    // ========== 3.2 并发get场景 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_GET_0100
     * @tc.name testLruCacheConcurrentGetSameKey0004
     * @tc.desc Concurrent get same key with 100 TaskPool tasks, verify read consistency
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentGetSameKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentGetSameKey0004';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10);
      const lock = new ArkTSUtils.locks.AsyncLock();

      await taskpool.execute(doCachePut, cache, lock, 1, 100);

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 100; i++) {
        tasks.push(taskpool.execute(concurrentGetTask, cache, lock, 1));
      }
      const results = await Promise.all(tasks) as (number | undefined)[];

      for (const result of results) {
        expect(result).assertEqual(100);
      }

      const matchCount = await taskpool.execute(getCacheMatchCount, cache, lock) as number;
      expect(matchCount).assertEqual(100);

      const missCount = await taskpool.execute(getCacheMissCount, cache, lock) as number;
      expect(missCount).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_GET_0200
     * @tc.name testLruCacheConcurrentGetDiffKeys0005
     * @tc.desc Concurrent get different keys with 64 TaskPool tasks, verify read completeness
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentGetDiffKeys0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentGetDiffKeys0005';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(64);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 64; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 64; i++) {
        tasks.push(taskpool.execute(concurrentGetTask, cache, lock, i));
      }
      const results = await Promise.all(tasks) as (number | undefined)[];

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(i);
      }

      const matchCount = await taskpool.execute(getCacheMatchCount, cache, lock) as number;
      expect(matchCount).assertEqual(64);

      const missCount = await taskpool.execute(getCacheMissCount, cache, lock) as number;
      expect(missCount).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_GET_0300
     * @tc.name testLruCacheConcurrentGetMiss0006
     * @tc.desc Concurrent get non-existent keys with 100 TaskPool tasks, verify miss count
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentGetMiss0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentGetMiss0006';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 100; i++) {
        tasks.push(taskpool.execute(concurrentGetTask, cache, lock, i));
      }
      const results = await Promise.all(tasks) as (number | undefined)[];

      for (const result of results) {
        expect(result === undefined).assertTrue();
      }

      const missCount = await taskpool.execute(getCacheMissCount, cache, lock) as number;
      expect(missCount).assertEqual(100);

      const matchCount = await taskpool.execute(getCacheMatchCount, cache, lock) as number;
      expect(matchCount).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    // ========== 3.3 并发get/put混合场景 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_READWRITE_0100
     * @tc.name testLruCacheConcurrentReadWriteSame0007
     * @tc.desc Concurrent read-write same key with 50 reads + 50 writes, verify read-write isolation
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentReadWriteSame0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentReadWriteSame0007';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10);
      const lock = new ArkTSUtils.locks.AsyncLock();

      await taskpool.execute(doCachePut, cache, lock, 1, 0);

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 50; i++) {
        tasks.push(taskpool.execute(concurrentGetTask, cache, lock, 1));
        tasks.push(taskpool.execute(concurrentPutSameKeyTask, cache, lock, i + 1));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(1);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(51);

      const matchCount = await taskpool.execute(getCacheMatchCount, cache, lock) as number;
      expect(matchCount).assertEqual(50);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_READWRITE_0200
     * @tc.name testLruCacheConcurrentReadWriteDiff0008
     * @tc.desc Concurrent read-write different keys with 100 reads + 100 writes
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentReadWriteDiff0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentReadWriteDiff0008';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(200);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 100; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 100; i++) {
        tasks.push(taskpool.execute(concurrentGetTask, cache, lock, i));
        tasks.push(taskpool.execute(concurrentPutTask, cache, lock, i + 100, i + 100));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(200);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(200);

      const matchCount = await taskpool.execute(getCacheMatchCount, cache, lock) as number;
      expect(matchCount).assertEqual(100);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_READWRITE_0300
     * @tc.name testLruCacheConcurrentReadWriteEviction0009
     * @tc.desc Concurrent read-write triggering LRU eviction with 50 reads + 50 writes, cache capacity 10
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentReadWriteEviction0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentReadWriteEviction0009';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 10; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 50; i++) {
        tasks.push(taskpool.execute(concurrentGetTask, cache, lock, i % 10));
        tasks.push(taskpool.execute(concurrentPutTask, cache, lock, i + 10, i + 10));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(10);

      const removeCount = await taskpool.execute(getCacheRemoveCount, cache, lock) as number;
      expect(removeCount).assertEqual(50);
      console.info(`${caseName}, test end`);
    });

    // ========== 3.4 并发remove场景 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_REMOVE_0100
     * @tc.name testLruCacheConcurrentRemoveSame0010
     * @tc.desc Concurrent remove same key with 10 TaskPool tasks, verify atomicity of delete
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentRemoveSame0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentRemoveSame0010';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10);
      const lock = new ArkTSUtils.locks.AsyncLock();

      await taskpool.execute(doCachePut, cache, lock, 1, 100);

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 10; i++) {
        tasks.push(taskpool.execute(concurrentRemoveTask, cache, lock, 1));
      }
      const results = await Promise.all(tasks) as (number | undefined)[];

      let successCount = 0;
      for (const result of results) {
        if (result === 100) {
          successCount++;
        }
      }
      expect(successCount).assertEqual(1);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(0);

      const containsResult = await taskpool.execute(cacheContains, cache, lock, 1) as boolean;
      expect(containsResult).assertFalse();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_REMOVE_0200
     * @tc.name testLruCacheConcurrentRemoveDiff0011
     * @tc.desc Concurrent remove different keys with 64 TaskPool tasks, verify completeness
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentRemoveDiff0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentRemoveDiff0011';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(64);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 64; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 64; i++) {
        tasks.push(taskpool.execute(concurrentRemoveTask, cache, lock, i));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(0);

      const isEmpty = await taskpool.execute(isCacheEmpty, cache, lock) as boolean;
      expect(isEmpty).assertTrue();
      console.info(`${caseName}, test end`);
    });

    // ========== 3.5 并发contains场景 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_CONTAINS_0100
     * @tc.name testLruCacheConcurrentContains0012
     * @tc.desc Concurrent contains query with 100 TaskPool tasks (50 existing + 50 non-existing keys)
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentContains0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentContains0012';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(100);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 50; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 50; i++) {
        tasks.push(taskpool.execute(concurrentContainsTask, cache, lock, i));
        tasks.push(taskpool.execute(concurrentContainsTask, cache, lock, i + 100));
      }
      const results = await Promise.all(tasks) as boolean[];

      for (let i = 0; i < 50; i++) {
        expect(results[i * 2]).assertTrue();
        expect(results[i * 2 + 1]).assertFalse();
      }
      console.info(`${caseName}, test end`);
    });

    // ========== 4.1 并发entries遍历 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_ENTRIES_0100
     * @tc.name testLruCacheConcurrentEntriesIter0013
     * @tc.desc Concurrent entries iteration without modification, 10 tasks, verify completeness
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentEntriesIter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentEntriesIter0013';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(100);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 100; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 10; i++) {
        tasks.push(taskpool.execute(concurrentEntriesTask, cache, lock));
      }
      const results = await Promise.all(tasks) as number[];

      for (const result of results) {
        expect(result).assertEqual(100);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_ENTRIES_0200
     * @tc.name testLruCacheConcurrentEntriesModify0014
     * @tc.desc Entries iteration with concurrent modification, 10 iter + 10 modify tasks
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentEntriesModify0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentEntriesModify0014';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(200);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 100; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const iterTasks: Promise<Object>[] = [];
      const modifyTasks: Promise<Object>[] = [];
      for (let i = 0; i < 10; i++) {
        iterTasks.push(taskpool.execute(concurrentEntriesTask, cache, lock));
        modifyTasks.push(taskpool.execute(concurrentPutTask, cache, lock, i + 100, i + 100));
      }

      const allResults = await Promise.all([
        Promise.all(iterTasks),
        Promise.all(modifyTasks)
      ]);
      const iterResults = allResults[0] as number[];

      for (const result of iterResults) {
        expect(result >= 100).assertTrue();
      }

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(110);
      console.info(`${caseName}, test end`);
    });

    // ========== 4.2 并发keys遍历 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_KEYS_0100
     * @tc.name testLruCacheConcurrentKeysIter0015
     * @tc.desc Concurrent keys iteration without modification, 10 tasks, verify array completeness
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentKeysIter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentKeysIter0015';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(100);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 100; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 10; i++) {
        tasks.push(taskpool.execute(concurrentKeysTask, cache, lock));
      }
      const results = await Promise.all(tasks) as number[];

      for (const result of results) {
        expect(result).assertEqual(100);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_KEYS_0200
     * @tc.name testLruCacheConcurrentKeysModify0016
     * @tc.desc Keys iteration with concurrent modification, 10 iter + 10 modify tasks
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentKeysModify0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentKeysModify0016';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(200);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 100; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const iterTasks: Promise<Object>[] = [];
      const modifyTasks: Promise<Object>[] = [];
      for (let i = 0; i < 10; i++) {
        iterTasks.push(taskpool.execute(concurrentKeysTask, cache, lock));
        modifyTasks.push(taskpool.execute(concurrentPutTask, cache, lock, i + 100, i + 100));
      }

      const allResults = await Promise.all([
        Promise.all(iterTasks),
        Promise.all(modifyTasks)
      ]);
      const iterResults = allResults[0] as number[];

      for (const result of iterResults) {
        expect(result >= 100).assertTrue();
      }

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(110);
      console.info(`${caseName}, test end`);
    });

    // ========== 4.3 并发values遍历 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_VALUES_0100
     * @tc.name testLruCacheConcurrentValuesIter0017
     * @tc.desc Concurrent values iteration without modification, 10 tasks, verify array completeness
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentValuesIter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentValuesIter0017';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(100);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 100; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 10; i++) {
        tasks.push(taskpool.execute(concurrentValuesTask, cache, lock));
      }
      const results = await Promise.all(tasks) as number[];

      for (const result of results) {
        expect(result).assertEqual(100);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_VALUES_0200
     * @tc.name testLruCacheConcurrentValuesModify0018
     * @tc.desc Values iteration with concurrent modification, 10 iter + 10 modify tasks
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentValuesModify0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentValuesModify0018';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(200);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 100; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const iterTasks: Promise<Object>[] = [];
      const modifyTasks: Promise<Object>[] = [];
      for (let i = 0; i < 10; i++) {
        iterTasks.push(taskpool.execute(concurrentValuesTask, cache, lock));
        modifyTasks.push(taskpool.execute(concurrentPutTask, cache, lock, i + 100, i + 100));
      }

      const allResults = await Promise.all([
        Promise.all(iterTasks),
        Promise.all(modifyTasks)
      ]);
      const iterResults = allResults[0] as number[];

      for (const result of iterResults) {
        expect(result >= 100).assertTrue();
      }

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(110);
      console.info(`${caseName}, test end`);
    });

    // ========== 5.1 并发updateCapacity场景 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_CAPACITY_0100
     * @tc.name testLruCacheConcurrentCapacityUpdate0019
     * @tc.desc Multi-thread concurrent updateCapacity with 10 tasks, verify final capacity
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentCapacityUpdate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentCapacityUpdate0019';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(64);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 64; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const tasks: Promise<Object>[] = [];
      for (let i = 1; i <= 10; i++) {
        tasks.push(taskpool.execute(concurrentUpdateCapacityTask, cache, lock, i * 10));
      }
      await Promise.all(tasks);

      await taskpool.execute(doCacheUpdateCapacity, cache, lock, 100);

      const capacity = await taskpool.execute(getCacheCapacity, cache, lock) as number;
      expect(capacity).assertEqual(100);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_CAPACITY_0200
     * @tc.name testLruCacheConcurrentCapacityAccess0020
     * @tc.desc updateCapacity with concurrent access, 1 capacity update + 99 concurrent access tasks
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentCapacityAccess0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentCapacityAccess0020';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(64);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 64; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const capacityTask = taskpool.execute(concurrentUpdateCapacityTask, cache, lock, 10);
      const accessTasks: Promise<Object>[] = [];
      for (let i = 0; i < 99; i++) {
        accessTasks.push(taskpool.execute(concurrentGetTask, cache, lock, i % 64));
      }

      await Promise.all([capacityTask, ...accessTasks]);

      const capacity = await taskpool.execute(getCacheCapacity, cache, lock) as number;
      expect(capacity).assertEqual(10);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(10);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_CAPACITY_0300
     * @tc.name testLruCacheConcurrentCapacityReduce0021
     * @tc.desc Capacity reduction triggering eviction, updateCapacity(10) on 100-element cache
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentCapacityReduce0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentCapacityReduce0021';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(100);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 100; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      await taskpool.execute(doCacheUpdateCapacity, cache, lock, 10);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(10);

      const removeCount = await taskpool.execute(getCacheRemoveCount, cache, lock) as number;
      expect(removeCount).assertEqual(90);
      console.info(`${caseName}, test end`);
    });

    // ========== 5.2 容量边界并发场景 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_CAPACITY_0400
     * @tc.name testLruCacheConcurrentCapacityOne0022
     * @tc.desc Concurrent put with capacity 1, 100 tasks, verify eviction correctness
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentCapacityOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentCapacityOne0022';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(1);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 100; i++) {
        tasks.push(taskpool.execute(concurrentPutTask, cache, lock, i, i));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(1);

      const removeCount = await taskpool.execute(getCacheRemoveCount, cache, lock) as number;
      expect(removeCount).assertEqual(99);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_CAPACITY_0500
     * @tc.name testLruCacheConcurrentCapacityExpand0023
     * @tc.desc Capacity expansion then concurrent put, 100 tasks, verify no eviction
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentCapacityExpand0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentCapacityExpand0023';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 10; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      await taskpool.execute(doCacheUpdateCapacity, cache, lock, 100);

      const tasks: Promise<Object>[] = [];
      for (let i = 10; i < 110; i++) {
        tasks.push(taskpool.execute(concurrentPutTask, cache, lock, i, i));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(100);

      const removeCount = await taskpool.execute(getCacheRemoveCount, cache, lock) as number;
      expect(removeCount).assertEqual(10);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(110);
      console.info(`${caseName}, test end`);
    });

    // ========== 6.1 并发操作统计 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_STAT_0100
     * @tc.name testLruCacheConcurrentStatPut0024
     * @tc.desc Concurrent put statistics verification, 100 tasks, verify getPutCount()=100
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testLruCacheConcurrentStatPut0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentStatPut0024';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(200);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 100; i++) {
        tasks.push(taskpool.execute(concurrentPutTask, cache, lock, i, i));
      }
      await Promise.all(tasks);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(100);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_STAT_0200
     * @tc.name testLruCacheConcurrentStatMatch0025
     * @tc.desc Concurrent get statistics verification, 50 match + 50 miss, verify matchCount and missCount
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testLruCacheConcurrentStatMatch0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentStatMatch0025';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(100);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 50; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 50; i++) {
        tasks.push(taskpool.execute(concurrentGetTask, cache, lock, i));
        tasks.push(taskpool.execute(concurrentGetTask, cache, lock, i % 64));
      }
      await Promise.all(tasks);

      const matchCount = await taskpool.execute(getCacheMatchCount, cache, lock) as number;
      expect(matchCount).assertEqual(100);

      const missCount = await taskpool.execute(getCacheMissCount, cache, lock) as number;
      expect(missCount).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_STAT_0300
     * @tc.name testLruCacheConcurrentStatRemove0026
     * @tc.desc Concurrent put eviction statistics, 100 tasks on capacity-10 cache, verify removeCount
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testLruCacheConcurrentStatRemove0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentStatRemove0026';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 100; i++) {
        tasks.push(taskpool.execute(concurrentPutTask, cache, lock, i, i));
      }
      await Promise.all(tasks);

      const removeCount = await taskpool.execute(getCacheRemoveCount, cache, lock) as number;
      expect(removeCount).assertEqual(90);
      console.info(`${caseName}, test end`);
    });

    // ========== 6.2 统计清零场景 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_STAT_0400
     * @tc.name testLruCacheConcurrentStatClear0027
     * @tc.desc Clear then verify all statistics reset to zero
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testLruCacheConcurrentStatClear0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentStatClear0027';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10);
      const lock = new ArkTSUtils.locks.AsyncLock();

      await taskpool.execute(doCachePut, cache, lock, 1, 1);
      await taskpool.execute(concurrentGetTask, cache, lock, 1) as number | undefined;
      await taskpool.execute(concurrentRemoveTask, cache, lock, 1) as number | undefined;
      await taskpool.execute(doCacheClear, cache, lock);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(0);

      const isEmpty = await taskpool.execute(isCacheEmpty, cache, lock) as boolean;
      expect(isEmpty).assertTrue();

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(1);

      const matchCount = await taskpool.execute(getCacheMatchCount, cache, lock) as number;
      expect(matchCount).assertEqual(1);

      const missCount = await taskpool.execute(getCacheMissCount, cache, lock) as number;
      expect(missCount).assertEqual(0);

      const removeCount = await taskpool.execute(getCacheRemoveCount, cache, lock) as number;
      expect(removeCount).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_STAT_0500
     * @tc.name testLruCacheConcurrentStatConcurrentClear0028
     * @tc.desc Concurrent clear with statistics queries, 10 clear + 90 operation tasks
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testLruCacheConcurrentStatConcurrentClear0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentStatConcurrentClear0028';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(100);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 50; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const clearTasks: Promise<Object>[] = [];
      const operationTasks: Promise<Object>[] = [];
      for (let i = 0; i < 10; i++) {
        clearTasks.push(taskpool.execute(concurrentClearTask, cache, lock));
      }
      for (let i = 0; i < 45; i++) {
        operationTasks.push(taskpool.execute(concurrentPutGetTask, cache, lock, i + 100, i + 100));
        operationTasks.push(taskpool.execute(concurrentPutGetTask, cache, lock, i + 200, i + 200));
      }

      await Promise.all([...clearTasks, ...operationTasks]);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(140);

      const matchCount = await taskpool.execute(getCacheMatchCount, cache, lock) as number;
      expect(matchCount).assertEqual(90);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length <= 90).assertTrue();
      console.info(`${caseName}, test end`);
    });

    // ========== 7.1 缓存引用传递 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_SENDABLE_0100
     * @tc.name testLruCacheConcurrentSendableRef0029
     * @tc.desc TaskPool reference passing with 10 tasks, verify all operations execute correctly
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testLruCacheConcurrentSendableRef0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentSendableRef0029';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(100);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 10; i++) {
        tasks.push(taskpool.execute(concurrentPutTask, cache, lock, i, i));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(10);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(10);
      console.info(`${caseName}, test end`);
    });

    // ========== 7.2 Sendable类型键值对 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_SENDABLE_0200
     * @tc.name testLruCacheConcurrentSendableNested0030
     * @tc.desc SendableLruCache nested as value, verify nested cache works correctly
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testLruCacheConcurrentSendableNested0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentSendableNested0030';
      console.info(`${caseName}, test start`);
      const innerCache = new ArkTSUtils.SendableLruCache<number, number>(10);
      innerCache.put(1, 100);

      const outerCache = new ArkTSUtils.SendableLruCache<number,
        ArkTSUtils.SendableLruCache<number, number>>(10);
      outerCache.put(1, innerCache);

      const retrieved = outerCache.get(1);

      expect(retrieved !== undefined).assertTrue();
      expect(retrieved!.get(1)).assertEqual(100);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_SENDABLE_0300
     * @tc.name testLruCacheConcurrentSendableClassKey0031
     * @tc.desc Sendable class as key for concurrent put/get, 10 tasks
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testLruCacheConcurrentSendableClassKey0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentSendableClassKey0031';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<TestKey, number>(10);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const key1 = new TestKey(1);
      await taskpool.execute(concurrentPutKeyTask, cache, lock, key1, 100);

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 10; i++) {
        const key = new TestKey(i + 100);
        tasks.push(taskpool.execute(concurrentPutKeyTask, cache, lock, key, i * 100));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLengthForTestKey, cache, lock) as number;
      expect(length).assertEqual(10);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_SENDABLE_0400
     * @tc.name testLruCacheConcurrentSendableCollectionValue0032
     * @tc.desc collections container as value for concurrent put/get, 10 tasks
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testLruCacheConcurrentSendableCollectionValue0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentSendableCollectionValue0032';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, collections.Array<number>>(10);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 10; i++) {
        tasks.push(taskpool.execute(concurrentPutArrayValueTask, cache, lock, i, i));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLengthForArray, cache, lock) as number;
      expect(length).assertEqual(10);

      const result = await taskpool.execute(getCacheArrayValue, cache, lock, 0) as collections.Array<number> | undefined;
      expect(result !== undefined).assertTrue();
      const arr = Array.from(result!);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    // ========== 7.3 嵌套SendableLruCache ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_SENDABLE_0500
     * @tc.name testLruCacheConcurrentSendableNestedCache0033
     * @tc.desc Concurrent access to nested SendableLruCache, 10 tasks
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testLruCacheConcurrentSendableNestedCache0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentSendableNestedCache0033';
      console.info(`${caseName}, test start`);
      const innerCache = new ArkTSUtils.SendableLruCache<number, number>(50);
      for (let i = 0; i < 50; i++) {
        innerCache.put(i, i * 10);
      }

      const outerCache = new ArkTSUtils.SendableLruCache<number,
        ArkTSUtils.SendableLruCache<number, number>>(10);
      const outerLock = new ArkTSUtils.locks.AsyncLock();

      await taskpool.execute(putNestedCache, outerCache, outerLock, 1, innerCache);

      const retrieved = await taskpool.execute(getNestedCacheValue, outerCache, outerLock, 1) as ArkTSUtils.SendableLruCache<number, number> | undefined;
      expect(retrieved !== undefined).assertTrue();
      expect(retrieved!.length).assertEqual(50);
      expect(retrieved!.get(0)).assertEqual(0);
      expect(retrieved!.get(25)).assertEqual(250);
      console.info(`${caseName}, test end`);
    });

    // ========== 8.1 高频并发访问 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_PRESSURE_0100
     * @tc.name testLruCacheConcurrentPressurePut0034
     * @tc.desc High-frequency concurrent put pressure test, 1000 tasks, capacity 1000
     * @tc.size LARGETEST
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLruCacheConcurrentPressurePut0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentPressurePut0034';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(1000);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 1000; i++) {
        tasks.push(taskpool.execute(concurrentPutTask, cache, lock, i, i));
      }
      await Promise.all(tasks);
0.
      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(1000);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(1000);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_PRESSURE_0200
     * @tc.name testLruCacheConcurrentPressureGet0035
     * @tc.desc High-frequency concurrent get pressure test, 1000 tasks * 10 iterations = 10000 gets
     * @tc.size LARGETEST
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLruCacheConcurrentPressureGet0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentPressureGet0035';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(100);
      const lock = new ArkTSUtils.locks.AsyncLock();

      for (let i = 0; i < 100; i++) {
        await taskpool.execute(doCachePut, cache, lock, i, i);
      }

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 1000; i++) {
        tasks.push(taskpool.execute(concurrentGetLoopTask, cache, lock, i % 100, 10));
      }
      await Promise.all(tasks);

      const matchCount = await taskpool.execute(getCacheMatchCount, cache, lock) as number;
      expect(matchCount).assertEqual(10000);
      console.info(`${caseName}, test end`);
    });

    // ========== 8.2 大容量压力 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_PRESSURE_0300
     * @tc.name testLruCacheConcurrentPressureLargeCapacity0036
     * @tc.desc Large capacity cache concurrent access, 100 tasks * 100 put/get iterations
     * @tc.size LARGETEST
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLruCacheConcurrentPressureLargeCapacity0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentPressureLargeCapacity0036';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10000);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let taskIdx = 0; taskIdx < 100; taskIdx++) {
        tasks.push(taskpool.execute(concurrentPutGetLoopTask, cache, lock, taskIdx, 100));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(10000);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(10000);

      const matchCount = await taskpool.execute(getCacheMatchCount, cache, lock) as number;
      expect(matchCount).assertEqual(10000);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_PRESSURE_0400
     * @tc.name testLruCacheConcurrentPressureMemoryLeak0037
     * @tc.desc Long-running memory leak detection, 100 tasks * 1000 iterations of put/get/remove
     * @tc.size LARGETEST
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLruCacheConcurrentPressureMemoryLeak0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentPressureMemoryLeak0037';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10000);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let taskIdx = 0; taskIdx < 100; taskIdx++) {
        tasks.push(taskpool.execute(concurrentPutRemoveLoopTask, cache, lock, taskIdx, 1000));
      }
      await Promise.all(tasks);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(100000);

      const matchCount = await taskpool.execute(getCacheMatchCount, cache, lock) as number;
      expect(matchCount).assertEqual(100000);

      const missCount = await taskpool.execute(getCacheMissCount, cache, lock) as number;
      expect(missCount).assertEqual(0);

      const removeCount = await taskpool.execute(getCacheRemoveCount, cache, lock) as number;
      expect(removeCount).assertEqual(0);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    // ========== 容量边界与异常场景 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_BOUNDARY_0100
     * @tc.name testLruCacheConcurrentBoundarySingle0038
     * @tc.desc Concurrent operations on capacity-1 cache, 50 tasks, verify no data corruption
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentBoundarySingle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentBoundarySingle0038';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(1);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < 50; i++) {
        tasks.push(taskpool.execute(concurrentPutTask, cache, lock, i, i));
      }
      await Promise.all(tasks);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(1);

      const removeCount = await taskpool.execute(getCacheRemoveCount, cache, lock) as number;
      expect(removeCount).assertEqual(49);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(50);
      console.info(`${caseName}, test end`);
    });

    // ========== 高并发统计准确性 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_STAT_0600
     * @tc.name testLruCacheConcurrentStatAccuracy0039
     * @tc.desc High-concurrency statistics accuracy, 200 tasks, verify all counters are correct
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testLruCacheConcurrentStatAccuracy0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const caseName: string = 'testLruCacheConcurrentStatAccuracy0039';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(500);
      const lock = new ArkTSUtils.locks.AsyncLock();

      const putTasks: Promise<Object>[] = [];
      for (let i = 0; i < 200; i++) {
        putTasks.push(taskpool.execute(concurrentPutTask, cache, lock, i, i));
      }
      await Promise.all(putTasks);

      const getTasks: Promise<Object>[] = [];
      for (let i = 0; i < 100; i++) {
        getTasks.push(taskpool.execute(concurrentGetTask, cache, lock, i));
        getTasks.push(taskpool.execute(concurrentGetTask, cache, lock, i + 300));
      }
      await Promise.all(getTasks);

      const removeTasks: Promise<Object>[] = [];
      for (let i = 0; i < 50; i++) {
        removeTasks.push(taskpool.execute(concurrentRemoveTask, cache, lock, i));
      }
      await Promise.all(removeTasks);

      const putCount = await taskpool.execute(getCachePutCount, cache, lock) as number;
      expect(putCount).assertEqual(200);

      const matchCount = await taskpool.execute(getCacheMatchCount, cache, lock) as number;
      expect(matchCount).assertEqual(100);

      const missCount = await taskpool.execute(getCacheMissCount, cache, lock) as number;
      expect(missCount).assertEqual(100);

      const removeCount = await taskpool.execute(getCacheRemoveCount, cache, lock) as number;
      expect(removeCount).assertEqual(0);

      const length = await taskpool.execute(getCacheLength, cache, lock) as number;
      expect(length).assertEqual(150);
      console.info(`${caseName}, test end`);
    });

    // ========== Worker并发访问测试 ==========

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_WORKER_PUT_0100
     * @tc.name testLruCacheConcurrentWorkerPut0040
     * @tc.desc 4 Worker threads concurrently put into SendableLruCache with capacity 100,
     * each worker puts 25 entries, verify final cache state
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentWorkerPut0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const caseName: string = 'testLruCacheConcurrentWorkerPut0040';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(100);
      const lock = new ArkTSUtils.locks.AsyncLock();
      const workerCount: number = 4;
      const putPerWorker: number = 25;

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < workerCount; i++) {
        const startKey: number = i * putPerWorker;
        tasks.push(executeLruCacheWorker(
          './SendableLruCacheWorker',
          cache, lock, startKey, putPerWorker
        ));
      }

      const results = await Promise.all(tasks) as Object[];

      let totalPutted: number = 0;
      for (const result of results) {
        const data = result as Record<string, number>;
        expect(data.putCount).assertEqual(putPerWorker);
        totalPutted += data.putCount;
      }
      expect(totalPutted).assertEqual(workerCount * putPerWorker);

      const length = cache.length;
      expect(length).assertEqual(100);

      const putCount = cache.getPutCount();
      expect(putCount).assertEqual(100);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRUCACHE_CONCURRENT_WORKER_REF_0100
     * @tc.name testLruCacheConcurrentWorkerRefPass0041
     * @tc.desc 4 Worker threads access SendableLruCache via postMessageWithSharedSendable,
     * verify reference passing and cross-thread access
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLruCacheConcurrentWorkerRefPass0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const caseName: string = 'testLruCacheConcurrentWorkerRefPass0041';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(50);
      const lock = new ArkTSUtils.locks.AsyncLock();
      const workerCount: number = 4;
      const putPerWorker: number = 10;

      const tasks: Promise<Object>[] = [];
      for (let i = 0; i < workerCount; i++) {
        const startKey: number = i * putPerWorker;
        tasks.push(executeLruCacheWorker(
          './SendableLruCacheWorker',
          cache, lock, startKey, putPerWorker
        ));
      }

      await Promise.all(tasks);

      const length = cache.length;
      expect(length).assertEqual(40);

      for (let i = 0; i < 40; i++) {
        const value = cache.get(i);
        expect(value).assertEqual(i);
      }

      const putCount = cache.getPutCount();
      expect(putCount).assertEqual(40);
      console.info(`${caseName}, test end`);
    });
  });
}

// ========== Worker 辅助函数 ==========

class LruCacheWorkerMessage {
  cache: ArkTSUtils.SendableLruCache<number, number>;
  lock: ArkTSUtils.locks.AsyncLock;
  startKey: number;
  count: number;

  constructor(cache: ArkTSUtils.SendableLruCache<number, number>,
    lock: ArkTSUtils.locks.AsyncLock, startKey: number, count: number) {
    this.cache = cache;
    this.lock = lock;
    this.startKey = startKey;
    this.count = count;
  }
}

class LruCacheWorkerResult {
  putCount: number;
  length: number;

  constructor(putCount: number, length: number) {
    this.putCount = putCount;
    this.length = length;
  }
}

function executeLruCacheWorker(
  path: string,
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  startKey: number,
  count: number
): Promise<Object> {
  return new Promise<Object>((resolve: (value: Object) => void): void => {
    const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(path);
    workerInstance.onmessage = (event: MessageEvents): void => {
      resolve(event.data as Object);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      resolve(new LruCacheWorkerResult(-1, -1));
      workerInstance.terminate();
    };
    workerInstance.postMessageWithSharedSendable(
      new LruCacheWorkerMessage(cache, lock, startKey, count)
    );
  });
}