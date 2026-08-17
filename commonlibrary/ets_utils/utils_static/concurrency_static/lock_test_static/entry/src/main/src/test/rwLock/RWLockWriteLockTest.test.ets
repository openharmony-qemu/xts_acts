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

class WriteLockSharedCounter {
  value: number = 0;
}

// Global shared RWLock for concurrent tests
const gRWLock: RWLock = new RWLock();

// ===== Module-level task functions for TaskPool =====

// TC-CONC-002: WriteLock acquire and increment shared counter
function writeLockIncrementTask(c: WriteLockSharedCounter): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    c.value++;
  } finally {
    wl.unlock();
  }
}

// TC-CONC-004: Write lock holder - signals readiness, holds briefly, then sets value to 100
function writeLockWriteHolderTask(c: WriteLockSharedCounter, holderReady: AtomicInt): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    holderReady.store(1);
    const start: number = Date.now();
    while (Date.now() - start < 200) {
      // hold the write lock briefly so the reader overlaps with the hold
    }
    c.value = 100;
  } finally {
    wl.unlock();
  }
}

// TC-CONC-004: Read lock waiter - increments value by 1
function writeLockReadWaiterTask(c: WriteLockSharedCounter): void {
  const rl = gRWLock.readLock();
  rl.lock();
  try {
    c.value = c.value + 1;
  } finally {
    rl.unlock();
  }
}

// TC-CONC-005: Read lock holder - signals readiness, holds briefly, then sets value to 50
function writeLockReadHolderTask(c: WriteLockSharedCounter, holderReady: AtomicInt): void {
  const rl = gRWLock.readLock();
  rl.lock();
  try {
    holderReady.store(1);
    const start: number = Date.now();
    while (Date.now() - start < 200) {
      // hold the read lock briefly so the writer overlaps with the hold
    }
    c.value = 50;
  } finally {
    rl.unlock();
  }
}

// TC-CONC-005: Write lock waiter after read - adds 100
function writeLockWriteAddTask(c: WriteLockSharedCounter): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    c.value = c.value + 100;
  } finally {
    wl.unlock();
  }
}

// TC-CONC-009: Cross-thread shared RWLock task with SharedCounter
function writeLockCrossThreadTask(rwlock: RWLock, c: WriteLockSharedCounter): void {
  const wl = rwlock.writeLock();
  wl.lock();
  try {
    c.value++;
  } finally {
    wl.unlock();
  }
}

// TC-CONC-009: Cross-thread shared RWLock task with AtomicInt
function writeLockCrossThreadAtomicTask(rwlock: RWLock, a: AtomicInt): void {
  const wl = rwlock.writeLock();
  wl.lock();
  try {
    a.fetchAdd(1);
  } finally {
    wl.unlock();
  }
}

// TC-CONC-010: Stress task - read temp, increment, write back
function writeLockStressTask(c: WriteLockSharedCounter): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    let temp: number = c.value;
    temp = temp + 1;
    c.value = temp;
  } finally {
    wl.unlock();
  }
}

// TC-CONC-013: Async-compatible write lock task
function writeLockAsyncCompatibleTask(a: AtomicInt): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    a.fetchAdd(1);
  } finally {
    wl.unlock();
  }
}

// TC-CONC-014: High-frequency writeLock acquire/release in task
function writeLockHighFreqTask(a: AtomicInt): void {
  const rwlock = new RWLock();
  for (let i = 0; i < 100; i++) {
    const wl = rwlock.writeLock();
    wl.lock();
    wl.unlock();
  }
  a.fetchAdd(1);
}

// TC-CONC-015: WriteLock under concurrent load
function writeLockConcurrentLoadTask(a: AtomicInt): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    a.fetchAdd(1);
  } finally {
    wl.unlock();
  }
}

// EAWorker task for writeLock basic test
function eaWorkerWriteLockBasicTask(a: AtomicInt): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    a.fetchAdd(1);
  } finally {
    wl.unlock();
  }
}

// TC-CONC-006: Sequential write lock reuse (same-thread nested reentrancy is implementation-dependent)
function writeLockSequentialReuseTask(counter: AtomicInt): void {
  const rwlock = new RWLock();
  const wl = rwlock.writeLock();
  for (let i = 0; i < 5; i++) {
    wl.lock();
    wl.unlock();
  }
  counter.fetchAdd(1);
}

