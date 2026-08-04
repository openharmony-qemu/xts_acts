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

class UnlockSharedCounter {
  value: number = 0;
}

const gUnlockRWLock: RWLock = new RWLock();

function unlockBasicReadTask(c: UnlockSharedCounter): void {
  const rl = gUnlockRWLock.readLock();
  rl.lock();
  try {
    c.value = 1;
  } finally {
    rl.unlock();
  }
}

function unlockAtomicIncrementTask(a: AtomicInt): void {
  const rl = gUnlockRWLock.readLock();
  rl.lock();
  try {
    a.fetchAdd(1);
  } finally {
    rl.unlock();
  }
}

function unlockWriteAdd100Task(c: UnlockSharedCounter): void {
  const wl = gUnlockRWLock.writeLock();
  wl.lock();
  try {
    c.value = c.value + 100;
  } finally {
    wl.unlock();
  }
}

function unlockStressCycleTask(a: AtomicInt): void {
  for (let i = 0; i < 1000; i++) {
    const rl = gUnlockRWLock.readLock();
    rl.lock();
    rl.unlock();
  }
  a.fetchAdd(1);
}

function unlockReadSetValueTask(c: UnlockSharedCounter): void {
  const rl = gUnlockRWLock.readLock();
  rl.lock();
  try {
    c.value = 100;
  } finally {
    rl.unlock();
  }
}

function eaWorkerUnlockTask(a: AtomicInt): void {
  const rl = gUnlockRWLock.readLock();
  rl.lock();
  try {
    a.fetchAdd(1);
  } finally {
    rl.unlock();
  }
}

function unlockReadAndNotifyTask(a: AtomicInt): void {
  const rl = gUnlockRWLock.readLock();
  rl.lock();
  a.fetchAdd(1);
  rl.unlock();
}

function unlockSharedDataReadTask(c: UnlockSharedCounter): void {
  const rl = gUnlockRWLock.readLock();
  rl.lock();
  try {
    let temp: number = c.value;
    temp = temp + 0;
  } finally {
    rl.unlock();
  }
}

// TC-009/TC-014/TC-017: other-thread unlock task; result 1 = unlock succeeded, 2 = threw
function unlockFromOtherThreadTask(rwlock: RWLock, result: AtomicInt): void {
  const rl = rwlock.readLock();
  try {
    rl.unlock();
    result.store(1);
  } catch (e) {
    result.store(2);
  }
}

