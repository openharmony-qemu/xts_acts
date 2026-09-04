'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Utils.test';

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
    it('testRWLockCacheConcurrent0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let lock: RWLock = new RWLock();
        let cache: containers.ConcurrentHashMap<string, string> = new containers.ConcurrentHashMap<string, string>();
        for (let i: number = 0; i < 100; i++) {
          cache.set('key' + i, 'value' + i);
        }
        let readCounter: AtomicInt = new AtomicInt(0);
        let writeCounter: AtomicInt = new AtomicInt(0);
        let totalReaders: number = 50;
        let totalWriters: number = 5;
        let readerTasks: Promise<Any>[] = [];
        let writerTasks: Promise<Any>[] = [];
        for (let i: number = 0; i < totalReaders; i++) {
          readerTasks.push(taskpool.execute(testRWLockCacheReader, cache, lock, readCounter));
        }
        for (let i: number = 0; i < totalWriters; i++) {
          writerTasks.push(taskpool.execute(testRWLockCacheWriter, cache, lock, writeCounter));
        }
        await Promise.all(readerTasks);
        await Promise.all(writerTasks);
        expect(readCounter.load()).assertEqual(totalReaders * 100);
        expect(writeCounter.load()).assertEqual(totalWriters * 100);
      } catch (e) {
        console.info(`testRWLockCacheConcurrent0700 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_INDUSTRY_CACHE_0800
     * @tc.name   testAtomicIntCounterConcurrent0800
     * @tc.desc   IP-005 AtomicInt并发计数器系统
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtomicIntCounterConcurrent0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let counter: AtomicInt = new AtomicInt(0);
        let taskCounter: AtomicInt = new AtomicInt(0);
        let totalTasks: number = 100;
        let tasks: Promise<Any>[] = [];
        for (let i: number = 0; i < totalTasks; i++) {
          tasks.push(taskpool.execute(testAtomicIntCounter, counter, taskCounter));
        }
        await Promise.all(tasks);
        expect(counter.load()).assertEqual(totalTasks * 100);
      } catch (e) {
        console.info(`testAtomicIntCounterConcurrent0800 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });
  });
}