// TC-CONC-011: Each waiter records one acquisition and its value inside the critical section
function writeLockOrderedAcquireTask(rwlock: RWLock, acquisitions: AtomicInt, sum: AtomicInt,
  value: int): void {
  const wl = rwlock.writeLock();
  wl.lock();
  try {
    acquisitions.fetchAdd(1);
    sum.fetchAdd(value);
  } finally {
    wl.unlock();
  }
}

// TC-CONC-015: Waiter records whether it acquired the lock after the cancellation attempt
class WriteLockCancelData {
  ran: boolean = false;
}

function writeLockHolderDelayTask(rwlock: RWLock, c: AtomicInt, holderReady: AtomicInt, cancelDone: AtomicInt): void {
  const wl = rwlock.writeLock();
  wl.lock();
  try {
    holderReady.store(1);
    // Hold the write lock until the cancellation attempt is done so the waiter is guaranteed to be
    // blocked in lock() when cancel() is called (bounded to avoid a deadlock on the failure path).
    const start: number = Date.now();
    while (cancelDone.load() === 0 && Date.now() - start < 5000) {
      // spin
    }
    c.fetchAdd(1);
  } finally {
    wl.unlock();
  }
  c.fetchAdd(100);
}

function writeLockCancelledWaiterTask(rwlock: RWLock, data: WriteLockCancelData, c: AtomicInt, started: AtomicInt): void {
  started.store(1);
  const wl = rwlock.writeLock();
  wl.lock();
  try {
    data.ran = true;
    c.fetchAdd(10);
  } finally {
    wl.unlock();
  }
}

