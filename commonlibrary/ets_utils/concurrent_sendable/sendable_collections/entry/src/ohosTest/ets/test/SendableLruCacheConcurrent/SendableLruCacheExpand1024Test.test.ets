/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArkTSUtils, taskpool } from '@kit.ArkTS';
import { LRU_CFG } from './SendableLruCacheExpandCfg';

const LRU_BOUNDARY_CAPACITY: number = LRU_CFG.BOUND;

@Sendable
class SendableObjectKey {
  id: string;

  constructor(id: string) {
    this.id = id;
  }
}

function fillNumberLru(cache: ArkTSUtils.SendableLruCache<number, number>, start: number, end: number): void {
  for (let index = start; index < end; index++) {
    cache.put(index, index * 2);
  }
}

@Concurrent
async function concurrentLruPutTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  start: number,
  end: number
): Promise<number> {
  try {
    return await lock.lockAsync(() => {
      let inserted: number = 0;
      for (let index = start; index < end; index++) {
        cache.put(index, index * 2);
        inserted++;
      }
      return inserted;
    });
  } catch (_error) {
    return -1;
  }
}

@Concurrent
async function concurrentLruReadTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  try {
    return await lock.lockAsync(() => {
      let count: number = 0;
      const keys: number[] = cache.keys();
      for (let index = 0; index < keys.length; index++) {
        if (cache.get(keys[index]) !== undefined) {
          count++;
        }
      }
      return count;
    });
  } catch (_error) {
    return -1;
  }
}

@Concurrent
async function concurrentLruWriterTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock,
  start: number,
  end: number
): Promise<number> {
  try {
    return await lock.lockAsync(() => {
      let written: number = 0;
      for (let index = start; index < end; index++) {
        cache.put(index, index);
        written++;
      }
      return written;
    });
  } catch (_error) {
    return -1;
  }
}

@Concurrent
async function concurrentLruAccessTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  try {
    return await lock.lockAsync(() => {
      let matched: number = 0;
      for (let index = 0; index < 100; index++) {
        if (cache.get(index) !== undefined) {
          matched++;
        }
      }
      return matched;
    });
  } catch (_error) {
    return -1;
  }
}

@Concurrent
async function concurrentLruCapacityTask(
  cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  try {
    return await lock.lockAsync(() => {
      cache.updateCapacity(1024);
      return cache.getCapacity();
    });
  } catch (_error) {
    return -1;
  }
}

@Concurrent
function verifyLruEntriesByGet(cache: ArkTSUtils.SendableLruCache<number, number>, count: number): number {
  for (let index = 0; index < count; index++) {
    if (cache.get(index) !== index * 2) {
      return index;
    }
  }
  return -1;
}

@Concurrent
function verifyLruEntriesByContainsAndGet(cache: ArkTSUtils.SendableLruCache<number, number>, count: number): number {
  for (let index = 0; index < count; index++) {
    if (!cache.contains(index)) {
      return index;
    }
    if (cache.get(index) !== index * 2) {
      return index;
    }
  }
  return -1;
}

@Concurrent
function verifySendableLruCacheAfterTransfer(cache: ArkTSUtils.SendableLruCache<number, string>): boolean {
  let initialCapacity: number = 1024;
  if (cache.length !== initialCapacity || cache.isEmpty()) {
    return false;
  }
  if (cache.getCapacity() !== initialCapacity) {
    return false;
  }
  const removeCountBeforeShrink: number = cache.getRemoveCount();
  let shrinkCapacity: number = 512;
  cache.updateCapacity(shrinkCapacity);
  if (cache.getCapacity() !== shrinkCapacity || cache.length !== shrinkCapacity) {
    return false;
  }
  if (cache.contains(0) || !cache.contains(512) || !cache.contains(1023)) {
    return false;
  }
  if (cache.getRemoveCount() !== removeCountBeforeShrink + 512) {
    return false;
  }
  let expandedCapacity: number = 1024;
  cache.updateCapacity(expandedCapacity);
  if (cache.getCapacity() !== expandedCapacity || cache.length !== shrinkCapacity) {
    return false;
  }
  if (cache.get(512) !== 'value_512' || cache.get(1023) !== 'value_1023' || cache.contains(99999)) {
    return false;
  }

  cache.put(1024, 'new_value');
  if (cache.get(1024) !== 'new_value') {
    return false;
  }
  if (cache.remove(1024) !== 'new_value' || cache.contains(1024)) {
    return false;
  }

  if (cache.getPutCount() < 0 || cache.getRemoveCount() < 0 || cache.getMatchCount() < 0 ||
    cache.getMissCount() < 0 || cache.getCreateCount() < 0 || cache.toString().length === 0) {
    return false;
  }

  if (cache.keys().length !== cache.length || cache.values().length !== cache.length) {
    return false;
  }
  const entries = cache.entries();
  let entryCount: number = 0;
  while (true) {
    const entry = entries.next();
    if (entry.done) {
      break;
    }
    entryCount++;
  }
  if (entryCount !== cache.length) {
    return false;
  }

  cache.clear();
  return cache.isEmpty();
}

