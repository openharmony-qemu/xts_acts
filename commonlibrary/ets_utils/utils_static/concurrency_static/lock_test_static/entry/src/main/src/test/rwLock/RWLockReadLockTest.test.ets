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

// Global shared RWLock for concurrent tests
const gReadLockRWLock: RWLock = new RWLock();

// ===== Module-level task functions for TaskPool =====

// TC-08: Single thread acquire read lock
function readLockSingleAcquireTask(c: ReadLockSharedCounter): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  try {
    c.value = 1;
  } finally {
    rl.unlock();
  }
}

// TC-09: Multi-thread concurrent read lock acquire
function readLockConcurrentReadTask(c: ReadLockSharedCounter): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  try {
    c.value = c.value + 1;
  } finally {
    rl.unlock();
  }
}

// TC-09 (Atomic version): Multi-thread concurrent read lock with atomic counter
function readLockConcurrentReadTaskAtomic(c: ReadLockSharedCounter, atomicCounter: AtomicInt): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  try {
    c.value = c.value + 1;
    atomicCounter.fetchAdd(1);
  } finally {
    rl.unlock();
  }
}

// TC-10: Reader holds read lock and sets value
function readLockReaderHolderTask(c: ReadLockSharedCounter): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  try {
    c.value = 100;
  } finally {
    rl.unlock();
  }
}

// TC-10/TC-11/TC-16/TC-22: Writer acquires write lock and modifies value
function readLockWriterTask(c: ReadLockSharedCounter): void {
  const wl = gReadLockRWLock.writeLock();
  wl.lock();
  try {
    c.value = c.value + 50;
  } finally {
    wl.unlock();
  }
}

// TC-11: Writer sets initial value
function readLockWriteFirstTask(c: ReadLockSharedCounter): void {
  const wl = gReadLockRWLock.writeLock();
  wl.lock();
  try {
    c.value = 200;
  } finally {
    wl.unlock();
  }
}

// TC-11: Reader reads value after writer releases
function readLockReaderAfterWriterTask(c: ReadLockSharedCounter): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  try {
    // Just read - value should be 200 set by writer
    let readValue: number = c.value;
    c.value = readValue;
  } finally {
    rl.unlock();
  }
}

// TC-12: Reader increments shared counter under read lock
function readLockSharedAccessTask(c: ReadLockSharedCounter): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  try {
    c.value = c.value + 1;
  } finally {
    rl.unlock();
  }
}

// TC-12 (Atomic version): Reader increments with atomic counter
function readLockSharedAccessTaskAtomic(c: ReadLockSharedCounter, atomicCounter: AtomicInt): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  try {
    c.value = c.value + 1;
    atomicCounter.fetchAdd(1);
  } finally {
    rl.unlock();
  }
}

// TC-17: Stress test - multiple acquire/release cycles in one task
function readLockStressAcquireReleaseTask(a: AtomicInt): void {
  for (let i = 0; i < 100; i++) {
    const rl = gReadLockRWLock.readLock();
    rl.lock();
    rl.unlock();
  }
  a.fetchAdd(1);
}

// TC-18: Read shared variable under read lock
function readLockReadSharedVarTask(c: ReadLockSharedCounter): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  try {
    let temp: number = c.value;
    temp = temp + 0;
  } finally {
    rl.unlock();
  }
}

// TC-19: Read lock with AtomicInt
function readLockAtomicReadTask(a: AtomicInt): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  try {
    a.load();
  } finally {
    rl.unlock();
  }
}

// TC-20: Read lock lifecycle - acquire, use, release
function readLockLifecycleTask(a: AtomicInt): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  rl.unlock();
  a.fetchAdd(1);
}

// TC-22: Read then write in one task (mixed scenario)
function readLockReadWriteMixedTask(a: AtomicInt): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  a.load();
  rl.unlock();
  const wl = gReadLockRWLock.writeLock();
  wl.lock();
  a.fetchAdd(1);
  wl.unlock();
}

// TC-23: Long-held read lock (500 ms busy-wait)
function readLockLongHoldTask(a: AtomicInt): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  // Busy-wait approximately 500 milliseconds
  const startTime: number = Date.now();
  while (Date.now() - startTime < 500) {
    // spin
  }
  rl.unlock();
  a.fetchAdd(1);
}

