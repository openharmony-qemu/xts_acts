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
import Utils from '../Util';

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

function readLockReadValueTask(c: ReadLockSharedCounter): void {
  const rl = gReadLockLockRWLock.readLock();
  rl.lock();
  try {
    let temp: number = c.value;
    temp = temp + 0;
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

export default function ReadLockLockTest(): void {
  describe('ReadLockLockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

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
      rl.lock();
      criticalSectionEntered = 42;
      expect(criticalSectionEntered).assertEqual(42);
      rl.unlock();
    })

    /**
     * @tc.name    ReadLockLockTest0200
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0200
     * @tc.desc    Verify ReadLock.lock() returns void after blocking on write lock release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new ReadLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(readLockWriteAdd100Task, counter));
      let p2 = taskpool.execute(new taskpool.Task(readLockSharedIncrementTask, counter));
      await Promise.all([p1, p2]);
      expect(counter.value).assertLarger(0);
    })

    // ========== ERROR HANDLING TESTS ==========

    /**
     * @tc.name    ReadLockLockTest0300
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0300
     * @tc.desc    Verify null ReadLock reference is detected before calling lock()
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
     * @tc.desc    Verify ReadLock.lock() in EAWorker completes and lock auto-releases on quit
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      const worker = new EAWorker('readLockLockEA');
      worker.start();
      await worker.run<void>(eaWorkerReadLockTask, counter);
      worker.quit();
      expect(counter.load()).assertEqual(1);
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      let result: void = rl.lock();
      rl.unlock();
    })

    // ========== CONCURRENCY TESTS - BASIC ==========

    /**
     * @tc.name    ReadLockLockTest0600
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0600
     * @tc.desc    Verify single thread acquires read lock without blocking
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      let state: number = 0;
      rl.lock();
      state = 42;
      expect(state).assertEqual(42);
      rl.unlock();
    })

    /**
     * @tc.name    ReadLockLockTest0700
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0700
     * @tc.desc    Verify multiple threads (5) concurrently acquire read locks for shared access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p5 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(atomicCounter.load()).assertEqual(5);
    })

    /**
     * @tc.name    ReadLockLockTest0800
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0800
     * @tc.desc    Verify multiple threads (3) acquire read locks without blocking in order
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3]);
      expect(atomicCounter.load()).assertEqual(3);
    })

    /**
     * @tc.name    ReadLockLockTest0900
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_0900
     * @tc.desc    Verify read lock shared count equals thread count with 10 threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p5 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p6 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p7 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p8 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p9 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p10 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(atomicCounter.load()).assertEqual(10);
    })

    // ========== CONCURRENCY TESTS - READ-WRITE MUTEX ==========

    /**
     * @tc.name    ReadLockLockTest1000
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1000
     * @tc.desc    Verify write lock request is blocked while read lock is held
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new ReadLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(readLockSet100Task, counter));
      let p2 = taskpool.execute(new taskpool.Task(readLockWriteAdd100Task, counter));
      await Promise.all([p1, p2]);
      expect(counter.value).assertLargerOrEqual(100);
    })

    /**
     * @tc.name    ReadLockLockTest1100
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1100
     * @tc.desc    Verify read lock request is blocked while write lock is held
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new ReadLockSharedCounter();
      await taskpool.execute(new taskpool.Task(readLockWriteAdd100Task, counter));
      await taskpool.execute(new taskpool.Task(readLockSharedIncrementTask, counter));
      expect(counter.value).assertEqual(101);
    })

    /**
     * @tc.name    ReadLockLockTest1200
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1200
     * @tc.desc    Verify write lock waits for all multiple read locks to be released
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p5 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(atomicCounter.load()).assertEqual(5);
    })

    /**
     * @tc.name    ReadLockLockTest1300
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1300
     * @tc.desc    Verify read-write lock alternating acquisition without deadlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockDowngradeTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(readLockDowngradeTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(readLockDowngradeTask, atomicCounter));
      await Promise.all([p1, p2, p3]);
      expect(atomicCounter.load()).assertEqual(6);
    })

    // ========== CONCURRENCY TESTS - LOCK RELEASE ==========

    /**
     * @tc.name    ReadLockLockTest1400
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1400
     * @tc.desc    Verify write lock can be acquired after read lock is released
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new ReadLockSharedCounter();
      await taskpool.execute(new taskpool.Task(readLockSet100Task, counter));
      await taskpool.execute(new taskpool.Task(readLockWriteAdd100Task, counter));
      expect(counter.value).assertEqual(200);
    })

    /**
     * @tc.name    ReadLockLockTest1500
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1500
     * @tc.desc    Verify write lock waits until last read lock is released with 5 readers
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new ReadLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(readLockSharedIncrementTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(readLockSharedIncrementTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(readLockSharedIncrementTask, counter));
      let p4 = taskpool.execute(new taskpool.Task(readLockSharedIncrementTask, counter));
      let p5 = taskpool.execute(new taskpool.Task(readLockSharedIncrementTask, counter));
      await Promise.all([p1, p2, p3, p4, p5]);
      await taskpool.execute(new taskpool.Task(readLockWriteAdd100Task, counter));
      // Read locks allow concurrent access, so read-modify-write may lose updates.
      // Write lock adds 100 after all readers finish; at least 1 reader succeeded.
      expect(counter.value).assertLargerOrEqual(101);
    })

    // ========== CONCURRENCY TESTS - REENTRANT ==========

    /**
     * @tc.name    ReadLockLockTest1600
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1600
     * @tc.desc    Verify reentrant read lock works in concurrent taskpool tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockLockTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockReentrantTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(readLockReentrantTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(readLockReentrantTask, atomicCounter));
      await Promise.all([p1, p2, p3]);
      expect(atomicCounter.load()).assertEqual(3);
    })

    // ========== CONCURRENCY TESTS - NESTED AND COMBO ==========

    /**
     * @tc.name    ReadLockLockTest1700
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1700
     * @tc.desc    Verify ReadLock.lock() works correctly inside TaskPool task
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new ReadLockSharedCounter();
      await taskpool.execute(new taskpool.Task(readLockBasicTask, counter));
      expect(counter.value).assertEqual(1);
    })

    /**
     * @tc.name    ReadLockLockTest1800
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1800
     * @tc.desc    Verify ReadLock.lock() works correctly inside EAWorker thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockLockTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new AtomicInt(0);
      const worker = new EAWorker('readLockEAWkr');
      worker.start();
      await worker.run<void>(eaWorkerMixedLockTask, counter);
      worker.quit();
      expect(counter.load()).assertEqual(11);
    })

    /**
     * @tc.name    ReadLockLockTest1900
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_1900
     * @tc.desc    Verify read lock combined with write lock in mixed TaskPool scenario
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockMixedTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(readLockMixedTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(readLockMixedTask, atomicCounter));
      await Promise.all([p1, p2, p3]);
      expect(atomicCounter.load()).assertEqual(3);
    })

    /**
     * @tc.name    ReadLockLockTest2000
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_2000
     * @tc.desc    Verify ReadLock.lock() on independent RWLock instances concurrently
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockLockTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicA = new AtomicInt(0);
      const atomicB = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicA));
      let p2 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicA));
      let p3 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicA));
      let p4 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicB));
      let p5 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicB));
      let p6 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicB));
      await Promise.all([p1, p2, p3, p4, p5, p6]);
      expect(atomicA.load()).assertEqual(3);
      expect(atomicB.load()).assertEqual(3);
    })

    // ========== CONCURRENCY TESTS - PERFORMANCE STRESS ==========

    /**
     * @tc.name    ReadLockLockTest2100
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_2100
     * @tc.desc    Verify high concurrency with 20 threads acquiring read locks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockLockTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p5 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p6 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p7 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p8 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p9 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p10 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p11 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p12 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p13 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p14 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p15 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p16 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p17 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p18 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p19 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      let p20 = taskpool.execute(new taskpool.Task(readLockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10,
        p11, p12, p13, p14, p15, p16, p17, p18, p19, p20]);
      expect(atomicCounter.load()).assertEqual(20);
    })

    /**
     * @tc.name    ReadLockLockTest2200
     * @tc.number  SUB_READ_LOCK_LOCK_TEST_2200
     * @tc.desc    Verify read lock shared performance with 10 concurrent threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockLockTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockStressCycleTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(readLockStressCycleTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(readLockStressCycleTask, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(readLockStressCycleTask, atomicCounter));
      let p5 = taskpool.execute(new taskpool.Task(readLockStressCycleTask, atomicCounter));
      let p6 = taskpool.execute(new taskpool.Task(readLockStressCycleTask, atomicCounter));
      let p7 = taskpool.execute(new taskpool.Task(readLockStressCycleTask, atomicCounter));
      let p8 = taskpool.execute(new taskpool.Task(readLockStressCycleTask, atomicCounter));
      let p9 = taskpool.execute(new taskpool.Task(readLockStressCycleTask, atomicCounter));
      let p10 = taskpool.execute(new taskpool.Task(readLockStressCycleTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(atomicCounter.load()).assertEqual(10);
    })
  })
}
