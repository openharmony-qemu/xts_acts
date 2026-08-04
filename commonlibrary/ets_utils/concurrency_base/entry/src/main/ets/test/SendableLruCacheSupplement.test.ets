/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, afterAll, it, expect, beforeAll, beforeEach, afterEach, TestType, Level, Size } from '@ohos/hypium'
import { ArkTSUtils, taskpool } from '@kit.ArkTS';

declare class ArkTools {
  static forceFullGC(): void
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, ms));
}

@Sendable
class CreateDefaultLruCache extends ArkTSUtils.SendableLruCache<number, number> {
  constructor() {
    super();
  }
  createDefault(key: number): number {
    return key + 100;
  }
}

@Sendable
class CreateDefaultUndefinedLruCache extends ArkTSUtils.SendableLruCache<number, number> {
  constructor() {
    super();
  }
  createDefault(key: number): number | undefined {
    return undefined;
  }
}

@Concurrent
async function concurrentPutWithLock(cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock, initialKey: number) {
  await lock.lockAsync(() => {
    cache.put(initialKey, initialKey + 1)
  })
}

@Concurrent
async function concurrentGetSideEffect(cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock, key: number) {
  await lock.lockAsync(() => {
    cache.get(key)
  })
}

@Concurrent
function taskPoolAllApisTest(): boolean {
  try {
    let cache = new ArkTSUtils.SendableLruCache<number, number>(10)
    let putRet = cache.put(1, 11)
    if (putRet !== 11) return false
    cache.put(2, 12)
    cache.put(3, 13)
    let len: number = cache.length
    if (len !== 3) return false
    if (cache.get(1) !== 11) return false
    if (cache.get(99) !== undefined) return false
    if (!cache.contains(1)) return false
    if (cache.contains(99)) return false
    let keys = cache.keys()
    if (keys.length !== 3) return false
    let values = cache.values()
    if (values.length !== 3) return false
    let entryCount = 0
    for (let entry of cache.entries()) {
      entryCount++
    }
    if (entryCount !== 3) return false
    let removed = cache.remove(1)
    if (removed !== 11) return false
    len = cache.length
    if (len !== 2) return false
    cache.updateCapacity(1)
    if (cache.getCapacity() !== 1) return false
    len = cache.length
    if (len !== 1) return false
    if (cache.isEmpty()) return false
    let str = cache.toString()
    if (str.indexOf('SendableLruCache') === -1) return false
    if (cache.getPutCount() !== 3) return false
    if (cache.getMatchCount() < 1) return false
    if (cache.getMissCount() < 1) return false
    if (cache.getRemoveCount() < 1) return false
    if (cache.getCreateCount() !== 0) return false
    cache.clear()
    if (!cache.isEmpty()) return false
    len = cache.length
    if (len !== 0) return false
    return true
  } catch (e) {
    return false
  }
}

@Concurrent
function taskPoolCreateDefaultTest(cache: ArkTSUtils.SendableLruCache<number, number>): boolean {
  try {
    let result = cache.get(5)
    if (result !== 105) return false
    if (cache.getCreateCount() !== 1) return false
    if (cache.length !== 1) return false
    if (!cache.contains(5)) return false
    return true
  } catch (e) {
    return false
  }
}

@Concurrent
function concurrentAllOpsTryCatch(cache: ArkTSUtils.SendableLruCache<number, number>, iterations: number): number {
  let errorCount: number = 0;
  for (let i = 0; i < iterations; i++) {
    let key: number = i;
    let value: number = i * 2;
    try {
      cache.put(key, value);
    } catch (err) {
      errorCount++;
    }
    try {
      cache.get(key);
    } catch (err) {
      errorCount++;
    }
    try {
      cache.contains(key);
    } catch (err) {
      errorCount++;
    }
    try {
      cache.remove(key);
    } catch (err) {
      errorCount++;
    }
    try {
      cache.put(key, value);
    } catch (err) {
      errorCount++;
    }
    try {
      cache.isEmpty();
    } catch (err) {
      errorCount++;
    }
    try {
      let len: number = cache.length;
      if (len < 0) {
        errorCount++;
      }
    } catch (err) {
      errorCount++;
    }
    try {
      cache.getCapacity();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.keys();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.values();
    } catch (err) {
      errorCount++;
    }
    try {
      let entryCount: number = 0;
      for (let entry of cache.entries()) {
        entryCount++;
      }
    } catch (err) {
      errorCount++;
    }
    try {
      cache.toString();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.getPutCount();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.getMatchCount();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.getMissCount();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.getRemoveCount();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.getCreateCount();
    } catch (err) {
      errorCount++;
    }
  }
  return errorCount;
}