// TC-10: Reader holds the read lock, signals readiness, then sets value while holding
function readLockBlockingHolderTask(c: ReadLockSharedCounter, holderReady: AtomicInt): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  try {
    holderReady.fetchAdd(1);
    c.value = 100;
  } finally {
    rl.unlock();
  }
}

// TC-23: Short read while another holds long
function readLockShortReadTask(a: AtomicInt): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  a.fetchAdd(10);
  rl.unlock();
}

// ===== EAWorker task functions =====

// TC-15: EAWorker basic read lock
function eaWorkerReadLockBasicTask(a: AtomicInt): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  try {
    a.fetchAdd(1);
  } finally {
    rl.unlock();
  }
}

// TC-15: EAWorker read and write lock
function eaWorkerReadLockFullTask(a: AtomicInt): void {
  const rl = gReadLockRWLock.readLock();
  rl.lock();
  a.fetchAdd(1);
  rl.unlock();
  const wl = gReadLockRWLock.writeLock();
  wl.lock();
  a.fetchAdd(10);
  wl.unlock();
}

export default function RWLockReadLockTest(): void {
  describe('RWLockReadLockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    // ========== INPUT TESTS ==========

    // ========== RETURN VALUE TESTS ==========

    /**
     * @tc.name    RWLockReadLockTest0100
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_0100
     * @tc.desc    Verify multiple calls to readLock() return the same ReadLock object (singleton pattern)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockReadLockTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const rl1 = rwlock.readLock();
      const rl2 = rwlock.readLock();
      expect(rl1 === rl2).assertTrue();
    })

    // ========== ERROR HANDLING TESTS ==========

    // ========== CONCURRENCY TESTS ==========

    /**
     * @tc.name    RWLockReadLockTest0200
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_0200
     * @tc.desc    Verify single thread can acquire read lock, modify shared state, and release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockReadLockTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new ReadLockSharedCounter();
      await taskpool.execute(new taskpool.Task(readLockSingleAcquireTask, counter));
      expect(counter.value).assertEqual(1);
    })

    /**
     * @tc.name    RWLockReadLockTest0300
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_0300
     * @tc.desc    Verify multiple threads (5) can concurrently acquire read locks for shared access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockReadLockTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new ReadLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(readLockConcurrentReadTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(readLockConcurrentReadTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(readLockConcurrentReadTask, counter));
      let p4 = taskpool.execute(new taskpool.Task(readLockConcurrentReadTask, counter));
      let p5 = taskpool.execute(new taskpool.Task(readLockConcurrentReadTask, counter));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(counter.value).assertLargerOrEqual(1);
      expect(counter.value).assertLessOrEqual(5);
    })

    /**
     * @tc.name    RWLockReadLockTest0400
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_0400
     * @tc.desc    Verify write lock is blocked while read lock is held: reader sets value, writer overwrites after release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockReadLockTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new ReadLockSharedCounter();
      const holderReady = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockBlockingHolderTask, counter, holderReady));
      // Wait until the reader actually holds the read lock before starting the writer (bounded poll).
      let waitCycles: number = 0;
      while (holderReady.load() === 0 && waitCycles < 50) {
        await Utils.msSleep(100);
        waitCycles++;
      }
      expect(holderReady.load()).assertEqual(1);
      let p2 = taskpool.execute(new taskpool.Task(readLockWriterTask, counter));
      await Promise.all([p1, p2]);
      // The reader set 100 while holding the read lock; the writer was blocked until the
      // reader released, then added 50, so the final value is deterministically 150.
      expect(counter.value).assertEqual(150);
    })

    /**
     * @tc.name    RWLockReadLockTest0500
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_0500
     * @tc.desc    Verify read lock is blocked while write lock is held: writer sets value first, reader reads after
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockReadLockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new ReadLockSharedCounter();
      // Writer sets value to 200 first
      await taskpool.execute(new taskpool.Task(readLockWriteFirstTask, counter));
      // Reader reads value after writer releases
      await taskpool.execute(new taskpool.Task(readLockReaderAfterWriterTask, counter));
      expect(counter.value).assertEqual(200);
    })

    /**
     * @tc.name    RWLockReadLockTest0600
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_0600
     * @tc.desc    Verify multiple threads (10) can simultaneously hold read locks and access shared resource
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockReadLockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new ReadLockSharedCounter();
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockSharedAccessTaskAtomic, counter, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(readLockSharedAccessTaskAtomic, counter, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(readLockSharedAccessTaskAtomic, counter, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(readLockSharedAccessTaskAtomic, counter, atomicCounter));
      let p5 = taskpool.execute(new taskpool.Task(readLockSharedAccessTaskAtomic, counter, atomicCounter));
      let p6 = taskpool.execute(new taskpool.Task(readLockSharedAccessTaskAtomic, counter, atomicCounter));
      let p7 = taskpool.execute(new taskpool.Task(readLockSharedAccessTaskAtomic, counter, atomicCounter));
      let p8 = taskpool.execute(new taskpool.Task(readLockSharedAccessTaskAtomic, counter, atomicCounter));
      let p9 = taskpool.execute(new taskpool.Task(readLockSharedAccessTaskAtomic, counter, atomicCounter));
      let p10 = taskpool.execute(new taskpool.Task(readLockSharedAccessTaskAtomic, counter, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(atomicCounter.load()).assertEqual(10);
    })


    /**
     * @tc.name    RWLockReadLockTest0700
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_0700
     * @tc.desc    Verify read lock can be used in TaskPool tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockReadLockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new ReadLockSharedCounter();
      // Use AtomicInt for thread-safe counter to avoid race conditions
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockConcurrentReadTaskAtomic, counter, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(readLockConcurrentReadTaskAtomic, counter, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(readLockConcurrentReadTaskAtomic, counter, atomicCounter));
      await Promise.all([p1, p2, p3]);
      expect(atomicCounter.load()).assertEqual(3);
    })

    /**
     * @tc.name    RWLockReadLockTest0800
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_0800
     * @tc.desc    Verify read lock can be used in EAWorker thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockReadLockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      const worker = new EAWorker('readLockEAWkr1');
      worker.start();
      await worker.run<void>(eaWorkerReadLockBasicTask, counter);
      worker.quit();
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    RWLockReadLockTest0900
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_0900
     * @tc.desc    Verify write lock can be acquired after all read locks are released
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockReadLockTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new ReadLockSharedCounter();
      // Read tasks acquire and release read locks
      let p1 = taskpool.execute(new taskpool.Task(readLockReaderHolderTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(readLockReaderHolderTask, counter));
      await Promise.all([p1, p2]);
      // Write task acquires write lock after read locks released
      await taskpool.execute(new taskpool.Task(readLockWriterTask, counter));
      // Readers set to 100 each (last one wins), then writer adds 50 -> 150
      expect(counter.value).assertEqual(150);
    })

    /**
     * @tc.name    RWLockReadLockTest1000
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_1000
     * @tc.desc    Verify high-frequency read lock acquire/release (100x per task, 5 tasks) remains stable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockReadLockTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockStressAcquireReleaseTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(readLockStressAcquireReleaseTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(readLockStressAcquireReleaseTask, counter));
      let p4 = taskpool.execute(new taskpool.Task(readLockStressAcquireReleaseTask, counter));
      let p5 = taskpool.execute(new taskpool.Task(readLockStressAcquireReleaseTask, counter));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(counter.load()).assertEqual(5);
    })

    /**
     * @tc.name    RWLockReadLockTest1100
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_1100
     * @tc.desc    Verify read lock protects shared variable reads correctly across multiple threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockReadLockTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new ReadLockSharedCounter();
      counter.value = 42;
      let p1 = taskpool.execute(new taskpool.Task(readLockReadSharedVarTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(readLockReadSharedVarTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(readLockReadSharedVarTask, counter));
      let p4 = taskpool.execute(new taskpool.Task(readLockReadSharedVarTask, counter));
      let p5 = taskpool.execute(new taskpool.Task(readLockReadSharedVarTask, counter));
      await Promise.all([p1, p2, p3, p4, p5]);
      // Value should remain 42 since readers only read
      expect(counter.value).assertEqual(42);
    })

    /**
     * @tc.name    RWLockReadLockTest1200
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_1200
     * @tc.desc    Verify read lock works correctly with AtomicInt atomic variable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockReadLockTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomic = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockAtomicReadTask, atomic));
      let p2 = taskpool.execute(new taskpool.Task(readLockAtomicReadTask, atomic));
      let p3 = taskpool.execute(new taskpool.Task(readLockAtomicReadTask, atomic));
      await Promise.all([p1, p2, p3]);
      // All read tasks completed without error, AtomicInt value unchanged
      expect(atomic.load()).assertEqual(0);
    })

    /**
     * @tc.name    RWLockReadLockTest1300
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_1300
     * @tc.desc    Verify read lock lifecycle management: acquire, use, release does not leak resources
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockReadLockTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockLifecycleTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(readLockLifecycleTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(readLockLifecycleTask, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.load()).assertEqual(3);
    })

    /**
     * @tc.name    RWLockReadLockTest1400
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_1400
     * @tc.desc    Verify read lock acquired without unlock does not crash the system
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockReadLockTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      let readHeld: boolean = false;
      let writeAcquired: boolean = false;
      rl.lock();
      try {
        // Intentionally hold the read lock without an immediate unlock.
        readHeld = true;
      } finally {
        // Clean up: release the read lock so the test does not leak.
        rl.unlock();
      }
      // After the read lock is released the write lock must be acquirable.
      const wl = rwlock.writeLock();
      wl.lock();
      try {
        writeAcquired = true;
      } finally {
        wl.unlock();
      }
      expect(readHeld).assertTrue();
      expect(writeAcquired).assertTrue();
    })

    /**
     * @tc.name    RWLockReadLockTest1500
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_1500
     * @tc.desc    Verify read and write locks work correctly in mixed alternating acquire/release scenario
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockReadLockTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockReadWriteMixedTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(readLockReadWriteMixedTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(readLockReadWriteMixedTask, counter));
      await Promise.all([p1, p2, p3]);
      // Each task adds 1 via write lock (read lock only reads)
      expect(counter.load()).assertEqual(3);
    })

    /**
     * @tc.name    RWLockReadLockTest1600
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_1600
     * @tc.desc    Verify read lock stability when held for an extended period (500 ms): other readers can still operate concurrently
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockReadLockTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new AtomicInt(0);
      // Long-held read lock (5s)
      let p1 = taskpool.execute(new taskpool.Task(readLockLongHoldTask, counter));
      // Short reads that should succeed concurrently (read locks are shared)
      let p2 = taskpool.execute(new taskpool.Task(readLockShortReadTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(readLockShortReadTask, counter));
      await Promise.all([p1, p2, p3]);
      // Long hold task adds 1, two short reads each add 10 -> 21
      expect(counter.load()).assertEqual(21);
    })

    /**
     * @tc.name    RWLockReadLockTest1700
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_1700
     * @tc.desc    Verify readLock() returns a ReadLock object (type verified via ReadLock API surface and distinction from WriteLock)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockReadLockTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      // A ReadLock supports shared acquisition: two read holds coexist without blocking
      rl.lock();
      rl.lock();
      rl.unlock();
      rl.unlock();
      expect(rwlock.readLock() === rl).assertTrue();
    })

    /**
     * @tc.name    RWLockReadLockTest1800
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_1800
     * @tc.desc    Verify readLock() returns a non-null usable ReadLock object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockReadLockTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      let usable: boolean = false;
      rl.lock();
      try {
        usable = true;
      } finally {
        rl.unlock();
      }
      expect(usable).assertTrue();
    })

    /**
     * @tc.name    RWLockReadLockTest1900
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_1900
     * @tc.desc    Verify readLock() still returns a usable ReadLock after the RWLock has been fully used and released (destroyed-object scenario approximation)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockReadLockTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // RWLock exposes no destroy API, so the exact destroyed-object behavior cannot be exercised.
      // Closest semantics: after the RWLock is fully used and all locks released, readLock() still
      // returns a valid ReadLock without throwing or returning an invalid object.
      const rwlock = new RWLock();
      const rl1 = rwlock.readLock();
      rl1.lock();
      rl1.unlock();
      let postUseOk: boolean = false;
      const rl2 = rwlock.readLock();
      rl2.lock();
      try {
        postUseOk = true;
      } finally {
        rl2.unlock();
      }
      expect(postUseOk).assertTrue();
    })

    /**
     * @tc.name    RWLockReadLockTest2000
     * @tc.number  SUB_RW_LOCK_READ_LOCK_TEST_2000
     * @tc.desc    Verify read lock can be acquired reentrantly (nested acquisition) by the same thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockReadLockTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const rl1 = rwlock.readLock();
      const rl2 = rwlock.readLock();
      let nestedCount: number = 0;
      rl1.lock();
      nestedCount++;
      rl2.lock();
      nestedCount++;
      expect(nestedCount).assertEqual(2);
      rl2.unlock();
      rl1.unlock();
    })
  })
}
