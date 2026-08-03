'use static'
/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

// ==================== ReadWriteCache classes ====================
class CacheData {
  key: string = 'key1';
  value: number = 100;
}

class HotCacheData {
  hits: number = 0;
  value: number = 42;
}

class AvalancheCacheData {
  valid: boolean = true;
  value: number = 100;
  refreshCount: number = 0;
}

class PenetrateCacheData {
  value: number = 0;
  hasValue: boolean = false;
  missCount: number = 0;
}

class LruCacheData {
  items: number[] = [1, 2, 3, 4, 5];
  updateCount: number = 0;
}

class PreloadCacheData {
  items: number[] = [];
  loadedCount: number = 0;
}

// ==================== ReadWriteConfig classes ====================
class ConfigData {
  value: string = 'config_v1';
  readCount: number = 0;
}

class HotUpdateConfig {
  value: string = 'initial';
  version: number = 1;
}

class VersionConfig {
  versions: string[] = ['v1'];
  currentVersion: number = 1;
}

class RollbackConfig {
  currentValue: string = 'current';
  previousValue: string = 'previous';
  rollbackCount: number = 0;
}

class EncryptConfig {
  plainText: string = 'secret';
  encrypted: string = '';
  decryptCount: AtomicInt = new AtomicInt(0);
}

// ==================== ReadWriteDatabase classes ====================
class DatabaseData {
  records: string[] = ['record1'];
  queryCount: AtomicInt = new AtomicInt(0);
  updateCount: AtomicInt = new AtomicInt(0);
}

class TransactionData {
  balance: number = 1000;
  committed: number = 0;
}

class ConnectionPoolData {
  connections: string[] = ['conn1', 'conn2', 'conn3'];
  acquired: number = 0;
  released: number = 0;
}

class BatchDbData {
  records: number[] = [];
  readCount: AtomicInt = new AtomicInt(0);
  writeCount: AtomicInt = new AtomicInt(0);
}

class IndexData {
  index: number[] = [1, 2, 3, 4, 5];
  queryCount: AtomicInt = new AtomicInt(0);
  rebuildCount: AtomicInt = new AtomicInt(0);
}

