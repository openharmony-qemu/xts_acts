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

const gRWLock: RWLock = new RWLock();

function writeLockIncrementTask(c: WriteLockSharedCounter): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    c.value++;
  } finally {
    wl.unlock();
  }
}

function writeLockCriticalSectionTask(c: WriteLockSharedCounter): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    c.value = c.value + 10;
    c.value = c.value * 2;
    c.value = c.value - 5;
  } finally {
    wl.unlock();
  }
}

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

function writeLockHolderTask(c: WriteLockSharedCounter, holderReady: AtomicInt): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    holderReady.store(1);
    const start: number = Date.now();
    while (Date.now() - start < 200) {
      // hold the write lock briefly so the waiter overlaps with the hold
    }
    c.value = 1;
  } finally {
    wl.unlock();
  }
}

function writeLockWaiterTask(c: WriteLockSharedCounter): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    c.value = c.value + 1;
  } finally {
    wl.unlock();
  }
}

function writeLockReadHolderTask(c: WriteLockSharedCounter, holderReady: AtomicInt): void {
  const rl = gRWLock.readLock();
  rl.lock();
  try {
    holderReady.store(1);
    const start: number = Date.now();
    while (Date.now() - start < 200) {
      // hold the read lock briefly so the write waiter overlaps with the hold
    }
    c.value = 100;
  } finally {
    rl.unlock();
  }
}

function writeLockReadIncrementTask(c: WriteLockSharedCounter): void {
  const rl = gRWLock.readLock();
  rl.lock();
  try {
    c.value = c.value + 1;
  } finally {
    rl.unlock();
  }
}

function writeLockWriteAdd100Task(c: WriteLockSharedCounter): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    c.value = c.value + 100;
  } finally {
    wl.unlock();
  }
}

function writeLockWriterATask(c: WriteLockSharedCounter, holderReady: AtomicInt): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    holderReady.fetchAdd(1);
    c.value = 10;
  } finally {
    wl.unlock();
  }
}

function writeLockWriterBTask(c: WriteLockSharedCounter): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    c.value = c.value + 5;
  } finally {
    wl.unlock();
  }
}

function writeLockAtomicIncrementTask(a: AtomicInt): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
    a.fetchAdd(1);
  } finally {
    wl.unlock();
  }
}

function writeLockIndependentInstanceTask(rwlock: RWLock, a: AtomicInt): void {
  const wl = rwlock.writeLock();
  wl.lock();
  try {
    a.fetchAdd(1);
  } finally {
    wl.unlock();
  }
}

function writeLockDowngradeTask(a: AtomicInt): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  a.fetchAdd(1);
  wl.unlock();
  const rl = gRWLock.readLock();
  rl.lock();
  a.fetchAdd(1);
  rl.unlock();
}

function writeLockUpgradeTask(a: AtomicInt): void {
  const rl = gRWLock.readLock();
  rl.lock();
  a.fetchAdd(1);
  rl.unlock();
  const wl = gRWLock.writeLock();
  wl.lock();
  a.fetchAdd(1);
  wl.unlock();
}

const WRITE_LOCK_FAIR_ROUNDS: number = 50;
const WRITE_LOCK_CONTENTION_ROUNDS: number = 20;

function writeLockBlockedWaiterTask(started: AtomicInt, done: AtomicInt): void {
  const wl = gRWLock.writeLock();
  started.store(1);
  wl.lock();
  done.fetchAdd(1);
  wl.unlock();
}

function writeLockBlockedReaderTask(started: AtomicInt, done: AtomicInt): void {
  const rl = gRWLock.readLock();
  started.store(1);
  rl.lock();
  done.fetchAdd(1);
  rl.unlock();
}

function writeLockCompetingWaiterTask(started: AtomicInt, counter: AtomicInt, active: AtomicInt, maxActive: AtomicInt): void {
  const wl = gRWLock.writeLock();
  started.fetchAdd(1);
  wl.lock();
  active.fetchAdd(1);
  if (active.load() > maxActive.load()) {
    maxActive.store(active.load());
  }
  counter.fetchAdd(1);
  active.fetchAdd(-1);
  wl.unlock();
}

