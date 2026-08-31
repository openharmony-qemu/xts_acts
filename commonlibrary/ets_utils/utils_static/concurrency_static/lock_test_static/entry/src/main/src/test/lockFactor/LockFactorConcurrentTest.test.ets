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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

class LockFactorSharedCounter {
  value: number = 0;
}

// TC-004: Mixed read-write lock contention shared stats (Sendable counters)
class MixedRWStats {
  activeReaders: AtomicInt = new AtomicInt(0);
  maxConcurrentReaders: AtomicInt = new AtomicInt(0);
  activeWriters: AtomicInt = new AtomicInt(0);
  readWithWriter: AtomicInt = new AtomicInt(0);
  writeWithReaders: AtomicInt = new AtomicInt(0);
}

// TC-001: Mutex multi-thread contention task
function mutexContentionTask(mutex: Mutex, counter: AtomicInt): void {
  for (let i = 0; i < 100; i++) {
    mutex.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      mutex.unlock();
    }
  }
}

// TC-002: ReadLock multi-thread sharing task
function readLockSharingTask(rwlock: RWLock, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

// TC-003: WriteLock multi-thread mutual exclusion task
function writeLockExclusionTask(rwlock: RWLock, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

// TC-005: Lock passing task - use lock created in main thread
function lockPassingTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC-006: Worker internal lock competition task
function workerInternalLockTask(): number {
  const mutex = new Mutex();
  let completed: number = 0;
  for (let i = 0; i < 100; i++) {
    mutex.lock();
    try {
      completed = completed + 1;
    } finally {
      mutex.unlock();
    }
  }
  return completed;
}

// TC-007: Mutex TaskPool concurrent task
function taskPoolMutexTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC-008: RWLock TaskPool concurrent task
function taskPoolRWLockTask(rwlock: RWLock, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

// TC-009: Task A holds lock then releases
function taskPoolShareTaskA(mutex: Mutex, counter: LockFactorSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}

// TC-009: Task B waits for lock
function taskPoolShareTaskB(mutex: Mutex, counter: LockFactorSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}

// TC-010: TaskPool callback lock task - sendData triggers the onReceiveData callback
function callbackLockTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
  taskpool.Task.sendData('callback_lock');
}

// TC-004: Read task competing with writers on the same RWLock
function mixedReadTask(rwlock: RWLock, stats: MixedRWStats, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    if (stats.activeWriters.load() > 0) {
      stats.readWithWriter.fetchAdd(1);
    }
    let prev: int = stats.activeReaders.fetchAdd(1);
    let cur: int = prev + 1;
    if (cur > stats.maxConcurrentReaders.load()) {
      stats.maxConcurrentReaders.store(cur);
    }
    stats.activeReaders.fetchSub(1);
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

// TC-004: Write task competing with readers on the same RWLock
function mixedWriteTask(rwlock: RWLock, stats: MixedRWStats, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    if (stats.activeReaders.load() > 0) {
      stats.writeWithReaders.fetchAdd(1);
    }
    stats.activeWriters.fetchAdd(1);
    // Widen the critical section so readers and writers interleave
    let sum: number = 0;
    for (let i = 0; i < 100000; i++) {
      sum = sum + i;
    }
    stats.activeWriters.fetchSub(1);
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

export default function LockFactorConcurrentTest(): void {
  describe('LockFactorConcurrentTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name    LockFactorConcurrentTest0100
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0100
     * @tc.desc    TC-001: Verify Mutex multi-thread contention with 10 concurrent tasks each performing 100 lock/unlock cycles
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockFactorConcurrentTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(mutexContentionTask, mutex, counter)));
      }
      await Promise.all(promises);
      expect(counter.load()).assertEqual(1000);
      } catch (error) {
        console.error(`LockFactorConcurrentTest0100 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorConcurrentTest0200
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0200
     * @tc.desc    TC-002: Verify ReadLock multi-thread sharing with 10 concurrent tasks all acquiring read lock simultaneously
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockFactorConcurrentTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLockSharingTask, rwlock, counter)));
      }
      await Promise.all(promises);
      expect(counter.load()).assertEqual(10);
      } catch (error) {
        console.error(`LockFactorConcurrentTest0200 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorConcurrentTest0300
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0300
     * @tc.desc    TC-003: Verify WriteLock multi-thread mutual exclusion with 10 concurrent tasks competing for the same write lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockFactorConcurrentTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(writeLockExclusionTask, rwlock, counter)));
      }
      await Promise.all(promises);
      expect(counter.load()).assertEqual(10);
      } catch (error) {
        console.error(`LockFactorConcurrentTest0300 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorConcurrentTest0400
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0400
     * @tc.desc    TC-005: Verify lock passing scenario where main thread creates Mutex and passes to TaskPool tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorConcurrentTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(lockPassingTask, mutex, counter)));
      }
      await Promise.all(promises);
      expect(counter.load()).assertEqual(3);
      } catch (error) {
        console.error(`LockFactorConcurrentTest0400 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorConcurrentTest0500
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0500
     * @tc.desc    TC-006: Verify Worker internal lock competition with repeated lock/unlock cycles in EAWorker
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorConcurrentTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const worker = new EAWorker('lockFactorEA01');
      try {
        worker.start();
        const completed: number = worker.run<number>(workerInternalLockTask).Await();
        expect(completed).assertEqual(100);
      } finally {
        try {
          worker.quit();
        } catch (err) {
          console.error(`LockFactorConcurrentTest0500 worker quit failed: ${err}`);
        }
      }
      } catch (error) {
        console.error(`LockFactorConcurrentTest0500 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorConcurrentTest0600
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0600
     * @tc.desc    TC-007: Verify Mutex TaskPool concurrent with 20 tasks competing for same lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockFactorConcurrentTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 20; i++) {
        promises.push(taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter)));
      }
      await Promise.all(promises);
      expect(counter.load()).assertEqual(20);
      } catch (error) {
        console.error(`LockFactorConcurrentTest0600 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorConcurrentTest0700
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0700
     * @tc.desc    TC-008: Verify RWLock TaskPool concurrent with 20 tasks using write lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockFactorConcurrentTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 20; i++) {
        promises.push(taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter)));
      }
      await Promise.all(promises);
      expect(counter.load()).assertEqual(20);
      } catch (error) {
        console.error(`LockFactorConcurrentTest0700 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorConcurrentTest0800
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0800
     * @tc.desc    TC-009: Verify TaskPool inter-task lock sharing where task A locks then task B waits and acquires
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorConcurrentTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new LockFactorSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(taskPoolShareTaskA, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(taskPoolShareTaskB, mutex, counter));
      await Promise.all([p1, p2]);
      expect(counter.value).assertEqual(2);
      } catch (error) {
        console.error(`LockFactorConcurrentTest0800 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorConcurrentTest0900
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0900
     * @tc.desc    TC-010: Verify TaskPool callback internal lock usage with onReceiveData callback performing lock/unlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorConcurrentTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(callbackLockTask, mutex, counter);
      task.onReceiveData((data: string): void => {
        console.info('received data:', data);
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      await taskpool.execute(task);
      // The task incremented once under the Mutex; the onReceiveData callback
      // (triggered by sendData) incremented once more under the same Mutex.
      // sendData/onReceiveData delivery has no ordering guarantee vs execute
      // completion; bounded-poll until the callback side has landed.
      let waits: int = 0;
      while (counter.load() < 2 && waits < 50) {
        await Utils.msSleep(100);
        waits++;
      }
      expect(counter.load()).assertEqual(2);
      } catch (error) {
        console.error(`LockFactorConcurrentTest0900 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorConcurrentTest1000
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_1000
     * @tc.desc    TC-004: Verify mixed read-write lock contention with 5 readers and 5 writers competing for the same RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorConcurrentTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const stats = new MixedRWStats();
      const counter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(mixedReadTask, rwlock, stats, counter)));
      }
      for (let i: number = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(mixedWriteTask, rwlock, stats, counter)));
      }
      await Promise.all(promises);
      expect(counter.load()).assertEqual(10);
      expect(stats.activeReaders.load()).assertEqual(0);
      expect(stats.activeWriters.load()).assertEqual(0);
      expect(stats.writeWithReaders.load()).assertEqual(0);
      expect(stats.readWithWriter.load()).assertEqual(0);
      // Reader/writer exclusion is verified by the zero cross-presence counters above.
      // Reader-reader overlap depends on scheduling and is not asserted deterministically.
      } catch (error) {
        console.error(`LockFactorConcurrentTest1000 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })
  })
}