// ==================== ReadWriteCache task functions ====================
function cacheReadTask(rwlock: RWLock, cache: CacheData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let val: number = cache.value;
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function cacheWriteTask(rwlock: RWLock, cache: CacheData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    cache.value = Math.floor(Math.random() * 1000);
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function hotCacheReadTask(rwlock: RWLock, cache: HotCacheData, counter: AtomicInt, hitCounter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let val: number = cache.value;
    hitCounter.fetchAdd(1);
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function hotCacheWriteTask(rwlock: RWLock, cache: HotCacheData, counter: AtomicInt, hitCounter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    cache.value = Math.floor(Math.random() * 1000);
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function avalancheReadTask(rwlock: RWLock, cache: AvalancheCacheData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    if (cache.valid) {
      let val: number = cache.value;
    }
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function avalancheRefreshTask(rwlock: RWLock, cache: AvalancheCacheData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    cache.valid = false;
    cache.value = Math.floor(Math.random() * 1000);
    cache.valid = true;
    cache.refreshCount = cache.refreshCount + 1;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function penetrateReadTask(rwlock: RWLock, cache: PenetrateCacheData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    if (!cache.hasValue) {
      cache.missCount = cache.missCount + 1;
    }
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function penetrateWriteTask(rwlock: RWLock, cache: PenetrateCacheData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    cache.value = 0;
    cache.hasValue = true;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function lruReadTask(rwlock: RWLock, cache: LruCacheData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    if (cache.items.length > 0) {
      let val: number = cache.items[0];
    }
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function lruUpdateTask(rwlock: RWLock, cache: LruCacheData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    if (cache.items.length > 0) {
      cache.items.shift();
      cache.items.push(Math.floor(Math.random() * 100));
    }
    cache.updateCount = cache.updateCount + 1;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function preloadBatchTask(rwlock: RWLock, cache: PreloadCacheData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    for (let i: number = 0; i < 5; i++) {
      cache.items.push(Math.floor(Math.random() * 100));
      cache.loadedCount = cache.loadedCount + 1;
    }
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function preloadVerifyTask(rwlock: RWLock, cache: PreloadCacheData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let len: number = cache.items.length;
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

// ==================== ReadWriteConfig task functions ====================
function configReadTask(rwlock: RWLock, config: ConfigData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let val: string = config.value;
    config.readCount = config.readCount + 1;
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function configUpdateTask(rwlock: RWLock, config: ConfigData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    config.value = 'config_v2';
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function hotUpdateTask(rwlock: RWLock, config: HotUpdateConfig, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    config.value = 'hot_updated';
    config.version = config.version + 1;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function hotUpdateReadTask(rwlock: RWLock, config: HotUpdateConfig, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let val: string = config.value;
    let ver: number = config.version;
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function versionReadTask(rwlock: RWLock, config: VersionConfig, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let ver: number = config.currentVersion;
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function versionUpdateTask(rwlock: RWLock, config: VersionConfig, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    config.currentVersion = config.currentVersion + 1;
    config.versions.push('v' + config.currentVersion.toString());
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function configRollbackTask(rwlock: RWLock, config: RollbackConfig, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    let temp: string = config.currentValue;
    config.currentValue = config.previousValue;
    config.previousValue = temp;
    config.rollbackCount = config.rollbackCount + 1;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function configEncryptTask(rwlock: RWLock, config: EncryptConfig, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    config.encrypted = 'enc_' + config.plainText;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function configDecryptTask(rwlock: RWLock, config: EncryptConfig, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let val: string = config.encrypted;
    config.decryptCount.fetchAdd(1);
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

// ==================== ReadWriteDatabase task functions ====================
function dbQueryTask(rwlock: RWLock, db: DatabaseData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    if (db.records.length > 0) {
      let val: string = db.records[0];
    }
    db.queryCount.fetchAdd(1);
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function dbUpdateTask(rwlock: RWLock, db: DatabaseData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    db.records.push('updated_record');
    db.updateCount.fetchAdd(1);
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function transactionCommitTask(mutex: Mutex, data: TransactionData, counter: AtomicInt): void {
  mutex.lock();
  try {
    let amount: number = 100;
    data.balance = data.balance - amount;
    data.balance = data.balance + amount;
    data.committed = data.committed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function connectionAcquireTask(mutex: Mutex, pool: ConnectionPoolData, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (pool.connections.length > 0) {
      let conn: string = pool.connections.pop() as string;
      pool.acquired = pool.acquired + 1;
      pool.connections.push(conn);
      pool.released = pool.released + 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function batchReadTask(rwlock: RWLock, data: BatchDbData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let len: number = data.records.length;
    data.readCount.fetchAdd(1);
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function batchWriteTask(rwlock: RWLock, data: BatchDbData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    for (let i: number = 0; i < 5; i++) {
      data.records.push(i);
    }
    data.writeCount.fetchAdd(1);
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function indexQueryTask(rwlock: RWLock, data: IndexData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    if (data.index.length > 0) {
      let val: number = data.index[0];
    }
    data.queryCount.fetchAdd(1);
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function indexRebuildTask(rwlock: RWLock, data: IndexData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    data.index = [1, 2, 3, 4, 5, 6];
    data.rebuildCount.fetchAdd(1);
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

// ==================== EXPORTED FUNCTION ====================
export default function LockDesignReadWriteCacheTest(): void {
  // ---------- ReadWriteCache tests ----------
  describe('LockDesignReadWriteCacheTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest0100
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_0100
     * @tc.desc    Verify cache read-write with 10 readers and 1 writer using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignReadWriteCacheTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const rwlock = new RWLock();
      const cache = new CacheData();
      const readCounter = new AtomicInt(0);
      const writeCounter = new AtomicInt(0);
      let r1 = taskpool.execute(new taskpool.Task(cacheReadTask, rwlock, cache, readCounter));
      let r2 = taskpool.execute(new taskpool.Task(cacheReadTask, rwlock, cache, readCounter));
      let r3 = taskpool.execute(new taskpool.Task(cacheReadTask, rwlock, cache, readCounter));
      let r4 = taskpool.execute(new taskpool.Task(cacheReadTask, rwlock, cache, readCounter));
      let r5 = taskpool.execute(new taskpool.Task(cacheReadTask, rwlock, cache, readCounter));
      let r6 = taskpool.execute(new taskpool.Task(cacheReadTask, rwlock, cache, readCounter));
      let r7 = taskpool.execute(new taskpool.Task(cacheReadTask, rwlock, cache, readCounter));
      let r8 = taskpool.execute(new taskpool.Task(cacheReadTask, rwlock, cache, readCounter));
      let r9 = taskpool.execute(new taskpool.Task(cacheReadTask, rwlock, cache, readCounter));
      let r10 = taskpool.execute(new taskpool.Task(cacheReadTask, rwlock, cache, readCounter));
      let w1 = taskpool.execute(new taskpool.Task(cacheWriteTask, rwlock, cache, writeCounter));
      await Promise.all([r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, w1]);
      expect(readCounter.load()).assertEqual(10);
      expect(writeCounter.load()).assertEqual(1);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest0200
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_0200
     * @tc.desc    Verify hot cache with 5 readers and 2 writers tracking hit count using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignReadWriteCacheTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rwlock = new RWLock();
      const cache = new HotCacheData();
      const counter = new AtomicInt(0);
      const hitCounter = new AtomicInt(0);
      let r1 = taskpool.execute(new taskpool.Task(hotCacheReadTask, rwlock, cache, counter, hitCounter));
      let r2 = taskpool.execute(new taskpool.Task(hotCacheReadTask, rwlock, cache, counter, hitCounter));
      let r3 = taskpool.execute(new taskpool.Task(hotCacheReadTask, rwlock, cache, counter, hitCounter));
      let r4 = taskpool.execute(new taskpool.Task(hotCacheReadTask, rwlock, cache, counter, hitCounter));
      let r5 = taskpool.execute(new taskpool.Task(hotCacheReadTask, rwlock, cache, counter, hitCounter));
      let w1 = taskpool.execute(new taskpool.Task(hotCacheWriteTask, rwlock, cache, counter, hitCounter));
      let w2 = taskpool.execute(new taskpool.Task(hotCacheWriteTask, rwlock, cache, counter, hitCounter));
      await Promise.all([r1, r2, r3, r4, r5, w1, w2]);
      expect(counter.load()).assertEqual(7);
      expect(hitCounter.load()).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest0300
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_0300
     * @tc.desc    Verify avalanche cache refresh with 5 readers and 2 refreshers using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignReadWriteCacheTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const cache = new AvalancheCacheData();
      const counter = new AtomicInt(0);
      let r1 = taskpool.execute(new taskpool.Task(avalancheReadTask, rwlock, cache, counter));
      let r2 = taskpool.execute(new taskpool.Task(avalancheReadTask, rwlock, cache, counter));
      let r3 = taskpool.execute(new taskpool.Task(avalancheReadTask, rwlock, cache, counter));
      let r4 = taskpool.execute(new taskpool.Task(avalancheReadTask, rwlock, cache, counter));
      let r5 = taskpool.execute(new taskpool.Task(avalancheReadTask, rwlock, cache, counter));
      let w1 = taskpool.execute(new taskpool.Task(avalancheRefreshTask, rwlock, cache, counter));
      let w2 = taskpool.execute(new taskpool.Task(avalancheRefreshTask, rwlock, cache, counter));
      await Promise.all([r1, r2, r3, r4, r5, w1, w2]);
      expect(counter.load()).assertEqual(7);
      expect(cache.refreshCount).assertEqual(2);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest0400
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_0400
     * @tc.desc    Verify cache penetration handling with 5 readers and 1 writer using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignReadWriteCacheTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const cache = new PenetrateCacheData();
      const counter = new AtomicInt(0);
      let r1 = taskpool.execute(new taskpool.Task(penetrateReadTask, rwlock, cache, counter));
      let r2 = taskpool.execute(new taskpool.Task(penetrateReadTask, rwlock, cache, counter));
      let r3 = taskpool.execute(new taskpool.Task(penetrateReadTask, rwlock, cache, counter));
      let r4 = taskpool.execute(new taskpool.Task(penetrateReadTask, rwlock, cache, counter));
      let r5 = taskpool.execute(new taskpool.Task(penetrateReadTask, rwlock, cache, counter));
      let w1 = taskpool.execute(new taskpool.Task(penetrateWriteTask, rwlock, cache, counter));
      await Promise.all([r1, r2, r3, r4, r5, w1]);
      expect(counter.load()).assertEqual(6);
      expect(cache.hasValue).assertTrue();
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest0500
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_0500
     * @tc.desc    Verify LRU cache with 3 readers and 2 updaters using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignReadWriteCacheTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const cache = new LruCacheData();
      const counter = new AtomicInt(0);
      let r1 = taskpool.execute(new taskpool.Task(lruReadTask, rwlock, cache, counter));
      let r2 = taskpool.execute(new taskpool.Task(lruReadTask, rwlock, cache, counter));
      let r3 = taskpool.execute(new taskpool.Task(lruReadTask, rwlock, cache, counter));
      let w1 = taskpool.execute(new taskpool.Task(lruUpdateTask, rwlock, cache, counter));
      let w2 = taskpool.execute(new taskpool.Task(lruUpdateTask, rwlock, cache, counter));
      await Promise.all([r1, r2, r3, w1, w2]);
      expect(counter.load()).assertEqual(5);
      expect(cache.updateCount).assertEqual(2);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest0600
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_0600
     * @tc.desc    Verify cache preload then verify with 2 preloaders and 3 verifiers using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignReadWriteCacheTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const cache = new PreloadCacheData();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(preloadBatchTask, rwlock, cache, counter));
      let p2 = taskpool.execute(new taskpool.Task(preloadBatchTask, rwlock, cache, counter));
      await Promise.all([p1, p2]);
      let v1 = taskpool.execute(new taskpool.Task(preloadVerifyTask, rwlock, cache, counter));
      let v2 = taskpool.execute(new taskpool.Task(preloadVerifyTask, rwlock, cache, counter));
      let v3 = taskpool.execute(new taskpool.Task(preloadVerifyTask, rwlock, cache, counter));
      await Promise.all([v1, v2, v3]);
      expect(counter.load()).assertEqual(5);
      expect(cache.loadedCount).assertEqual(10);
      expect(cache.items.length).assertEqual(10);
    })
    
    /**
     * @tc.name    LockDesignReadWriteCacheTest0700
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_0700
     * @tc.desc    Verify config read-update with 5 readers and 1 writer using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignReadWriteCacheTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const rwlock = new RWLock();
      const config = new ConfigData();
      const counter = new AtomicInt(0);
      let r1 = taskpool.execute(new taskpool.Task(configReadTask, rwlock, config, counter));
      let r2 = taskpool.execute(new taskpool.Task(configReadTask, rwlock, config, counter));
      let r3 = taskpool.execute(new taskpool.Task(configReadTask, rwlock, config, counter));
      let r4 = taskpool.execute(new taskpool.Task(configReadTask, rwlock, config, counter));
      let r5 = taskpool.execute(new taskpool.Task(configReadTask, rwlock, config, counter));
      let w1 = taskpool.execute(new taskpool.Task(configUpdateTask, rwlock, config, counter));
      await Promise.all([r1, r2, r3, r4, r5, w1]);
      expect(counter.load()).assertEqual(6);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest0800
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_0800
     * @tc.desc    Verify hot update config with 3 readers and 1 updater using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignReadWriteCacheTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rwlock = new RWLock();
      const config = new HotUpdateConfig();
      const counter = new AtomicInt(0);
      let r1 = taskpool.execute(new taskpool.Task(hotUpdateReadTask, rwlock, config, counter));
      let r2 = taskpool.execute(new taskpool.Task(hotUpdateReadTask, rwlock, config, counter));
      let r3 = taskpool.execute(new taskpool.Task(hotUpdateReadTask, rwlock, config, counter));
      let u1 = taskpool.execute(new taskpool.Task(hotUpdateTask, rwlock, config, counter));
      await Promise.all([r1, r2, r3, u1]);
      expect(counter.load()).assertEqual(4);
      expect(config.version).assertEqual(2);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest0900
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_0900
     * @tc.desc    Verify version config with 3 readers and 2 updaters using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignReadWriteCacheTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const config = new VersionConfig();
      const counter = new AtomicInt(0);
      let r1 = taskpool.execute(new taskpool.Task(versionReadTask, rwlock, config, counter));
      let r2 = taskpool.execute(new taskpool.Task(versionReadTask, rwlock, config, counter));
      let r3 = taskpool.execute(new taskpool.Task(versionReadTask, rwlock, config, counter));
      let u1 = taskpool.execute(new taskpool.Task(versionUpdateTask, rwlock, config, counter));
      let u2 = taskpool.execute(new taskpool.Task(versionUpdateTask, rwlock, config, counter));
      await Promise.all([r1, r2, r3, u1, u2]);
      expect(counter.load()).assertEqual(5);
      expect(config.currentVersion).assertEqual(3);
      expect(config.versions.length).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest1000
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_1000
     * @tc.desc    Verify config rollback with 2 concurrent rollback tasks using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignReadWriteCacheTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const config = new RollbackConfig();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(configRollbackTask, rwlock, config, counter));
      let t2 = taskpool.execute(new taskpool.Task(configRollbackTask, rwlock, config, counter));
      await Promise.all([t1, t2]);
      expect(counter.load()).assertEqual(2);
      expect(config.rollbackCount).assertEqual(2);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest1100
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_1100
     * @tc.desc    Verify config encrypt-decrypt with 1 encrypter and 3 decrypters using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignReadWriteCacheTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const config = new EncryptConfig();
      const counter = new AtomicInt(0);
      let e1 = taskpool.execute(new taskpool.Task(configEncryptTask, rwlock, config, counter));
      await Promise.all([e1]);
      let d1 = taskpool.execute(new taskpool.Task(configDecryptTask, rwlock, config, counter));
      let d2 = taskpool.execute(new taskpool.Task(configDecryptTask, rwlock, config, counter));
      let d3 = taskpool.execute(new taskpool.Task(configDecryptTask, rwlock, config, counter));
      await Promise.all([d1, d2, d3]);
      expect(counter.load()).assertEqual(4);
      expect(config.encrypted).assertEqual('enc_secret');
      expect(config.decryptCount.load()).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest1200
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_1200
     * @tc.desc    Verify database query-update with 5 queriers and 1 updater using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignReadWriteCacheTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const rwlock = new RWLock();
      const db = new DatabaseData();
      const counter = new AtomicInt(0);
      // Execute all query tasks first
      let q1 = taskpool.execute(new taskpool.Task(dbQueryTask, rwlock, db, counter));
      let q2 = taskpool.execute(new taskpool.Task(dbQueryTask, rwlock, db, counter));
      let q3 = taskpool.execute(new taskpool.Task(dbQueryTask, rwlock, db, counter));
      let q4 = taskpool.execute(new taskpool.Task(dbQueryTask, rwlock, db, counter));
      let q5 = taskpool.execute(new taskpool.Task(dbQueryTask, rwlock, db, counter));
      await Promise.all([q1, q2, q3, q4, q5]);
      // Then execute update task
      await taskpool.execute(new taskpool.Task(dbUpdateTask, rwlock, db, counter));
      expect(counter.load()).assertEqual(6);
      expect(db.queryCount.load()).assertEqual(5);
      expect(db.updateCount.load()).assertEqual(1);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest1300
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_1300
     * @tc.desc    Verify transaction commit with 5 concurrent tasks maintaining balance using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignReadWriteCacheTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new TransactionData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(transactionCommitTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(transactionCommitTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(transactionCommitTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(transactionCommitTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(transactionCommitTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.balance).assertEqual(1000);
      expect(data.committed).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest1400
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_1400
     * @tc.desc    Verify connection pool acquire-release with 5 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignReadWriteCacheTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const pool = new ConnectionPoolData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(connectionAcquireTask, mutex, pool, counter));
      let t2 = taskpool.execute(new taskpool.Task(connectionAcquireTask, mutex, pool, counter));
      let t3 = taskpool.execute(new taskpool.Task(connectionAcquireTask, mutex, pool, counter));
      let t4 = taskpool.execute(new taskpool.Task(connectionAcquireTask, mutex, pool, counter));
      let t5 = taskpool.execute(new taskpool.Task(connectionAcquireTask, mutex, pool, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(pool.acquired).assertEqual(5);
      expect(pool.released).assertEqual(5);
      expect(pool.connections.length).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest1500
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_1500
     * @tc.desc    Verify batch write then read with 2 writers and 3 readers using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignReadWriteCacheTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const data = new BatchDbData();
      const counter = new AtomicInt(0);
      // Execute write tasks first and wait for completion
      let w1 = taskpool.execute(new taskpool.Task(batchWriteTask, rwlock, data, counter));
      let w2 = taskpool.execute(new taskpool.Task(batchWriteTask, rwlock, data, counter));
      await Promise.all([w1, w2]);
      // Then execute read tasks
      let r1 = taskpool.execute(new taskpool.Task(batchReadTask, rwlock, data, counter));
      let r2 = taskpool.execute(new taskpool.Task(batchReadTask, rwlock, data, counter));
      let r3 = taskpool.execute(new taskpool.Task(batchReadTask, rwlock, data, counter));
      await Promise.all([r1, r2, r3]);
      expect(counter.load()).assertEqual(5);
      expect(data.records.length).assertEqual(10);
      expect(data.readCount.load()).assertEqual(3);
      expect(data.writeCount.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockDesignReadWriteCacheTest1600
     * @tc.number  SUB_LOCK_DESIGN_READ_WRITE_CACHE_TEST_1600
     * @tc.desc    Verify index query-rebuild with 5 queriers and 1 rebuilder using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignReadWriteCacheTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const data = new IndexData();
      const counter = new AtomicInt(0);
      // Execute all query tasks first
      let q1 = taskpool.execute(new taskpool.Task(indexQueryTask, rwlock, data, counter));
      let q2 = taskpool.execute(new taskpool.Task(indexQueryTask, rwlock, data, counter));
      let q3 = taskpool.execute(new taskpool.Task(indexQueryTask, rwlock, data, counter));
      let q4 = taskpool.execute(new taskpool.Task(indexQueryTask, rwlock, data, counter));
      let q5 = taskpool.execute(new taskpool.Task(indexQueryTask, rwlock, data, counter));
      await Promise.all([q1, q2, q3, q4, q5]);
      // Then execute rebuild task
      await taskpool.execute(new taskpool.Task(indexRebuildTask, rwlock, data, counter));
      expect(counter.load()).assertEqual(6);
      expect(data.queryCount.load()).assertEqual(5);
      expect(data.rebuildCount.load()).assertEqual(1);
    })
  })
}