@Concurrent
async function concurrentAllOpsWithLock(cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock, iterations: number): Promise<number> {
  let errorCount: number = 0;
  await lock.lockAsync(() => {
    for (let i = 0; i < iterations; i++) {
      let key: number = i;
      let value: number = i * 2;
      cache.put(key, value);
      cache.get(key);
      cache.contains(key);
      cache.remove(key);
      cache.put(key, value);
      cache.isEmpty();
      let len: number = cache.length;
      cache.getCapacity();
      cache.keys();
      cache.values();
      let entryCount: number = 0;
      for (let entry of cache.entries()) {
        entryCount++;
      }
      cache.toString();
      cache.getPutCount();
      cache.getMatchCount();
      cache.getMissCount();
      cache.getRemoveCount();
      cache.getCreateCount();
    }
  });
  return errorCount;
}

export default function SendableLruCacheSupplementTest() {
  let printLog = 'SendableLruCacheSupplementTest:';
  describe('SendableLruCacheSupplementTest', () => {

    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
      console.info(printLog + 'total supplement case over');
    })

    /**
     * @tc.name   testSendableLRUCacheCreateDefault001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_001
     * @tc.desc   Override createDefault to return non-undefined, get(missing key) returns default and adds entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheCreateDefault001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheCreateDefault001";
      let cache = new CreateDefaultLruCache()
      cache.put(1, 10)
      let result = cache.get(5)
      expect(result).assertEqual(105)
      let createCount = cache.getCreateCount()
      expect(createCount).assertEqual(1)
      let len = cache.length
      expect(len).assertEqual(2)
      let contains = cache.contains(5)
      expect(contains).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCreateDefault002
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_002
     * @tc.desc   Override createDefault to return undefined, get(missing key) returns undefined without adding entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheCreateDefault002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheCreateDefault002";
      let cache = new CreateDefaultUndefinedLruCache()
      cache.put(1, 10)
      let result = cache.get(5)
      expect(result).assertEqual(undefined)
      let createCount = cache.getCreateCount()
      expect(createCount).assertEqual(0)
      let len = cache.length
      expect(len).assertEqual(1)
      let contains = cache.contains(5)
      expect(contains).assertEqual(false)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCreateDefault003
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_003
     * @tc.desc   Multiple get(missing key) calls accumulate getCreateCount correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheCreateDefault003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheCreateDefault003";
      let cache = new CreateDefaultLruCache()
      cache.put(1, 10)
      cache.get(5)
      cache.get(7)
      cache.get(9)
      let createCount = cache.getCreateCount()
      expect(createCount).assertEqual(3)
      let len = cache.length
      expect(len).assertEqual(4)
      let r5 = cache.get(5)
      expect(r5).assertEqual(105)
      let createCountAfterHit = cache.getCreateCount()
      expect(createCountAfterHit).assertEqual(3)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCreateDefault004
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_004
     * @tc.desc   get(existing key) does not invoke createDefault.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheCreateDefault004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheCreateDefault004";
      let cache = new CreateDefaultLruCache()
      cache.put(1, 10)
      let result = cache.get(1)
      expect(result).assertEqual(10)
      let createCount = cache.getCreateCount()
      expect(createCount).assertEqual(0)
      let len = cache.length
      expect(len).assertEqual(1)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCreateDefault005
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_005
     * @tc.desc   createDefault triggered entry addition causes LRU eviction when capacity exceeded.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheCreateDefault005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheCreateDefault005";
      let cache = new CreateDefaultLruCache()
      cache.updateCapacity(2)
      cache.put(1, 10)
      cache.put(2, 20)
      let result = cache.get(3)
      expect(result).assertEqual(103)
      let removeCount = cache.getRemoveCount()
      expect(removeCount).assertEqual(1)
      let len = cache.length
      expect(len).assertEqual(2)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(false)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEvictOrder001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EVICT_ORDER_001
     * @tc.desc   When capacity exceeded by put, the least recently used key is evicted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheEvictOrder001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheEvictOrder001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(2)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.put(3, 30)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(false)
      let contains2 = cache.contains(2)
      expect(contains2).assertEqual(true)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      let removeCount = cache.getRemoveCount()
      expect(removeCount).assertEqual(1)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEvictOrder002
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EVICT_ORDER_002
     * @tc.desc   get(LRU key) refreshes its position so it is not evicted on next put.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheEvictOrder002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheEvictOrder002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(2)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.get(1)
      cache.put(3, 30)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(true)
      let contains2 = cache.contains(2)
      expect(contains2).assertEqual(false)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEvictOrder003
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EVICT_ORDER_003
     * @tc.desc   contains(key) refreshes LRU position so the other key is evicted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheEvictOrder003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheEvictOrder003";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(2)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.contains(1)
      cache.put(3, 30)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(true)
      let contains2 = cache.contains(2)
      expect(contains2).assertEqual(false)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEvictOrder004
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EVICT_ORDER_004
     * @tc.desc   updateCapacity shrink evicts least recently used keys in order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheEvictOrder004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheEvictOrder004";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(4)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.put(3, 30)
      cache.put(4, 40)
      cache.updateCapacity(2)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(false)
      let contains2 = cache.contains(2)
      expect(contains2).assertEqual(false)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      let contains4 = cache.contains(4)
      expect(contains4).assertEqual(true)
      let removeCount = cache.getRemoveCount()
      expect(removeCount).assertEqual(2)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CAPACITY_BOUNDARY_001
     * @tc.desc   Constructor with capacity 2147483647 (max boundary) succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(2147483647)
      let capacity = cache.getCapacity()
      expect(capacity).assertEqual(2147483647)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary002
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CAPACITY_BOUNDARY_002
     * @tc.desc   Constructor with capacity 0 throws exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary002";
      try {
        let cache = new ArkTSUtils.SendableLruCache<number, number>(0)
        console.error(`${TAG} expected exception not thrown`);
        expect().assertFail();
        done();
      } catch (e) {
        // No error code defined in API doc, only verify exception is thrown
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary003
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CAPACITY_BOUNDARY_003
     * @tc.desc   Constructor with negative integer capacity throws exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary003";
      try {
        let cache = new ArkTSUtils.SendableLruCache<number, number>(-5)
        console.error(`${TAG} expected exception not thrown`);
        expect().assertFail();
        done();
      } catch (e) {
        // No error code defined in API doc, only verify exception is thrown
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary004
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CAPACITY_BOUNDARY_004
     * @tc.desc   Constructor with NaN capacity throws exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary004";
      try {
        let cache = new ArkTSUtils.SendableLruCache<number, number>(NaN)
        console.error(`${TAG} expected exception not thrown`);
        expect().assertFail();
        done();
      } catch (e) {
        // No error code defined in API doc, only verify exception is thrown
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary005
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CAPACITY_BOUNDARY_005
     * @tc.desc   Constructor with Infinity capacity throws exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary005";
      try {
        let cache = new ArkTSUtils.SendableLruCache<number, number>(Infinity)
        console.error(`${TAG} expected exception not thrown`);
        expect().assertFail();
        done();
      } catch (e) {
        // No error code defined in API doc, only verify exception is thrown
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary006
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CAPACITY_BOUNDARY_006
     * @tc.desc   updateCapacity(0) throws exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary006";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(100)
      try {
        cache.updateCapacity(0)
        console.error(`${TAG} expected exception not thrown`);
        expect().assertFail();
        done();
      } catch (e) {
        // No error code defined in API doc, only verify exception is thrown
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary007
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CAPACITY_BOUNDARY_007
     * @tc.desc   updateCapacity(2147483647) succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary007";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.updateCapacity(2147483647)
      let capacity = cache.getCapacity()
      expect(capacity).assertEqual(2147483647)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary008
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CAPACITY_BOUNDARY_008
     * @tc.desc   updateCapacity(NaN) throws exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary008";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(100)
      try {
        cache.updateCapacity(NaN)
        console.error(`${TAG} expected exception not thrown`);
        expect().assertFail();
        done();
      } catch (e) {
        // No error code defined in API doc, only verify exception is thrown
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheClearStats001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CLEAR_STATS_001
     * @tc.desc   Verify stats counters are retained (not reset) after clear(); only cache entries are cleared.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClearStats001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClearStats001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      cache.put(2, 20)
      cache.get(1)
      cache.get(3)
      let beforeLength = cache.length
      expect(beforeLength).assertEqual(2)
      let beforeMatch = cache.getMatchCount()
      let beforeMiss = cache.getMissCount()
      let beforePut = cache.getPutCount()
      let beforeRemove = cache.getRemoveCount()
      expect(beforeMatch).assertEqual(1)
      expect(beforeMiss).assertEqual(1)
      expect(beforePut).assertEqual(2)
      expect(beforeRemove).assertEqual(0)
      cache.clear()
      let afterLength = cache.length
      expect(afterLength).assertEqual(0)
      expect(cache.isEmpty()).assertEqual(true)
      let afterMatch = cache.getMatchCount()
      let afterMiss = cache.getMissCount()
      let afterPut = cache.getPutCount()
      let afterRemove = cache.getRemoveCount()
      console.info(`${TAG} after clear: match=${afterMatch}, miss=${afterMiss}, put=${afterPut}, remove=${afterRemove}`);
      expect(afterMatch).assertEqual(beforeMatch)
      expect(afterMiss).assertEqual(beforeMiss)
      expect(afterPut).assertEqual(beforePut)
      expect(afterRemove).assertEqual(beforeRemove)
      cache.put(1, 10)
      cache.get(1)
      expect(cache.getPutCount()).assertEqual(beforePut + 1)
      expect(cache.getMatchCount()).assertEqual(beforeMatch + 1)
      expect(cache.length).assertEqual(1)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheClearStats002
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CLEAR_STATS_002
     * @tc.desc   After clear(), non-zero putCount/matchCount/missCount/removeCount are retained and accumulate on subsequent operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClearStats002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClearStats002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(2)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.put(3, 30)   // exceeds capacity 2, evicts key 1 -> removeCount=1
      cache.get(2)       // hit -> matchCount=1
      cache.get(99)      // miss (base createDefault returns undefined) -> missCount=1
      let beforeCap = cache.getCapacity()
      let beforePut = cache.getPutCount()
      let beforeMatch = cache.getMatchCount()
      let beforeMiss = cache.getMissCount()
      let beforeRemove = cache.getRemoveCount()
      let beforeCreate = cache.getCreateCount()
      expect(beforeCap).assertEqual(2)
      expect(beforePut).assertEqual(3)
      expect(beforeMatch).assertEqual(1)
      expect(beforeMiss).assertEqual(1)
      expect(beforeRemove).assertEqual(1)
      expect(beforeCreate).assertEqual(0)
      cache.clear()
      expect(cache.length).assertEqual(0)
      expect(cache.isEmpty()).assertEqual(true)
      // capacity is a configuration value, not entries -> unchanged by clear
      expect(cache.getCapacity()).assertEqual(beforeCap)
      // all stat counters retained (clear only removes entries, not counters)
      expect(cache.getPutCount()).assertEqual(beforePut)
      expect(cache.getMatchCount()).assertEqual(beforeMatch)
      expect(cache.getMissCount()).assertEqual(beforeMiss)
      expect(cache.getRemoveCount()).assertEqual(beforeRemove)
      expect(cache.getCreateCount()).assertEqual(beforeCreate)
      // subsequent operations accumulate on top of retained values
      cache.put(10, 100)   // putCount = beforePut + 1
      cache.put(20, 200)   // fill capacity 2
      cache.put(30, 300)   // exceeds capacity, evicts LRU(key 10) -> removeCount = beforeRemove + 1
      let keysAfter = cache.keys()
      expect(keysAfter.indexOf(10)).assertEqual(-1)
      cache.get(20)         // hit -> matchCount = beforeMatch + 1
      cache.get(88)         // miss -> missCount = beforeMiss + 1
      expect(cache.getPutCount()).assertEqual(beforePut + 3)
      expect(cache.getMatchCount()).assertEqual(beforeMatch + 1)
      expect(cache.getMissCount()).assertEqual(beforeMiss + 1)
      expect(cache.getRemoveCount()).assertEqual(beforeRemove + 1)
      // capacity unaffected by put/get/eviction (only updateCapacity changes it)
      expect(cache.getCapacity()).assertEqual(beforeCap)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheClearStats003
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CLEAR_STATS_003
     * @tc.desc   After clear(), non-zero createCount (from createDefault) is retained and accumulates on subsequent get(missing key).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClearStats003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClearStats003";
      let cache = new CreateDefaultLruCache()   // createDefault returns key + 100
      cache.put(1, 10)
      let r5 = cache.get(5)   // missing -> createDefault(5)=105, createCount=1
      expect(r5).assertEqual(105)
      let r7 = cache.get(7)   // missing -> createDefault(7)=107, createCount=2
      expect(r7).assertEqual(107)
      let beforeCreate = cache.getCreateCount()
      let beforePut = cache.getPutCount()
      expect(beforeCreate).assertEqual(2)
      cache.clear()
      expect(cache.length).assertEqual(0)
      // createCount retained (not reset by clear)
      expect(cache.getCreateCount()).assertEqual(beforeCreate)
      expect(cache.getPutCount()).assertEqual(beforePut)
      // get(missing) after clear triggers createDefault again, accumulates on retained value
      let r9 = cache.get(9)   // missing -> createDefault(9)=109, createCount = beforeCreate + 1
      expect(r9).assertEqual(109)
      expect(cache.getCreateCount()).assertEqual(beforeCreate + 1)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheClearStats004
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CLEAR_STATS_004
     * @tc.desc   After clear(), toString() stays identical because counters (hits/misses/hitRate) are retained, not reset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClearStats004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClearStats004";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      cache.get(1)    // hit -> hits=1
      cache.get(2)    // miss -> misses=1
      let strBefore = cache.toString()
      expect(strBefore).assertEqual('SendableLruCache[ maxSize = 64, hits = 1, misses = 1, hitRate = 50% ]')
      cache.clear()
      expect(cache.length).assertEqual(0)
      // counters retained -> toString output unchanged
      let strAfter = cache.toString()
      expect(strAfter).assertEqual(strBefore)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheClearStats005
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CLEAR_STATS_005
     * @tc.desc   Manual remove(key) does not increment getRemoveCount (eviction counter); only capacity-exceeded eviction increments it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClearStats005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClearStats005";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(3)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.put(3, 30)
      let removeCount0 = cache.getRemoveCount()
      expect(removeCount0).assertEqual(0)   // no eviction yet
      // manual remove (within capacity) is NOT an eviction -> removeCount unchanged
      cache.remove(2)
      expect(cache.getRemoveCount()).assertEqual(removeCount0)
      expect(cache.length).assertEqual(2)
      // capacity-exceeded put triggers eviction -> removeCount increments
      cache.put(4, 40)   // length=3, at capacity, no eviction
      cache.put(5, 50)   // length=4 > capacity 3, evicts LRU -> removeCount=1
      expect(cache.getRemoveCount()).assertEqual(removeCount0 + 1)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EMPTY_001
     * @tc.desc   keys() on empty cache returns empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmpty001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let keys = cache.keys()
      expect(keys.length).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmpty002
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EMPTY_002
     * @tc.desc   values() on empty cache returns empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmpty002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let values = cache.values()
      expect(values.length).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmpty003
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EMPTY_003
     * @tc.desc   entries() on empty cache produces no iteration items.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmpty003";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let count = 0
      for (let entry of cache.entries()) {
        count++
      }
      expect(count).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmpty004
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EMPTY_004
     * @tc.desc   toString() on empty cache returns the expected format.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmpty004";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let str = cache.toString()
      expect(str).assertEqual('SendableLruCache[ maxSize = 64, hits = 0, misses = 0, hitRate = 0% ]')
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheContainsAfterRemove001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONTAINS_AFTER_REMOVE_001
     * @tc.desc   contains(key) returns false after remove(key).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheContainsAfterRemove001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContainsAfterRemove001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(true)
      cache.remove(1)
      let contains2 = cache.contains(1)
      expect(contains2).assertEqual(false)
      let len = cache.length
      expect(len).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCachePutUpdateOrder001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_PUT_UPDATE_ORDER_001
     * @tc.desc   put(same key, new value) refreshes LRU position so the other key is evicted next.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCachePutUpdateOrder001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCachePutUpdateOrder001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(2)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.put(1, 100)
      cache.put(3, 30)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(true)
      let contains2 = cache.contains(2)
      expect(contains2).assertEqual(false)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      let val1 = cache.get(1)
      expect(val1).assertEqual(100)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheStress001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_STRESS_001
     * @tc.desc   Stress test with 1000 put operations on capacity-100 cache.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheStress001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheStress001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(100)
      for (let i = 0; i < 1000; i++) {
        cache.put(i, i * 2)
      }
      let len = cache.length
      expect(len).assertEqual(100)
      let putCount = cache.getPutCount()
      expect(putCount).assertEqual(1000)
      let removeCount = cache.getRemoveCount()
      expect(removeCount).assertEqual(900)
      let lastKey = cache.get(999)
      expect(lastKey).assertEqual(1998)
      let firstEvictedKey = cache.get(0)
      expect(firstEvictedKey === undefined || firstEvictedKey === 100).assertTrue()
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheConcurrent001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONCURRENT_001
     * @tc.desc   Concurrent put via TaskGroup with AsyncLock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheConcurrent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheConcurrent001";
      try {
        let cache = new ArkTSUtils.SendableLruCache<number, number>();
        let lock = new ArkTSUtils.locks.AsyncLock()
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(concurrentPutWithLock, cache, lock, 10);
        taskGroup.addTask(concurrentPutWithLock, cache, lock, 20);
        taskGroup.addTask(concurrentPutWithLock, cache, lock, 30);
        taskGroup.addTask(concurrentPutWithLock, cache, lock, 40);
        taskGroup.addTask(concurrentPutWithLock, cache, lock, 50);
        await taskpool.execute(taskGroup)
        ArkTools.forceFullGC()
        let len = cache.length
        expect(len).assertEqual(5)
        expect(cache.contains(10)).assertEqual(true)
        expect(cache.contains(20)).assertEqual(true)
        expect(cache.contains(30)).assertEqual(true)
        expect(cache.contains(40)).assertEqual(true)
        expect(cache.contains(50)).assertEqual(true)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheConcurrent002
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONCURRENT_002
     * @tc.desc   Concurrent get via TaskGroup with AsyncLock, verify match count after concurrent hits.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheConcurrent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheConcurrent002";
      try {
        let cache = new ArkTSUtils.SendableLruCache<number, number>();
        let lock = new ArkTSUtils.locks.AsyncLock()
        cache.put(10, 11)
        cache.put(20, 21)
        cache.put(30, 31)
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(concurrentGetSideEffect, cache, lock, 10);
        taskGroup.addTask(concurrentGetSideEffect, cache, lock, 20);
        taskGroup.addTask(concurrentGetSideEffect, cache, lock, 30);
        await taskpool.execute(taskGroup)
        ArkTools.forceFullGC()
        let matchCount = cache.getMatchCount()
        expect(matchCount >= 3).assertTrue()
        expect(cache.get(10)).assertEqual(11)
        expect(cache.get(20)).assertEqual(21)
        expect(cache.get(30)).assertEqual(31)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary009
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CAPACITY_BOUNDARY_009
     * @tc.desc   Constructor with capacity 1 (minimum valid value) succeeds and only retains one entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary009";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(1)
      let capacity = cache.getCapacity()
      expect(capacity).assertEqual(1)
      cache.put(1, 10)
      cache.put(2, 20)
      let len = cache.length
      expect(len).assertEqual(1)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(false)
      let contains2 = cache.contains(2)
      expect(contains2).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary010
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CAPACITY_BOUNDARY_010
     * @tc.desc   updateCapacity(1) shrinks to minimum capacity and retains only the most recent entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary010";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(10)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.put(3, 30)
      cache.updateCapacity(1)
      let capacity = cache.getCapacity()
      expect(capacity).assertEqual(1)
      let len = cache.length
      expect(len).assertEqual(1)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(false)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheValueBoundary001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_VALUE_BOUNDARY_001
     * @tc.desc   put/get with value 0 (boundary value).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValueBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValueBoundary001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let ret = cache.put(1, 0)
      expect(ret).assertEqual(0)
      let val = cache.get(1)
      expect(val).assertEqual(0)
      let contains = cache.contains(1)
      expect(contains).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheValueBoundary002
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_VALUE_BOUNDARY_002
     * @tc.desc   put/get with value Number.MAX_SAFE_INTEGER (boundary value).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValueBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValueBoundary002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let maxVal = Number.MAX_SAFE_INTEGER
      let ret = cache.put(1, maxVal)
      expect(ret).assertEqual(maxVal)
      let val = cache.get(1)
      expect(val).assertEqual(maxVal)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheValueBoundary003
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_VALUE_BOUNDARY_003
     * @tc.desc   put/get with value Number.MIN_SAFE_INTEGER (boundary value).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValueBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValueBoundary003";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let minVal = Number.MIN_SAFE_INTEGER
      let ret = cache.put(1, minVal)
      expect(ret).assertEqual(minVal)
      let val = cache.get(1)
      expect(val).assertEqual(minVal)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheValueBoundary004
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_VALUE_BOUNDARY_004
     * @tc.desc   put/get with value -0 (negative zero boundary value).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValueBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValueBoundary004";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let negZero = -0
      let ret = cache.put(1, negZero)
      expect(ret).assertEqual(0)
      let val = cache.get(1)
      expect(val).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheKeyBoundary001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_KEY_BOUNDARY_001
     * @tc.desc   Use empty string '' as key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheKeyBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeyBoundary001";
      let cache = new ArkTSUtils.SendableLruCache<string, number>()
      cache.put('', 10)
      let val = cache.get('')
      expect(val).assertEqual(10)
      let contains = cache.contains('')
      expect(contains).assertEqual(true)
      let keys = cache.keys()
      expect(keys[0]).assertEqual('')
      let removed = cache.remove('')
      expect(removed).assertEqual(10)
      expect(cache.contains('')).assertEqual(false)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheKeyBoundary002
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_KEY_BOUNDARY_002
     * @tc.desc   Use long string as key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheKeyBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeyBoundary002";
      let cache = new ArkTSUtils.SendableLruCache<string, number>()
      let longKey = ''
      for (let i = 0; i < 1000; i++) {
        longKey = longKey + 'a'
      }
      cache.put(longKey, 10)
      let val = cache.get(longKey)
      expect(val).assertEqual(10)
      let contains = cache.contains(longKey)
      expect(contains).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheKeyBoundary003
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_KEY_BOUNDARY_003
     * @tc.desc   Use 0 as numeric key (boundary value).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheKeyBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeyBoundary003";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(0, 100)
      let val = cache.get(0)
      expect(val).assertEqual(100)
      let contains = cache.contains(0)
      expect(contains).assertEqual(true)
      let removed = cache.remove(0)
      expect(removed).assertEqual(100)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheRepeat001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_REPEAT_001
     * @tc.desc   Repeated get(same key) accumulates getMatchCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheRepeat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRepeat001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      cache.get(1)
      cache.get(1)
      cache.get(1)
      let matchCount = cache.getMatchCount()
      expect(matchCount).assertEqual(3)
      let missCount = cache.getMissCount()
      expect(missCount).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheRepeat002
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_REPEAT_002
     * @tc.desc   Repeated contains(same key) accumulates getMatchCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheRepeat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRepeat002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      cache.contains(1)
      cache.contains(1)
      let matchCount = cache.getMatchCount()
      expect(matchCount).assertEqual(2)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheRepeat003
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_REPEAT_003
     * @tc.desc   Repeated remove(same key), the second call returns undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheRepeat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRepeat003";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      let first = cache.remove(1)
      expect(first).assertEqual(10)
      let second = cache.remove(1)
      expect(second).assertEqual(undefined)
      let len = cache.length
      expect(len).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheRepeat004
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_REPEAT_004
     * @tc.desc   Repeated clear() keeps length at 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheRepeat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRepeat004";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      cache.clear()
      let len1 = cache.length
      expect(len1).assertEqual(0)
      cache.clear()
      let len2 = cache.length
      expect(len2).assertEqual(0)
      let isEmpty = cache.isEmpty()
      expect(isEmpty).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheRepeat005
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_REPEAT_005
     * @tc.desc   Repeated updateCapacity with the same value keeps capacity unchanged.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheRepeat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRepeat005";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(50)
      cache.updateCapacity(20)
      let cap1 = cache.getCapacity()
      expect(cap1).assertEqual(20)
      cache.updateCapacity(20)
      let cap2 = cache.getCapacity()
      expect(cap2).assertEqual(20)
      cache.put(1, 10)
      cache.put(2, 20)
      let len = cache.length
      expect(len).assertEqual(2)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheSameValue001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_SAME_VALUE_001
     * @tc.desc   put different keys with the same value, values() contains duplicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheSameValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheSameValue001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 100)
      cache.put(2, 100)
      cache.put(3, 100)
      let val1 = cache.get(1)
      let val2 = cache.get(2)
      let val3 = cache.get(3)
      expect(val1).assertEqual(100)
      expect(val2).assertEqual(100)
      expect(val3).assertEqual(100)
      let values = cache.values()
      expect(values.length).assertEqual(3)
      expect(values[0]).assertEqual(100)
      expect(values[1]).assertEqual(100)
      expect(values[2]).assertEqual(100)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheSameValue002
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_SAME_VALUE_002
     * @tc.desc   put same key with the same value repeatedly, length stays unchanged and putCount accumulates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheSameValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheSameValue002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 100)
      cache.put(1, 100)
      cache.put(1, 100)
      let len = cache.length
      expect(len).assertEqual(1)
      let putCount = cache.getPutCount()
      expect(putCount).assertEqual(3)
      let val = cache.get(1)
      expect(val).assertEqual(100)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmptyOperation001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EMPTY_OPERATION_001
     * @tc.desc   isEmpty() returns true on a fresh empty cache.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmptyOperation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmptyOperation001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let isEmpty = cache.isEmpty()
      expect(isEmpty).assertEqual(true)
      let len = cache.length
      expect(len).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmptyOperation002
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EMPTY_OPERATION_002
     * @tc.desc   get(anyKey) on empty cache returns undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmptyOperation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmptyOperation002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let val = cache.get(1)
      expect(val).assertEqual(undefined)
      let missCount = cache.getMissCount()
      expect(missCount).assertEqual(1)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmptyOperation003
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EMPTY_OPERATION_003
     * @tc.desc   remove(anyKey) on empty cache returns undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmptyOperation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmptyOperation003";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let removed = cache.remove(1)
      expect(removed).assertEqual(undefined)
      let len = cache.length
      expect(len).assertEqual(0)
      let isEmpty = cache.isEmpty()
      expect(isEmpty).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmptyOperation004
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EMPTY_OPERATION_004
     * @tc.desc   contains(anyKey) on empty cache returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmptyOperation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmptyOperation004";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let contains = cache.contains(1)
      expect(contains).assertEqual(false)
      let len = cache.length
      expect(len).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmptyOperation005
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_EMPTY_OPERATION_005
     * @tc.desc   All stat counters on a fresh empty cache are 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmptyOperation005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmptyOperation005";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      expect(cache.getMatchCount()).assertEqual(0)
      expect(cache.getMissCount()).assertEqual(0)
      expect(cache.getPutCount()).assertEqual(0)
      expect(cache.getRemoveCount()).assertEqual(0)
      expect(cache.getCreateCount()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheTaskPoolAllApis001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_TASKPOOL_ALL_APIS_001
     * @tc.desc   Verify all SendableLruCache APIs (except createDefault) work correctly in taskpool worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheTaskPoolAllApis001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheTaskPoolAllApis001";
      let task: taskpool.Task = new taskpool.Task(taskPoolAllApisTest)
      let result = await taskpool.execute(task) as boolean
      ArkTools.forceFullGC()
      expect(result).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheTaskPoolCreateDefault001
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_TASKPOOL_CREATE_DEFAULT_001
     * @tc.desc   Verify createDefault override works in taskpool worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheTaskPoolCreateDefault001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheTaskPoolCreateDefault001";
      let cache = new CreateDefaultLruCache()
      let task: taskpool.Task = new taskpool.Task(taskPoolCreateDefaultTest, cache)
      let result = await taskpool.execute(task) as boolean
      ArkTools.forceFullGC()
      expect(result).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheConcurrentAllOpsTryCatch
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONCURRENT_003
     * @tc.desc   SendableLruCache concurrent: 10 loops, main thread + TaskPool simultaneously call all interfaces, try-catch, only assert task completed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheConcurrentAllOpsTryCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testSendableLRUCacheConcurrentAllOpsTryCatch";
        let cache = new ArkTSUtils.SendableLruCache<number, number>(64);
        for (let i = 0; i < 10; i++) {
          cache.put(i, i * 2);
        }

        let count: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(concurrentAllOpsTryCatch, cache, 10);
          taskpool.execute(task).then((result: Object) => {
            count++;
          });
          concurrentAllOpsTryCatch(cache, 10);
        }
        let waitCount: number = 0;
        while (count < 10 && waitCount < 100) {
          await sleep(100);
          waitCount++;
        }
        expect(count).assertEqual(10);
        done();
      });

    /**
     * @tc.name   testSendableLRUCacheConcurrentWithLock
     * @tc.number SUB_COMMONLIBRARY_UTILS_SENDABLE_LRU_CACHE_CONCURRENT_004
     * @tc.desc   SendableLruCache with AsyncLock: 10 loops, TaskPool + main thread both acquire lock, serialized, assert data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheConcurrentWithLock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testSendableLRUCacheConcurrentWithLock";
        let cache = new ArkTSUtils.SendableLruCache<number, number>(64);
        for (let i = 0; i < 10; i++) {
          cache.put(i, i * 2);
        }
        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let count: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(concurrentAllOpsWithLock, cache, lock, 10);
          taskpool.execute(task).then((result: Object) => {
            count++;
          });
          concurrentAllOpsWithLock(cache, lock, 10);
        }
        let waitCount: number = 0;
        while (count < 10 && waitCount < 100) {
          await sleep(100);
          waitCount++;
        }
        expect(count).assertEqual(10);
        expect(cache.length).assertEqual(10);
        expect(cache.contains(0)).assertEqual(true);
        expect(cache.contains(9)).assertEqual(true);
        done();
      });
  })
}
