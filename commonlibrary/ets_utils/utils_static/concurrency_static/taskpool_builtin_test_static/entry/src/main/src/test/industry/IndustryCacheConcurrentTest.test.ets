'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testRWLockCacheReader(cache: containers.ConcurrentHashMap<string, string>, lock: RWLock, readCounter: AtomicInt): void {
  for (let i: int = 0; i < 100; i++) {
    let rlock = lock.readLock();
    rlock.lock();
    try {
      let key: string = 'key' + (i % 100);
      let value: string | undefined = cache.get(key);
      readCounter.fetchAdd(1);
    } finally {
      rlock.unlock();
    }
  }
}

function testRWLockCacheWriter(cache: containers.ConcurrentHashMap<string, string>, lock: RWLock, writeCounter: AtomicInt): void {
  for (let i: int = 0; i < 100; i++) {
    let wlock = lock.writeLock();
    wlock.lock();
    try {
      let key: string = 'key' + (i % 100);
      cache.set(key, 'value' + i);
      writeCounter.fetchAdd(1);
    } finally {
      wlock.unlock();
    }
  }
}

function testAtomicIntCounter(counter: AtomicInt, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 100; i++) {
    counter.fetchAdd(1);
  }
  taskCounter.fetchAdd(1);
}

export default function IndustryCacheConcurrentTest(): void {
  describe('IndustryCacheConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_INDUSTRY_CACHE_0700
     * @tc.name   testRWLockCacheConcurrent0700
     * @tc.desc   IP-004 RWLock读多写少缓存系统
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRWLockCacheConcurrent0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock: RWLock = new RWLock();
      let cache: containers.ConcurrentHashMap<string, string> = new containers.ConcurrentHashMap<string, string>();
      for (let i: number = 0; i < 100; i++) {
        cache.set('key' + i, 'value' + i);
      }
      let readCounter: AtomicInt = new AtomicInt(0);
      let writeCounter: AtomicInt = new AtomicInt(0);
      let totalReaders: number = 50;
      let totalWriters: number = 5;
      for (let i: number = 0; i < totalReaders; i++) {
        taskpool.execute(testRWLockCacheReader, cache, lock, readCounter).then((): void => { });
      }
      for (let i: number = 0; i < totalWriters; i++) {
        taskpool.execute(testRWLockCacheWriter, cache, lock, writeCounter).then((): void => { });
      }
      while (readCounter.load() < totalReaders * 100 || writeCounter.load() < totalWriters * 100) {
        await Utils.msSleep(100);
      }
      expect(readCounter.load()).assertEqual(totalReaders * 100);
      expect(writeCounter.load()).assertEqual(totalWriters * 100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_INDUSTRY_CACHE_0800
     * @tc.name   testAtomicIntCounterConcurrent0800
     * @tc.desc   IP-005 AtomicInt并发计数器系统
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtomicIntCounterConcurrent0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 100;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testAtomicIntCounter, counter, taskCounter).then((): void => { });
      }
      while (taskCounter.load() < totalTasks) {
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(totalTasks * 100);
    });
  });
}