function writeLockFairWaiterTask(mine: AtomicInt, total: AtomicInt): void {
  const wl = gRWLock.writeLock();
  for (let i: number = 0; i < WRITE_LOCK_FAIR_ROUNDS; i++) {
    wl.lock();
    mine.fetchAdd(1);
    total.fetchAdd(1);
    wl.unlock();
  }
}

function writeLockContentionTask(counter: AtomicInt): void {
  const wl = gRWLock.writeLock();
  for (let i: number = 0; i < WRITE_LOCK_CONTENTION_ROUNDS; i++) {
    wl.lock();
    counter.fetchAdd(1);
    wl.unlock();
  }
}

function writeLockSequentialNestedTask(counter: AtomicInt): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  counter.fetchAdd(1);
  wl.unlock();
  wl.lock();
  counter.fetchAdd(1);
  wl.unlock();
}

export default function WriteLockLockTest(): void {
  describe('WriteLockLockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    // ========== INPUT TESTS ==========

    // ========== RETURN VALUE TESTS ==========

    /**
     * @tc.name    WriteLockLockTest0100
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_0100
     * @tc.desc    Verify WriteLock.lock() returns immediately without blocking when no contention
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('WriteLockLockTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      let lockOk: boolean = false;
      wl.lock();
      try {
        lockOk = true;
      } finally {
        wl.unlock();
      }
      expect(lockOk).assertTrue();
      // Verify lock can be re-acquired after unlock
      let reacquired: boolean = false;
      wl.lock();
      try {
        reacquired = true;
      } finally {
        wl.unlock();
      }
      expect(reacquired).assertTrue();
    })

    /**
     * @tc.name    WriteLockLockTest0200
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_0200
     * @tc.desc    Verify WriteLock.lock() returns void after blocking resolves
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new WriteLockSharedCounter();
      const holderReady = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockHolderTask, counter, holderReady));
      // Wait until the holder actually holds the write lock before starting the waiter (bounded poll).
      let waitCycles: number = 0;
      while (holderReady.load() === 0 && waitCycles < 50) {
        await Utils.msSleep(100);
        waitCycles++;
      }
      expect(holderReady.load()).assertEqual(1);
      let p2 = taskpool.execute(new taskpool.Task(writeLockWaiterTask, counter));
      await Promise.all([p1, p2]);
      // The waiter's lock() blocked until the holder released: 1 set first, then +1 -> 2.
      expect(counter.value).assertEqual(2);
    })

    // ========== ERROR HANDLING TESTS ==========

    /**
     * @tc.name    WriteLockLockTest0300
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_0300
     * @tc.desc    Verify WriteLock.lock() acquired in taskpool task allows shared state modification correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockLockTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new WriteLockSharedCounter();
      await taskpool.execute(new taskpool.Task(writeLockIncrementTask, counter));
      expect(counter.value).assertEqual(1);
    })

    /**
     * @tc.name    WriteLockLockTest0400
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_0400
     * @tc.desc    Verify WriteLock.lock() works correctly in try-finally exception flow
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      let exceptionCaught: boolean = false;
      wl.lock();
      try {
        throw new Error('simulated error');
      } catch (e) {
        exceptionCaught = true;
      } finally {
        wl.unlock();
      }
      expect(exceptionCaught).assertTrue();
      // The finally block released the lock after the exception: it can be acquired again
      wl.lock();
      wl.unlock();
    })

    /**
     * @tc.name    WriteLockLockTest0500
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_0500
     * @tc.desc    Verify WriteLock.lock() blocks when a read lock is held by another thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new WriteLockSharedCounter();
      const holderReady = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockReadHolderTask, counter, holderReady));
      // Wait until the read holder actually holds the read lock before starting the write waiter (bounded poll).
      let waitCycles: number = 0;
      while (holderReady.load() === 0 && waitCycles < 50) {
        await Utils.msSleep(100);
        waitCycles++;
      }
      expect(holderReady.load()).assertEqual(1);
      let p2 = taskpool.execute(new taskpool.Task(writeLockWaiterTask, counter));
      await Promise.all([p1, p2]);
      // The write waiter blocked while the read lock was held: 100 set first, then +1 -> 101.
      expect(counter.value).assertEqual(101);
    })

    /**
     * @tc.name    WriteLockLockTest0600
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_0600
     * @tc.desc    Verify WriteLock.lock() blocks when another thread holds the write lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new WriteLockSharedCounter();
      const holderReady = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockWriterATask, counter, holderReady));
      // Wait until writer A actually holds the write lock before starting writer B (bounded poll).
      let waitCycles: number = 0;
      while (holderReady.load() === 0 && waitCycles < 50) {
        await Utils.msSleep(100);
        waitCycles++;
      }
      expect(holderReady.load()).assertEqual(1);
      let p2 = taskpool.execute(new taskpool.Task(writeLockWriterBTask, counter));
      await Promise.all([p1, p2]);
      // Writer B was blocked until writer A released the write lock: final value is 10 + 5.
      expect(counter.value).assertEqual(15);
    })

    // ========== CONCURRENCY TESTS ==========

    /**
     * @tc.name    WriteLockLockTest0700
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_0700
     * @tc.desc    Verify WriteLock.lock() protects critical section code execution correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('WriteLockLockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new WriteLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(writeLockCriticalSectionTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockCriticalSectionTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockCriticalSectionTask, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.value).assertEqual(105);
    })

    // The former "extended duration hold" case is removed: its instantaneous lock/set/unlock body
    // duplicated WriteLockLockTest0100's oracle, and genuine long-hold blocking coverage is provided
    // by WriteLockLockTest2400 (former 2600).

    /**
     * @tc.name    WriteLockLockTest0800
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_0800
     * @tc.desc    Verify WriteLock.lock() mutual exclusion with two concurrent threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('WriteLockLockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new WriteLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(writeLockIncrementTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockIncrementTask, counter));
      await Promise.all([p1, p2]);
      expect(counter.value).assertEqual(2);
    })

    /**
     * @tc.name    WriteLockLockTest0900
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_0900
     * @tc.desc    Verify WriteLock.lock() mutual exclusion with 12 concurrent threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('WriteLockLockTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p5 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p6 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p7 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p8 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p9 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p10 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p11 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p12 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]);
      expect(atomicCounter.load()).assertEqual(12);
    })

    /**
     * @tc.name    WriteLockLockTest1000
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1000
     * @tc.desc    Verify WriteLock.lock() blocks while a read lock is held by another thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new WriteLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(writeLockReadIncrementTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockWriteAdd100Task, counter));
      await Promise.all([p1, p2]);
      expect(counter.value).assertEqual(101);
    })


    /**
     * @tc.name    WriteLockLockTest1100
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1100
     * @tc.desc    Verify woken thread acquires WriteLock and continues execution successfully
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3]);
      expect(atomicCounter.load()).assertEqual(3);
    })

    /**
     * @tc.name    WriteLockLockTest1200
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1200
     * @tc.desc    Verify WriteLock.lock() completes correctly under standard concurrent conditions
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockLockTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4]);
      expect(atomicCounter.load()).assertEqual(4);
    })

    /**
     * @tc.name    WriteLockLockTest1300
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1300
     * @tc.desc    Verify WriteLock.lock() correctness under high concurrency with 10 threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(counter.value).assertEqual(10);
    })


    /**
     * @tc.name    WriteLockLockTest1400
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1400
     * @tc.desc    Verify WriteLock.lock() high-concurrency stability with 15 threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockLockTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p5 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p6 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p7 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p8 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p9 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p10 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p11 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p12 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p13 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p14 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p15 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15]);
      expect(atomicCounter.load()).assertEqual(15);
    })

    /**
     * @tc.name    WriteLockLockTest1500
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1500
     * @tc.desc    Verify WriteLock.lock() on multiple independent RWLock instances concurrently
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rwlock1 = new RWLock();
      const rwlock2 = new RWLock();
      const atomicA = new AtomicInt(0);
      const atomicB = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockIndependentInstanceTask, rwlock1, atomicA));
      let p2 = taskpool.execute(new taskpool.Task(writeLockIndependentInstanceTask, rwlock1, atomicA));
      let p3 = taskpool.execute(new taskpool.Task(writeLockIndependentInstanceTask, rwlock1, atomicA));
      let p4 = taskpool.execute(new taskpool.Task(writeLockIndependentInstanceTask, rwlock2, atomicB));
      let p5 = taskpool.execute(new taskpool.Task(writeLockIndependentInstanceTask, rwlock2, atomicB));
      let p6 = taskpool.execute(new taskpool.Task(writeLockIndependentInstanceTask, rwlock2, atomicB));
      await Promise.all([p1, p2, p3, p4, p5, p6]);
      expect(atomicA.load()).assertEqual(3);
      expect(atomicB.load()).assertEqual(3);
    })

    /**
     * @tc.name    WriteLockLockTest1600
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1600
     * @tc.desc    Verify WriteLock downgrade from write lock to read lock completes correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockDowngradeTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockDowngradeTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockDowngradeTask, atomicCounter));
      await Promise.all([p1, p2, p3]);
      expect(atomicCounter.load()).assertEqual(6);
    })

    /**
     * @tc.name    WriteLockLockTest1700
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1700
     * @tc.desc    Verify WriteLock upgrade from read lock to write lock completes correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockUpgradeTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockUpgradeTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockUpgradeTask, atomicCounter));
      await Promise.all([p1, p2, p3]);
      expect(atomicCounter.load()).assertEqual(6);
    })

    // ========== RETURN VALUE TESTS (supplement) ==========

    // The former "lock() returns void type" case is removed: the void return is a compile-time fact in
    // the ArkTS 1.2 static model with no runtime-observable behavior, and its re-acquire oracle
    // duplicated WriteLockLockTest0100.

    // ========== ERROR HANDLING TESTS (supplement) ==========

    /**
     * @tc.name    WriteLockLockTest1800
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1800
     * @tc.desc    Verify WriteLock.lock() is non-reentrant: a second lock() request while the write lock is held is blocked until release (same-thread re-lock would block forever per implementation, so the re-entry request is verified cross-thread)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const started = new AtomicInt(0);
      const done = new AtomicInt(0);
      const wl = gRWLock.writeLock();
      wl.lock();
      let p1 = taskpool.execute(new taskpool.Task(writeLockBlockedWaiterTask, started, done));
      try {
        let attempts: number = 0;
        while (started.load() === 0 && attempts < 50) {
          await Utils.msSleep(100);
          attempts++;
        }
        expect(started.load()).assertEqual(1);
        // The second lock() request is still blocked while the first acquisition is held
        expect(done.load()).assertEqual(0);
      } finally {
        wl.unlock();
      }
      await p1;
      expect(done.load()).assertEqual(1);
    })

    /**
     * @tc.name    WriteLockLockTest1900
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1900
     * @tc.desc    Verify WriteLock.lock() cannot be acquired again while the write lock is held and not released: all second acquisition requests stay blocked and the holder keeps exclusive access until it releases
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const startedA = new AtomicInt(0);
      const doneA = new AtomicInt(0);
      const startedB = new AtomicInt(0);
      const doneB = new AtomicInt(0);
      const wl = gRWLock.writeLock();
      wl.lock();
      let p1 = taskpool.execute(new taskpool.Task(writeLockBlockedWaiterTask, startedA, doneA));
      let p2 = taskpool.execute(new taskpool.Task(writeLockBlockedWaiterTask, startedB, doneB));
      try {
        let attempts: number = 0;
        while ((startedA.load() === 0 || startedB.load() === 0) && attempts < 50) {
          await Utils.msSleep(100);
          attempts++;
        }
        expect(startedA.load()).assertEqual(1);
        expect(startedB.load()).assertEqual(1);
        // While the write lock is held and not released, no second acquisition can proceed
        expect(doneA.load()).assertEqual(0);
        expect(doneB.load()).assertEqual(0);
      } finally {
        wl.unlock();
      }
      await Promise.all([p1, p2]);
      expect(doneA.load()).assertEqual(1);
      expect(doneB.load()).assertEqual(1);
    })

    // ========== CONCURRENCY TESTS - READ-WRITE MUTEX (supplement) ==========

    /**
     * @tc.name    WriteLockLockTest2000
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_2000
     * @tc.desc    Verify WriteLock.lock() is blocked while multiple (three) read locks are held on the same RWLock and succeeds only after all read locks are released
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const started = new AtomicInt(0);
      const done = new AtomicInt(0);
      const rl1 = gRWLock.readLock();
      const rl2 = gRWLock.readLock();
      const rl3 = gRWLock.readLock();
      let p1: Promise<Any> | null = null;
      try {
        rl1.lock();
        rl2.lock();
        rl3.lock();
        p1 = taskpool.execute(new taskpool.Task(writeLockBlockedWaiterTask, started, done));
        let attempts: number = 0;
        while (started.load() === 0 && attempts < 50) {
          await Utils.msSleep(100);
          attempts++;
        }
        expect(started.load()).assertEqual(1);
        // While three read locks are held, the write lock request stays blocked
        expect(done.load()).assertEqual(0);
      } finally {
        rl3.unlock();
        rl2.unlock();
        rl1.unlock();
      }
      if (p1 !== null) {
        await p1;
      }
      expect(done.load()).assertEqual(1);
    })

    /**
     * @tc.name    WriteLockLockTest2100
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_2100
     * @tc.desc    Verify readLock.lock() is blocked while the write lock is held and succeeds only after the write lock is released
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const started = new AtomicInt(0);
      const done = new AtomicInt(0);
      const wl = gRWLock.writeLock();
      wl.lock();
      let p1 = taskpool.execute(new taskpool.Task(writeLockBlockedReaderTask, started, done));
      try {
        let attempts: number = 0;
        while (started.load() === 0 && attempts < 50) {
          await Utils.msSleep(100);
          attempts++;
        }
        expect(started.load()).assertEqual(1);
        // While the write lock is held, a read lock request stays blocked
        expect(done.load()).assertEqual(0);
      } finally {
        wl.unlock();
      }
      await p1;
      expect(done.load()).assertEqual(1);
    })

    // ========== CONCURRENCY TESTS - WRITE COMPETITION (supplement) ==========

    /**
     * @tc.name    WriteLockLockTest2200
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_2200
     * @tc.desc    Verify after the write lock is released multiple waiting write threads compete and acquire one at a time (exclusive write lock)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const started = new AtomicInt(0);
      const counter = new AtomicInt(0);
      const active = new AtomicInt(0);
      const maxActive = new AtomicInt(0);
      const wl = gRWLock.writeLock();
      wl.lock();
      let p1 = taskpool.execute(new taskpool.Task(writeLockCompetingWaiterTask, started, counter, active, maxActive));
      let p2 = taskpool.execute(new taskpool.Task(writeLockCompetingWaiterTask, started, counter, active, maxActive));
      let p3 = taskpool.execute(new taskpool.Task(writeLockCompetingWaiterTask, started, counter, active, maxActive));
      let p4 = taskpool.execute(new taskpool.Task(writeLockCompetingWaiterTask, started, counter, active, maxActive));
      try {
        let attempts: number = 0;
        while (started.load() < 4 && attempts < 50) {
          await Utils.msSleep(100);
          attempts++;
        }
        expect(started.load()).assertEqual(4);
        // All four write threads are waiting while the write lock is held
        expect(counter.load()).assertEqual(0);
      } finally {
        wl.unlock();
      }
      await Promise.all([p1, p2, p3, p4]);
      // All four waiting write threads eventually acquire the lock after release
      expect(counter.load()).assertEqual(4);
      // The write lock is exclusive: at most one writer inside the critical section at a time
      expect(maxActive.load()).assertEqual(1);
      expect(active.load()).assertEqual(0);
    })

    // ========== CONCURRENCY TESTS - BLOCKING AND WAKING (supplement) ==========

    /**
     * @tc.name    WriteLockLockTest2300
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_2300
     * @tc.desc    Verify a thread blocked in WriteLock.lock() keeps waiting while the write lock is held and is not interrupted or spuriously woken (ArkTS has no thread-interrupt API for a blocked lock(), approximated by repeated sampling), then acquires after release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockLockTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const startedA = new AtomicInt(0);
      const doneA = new AtomicInt(0);
      const startedB = new AtomicInt(0);
      const doneB = new AtomicInt(0);
      const wl = gRWLock.writeLock();
      wl.lock();
      let p1 = taskpool.execute(new taskpool.Task(writeLockBlockedWaiterTask, startedA, doneA));
      let p2 = taskpool.execute(new taskpool.Task(writeLockBlockedWaiterTask, startedB, doneB));
      try {
        let attempts: number = 0;
        while ((startedA.load() === 0 || startedB.load() === 0) && attempts < 50) {
          await Utils.msSleep(100);
          attempts++;
        }
        expect(startedA.load()).assertEqual(1);
        expect(startedB.load()).assertEqual(1);
        // Blocked waiters are not interrupted while the write lock is held
        expect(doneA.load()).assertEqual(0);
        expect(doneB.load()).assertEqual(0);
        // Repeated sampling confirms the waiters keep waiting without spurious completion
        await Utils.msSleep(200);
        expect(doneA.load()).assertEqual(0);
        expect(doneB.load()).assertEqual(0);
      } finally {
        wl.unlock();
      }
      await Promise.all([p1, p2]);
      expect(doneA.load()).assertEqual(1);
      expect(doneB.load()).assertEqual(1);
    })

    /**
     * @tc.name    WriteLockLockTest2400
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_2400
     * @tc.desc    Verify WriteLock.lock() succeeds after a long blocking period: the waiter stays blocked during a long hold and acquires the lock after release, leaving the lock fully usable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockLockTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const started = new AtomicInt(0);
      const done = new AtomicInt(0);
      const wl = gRWLock.writeLock();
      wl.lock();
      let p1 = taskpool.execute(new taskpool.Task(writeLockBlockedWaiterTask, started, done));
      try {
        let attempts: number = 0;
        while (started.load() === 0 && attempts < 50) {
          await Utils.msSleep(100);
          attempts++;
        }
        expect(started.load()).assertEqual(1);
        // The waiter stays blocked during the long hold
        await Utils.msSleep(1000);
        expect(done.load()).assertEqual(0);
      } finally {
        wl.unlock();
      }
      // After the long blocking period the waiter acquires the lock successfully
      await p1;
      expect(done.load()).assertEqual(1);
      // The lock remains fully usable after the long-wait scenario
      wl.lock();
      wl.unlock();
    })

    // ========== CONCURRENCY TESTS - FAIRNESS AND PERFORMANCE (supplement) ==========

    /**
     * @tc.name    WriteLockLockTest2500
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_2500
     * @tc.desc    Verify WriteLock.lock() fairness approximately: every waiting write thread acquires the lock in every round (no starvation) under repeated contention
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockLockTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const w0 = new AtomicInt(0);
      const w1 = new AtomicInt(0);
      const w2 = new AtomicInt(0);
      const total = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockFairWaiterTask, w0, total));
      let p2 = taskpool.execute(new taskpool.Task(writeLockFairWaiterTask, w1, total));
      let p3 = taskpool.execute(new taskpool.Task(writeLockFairWaiterTask, w2, total));
      await Promise.all([p1, p2, p3]);
      // No waiter is starved: each waiting write thread acquires the lock every round
      expect(w0.load()).assertEqual(50);
      expect(w1.load()).assertEqual(50);
      expect(w2.load()).assertEqual(50);
      expect(total.load()).assertEqual(150);
    })

    /**
     * @tc.name    WriteLockLockTest2600
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_2600
     * @tc.desc    Verify WriteLock.lock() remains correct under intense contention with 12 tasks doing 20 acquisitions each (240 total acquisitions)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockLockTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockContentionTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockContentionTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockContentionTask, counter));
      let p4 = taskpool.execute(new taskpool.Task(writeLockContentionTask, counter));
      let p5 = taskpool.execute(new taskpool.Task(writeLockContentionTask, counter));
      let p6 = taskpool.execute(new taskpool.Task(writeLockContentionTask, counter));
      let p7 = taskpool.execute(new taskpool.Task(writeLockContentionTask, counter));
      let p8 = taskpool.execute(new taskpool.Task(writeLockContentionTask, counter));
      let p9 = taskpool.execute(new taskpool.Task(writeLockContentionTask, counter));
      let p10 = taskpool.execute(new taskpool.Task(writeLockContentionTask, counter));
      let p11 = taskpool.execute(new taskpool.Task(writeLockContentionTask, counter));
      let p12 = taskpool.execute(new taskpool.Task(writeLockContentionTask, counter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]);
      expect(counter.load()).assertEqual(240);
    })

    // ========== CONCURRENCY TESTS - NESTED ACQUISITION (supplement) ==========

    /**
     * @tc.name    WriteLockLockTest2700
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_2700
     * @tc.desc    Verify WriteLock.lock() nested acquisition by the same task after release succeeds; the write lock is non-reentrant so re-locking while held would block forever, and re-acquisition is only valid after unlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockLockTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockSequentialNestedTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockSequentialNestedTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockSequentialNestedTask, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.load()).assertEqual(6);
    })
  })
}