export default function ReadLockUnlockTest(): void {
  describe('ReadLockUnlockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    // ========== INPUT TESTS ==========

    // ========== RETURN VALUE TESTS ==========

    /**
     * @tc.name    ReadLockUnlockTest0100
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_0100
     * @tc.desc    Verify consecutive unlock() calls throw error on second call
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockUnlockTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      rl.lock();
      rl.unlock();
      let secondUnlockThrew: boolean = false;
      try {
        rl.unlock();
      } catch (e) {
        secondUnlockThrew = true;
      }
      expect(secondUnlockThrew).assertTrue();
    })

    // ========== ERROR HANDLING TESTS ==========

    /**
     * @tc.name    ReadLockUnlockTest0200
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_0200
     * @tc.desc    Verify unlocking a read lock that was never locked throws an error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockUnlockTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      let threw: boolean = false;
      try {
        rl.unlock();
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    })

    /**
     * @tc.name    ReadLockUnlockTest0300
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_0300
     * @tc.desc    Verify calling unlock() on read lock while write lock is held throws an error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockUnlockTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      wl.lock();
      const rl = rwlock.readLock();
      let threw: boolean = false;
      try {
        rl.unlock();
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      wl.unlock();
    })

    /**
     * @tc.name    ReadLockUnlockTest0400
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_0400
     * @tc.desc    Verify same thread repeated unlock throws error on second call
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockUnlockTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      rl.lock();
      rl.unlock();
      let secondThrew: boolean = false;
      try {
        rl.unlock();
      } catch (e) {
        secondThrew = true;
      }
      expect(secondThrew).assertTrue();
    })

    // ========== CONCURRENCY TESTS - BASIC ==========

    /**
     * @tc.name    ReadLockUnlockTest0500
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_0500
     * @tc.desc    Verify single thread normal lock-unlock flow completes without error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockUnlockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      let state: number = 0;
      rl.lock();
      state = 42;
      rl.unlock();
      expect(state).assertEqual(42);
    })

    /**
     * @tc.name    ReadLockUnlockTest0600
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_0600
     * @tc.desc    Verify multiple threads concurrently hold read locks and release independently
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ReadLockUnlockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p5 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(atomicCounter.load()).assertEqual(5);
    })

    /**
     * @tc.name    ReadLockUnlockTest0700
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_0700
     * @tc.desc    Verify read lock acquisition in main thread with taskpool task completing independently
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockUnlockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      rl.lock();
      let taskCompleted: boolean = false;
      let p1 = taskpool.execute(new taskpool.Task(unlockReadAndNotifyTask, new AtomicInt(0)));
      await p1;
      taskCompleted = true;
      rl.unlock();
      expect(taskCompleted).assertTrue();
    })

    /**
     * @tc.name    ReadLockUnlockTest0800
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_0800
     * @tc.desc    Verify high concurrency with 10 threads releasing read locks simultaneously
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockUnlockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicCounter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p2 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p3 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p4 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p5 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p6 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p7 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p8 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p9 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      let p10 = taskpool.execute(new taskpool.Task(unlockAtomicIncrementTask, atomicCounter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(atomicCounter.load()).assertEqual(10);
    })

    /**
     * @tc.name    ReadLockUnlockTest0900
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_0900
     * @tc.desc    Verify taskpool task completes read lock and unlock correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockUnlockTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new UnlockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(unlockBasicReadTask, counter));
      await p1;
      expect(counter.value).assertEqual(1);
    })

    /**
     * @tc.name    ReadLockUnlockTest1000
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_1000
     * @tc.desc    Verify write lock can be acquired after read lock is released by taskpool thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockUnlockTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new UnlockSharedCounter();
      await taskpool.execute(new taskpool.Task(unlockReadSetValueTask, counter));
      await taskpool.execute(new taskpool.Task(unlockWriteAdd100Task, counter));
      expect(counter.value).assertEqual(200);
    })

    /**
     * @tc.name    ReadLockUnlockTest1100
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_1100
     * @tc.desc    Verify shared data visibility after read lock unlock in concurrent scenario
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockUnlockTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new UnlockSharedCounter();
      counter.value = 50;
      let p1 = taskpool.execute(new taskpool.Task(unlockSharedDataReadTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(unlockSharedDataReadTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(unlockSharedDataReadTask, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.value).assertEqual(50);
    })

    // ========== RETURN VALUE TESTS - EXTENDED ==========

    /**
     * @tc.name    ReadLockUnlockTest1200
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_1200
     * @tc.desc    TC-003: Verify ReadLock.unlock() returns void and releases the lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockUnlockTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      rl.lock();
      // unlock() returns void: verified at compile time by assigning to a void variable
      let result: void = rl.unlock();
      // Side effect verification: write lock can be acquired after unlock
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

    // ========== ERROR HANDLING TESTS - EXTENDED ==========

    /**
     * @tc.name    ReadLockUnlockTest1300
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_1300
     * @tc.desc    TC-009: Verify unlock() from a different thread succeeds on a read lock held by main thread (count-based, no owner check)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockUnlockTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      const releaseResult = new AtomicInt(0);
      rl.lock();
      // Another thread (TaskPool task) releases the read lock held by this thread
      let p1 = taskpool.execute(new taskpool.Task(unlockFromOtherThreadTask, rwlock, releaseResult));
      await p1;
      // Runtime semantics: read lock is count-based without owner tracking, so unlock succeeds (result=1)
      expect(releaseResult.load()).assertEqual(1);
      // Read count was released by the other thread; second unlock by this thread throws
      let secondUnlockThrew: boolean = false;
      try {
        rl.unlock();
      } catch (e) {
        secondUnlockThrew = true;
      }
      expect(secondUnlockThrew).assertTrue();
    })

    /**
     * @tc.name    ReadLockUnlockTest1400
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_1400
     * @tc.desc    TC-010: Verify unlock() throws after the lock is fully released (closest semantics of a destroyed lock; no destroy API)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockUnlockTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      rl.lock();
      rl.unlock();
      // Lock fully released (closest to destroyed state): unlock again throws
      let threw: boolean = false;
      try {
        rl.unlock();
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      // Unlike a truly destroyed lock, the object can still be re-acquired and released
      let reusable: boolean = false;
      try {
        rl.lock();
        reusable = true;
        rl.unlock();
      } catch (e) {
        reusable = false;
      }
      expect(reusable).assertTrue();
    })

    // ========== CONCURRENCY TESTS - EXTENDED ==========

    /**
     * @tc.name    ReadLockUnlockTest1500
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_1500
     * @tc.desc    TC-012: Verify multiple lock() calls are released one by one by matching unlock() calls
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ReadLockUnlockTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      const times: number = 3;
      for (let i = 0; i < times; i++) {
        rl.lock();
      }
      // Release locks one by one (read count decrements each time)
      for (let i = 0; i < times; i++) {
        rl.unlock();
      }
      // Count reached 0: extra unlock throws
      let extraUnlockThrew: boolean = false;
      try {
        rl.unlock();
      } catch (e) {
        extraUnlockThrew = true;
      }
      expect(extraUnlockThrew).assertTrue();
      // Count reached 0: write lock can be acquired
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

    /**
     * @tc.name    ReadLockUnlockTest1600
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_1600
     * @tc.desc    TC-014: Verify thread B (EAWorker) releasing read lock held by thread A succeeds (count-based ownership behavior)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockUnlockTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      const releaseResult = new AtomicInt(0);
      const worker = new EAWorker('readLockUnlockOwnership');
      worker.start();
      rl.lock();
      // Thread B (EAWorker) releases the read lock held by thread A (main thread)
      await worker.run<void>(unlockFromOtherThreadTask, rwlock, releaseResult);
      // Runtime semantics: read lock does not track the owner, so B's unlock succeeds (result=1)
      expect(releaseResult.load()).assertEqual(1);
      // Lock state is not corrupted: main thread can re-acquire and release
      let reacquired: boolean = false;
      try {
        rl.lock();
        reacquired = true;
        rl.unlock();
      } catch (e) {
        reacquired = false;
      }
      expect(reacquired).assertTrue();
      worker.quit();
    })

    /**
     * @tc.name    ReadLockUnlockTest1700
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_1700
     * @tc.desc    TC-015: Verify fast lock/unlock loop (5000 cycles) completes without deadlock or error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockUnlockTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      const cycles: number = 5000;
      for (let i = 0; i < cycles; i++) {
        rl.lock();
        rl.unlock();
      }
      // After the loop there is no deadlock and the lock is still usable
      let stillUsable: boolean = false;
      try {
        rl.lock();
        stillUsable = true;
        rl.unlock();
      } catch (e) {
        stillUsable = false;
      }
      expect(stillUsable).assertTrue();
    })

    /**
     * @tc.name    ReadLockUnlockTest1800
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_1800
     * @tc.desc    TC-017: Verify child thread (EAWorker) unlock() releases a read lock locked by the main thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockUnlockTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      const releaseResult = new AtomicInt(0);
      const worker = new EAWorker('readLockUnlockChild');
      worker.start();
      rl.lock();
      // Main thread locks, child thread unlocks
      await worker.run<void>(unlockFromOtherThreadTask, rwlock, releaseResult);
      // Runtime semantics: count-based read lock allows the child thread to release the main thread's lock (result=1)
      expect(releaseResult.load()).assertEqual(1);
      // Read lock has been released by the child thread: write lock can be acquired (state fully restored)
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
      worker.quit();
    })

    /**
     * @tc.name    ReadLockUnlockTest1900
     * @tc.number  SUB_READ_LOCK_UNLOCK_TEST_1900
     * @tc.desc    TC-018: Verify immediate unlock right after lock() works without race error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ReadLockUnlockTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      let quickUnlockOk: boolean = false;
      try {
        rl.lock();
        rl.unlock();
        quickUnlockOk = true;
      } catch (e) {
        quickUnlockOk = false;
      }
      expect(quickUnlockOk).assertTrue();
      // After the immediate lock/unlock the count is 0: write lock can be acquired
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
