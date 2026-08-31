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

class ReadLockSharedCounter {
  value: number = 0;
}

const gReadLockLockRWLock: RWLock = new RWLock();

function readLockBasicTask(c: ReadLockSharedCounter): void {
  const rl = gReadLockLockRWLock.readLock();
  rl.lock();
  try {
    c.value = 1;
  } finally {
    rl.unlock();
  }
}

function readLockSharedIncrementTask(c: ReadLockSharedCounter): void {
  const rl = gReadLockLockRWLock.readLock();
  rl.lock();
  try {
    c.value = c.value + 1;
  } finally {
    rl.unlock();
  }
}

function readLockAtomicIncrementTask(a: AtomicInt): void {
  const rl = gReadLockLockRWLock.readLock();
  rl.lock();
  try {
    a.fetchAdd(1);
  } finally {
    rl.unlock();
  }
}

// Increment under a caller-provided RWLock instance (independent-instance scenarios)
function readLockIndependentIncrementTask(rwlock: RWLock, a: AtomicInt): void {
  const rl = rwlock.readLock();
  rl.lock();
  try {
    a.fetchAdd(1);
  } finally {
    rl.unlock();
  }
}

function readLockWriteAdd100Task(c: ReadLockSharedCounter): void {
  const wl = gReadLockLockRWLock.writeLock();
  wl.lock();
  try {
    c.value = c.value + 100;
  } finally {
    wl.unlock();
  }
}

function readLockSet100Task(c: ReadLockSharedCounter): void {
  const rl = gReadLockLockRWLock.readLock();
  rl.lock();
  try {
    c.value = 100;
  } finally {
    rl.unlock();
  }
}

// Reader holds the read lock, signals readiness, then sets value while holding
function readLockSet100BlockingTask(c: ReadLockSharedCounter, holderReady: AtomicInt): void {
  const rl = gReadLockLockRWLock.readLock();
  rl.lock();
  try {
    holderReady.fetchAdd(1);
    c.value = 100;
  } finally {
    rl.unlock();
  }
}

function readLockStressCycleTask(a: AtomicInt): void {
  for (let i = 0; i < 1000; i++) {
    const rl = gReadLockLockRWLock.readLock();
    rl.lock();
    rl.unlock();
  }
  a.fetchAdd(1);
}

function readLockReentrantTask(a: AtomicInt): void {
  const rl = gReadLockLockRWLock.readLock();
  rl.lock();
  rl.lock();
  rl.lock();
  a.fetchAdd(1);
  rl.unlock();
  rl.unlock();
  rl.unlock();
}

function readLockDowngradeTask(a: AtomicInt): void {
  const wl = gReadLockLockRWLock.writeLock();
  wl.lock();
  a.fetchAdd(1);
  wl.unlock();
  const rl = gReadLockLockRWLock.readLock();
  rl.lock();
  a.fetchAdd(1);
  rl.unlock();
}

function readLockMixedTask(a: AtomicInt): void {
  const rl = gReadLockLockRWLock.readLock();
  rl.lock();
  a.load();
  rl.unlock();
  const wl = gReadLockLockRWLock.writeLock();
  wl.lock();
  a.fetchAdd(1);
  wl.unlock();
}

function eaWorkerReadLockTask(a: AtomicInt): void {
  const rl = gReadLockLockRWLock.readLock();
  rl.lock();
  try {
    a.fetchAdd(1);
  } finally {
    rl.unlock();
  }
}

function eaWorkerMixedLockTask(a: AtomicInt): void {
  const rl = gReadLockLockRWLock.readLock();
  rl.lock();
  a.fetchAdd(1);
  rl.unlock();
  const wl = gReadLockLockRWLock.writeLock();
  wl.lock();
  a.fetchAdd(10);
  wl.unlock();
}

// T-CC-011: writer probe task - blocked while read lock count is not zero
function readLockWriteProbeTask(rwlock: RWLock, writerStart: AtomicInt, writerAcquired: AtomicInt): void {
  writerStart.store(1);
  const wl = rwlock.writeLock();
  wl.lock();
  try {
    writerAcquired.store(1);
  } finally {
    wl.unlock();
  }
}