export default function RWLockWriteLockTest(): void {
  describe('RWLockWriteLockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    // ========== INPUT TESTS ==========

    // ========== RETURN VALUE TESTS ==========

    /**
     * @tc.name    RWLockWriteLockTest0100
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_0100
     * @tc.desc    Verify multiple calls to writeLock() return the same WriteLock object (singleton pattern)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockWriteLockTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const wl1 = rwlock.writeLock();
      const wl2 = rwlock.writeLock();
      expect(wl1 === wl2).assertTrue();
    })

    // ========== ERROR HANDLING TESTS ==========

    /**
     * @tc.name    RWLockWriteLockTest0200
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_0200
     * @tc.desc    Verify 1000 consecutive writeLock() calls succeed without throwing exceptions
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockWriteLockTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let successCount: number = 0;
      const rwlock = new RWLock();
      for (let i = 0; i < 1000; i++) {
        const wl = rwlock.writeLock();
        successCount++;
      }
      expect(successCount).assertEqual(1000);
    })

    /**
     * @tc.name    RWLockWriteLockTest0300
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_0300
     * @tc.desc    Verify writeLock() works correctly in a try-finally usage context and the lock is released for re-acquisition
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockWriteLockTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      let state: number = 0;
      wl.lock();
      try {
        state = 42;
      } finally {
        wl.unlock();
      }
      expect(state).assertEqual(42);
      // The finally block released the lock: it can be acquired again
      wl.lock();
      wl.unlock();
    })

    // ========== CONCURRENCY TESTS ==========

    /**
     * @tc.name    RWLockWriteLockTest0400
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_0400
     * @tc.desc    Verify single thread can acquire write lock and modify shared state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockWriteLockTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      let state: number = 0;
      let lockOk: boolean = false;
      wl.lock();
      try {
        state = 42;
        lockOk = true;
      } finally {
        wl.unlock();
      }
      expect(lockOk).assertTrue();
      expect(state).assertEqual(42);
    })

    /**
     * @tc.name    RWLockWriteLockTest0500
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_0500
     * @tc.desc    Verify multiple threads competing for writeLock on same RWLock maintain data consistency
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockWriteLockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const counter = new WriteLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(writeLockIncrementTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockIncrementTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockIncrementTask, counter));
      let p4 = taskpool.execute(new taskpool.Task(writeLockIncrementTask, counter));
      let p5 = taskpool.execute(new taskpool.Task(writeLockIncrementTask, counter));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(counter.value).assertEqual(5);
      } catch (error) {
        console.error(`RWLockWriteLockTest0500 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    RWLockWriteLockTest0600
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_0600
     * @tc.desc    Verify write lock blocks read locks: writer sets value, reader increments after release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockWriteLockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const counter = new WriteLockSharedCounter();
      const holderReady = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockWriteHolderTask, counter, holderReady));
      // Wait until the writer actually holds the write lock before starting the reader (bounded poll).
      let waitCycles: number = 0;
      while (holderReady.load() === 0 && waitCycles < 50) {
        await Utils.msSleep(100);
        waitCycles++;
      }
      expect(holderReady.load()).assertEqual(1);
      let p2 = taskpool.execute(new taskpool.Task(writeLockReadWaiterTask, counter));
      await Promise.all([p1, p2]);
      // The reader was blocked while the writer held the write lock: it reads 100 and adds 1 -> 101.
      expect(counter.value).assertEqual(101);
      } catch (error) {
        console.error(`RWLockWriteLockTest0600 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    RWLockWriteLockTest0700
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_0700
     * @tc.desc    Verify read lock blocks write lock: reader sets value, writer adds after release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockWriteLockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const counter = new WriteLockSharedCounter();
      const holderReady = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockReadHolderTask, counter, holderReady));
      // Wait until the reader actually holds the read lock before starting the writer (bounded poll).
      let waitCycles: number = 0;
      while (holderReady.load() === 0 && waitCycles < 50) {
        await Utils.msSleep(100);
        waitCycles++;
      }
      expect(holderReady.load()).assertEqual(1);
      let p2 = taskpool.execute(new taskpool.Task(writeLockWriteAddTask, counter));
      await Promise.all([p1, p2]);
      // The writer was blocked while the reader held the read lock: 50 set first, then +100 -> 150.
      expect(counter.value).assertEqual(150);
      } catch (error) {
        console.error(`RWLockWriteLockTest0700 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    RWLockWriteLockTest0800
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_0800
     * @tc.desc    Verify same thread can call writeLock() multiple times and each call returns the same singleton WriteLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockWriteLockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const wl1 = rwlock.writeLock();
      wl1.lock();
      const wl2 = rwlock.writeLock();
      expect(wl1 === wl2).assertTrue();
      wl1.unlock();
    })

    /**
     * @tc.name    RWLockWriteLockTest0900
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_0900
     * @tc.desc    Verify multiple RWLock instances can hold write locks independently without interference
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockWriteLockTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const rwlock1 = new RWLock();
      const rwlock2 = new RWLock();
      const atomicA = new AtomicInt(0);
      const atomicB = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockCrossThreadAtomicTask, rwlock1, atomicA));
      let p2 = taskpool.execute(new taskpool.Task(writeLockCrossThreadAtomicTask, rwlock1, atomicA));
      let p3 = taskpool.execute(new taskpool.Task(writeLockCrossThreadAtomicTask, rwlock1, atomicA));
      let p4 = taskpool.execute(new taskpool.Task(writeLockCrossThreadAtomicTask, rwlock2, atomicB));
      let p5 = taskpool.execute(new taskpool.Task(writeLockCrossThreadAtomicTask, rwlock2, atomicB));
      let p6 = taskpool.execute(new taskpool.Task(writeLockCrossThreadAtomicTask, rwlock2, atomicB));
      await Promise.all([p1, p2, p3, p4, p5, p6]);
      expect(atomicA.load()).assertEqual(3);
      expect(atomicB.load()).assertEqual(3);
      } catch (error) {
        console.error(`RWLockWriteLockTest0900 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    RWLockWriteLockTest1000
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_1000
     * @tc.desc    Verify RWLock object can be shared across threads and writeLock() works correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockWriteLockTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const counter = new WriteLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(writeLockCrossThreadTask, rwlock, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockCrossThreadTask, rwlock, counter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockCrossThreadTask, rwlock, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.value).assertEqual(3);
      } catch (error) {
        console.error(`RWLockWriteLockTest1000 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    RWLockWriteLockTest1100
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_1100
     * @tc.desc    Verify high-concurrency writeLock with 20 threads maintains data integrity
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockWriteLockTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const counter = new WriteLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p4 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p5 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p6 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p7 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p8 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p9 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p10 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p11 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p12 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p13 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p14 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p15 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p16 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p17 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p18 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p19 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      let p20 = taskpool.execute(new taskpool.Task(writeLockStressTask, counter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10,
        p11, p12, p13, p14, p15, p16, p17, p18, p19, p20]);
      // Non-atomic read-modify-write under the exclusive write lock: any lock failure loses updates
      expect(counter.value).assertEqual(20);
      } catch (error) {
        console.error(`RWLockWriteLockTest1100 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })


    /**
     * @tc.name    RWLockWriteLockTest1200
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_1200
     * @tc.desc    Verify write lock is properly released after exception in try-finally block
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockWriteLockTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      let exceptionCaught: boolean = false;
      const wl = rwlock.writeLock();
      wl.lock();
      try {
        throw new Error('simulated error');
      } catch (e) {
        exceptionCaught = true;
      } finally {
        wl.unlock();
      }
      expect(exceptionCaught).assertTrue();
      // Verify the lock was released and can be acquired again
      const wl2 = rwlock.writeLock();
      wl2.lock();
      wl2.unlock();
    })

    /**
     * @tc.name    RWLockWriteLockTest1300
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_1300
     * @tc.desc    Verify writeLock() works correctly with async/await pattern
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockWriteLockTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockAsyncCompatibleTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockAsyncCompatibleTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockAsyncCompatibleTask, atomicCounter));
      await Promise.all([p1, p2, p3]);
      expect(atomicCounter.load()).assertEqual(3);
      } catch (error) {
        console.error(`RWLockWriteLockTest1300 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    RWLockWriteLockTest1400
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_1400
     * @tc.desc    Verify high-frequency writeLock() calls do not cause resource exhaustion or system errors
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockWriteLockTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockHighFreqTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockHighFreqTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockHighFreqTask, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(writeLockHighFreqTask, atomicCounter));
      let p5 = taskpool.execute(new taskpool.Task(writeLockHighFreqTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(atomicCounter.load()).assertEqual(5);
      } catch (error) {
        console.error(`RWLockWriteLockTest1400 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    RWLockWriteLockTest1500
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_1500
     * @tc.desc    Verify writeLock() operates correctly under concurrent system load
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockWriteLockTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockConcurrentLoadTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockConcurrentLoadTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockConcurrentLoadTask, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(writeLockConcurrentLoadTask, atomicCounter));
      let p5 = taskpool.execute(new taskpool.Task(writeLockConcurrentLoadTask, atomicCounter));
      let p6 = taskpool.execute(new taskpool.Task(writeLockConcurrentLoadTask, atomicCounter));
      let p7 = taskpool.execute(new taskpool.Task(writeLockConcurrentLoadTask, atomicCounter));
      let p8 = taskpool.execute(new taskpool.Task(writeLockConcurrentLoadTask, atomicCounter));
      let p9 = taskpool.execute(new taskpool.Task(writeLockConcurrentLoadTask, atomicCounter));
      let p10 = taskpool.execute(new taskpool.Task(writeLockConcurrentLoadTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(atomicCounter.load()).assertEqual(10);
      } catch (error) {
        console.error(`RWLockWriteLockTest1500 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    RWLockWriteLockTest1600
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_1600
     * @tc.desc    Verify writeLock() can be used in EAWorker thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockWriteLockTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const atomicCounter = new AtomicInt(0);
      const worker = new EAWorker('writeLockEAWkr1');
      worker.start();
      try {
        worker.run<void>(eaWorkerWriteLockBasicTask, atomicCounter).Await();
      } finally {
        worker.quit();
      }
      expect(atomicCounter.load()).assertEqual(1);
      } catch (error) {
        console.error(`RWLockWriteLockTest1600 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    // TC-PARAM-002 (md writeLock(1) parameter check) is skipped: writeLock() accepts no parameters and
    // passing an argument is a compile-time error in the ArkTS 1.2 static model, so it has no
    // runtime-observable behavior and cannot be expressed as a runtime test case.

    /**
     * @tc.name    RWLockWriteLockTest1700
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_1700
     * @tc.desc    Verify writeLock() returns a non-null usable WriteLock object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockWriteLockTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      let state: number = 0;
      for (let i = 0; i < 3; i++) {
        wl.lock();
        try {
          state++;
        } finally {
          wl.unlock();
        }
      }
      expect(state).assertEqual(3);
    })

    /**
     * @tc.name    RWLockWriteLockTest1800
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_1800
     * @tc.desc    Verify writeLock() returns a reusable WriteLock object that supports exclusive locking
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockWriteLockTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      // A WriteLock provides exclusive acquisition: lock/unlock round-trip succeeds
      wl.lock();
      wl.unlock();
      expect(rwlock.writeLock() === wl).assertTrue();
    })

    /**
     * @tc.name    RWLockWriteLockTest1900
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_1900
     * @tc.desc    Verify a freshly obtained WriteLock starts in unlocked state: first lock() succeeds immediately
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockWriteLockTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      // A freshly obtained WriteLock starts unlocked, so the first lock() succeeds immediately,
      // including when the first acquirer runs on another thread.
      const rwlock = new RWLock();
      const counter = new WriteLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(writeLockCrossThreadTask, rwlock, counter));
      await p1;
      expect(counter.value).assertEqual(1);
      } catch (error) {
        console.error(`RWLockWriteLockTest1900 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    RWLockWriteLockTest2000
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_2000
     * @tc.desc    Verify writeLock() still returns a usable WriteLock after the RWLock has been fully used and released (destroyed-object scenario approximation)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockWriteLockTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // RWLock exposes no destroy API, so the exact destroyed-object behavior cannot be exercised.
      // Closest semantics: after the RWLock is fully used and all locks released, writeLock() still
      // returns a valid WriteLock without throwing or returning an invalid object.
      const rwlock = new RWLock();
      const wl1 = rwlock.writeLock();
      wl1.lock();
      wl1.unlock();
      let state: number = 0;
      const wl2 = rwlock.writeLock();
      wl2.lock();
      try {
        state = 7;
      } finally {
        wl2.unlock();
      }
      expect(state).assertEqual(7);
    })

    /**
     * @tc.name    RWLockWriteLockTest2100
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_2100
     * @tc.desc    Verify write lock sequential lock-unlock reuse (same-thread nested reentrancy is implementation-dependent and not exercised to avoid deadlock)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockWriteLockTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockSequentialReuseTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
      } catch (error) {
        console.error(`RWLockWriteLockTest2100 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    RWLockWriteLockTest2200
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_2200
     * @tc.desc    Verify multiple write lock waiters acquire one at a time and all complete (approximate fairness verification)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockWriteLockTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const acquisitions = new AtomicInt(0);
      const sum = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockOrderedAcquireTask, rwlock, acquisitions, sum, 10));
      let p2 = taskpool.execute(new taskpool.Task(writeLockOrderedAcquireTask, rwlock, acquisitions, sum, 20));
      let p3 = taskpool.execute(new taskpool.Task(writeLockOrderedAcquireTask, rwlock, acquisitions, sum, 30));
      let p4 = taskpool.execute(new taskpool.Task(writeLockOrderedAcquireTask, rwlock, acquisitions, sum, 40));
      let p5 = taskpool.execute(new taskpool.Task(writeLockOrderedAcquireTask, rwlock, acquisitions, sum, 50));
      await Promise.all([p1, p2, p3, p4, p5]);
      // Every waiter acquired the write lock exactly once (records are made inside the critical section);
      // strict FIFO order is scheduler-dependent and is not asserted
      expect(acquisitions.load()).assertEqual(5);
      expect(sum.load()).assertEqual(150);
      } catch (error) {
        console.error(`RWLockWriteLockTest2200 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    RWLockWriteLockTest2300
     * @tc.number  SUB_RW_LOCK_WRITE_LOCK_TEST_2300
     * @tc.desc    Verify a task already blocked in write lock acquisition is not interrupted by taskpool.cancel: it still acquires the lock after the holder releases (cancellation approximation)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockWriteLockTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      const data = new WriteLockCancelData();
      const holderReady = new AtomicInt(0);
      const waiterStarted = new AtomicInt(0);
      const cancelDone = new AtomicInt(0);
      let holderPromise = taskpool.execute(new taskpool.Task(writeLockHolderDelayTask, rwlock, counter, holderReady, cancelDone));
      // Wait until the holder actually holds the write lock so the waiter queues behind it (bounded poll).
      let holderCycles: number = 0;
      while (holderReady.load() === 0 && holderCycles < 50) {
        await Utils.msSleep(100);
        holderCycles++;
      }
      expect(holderReady.load()).assertEqual(1);
      const waiter = new taskpool.Task(writeLockCancelledWaiterTask, rwlock, data, counter, waiterStarted);
      let waiterPromise = taskpool.execute(waiter);
      // Wait until the waiter is executing and blocked in lock() before cancelling it (bounded poll).
      let waiterCycles: number = 0;
      while (waiterStarted.load() === 0 && waiterCycles < 50) {
        await Utils.msSleep(100);
        waiterCycles++;
      }
      expect(waiterStarted.load()).assertEqual(1);
      // taskpool.cancel only marks an already-executing task as cancelled: it cannot interrupt a
      // waiter that is blocked in lock(), so the waiter must still complete after the holder releases.
      taskpool.cancel(waiter);
      cancelDone.store(1);
      await holderPromise;
      // Cancelling an already-running task does not interrupt lock(); wait for the task to complete.
      await waiterPromise;
      // Single expected direction: the blocked waiter was not interrupted and acquired the write lock
      expect(data.ran).assertTrue();
      expect(counter.load()).assertEqual(111);
      } catch (error) {
        console.error(`RWLockWriteLockTest2300 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })
  })
}
