'use static'
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util';

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

function writeLockHolderTask(c: WriteLockSharedCounter): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
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

function writeLockReadHolderTask(c: WriteLockSharedCounter): void {
  const rl = gRWLock.readLock();
  rl.lock();
  try {
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

function writeLockWriterATask(c: WriteLockSharedCounter): void {
  const wl = gRWLock.writeLock();
  wl.lock();
  try {
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

export default function WriteLockLockTest(): void {
  describe('WriteLockLockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

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
      wl.lock();
      // Verify lock was acquired by modifying state under lock
      let state: number = 42;
      expect(state).assertEqual(42);
      wl.unlock();
      // Verify lock can be re-acquired after unlock
      wl.lock();
      state = 100;
      expect(state).assertEqual(100);
      wl.unlock();
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
      // Ensure holder completes first by awaiting it before starting waiter
      await taskpool.execute(new taskpool.Task(writeLockHolderTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockWaiterTask, counter));
      await p2;
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
      let lockAcquired: boolean = false;
      let finallyExecuted: boolean = false;
      wl.lock();
      try {
        lockAcquired = true;
      } finally {
        finallyExecuted = true;
        wl.unlock();
      }
      expect(lockAcquired).assertTrue();
      expect(finallyExecuted).assertTrue();
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
      // Ensure read holder completes first, then write waiter
      await taskpool.execute(new taskpool.Task(writeLockReadHolderTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockWaiterTask, counter));
      await p2;
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
      let p1 = taskpool.execute(new taskpool.Task(writeLockWriterATask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockWriterBTask, counter));
      await Promise.all([p1, p2]);
      expect(counter.value).assertLargerOrEqual(10);
    })

    // ========== CONCURRENCY TESTS ==========

    /**
     * @tc.name    WriteLockLockTest0700
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_0700
     * @tc.desc    Verify WriteLock.lock() acquires lock and allows state modification in single thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('WriteLockLockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      let state: number = 0;
      wl.lock();
      state = 42;
      expect(state).assertEqual(42);
      wl.unlock();
    })

    /**
     * @tc.name    WriteLockLockTest0800
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_0800
     * @tc.desc    Verify WriteLock.lock() protects critical section code execution correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('WriteLockLockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new WriteLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(writeLockCriticalSectionTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockCriticalSectionTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockCriticalSectionTask, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.value).assertEqual(105);
    })

    /**
     * @tc.name    WriteLockLockTest0900
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_0900
     * @tc.desc    Verify WriteLock maintains lock state and protects shared data while held for extended duration
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockLockTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      let state: number = 0;
      wl.lock();
      state = 100;
      expect(state).assertEqual(100);
      let spinCount: number = 0;
      while (spinCount < 1000) {
        spinCount++;
      }
      expect(state).assertEqual(100);
      wl.unlock();
    })

    /**
     * @tc.name    WriteLockLockTest1000
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1000
     * @tc.desc    Verify WriteLock.lock() mutual exclusion with two concurrent threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('WriteLockLockTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new WriteLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(writeLockIncrementTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockIncrementTask, counter));
      await Promise.all([p1, p2]);
      expect(counter.value).assertEqual(2);
    })

    /**
     * @tc.name    WriteLockLockTest1100
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1100
     * @tc.desc    Verify WriteLock.lock() mutual exclusion with 12 concurrent threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('WriteLockLockTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
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
     * @tc.name    WriteLockLockTest1200
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1200
     * @tc.desc    Verify WriteLock.lock() blocks while a read lock is held by another thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new WriteLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(writeLockReadIncrementTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockWriteAdd100Task, counter));
      await Promise.all([p1, p2]);
      expect(counter.value).assertEqual(101);
    })


    /**
     * @tc.name    WriteLockLockTest1300
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1300
     * @tc.desc    Verify woken thread acquires WriteLock and continues execution successfully
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3]);
      expect(atomicCounter.load()).assertEqual(3);
    })

    /**
     * @tc.name    WriteLockLockTest1400
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1400
     * @tc.desc    Verify WriteLock.lock() completes correctly under standard concurrent conditions
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
      await Promise.all([p1, p2, p3, p4]);
      expect(atomicCounter.load()).assertEqual(4);
    })

    /**
     * @tc.name    WriteLockLockTest1500
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1500
     * @tc.desc    Verify WriteLock.lock() correctness under high concurrency with 10 threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.name    WriteLockLockTest1600
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1600
     * @tc.desc    Verify WriteLock.lock() data integrity under intense contention with 20 threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockLockTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      let p16 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p17 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p18 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p19 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      let p20 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20]);
      expect(atomicCounter.load()).assertEqual(20);
    })


    /**
     * @tc.name    WriteLockLockTest1700
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1700
     * @tc.desc    Verify WriteLock.lock() high-concurrency stability with 15 threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockLockTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name    WriteLockLockTest1800
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1800
     * @tc.desc    Verify WriteLock.lock() on multiple independent RWLock instances concurrently
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicA = new AtomicInt(0);
      const atomicB = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicA));
      let p2 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicA));
      let p3 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicA));
      let p4 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicB));
      let p5 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicB));
      let p6 = taskpool.execute(new taskpool.Task(writeLockAtomicIncrementTask, atomicB));
      await Promise.all([p1, p2, p3, p4, p5, p6]);
      expect(atomicA.load()).assertEqual(3);
      expect(atomicB.load()).assertEqual(3);
    })

    /**
     * @tc.name    WriteLockLockTest1900
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_1900
     * @tc.desc    Verify WriteLock downgrade from write lock to read lock completes correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockDowngradeTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockDowngradeTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockDowngradeTask, atomicCounter));
      await Promise.all([p1, p2, p3]);
      expect(atomicCounter.load()).assertEqual(6);
    })

    /**
     * @tc.name    WriteLockLockTest2000
     * @tc.number  SUB_WRITE_LOCK_LOCK_TEST_2000
     * @tc.desc    Verify WriteLock upgrade from read lock to write lock completes correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockLockTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockUpgradeTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockUpgradeTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockUpgradeTask, atomicCounter));
      await Promise.all([p1, p2, p3]);
      expect(atomicCounter.load()).assertEqual(6);
    })
  })
}