export default function SendableLruCacheExpand1024Test(): void {
  describe('SendableLruCacheExpand1024Test', () => {
    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_0100
     * @tc.name sendableLruCacheExpand1024Test0001
     * @tc.desc EXP_LRU_001: Construct a cache at capacity 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cache = new ArkTSUtils.SendableLruCache<number, number>(LRU_BOUNDARY_CAPACITY);
      expect(cache.getCapacity()).assertEqual(LRU_BOUNDARY_CAPACITY);
      expect(cache.length).assertEqual(0);
      expect(cache.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_0200
     * @tc.name sendableLruCacheExpand1024Test0002
     * @tc.desc EXP_LRU_002: Check documented capacity boundaries with updateCapacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cache1023 = new ArkTSUtils.SendableLruCache<number, number>(1023);
      const cache1025 = new ArkTSUtils.SendableLruCache<number, number>(1025);
      expect(cache1023.getCapacity()).assertEqual(1023);
      expect(cache1025.getCapacity()).assertEqual(1025);

      let zeroRejected: boolean = false;
      try {
        cache1023.updateCapacity(0);
      } catch (_error) {
        zeroRejected = true;
      }
      expect(zeroRejected).assertTrue();
      expect(cache1023.getCapacity()).assertEqual(1023);

      let negativeRejected: boolean = false;
      try {
        cache1025.updateCapacity(-1);
      } catch (_error) {
        negativeRejected = true;
      }
      expect(negativeRejected).assertTrue();
      expect(cache1025.getCapacity()).assertEqual(1025);

      let overMaximumRejected: boolean = false;
      try {
        cache1025.updateCapacity(2147483648);
      } catch (_error) {
        overMaximumRejected = true;
      }
      expect(overMaximumRejected).assertTrue();
      expect(cache1025.getCapacity()).assertEqual(1025);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_0300
     * @tc.name sendableLruCacheExpand1024Test0003
     * @tc.desc EXP_LRU_003: Fill exactly 1024 entries without eviction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const cache = new ArkTSUtils.SendableLruCache<number, number>(LRU_BOUNDARY_CAPACITY);
      fillNumberLru(cache, 0, LRU_BOUNDARY_CAPACITY);
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
      expect(cache.getCapacity()).assertEqual(LRU_BOUNDARY_CAPACITY);
      expect(cache.getRemoveCount()).assertEqual(0);
      expect(cache.getPutCount()).assertEqual(LRU_BOUNDARY_CAPACITY);
      const result: Object = await taskpool.execute(verifyLruEntriesByGet, cache, LRU_BOUNDARY_CAPACITY);
      expect(result).assertEqual(-1);
      expect(cache.getMatchCount()).assertEqual(LRU_BOUNDARY_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_0400
     * @tc.name sendableLruCacheExpand1024Test0004
     * @tc.desc EXP_LRU_004: The 1025th unique entry evicts the least recently used entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cache = new ArkTSUtils.SendableLruCache<number, number>(LRU_BOUNDARY_CAPACITY);
      fillNumberLru(cache, 0, LRU_BOUNDARY_CAPACITY);
      cache.put(LRU_BOUNDARY_CAPACITY, LRU_BOUNDARY_CAPACITY * 2);
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
      expect(cache.getRemoveCount()).assertEqual(1);
      expect(cache.contains(0)).assertFalse();
      expect(cache.contains(LRU_BOUNDARY_CAPACITY)).assertTrue();
      expect(cache.get(LRU_BOUNDARY_CAPACITY)).assertEqual(LRU_BOUNDARY_CAPACITY * 2);
      expect(cache.contains(1)).assertTrue();
      expect(cache.get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_0500
     * @tc.name sendableLruCacheExpand1024Test0005
     * @tc.desc EXP_LRU_005: Count evictions after inserting 1100 unique entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cache = new ArkTSUtils.SendableLruCache<number, number>(LRU_BOUNDARY_CAPACITY);
      fillNumberLru(cache, 0, 1100);
      expect(cache.getRemoveCount()).assertEqual(76);
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
      expect(cache.contains(76)).assertTrue();
      expect(cache.contains(1099)).assertTrue();
      expect(cache.contains(75)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_0600
     * @tc.name sendableLruCacheExpand1024Test0006
     * @tc.desc EXP_LRU_006: Expand capacity from 100 to 1024 without data loss.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cache = new ArkTSUtils.SendableLruCache<number, number>(100);
      fillNumberLru(cache, 0, 100);
      cache.updateCapacity(LRU_BOUNDARY_CAPACITY);
      expect(cache.getCapacity()).assertEqual(LRU_BOUNDARY_CAPACITY);
      for (let index = 0; index < 100; index++) {
        expect(cache.contains(index)).assertTrue();
        expect(cache.get(index)).assertEqual(index * 2);
      }
      fillNumberLru(cache, 100, LRU_BOUNDARY_CAPACITY);
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
      expect(cache.getRemoveCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_0700
     * @tc.name sendableLruCacheExpand1024Test0007
     * @tc.desc EXP_LRU_007: Expand from 1023 to 1024 at the boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const cache = new ArkTSUtils.SendableLruCache<number, number>(1023);
      fillNumberLru(cache, 0, 1023);
      cache.updateCapacity(LRU_BOUNDARY_CAPACITY);
      expect(cache.getCapacity()).assertEqual(LRU_BOUNDARY_CAPACITY);
      const result: Object = await taskpool.execute(verifyLruEntriesByContainsAndGet, cache, 1023);
      expect(result).assertEqual(-1);
      cache.put(1023, 2046);
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
      expect(cache.getRemoveCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_0800
     * @tc.name sendableLruCacheExpand1024Test0008
     * @tc.desc EXP_LRU_008: Keep a NaN key valid across the full-cache boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cache = new ArkTSUtils.SendableLruCache<number, string>(LRU_BOUNDARY_CAPACITY);
      for (let index = 0; index < LRU_BOUNDARY_CAPACITY; index++) {
        cache.put(index, `value_${index}`);
      }
      cache.put(NaN, 'nan_value');
      expect(cache.contains(NaN)).assertTrue();
      expect(cache.get(NaN)).assertEqual('nan_value');
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
      expect(cache.getRemoveCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_0900
     * @tc.name sendableLruCacheExpand1024Test0009
     * @tc.desc EXP_LRU_009: Treat -0 and +0 as one key at the eviction boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cache = new ArkTSUtils.SendableLruCache<number, string>(LRU_BOUNDARY_CAPACITY);
      for (let index = 1; index <= LRU_BOUNDARY_CAPACITY; index++) {
        cache.put(index, `value_${index}`);
      }
      cache.put(0, 'zero_value');
      cache.put(-0, 'negative_zero_value');
      expect(cache.contains(0)).assertTrue();
      expect(cache.contains(-0)).assertTrue();
      expect(cache.get(0)).assertEqual('negative_zero_value');
      expect(cache.get(-0)).assertEqual('negative_zero_value');
      expect(cache.getRemoveCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_1000
     * @tc.name sendableLruCacheExpand1024Test0010
     * @tc.desc EXP_LRU_010: Sendable object keys preserve reference identity at the full-cache boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cache = new ArkTSUtils.SendableLruCache<SendableObjectKey, string>(LRU_BOUNDARY_CAPACITY);
      for (let index = 0; index < LRU_BOUNDARY_CAPACITY; index++) {
        cache.put(new SendableObjectKey(`key_${index}`), `value_${index}`);
      }
      const firstKey = new SendableObjectKey('symbol-like-boundary');
      const equivalentKey = new SendableObjectKey('symbol-like-boundary');
      cache.put(firstKey, 'initial_value');
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
      expect(cache.getRemoveCount()).assertEqual(1);
      cache.put(firstKey, 'updated_value');
      expect(cache.contains(firstKey)).assertTrue();
      expect(cache.get(firstKey)).assertEqual('updated_value');
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
      expect(cache.getRemoveCount()).assertEqual(1);
      cache.put(equivalentKey, 'equivalent_value');
      expect(cache.contains(firstKey)).assertTrue();
      expect(cache.contains(equivalentKey)).assertTrue();
      expect(cache.contains(new SendableObjectKey('symbol-like-boundary'))).assertFalse();
      expect(cache.get(equivalentKey)).assertEqual('equivalent_value');
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
      expect(cache.getRemoveCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_1100
     * @tc.name sendableLruCacheExpand1024Test0011
     * @tc.desc EXP_LRU_011: Preserve a 100000-character string key after eviction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cache = new ArkTSUtils.SendableLruCache<string, number>(LRU_BOUNDARY_CAPACITY);
      for (let index = 0; index < LRU_BOUNDARY_CAPACITY; index++) {
        cache.put(`key_${index}`, index);
      }
      const longKey = 'a'.repeat(100000);
      cache.put(longKey, 9999);
      expect(cache.contains(longKey)).assertTrue();
      expect(cache.get(longKey)).assertEqual(9999);
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_1200
     * @tc.name sendableLruCacheExpand1024Test0012
     * @tc.desc EXP_LRU_012: Preserve an emoji string key after eviction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cache = new ArkTSUtils.SendableLruCache<string, number>(LRU_BOUNDARY_CAPACITY);
      for (let index = 0; index < LRU_BOUNDARY_CAPACITY; index++) {
        cache.put(`key_${index}`, index);
      }
      const emojiKey = 'emoji-🚀🎉🔑';
      cache.put(emojiKey, 8888);
      expect(cache.contains(emojiKey)).assertTrue();
      expect(cache.get(emojiKey)).assertEqual(8888);
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_1300
     * @tc.name sendableLruCacheExpand1024Test0013
     * @tc.desc EXP_LRU_013: Use sendable object keys and retain reference identity after eviction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cache = new ArkTSUtils.SendableLruCache<SendableObjectKey, number>(LRU_BOUNDARY_CAPACITY);
      for (let index = 0; index < LRU_BOUNDARY_CAPACITY; index++) {
        cache.put(new SendableObjectKey(String(index)), index);
      }
      const specialKey = new SendableObjectKey('special');
      cache.put(specialKey, 9999);
      expect(cache.contains(specialKey)).assertTrue();
      expect(cache.get(specialKey)).assertEqual(9999);
      expect(cache.contains(new SendableObjectKey('special'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_1400
     * @tc.name sendableLruCacheExpand1024Test0014
     * @tc.desc EXP_LRU_014: Coordinate three TaskPool put tasks near capacity 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'sendableLruCacheExpand1024Test0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const cache = new ArkTSUtils.SendableLruCache<number, number>(LRU_BOUNDARY_CAPACITY);
        const lock = new ArkTSUtils.locks.AsyncLock();
        fillNumberLru(cache, 0, 1000);
        const results: Object[] = await Promise.all([
          taskpool.execute(concurrentLruPutTask, cache, lock, 1000, 1034),
          taskpool.execute(concurrentLruPutTask, cache, lock, 1034, 1067),
          taskpool.execute(concurrentLruPutTask, cache, lock, 1067, 1100)
        ]);
        expect(results[0]).assertEqual(34);
        expect(results[1]).assertEqual(33);
        expect(results[2]).assertEqual(33);
        expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
        expect(cache.getRemoveCount()).assertEqual(76);
        expect(cache.contains(1099)).assertTrue();
        expect(cache.contains(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_1500
     * @tc.name sendableLruCacheExpand1024Test0015
     * @tc.desc EXP_LRU_015: Coordinate a reader and a writer around capacity 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'sendableLruCacheExpand1024Test0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const cache = new ArkTSUtils.SendableLruCache<number, number>(LRU_BOUNDARY_CAPACITY);
        const lock = new ArkTSUtils.locks.AsyncLock();
        for (let index = 0; index < 1020; index++) {
          cache.put(index, index);
        }
        const results: Object[] = await Promise.all([
          taskpool.execute(concurrentLruReadTask, cache, lock),
          taskpool.execute(concurrentLruWriterTask, cache, lock, 1020, 1030)
        ]);
        const readerCount: Object = results[0];
        expect(typeof readerCount === 'number').assertTrue();
        if (typeof readerCount === 'number') {
          expect(readerCount >= 1020).assertTrue();
          expect(readerCount <= 1024).assertTrue();
        }
        expect(results[1]).assertEqual(10);
        expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
        expect(cache.getRemoveCount()).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_1600
     * @tc.name sendableLruCacheExpand1024Test0016
     * @tc.desc EXP_LRU_016: Update capacity to 1024 while 99 tasks access the cache.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'sendableLruCacheExpand1024Test0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const cache = new ArkTSUtils.SendableLruCache<number, number>(64);
        const lock = new ArkTSUtils.locks.AsyncLock();
        for (let index = 0; index < 64; index++) {
          cache.put(index, index);
        }
        const tasks: Promise<Object>[] = [taskpool.execute(concurrentLruCapacityTask, cache, lock)];
        for (let index = 0; index < 99; index++) {
          tasks.push(taskpool.execute(concurrentLruAccessTask, cache, lock));
        }
        const results: Object[] = await Promise.all(tasks);
        expect(results[0]).assertEqual(LRU_BOUNDARY_CAPACITY);
        for (let index = 1; index < results.length; index++) {
          expect(results[index]).assertEqual(64);
        }
        expect(cache.getCapacity()).assertEqual(LRU_BOUNDARY_CAPACITY);
        for (let index = 0; index < 64; index++) {
          expect(cache.contains(index)).assertTrue();
          expect(cache.get(index)).assertEqual(index);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_1700
     * @tc.name sendableLruCacheExpand1024Test0017
     * @tc.desc EXP_LRU_017: Verify documented SendableLruCache APIs after TaskPool transfer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'sendableLruCacheExpand1024Test0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const cache = new ArkTSUtils.SendableLruCache<number, string>(LRU_BOUNDARY_CAPACITY);
        for (let index = 0; index < LRU_BOUNDARY_CAPACITY; index++) {
          cache.put(index, `value_${index}`);
        }
        const result: Object = await taskpool.execute(verifySendableLruCacheAfterTransfer, cache);
        expect(result).assertEqual(true);
        expect(cache.isEmpty()).assertTrue();
        expect(cache.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTSUTILS_SENDABLELRUCACHE_EXPANSION_1024_1800
     * @tc.name sendableLruCacheExpand1024Test0018
     * @tc.desc EXP_LRU_018: Repeated keys stay unique and most recently used at capacity 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheExpand1024Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const cache = new ArkTSUtils.SendableLruCache<number, number>(LRU_BOUNDARY_CAPACITY);
      for (let index = 0; index < 100; index++) {
        cache.put(0, 0);
      }
      expect(cache.length).assertEqual(1);
      expect(cache.get(0)).assertEqual(0);
      for (let index = 1; index < LRU_BOUNDARY_CAPACITY; index++) {
        cache.put(index, index);
      }
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
      for (let index = 0; index < 100; index++) {
        cache.put(0, 0);
      }
      expect(cache.get(0)).assertEqual(0);
      cache.put(LRU_BOUNDARY_CAPACITY, LRU_BOUNDARY_CAPACITY);
      expect(cache.length).assertEqual(LRU_BOUNDARY_CAPACITY);
      expect(cache.getRemoveCount()).assertEqual(1);
      expect(cache.contains(0)).assertTrue();
      expect(cache.contains(1)).assertFalse();
      expect(cache.get(0)).assertEqual(0);
      expect(cache.contains(LRU_BOUNDARY_CAPACITY)).assertTrue();
      expect(cache.get(LRU_BOUNDARY_CAPACITY)).assertEqual(LRU_BOUNDARY_CAPACITY);

      const specialValueCache = new ArkTSUtils.SendableLruCache<number, number>(4);
      specialValueCache.put(NaN, NaN);
      expect(Number.isNaN(specialValueCache.get(NaN))).assertTrue();
      const lengthAfterNanInsert: number = specialValueCache.length;
      specialValueCache.put(NaN, -101);
      expect(specialValueCache.length).assertEqual(lengthAfterNanInsert);
      expect(specialValueCache.get(NaN)).assertEqual(-101);
      specialValueCache.put(-0, -0);
      const negativeZeroValue = specialValueCache.get(0);
      expect(negativeZeroValue === 0).assertTrue();
      if (negativeZeroValue !== undefined) {
        expect(1 / negativeZeroValue < 0).assertTrue();
      }
      expect(specialValueCache.length).assertEqual(2);
    });
  });
}