// T-CC-017: inner task acquires read lock while outer holder keeps the same lock
function readLockNestedInnerTask(rwlock: RWLock, counter: AtomicInt): void {
  const rl = rwlock.readLock();
  rl.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    rl.unlock();
  }
}

// T-ER-001: helper returning an uninitialized (null) ReadLock handle
function getNullReadLock(): ReadLock | null {
  return null;
}

export default function ReadLockLockTest(): void {
  describe('ReadLockLockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    // ========== INPUT TESTS ==========

    // ========== RETURN VALUE TESTS ==========

    /**
     * @tc.name    ReadLockLockTest0100
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0100
     * @tc.desc    Verify ReadLock.lock() acquires the lock so critical section code executes
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      let criticalSectionEntered: number = 0;
      let writeLockAcquired: boolean = false;
      rl.lock();
      criticalSectionEntered = 42;
      expect(criticalSectionEntered).assertEqual(42);
      rl.unlock();
      const wl = rwlock.writeLock();
      try {
        wl.lock();
        writeLockAcquired = true;
      } finally {
        wl.unlock();
      }
      expect(writeLockAcquired).assertTrue();
    })

    /**
     * @tc.name    ReadLockLockTest0200
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0200
     * @tc.desc    Verify read lock and write lock exclude each other so read-modify-write and write update serialize to 101
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const counter = new ReadLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(readLockWriteAdd100Task, counter));
      let p2 = taskpool.execute(new taskpool.Task(readLockSharedIncrementTask, counter));
      await Promise.all([p1, p2]);
      // Read and write lock exclude each other, so both increments are serialized: 100 + 1.
      expect(counter.value).assertEqual(101);
      } catch (error) {
        console.error(`ReadLockLockTest0200 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    // ========== ERROR HANDLING TESTS ==========

    /**
     * @tc.name    ReadLockLockTest0300
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0300
     * @tc.desc    Verify a ReadLock acquired with lock() can be released with unlock() without error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      rl.lock();
      // Verify lock is held: unlock should succeed
      let canUnlock: boolean = true;
      try {
        rl.unlock();
      } catch (e) {
        canUnlock = false;
      }
      expect(canUnlock).assertTrue();
    })

    /**
     * @tc.name    ReadLockLockTest0400
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0400
     * @tc.desc    Verify ReadLock.lock() in try-finally block ensures unlock is called
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockLockTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      let finallyExecuted: boolean = false;
      rl.lock();
      try {
        let temp: number = 1;
        temp = temp + 1;
        expect(temp).assertEqual(2);
      } finally {
        finallyExecuted = true;
        rl.unlock();
      }
      expect(finallyExecuted).assertTrue();
    })

    /**
     * @tc.name    ReadLockLockTest0500
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0500
     * @tc.desc    Verify ReadLock.lock() completes in an EAWorker thread and the lock is released inside the task
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      const worker = new EAWorker('readLockLockEA');
      worker.start();
      try {
        await worker.run<void>(eaWorkerReadLockTask, counter);
        // run<void> may resolve before the worker-side store is visible; bounded-poll it.
        let waits: int = 0;
        while (counter.load() === 0 && waits < 50) {
          await Utils.msSleep(100);
          waits++;
        }
      } finally {
        worker.quit();
      }
      expect(counter.load()).assertEqual(1);
      } catch (error) {
        console.error(`ReadLockLockTest0500 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    // ========== CONCURRENCY TESTS - BASIC ==========

    /**
     * @tc.name    ReadLockLockTest0600
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0600
     * @tc.desc    Verify multiple threads (5) concurrently acquire read locks for shared access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const atomicCounter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter)));
      }
      await Promise.all(promises);
      expect(atomicCounter.load()).assertEqual(5);
      } catch (error) {
        console.error(`ReadLockLockTest0600 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    ReadLockLockTest0700
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0700
     * @tc.desc    Verify multiple threads (3) concurrently acquire read locks for shared access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const atomicCounter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter)));
      }
      await Promise.all(promises);
      expect(atomicCounter.load()).assertEqual(3);
      } catch (error) {
        console.error(`ReadLockLockTest0700 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    ReadLockLockTest0800
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0800
     * @tc.desc    Verify read lock shared count equals thread count with 10 threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const atomicCounter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter)));
      }
      await Promise.all(promises);
      expect(atomicCounter.load()).assertEqual(10);
      } catch (error) {
        console.error(`ReadLockLockTest0800 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    // ========== CONCURRENCY TESTS - READ-WRITE MUTEX ==========

    /**
     * @tc.name    ReadLockLockTest0900
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0900
     * @tc.desc    Verify write lock request is blocked while read lock is held
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const counter = new ReadLockSharedCounter();
      const holderReady = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockSet100BlockingTask, counter, holderReady));
      // Wait until the reader actually holds the read lock before starting the writer (bounded poll).
      let waitCycles: number = 0;
      while (holderReady.load() === 0 && waitCycles < 50) {
        await Utils.msSleep(100);
        waitCycles++;
      }
      expect(holderReady.load()).assertEqual(1);
      let p2 = taskpool.execute(new taskpool.Task(readLockWriteAdd100Task, counter));
      await Promise.all([p1, p2]);
      // The writer was blocked until the reader released the read lock: final value is 100 + 100.
      expect(counter.value).assertEqual(200);
      } catch (error) {
        console.error(`ReadLockLockTest0900 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    ReadLockLockTest1000
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1000
     * @tc.desc    Verify read lock request is blocked while write lock is held
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const counter = new ReadLockSharedCounter();
      await taskpool.execute(new taskpool.Task(readLockWriteAdd100Task, counter)); // value = 100
      const wl = gReadLockLockRWLock.writeLock();
      wl.lock(); // main thread holds the write lock
      let p = taskpool.execute(new taskpool.Task(readLockSharedIncrementTask, counter)); // blocked
      try {
        // Bounded window: the read lock request stays blocked while the write lock is held
        let waited: int = 0;
        while (waited < 5) {
          expect(counter.value).assertEqual(100);
          await Utils.msSleep(100);
          waited++;
        }
      } finally {
        wl.unlock(); // releasing the write lock wakes the blocked reader
      }
      await p;
      // The reader proceeded only after the write lock was released.
      expect(counter.value).assertEqual(101);
      } catch (error) {
        console.error(`ReadLockLockTest1000 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    ReadLockLockTest1100
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1100
     * @tc.desc    Verify read-write lock alternating acquisition without deadlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const atomicCounter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLockDowngradeTask, atomicCounter)));
      }
      await Promise.all(promises);
      expect(atomicCounter.load()).assertEqual(6);
      } catch (error) {
        console.error(`ReadLockLockTest1100 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    // ========== CONCURRENCY TESTS - LOCK RELEASE ==========

    /**
     * @tc.name    ReadLockLockTest1200
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1200
     * @tc.desc    Verify write lock can be acquired after read lock is released
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const counter = new ReadLockSharedCounter();
      await taskpool.execute(new taskpool.Task(readLockSet100Task, counter));
      await taskpool.execute(new taskpool.Task(readLockWriteAdd100Task, counter));
      expect(counter.value).assertEqual(200);
      } catch (error) {
        console.error(`ReadLockLockTest1200 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    ReadLockLockTest1300
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1300
     * @tc.desc    Verify write lock adds 100 after all concurrent readers finish (read-modify-write may lose updates, final value at least 101)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const counter = new ReadLockSharedCounter();
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLockSharedIncrementTask, counter)));
      }
      await Promise.all(promises);
      await taskpool.execute(new taskpool.Task(readLockWriteAdd100Task, counter));
      // Read locks allow concurrent access, so read-modify-write may lose updates.
      // Write lock adds 100 after all readers finish; at least 1 reader succeeded.
      expect(counter.value).assertLargerOrEqual(101);
      } catch (error) {
        console.error(`ReadLockLockTest1300 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    // ========== CONCURRENCY TESTS - REENTRANT ==========

    /**
     * @tc.name    ReadLockLockTest1400
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1400
     * @tc.desc    Verify reentrant read lock works in concurrent taskpool tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockLockTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const atomicCounter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLockReentrantTask, atomicCounter)));
      }
      await Promise.all(promises);
      expect(atomicCounter.load()).assertEqual(3);
      } catch (error) {
        console.error(`ReadLockLockTest1400 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    // ========== CONCURRENCY TESTS - NESTED AND COMBO ==========

    /**
     * @tc.name    ReadLockLockTest1500
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1500
     * @tc.desc    Verify ReadLock.lock() works correctly inside TaskPool task
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const counter = new ReadLockSharedCounter();
      await taskpool.execute(new taskpool.Task(readLockBasicTask, counter));
      expect(counter.value).assertEqual(1);
      } catch (error) {
        console.error(`ReadLockLockTest1500 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    ReadLockLockTest1600
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1600
     * @tc.desc    Verify ReadLock.lock() works correctly inside EAWorker thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      const worker = new EAWorker('readLockEAWkr');
      worker.start();
      try {
        await worker.run<void>(eaWorkerMixedLockTask, counter);
        // run<void> may resolve before the worker-side store is visible; bounded-poll it.
        let waits: int = 0;
        while (counter.load() !== 11 && waits < 50) {
          await Utils.msSleep(100);
          waits++;
        }
      } finally {
        worker.quit();
      }
      expect(counter.load()).assertEqual(11);
      } catch (error) {
        console.error(`ReadLockLockTest1600 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    ReadLockLockTest1700
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1700
     * @tc.desc    Verify read lock combined with write lock in mixed TaskPool scenario
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const atomicCounter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLockMixedTask, atomicCounter)));
      }
      await Promise.all(promises);
      expect(atomicCounter.load()).assertEqual(3);
      } catch (error) {
        console.error(`ReadLockLockTest1700 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    ReadLockLockTest1800
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1800
     * @tc.desc    Verify ReadLock.lock() on independent RWLock instances concurrently
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockLockTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const rwlockA = new RWLock();
      const rwlockB = new RWLock();
      const atomicA = new AtomicInt(0);
      const atomicB = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLockIndependentIncrementTask, rwlockA, atomicA)));
      }
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLockIndependentIncrementTask, rwlockB, atomicB)));
      }
      await Promise.all(promises);
      expect(atomicA.load()).assertEqual(3);
      expect(atomicB.load()).assertEqual(3);
      } catch (error) {
        console.error(`ReadLockLockTest1800 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    // ========== CONCURRENCY TESTS - PERFORMANCE STRESS ==========

    /**
     * @tc.name    ReadLockLockTest1900
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1900
     * @tc.desc    Verify high concurrency with 20 threads acquiring read locks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const atomicCounter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 20; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter)));
      }
      await Promise.all(promises);
      expect(atomicCounter.load()).assertEqual(20);
      } catch (error) {
        console.error(`ReadLockLockTest1900 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    ReadLockLockTest2000
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_2000
     * @tc.desc    Verify read lock shared performance with 10 concurrent threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockLockTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const atomicCounter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLockStressCycleTask, atomicCounter)));
      }
      await Promise.all(promises);
      expect(atomicCounter.load()).assertEqual(10);
      } catch (error) {
        console.error(`ReadLockLockTest2000 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    // ========== ERROR HANDLING TESTS - EXTENDED ==========

    /**
     * @tc.name    ReadLockLockTest2100
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_2100
     * @tc.desc    T-ER-001: Verify calling lock() on an uninitialized (null) ReadLock throws an error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rl: ReadLock | null = getNullReadLock();
      let threw: boolean = false;
      try {
        rl!.lock();
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    })

    /**
     * @tc.name    ReadLockLockTest2200
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_2200
     * @tc.desc    T-ER-002: Verify ReadLock.lock() re-acquires the lock normally after unlock()
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      rl.lock();
      rl.unlock();
      let reacquired: boolean = false;
      try {
        rl.lock();
        reacquired = true;
        rl.unlock();
      } catch (e) {
        reacquired = false;
      }
      expect(reacquired).assertTrue();
    })

    /**
     * @tc.name    ReadLockLockTest2300
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_2300
     * @tc.desc    T-ER-004: Verify ReadLock stays usable after misuse error (no destroy API, closest semantics)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockLockTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      // No destroy API: simulate an abnormal lock state by unlocking an unheld read lock (throws)
      let misuseThrew: boolean = false;
      try {
        rl.unlock();
      } catch (e) {
        misuseThrew = true;
      }
      expect(misuseThrew).assertTrue();
      // Abnormal state does not affect other threads: taskpool thread still acquires the lock
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockNestedInnerTask, rwlock, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
      // The lock object itself remains usable
      let reacquired: boolean = false;
      try {
        rl.lock();
        reacquired = true;
        rl.unlock();
      } catch (e) {
        reacquired = false;
      }
      expect(reacquired).assertTrue();
      } catch (error) {
        console.error(`ReadLockLockTest2300 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    // ========== CONCURRENCY TESTS - RELEASE COUNT AND REENTRANCY ==========

    /**
     * @tc.name    ReadLockLockTest2400
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_2400
     * @tc.desc    T-CC-011: Verify read lock count decrements when locks are released one by one; write lock blocked until last release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockLockTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      const writerStart = new AtomicInt(0);
      const writerAcquired = new AtomicInt(0);
      // Main thread holds 3 read locks reentrantly (read count = 3)
      rl.lock();
      rl.lock();
      rl.lock();
      // Writer probe task stays blocked while read count is not zero
      let writerP = taskpool.execute(new taskpool.Task(readLockWriteProbeTask, rwlock, writerStart, writerAcquired));
      let waitCycles: number = 0;
      while (writerStart.load() === 0 && waitCycles < 50) {
        await Utils.msSleep(100);
        waitCycles++;
      }
      expect(writerStart.load()).assertEqual(1);
      // Release first two read locks: count decreases but writer is still blocked
      rl.unlock();
      rl.unlock();
      expect(writerAcquired.load()).assertEqual(0);
      // Release last read lock: count reaches 0 and writer acquires the lock
      rl.unlock();
      await writerP;
      expect(writerAcquired.load()).assertEqual(1);
      } catch (error) {
        console.error(`ReadLockLockTest2400 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    ReadLockLockTest2500
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_2500
     * @tc.desc    T-CC-014: Verify large-number reentrant lock does not throw (no explicit reentrancy limit)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockLockTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      const reentrantTimes: number = 1000;
      for (let i = 0; i < reentrantTimes; i++) {
        rl.lock();
      }
      // No explicit reentrancy limit: continuing to lock after large reentrancy does not throw
      let noLimitError: boolean = false;
      try {
        rl.lock();
        noLimitError = true;
      } catch (e) {
        noLimitError = false;
      }
      expect(noLimitError).assertTrue();
      // Release all reentrant locks; extra unlock throws once count reaches 0
      for (let i = 0; i < reentrantTimes + 1; i++) {
        rl.unlock();
      }
      let extraUnlockThrew: boolean = false;
      try {
        rl.unlock();
      } catch (e) {
        extraUnlockThrew = true;
      }
      expect(extraUnlockThrew).assertTrue();
    })

    // ========== CONCURRENCY TESTS - NESTED AND HIGH FREQUENCY ==========

    /**
     * @tc.name    ReadLockLockTest2600
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_2600
     * @tc.desc    T-CC-017: Verify inner TaskPool task acquires read lock while outer holder keeps it (read lock shared)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      // Outer holder (main thread) keeps the read lock
      rl.lock();
      // Inner task acquires the same read lock: read locks are shared, so it succeeds
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockNestedInnerTask, rwlock, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
      rl.unlock();
      } catch (error) {
        console.error(`ReadLockLockTest2600 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    ReadLockLockTest2700
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_2700
     * @tc.desc    T-CC-020: Verify single thread high-frequency lock/unlock cycles (5000) remain stable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockLockTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      const cycles: number = 5000;
      for (let i = 0; i < cycles; i++) {
        rl.lock();
        rl.unlock();
      }
      // After the high-frequency loop, the lock is still usable without error
      let stillUsable: boolean = false;
      try {
        rl.lock();
        stillUsable = true;
        rl.unlock();
      } catch (e) {
        stillUsable = false;
      }
      expect(stillUsable).assertTrue();
      // Read count reached 0: write lock can be acquired (no leak)
      const wl = rwlock.writeLock();
      let writerAcquired: boolean = false;
      try {
        wl.lock();
        writerAcquired = true;
        wl.unlock();
      } catch (e) {
        writerAcquired = false;
      }
      expect(writerAcquired).assertTrue();
    })
  })
}
