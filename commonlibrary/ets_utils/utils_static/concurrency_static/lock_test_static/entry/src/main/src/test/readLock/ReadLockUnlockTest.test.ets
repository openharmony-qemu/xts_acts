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
  })
}
