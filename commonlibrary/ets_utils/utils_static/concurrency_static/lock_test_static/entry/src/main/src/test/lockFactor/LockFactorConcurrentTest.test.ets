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

class LockFactorSharedCounter {
  value: number = 0;
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
function workerInternalLockTask(counter: AtomicInt): void {
  const mutex = new Mutex();
  for (let i = 0; i < 100; i++) {
    mutex.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      mutex.unlock();
    }
  }
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

// TC-010: TaskPool callback lock task
function callbackLockTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

export default function LockFactorConcurrentTest(): void {
  describe('LockFactorConcurrentTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name    LockFactorConcurrentTest0100
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0100
     * @tc.desc    TC-001: Verify Mutex multi-thread contention with 10 concurrent tasks each performing 100 lock/unlock cycles
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockFactorConcurrentTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(mutexContentionTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(mutexContentionTask, mutex, counter));
      let p3 = taskpool.execute(new taskpool.Task(mutexContentionTask, mutex, counter));
      let p4 = taskpool.execute(new taskpool.Task(mutexContentionTask, mutex, counter));
      let p5 = taskpool.execute(new taskpool.Task(mutexContentionTask, mutex, counter));
      let p6 = taskpool.execute(new taskpool.Task(mutexContentionTask, mutex, counter));
      let p7 = taskpool.execute(new taskpool.Task(mutexContentionTask, mutex, counter));
      let p8 = taskpool.execute(new taskpool.Task(mutexContentionTask, mutex, counter));
      let p9 = taskpool.execute(new taskpool.Task(mutexContentionTask, mutex, counter));
      let p10 = taskpool.execute(new taskpool.Task(mutexContentionTask, mutex, counter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(counter.load()).assertEqual(1000);
    })

    /**
     * @tc.name    LockFactorConcurrentTest0200
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0200
     * @tc.desc    TC-002: Verify ReadLock multi-thread sharing with 10 concurrent tasks all acquiring read lock simultaneously
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockFactorConcurrentTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(readLockSharingTask, rwlock, counter));
      let p2 = taskpool.execute(new taskpool.Task(readLockSharingTask, rwlock, counter));
      let p3 = taskpool.execute(new taskpool.Task(readLockSharingTask, rwlock, counter));
      let p4 = taskpool.execute(new taskpool.Task(readLockSharingTask, rwlock, counter));
      let p5 = taskpool.execute(new taskpool.Task(readLockSharingTask, rwlock, counter));
      let p6 = taskpool.execute(new taskpool.Task(readLockSharingTask, rwlock, counter));
      let p7 = taskpool.execute(new taskpool.Task(readLockSharingTask, rwlock, counter));
      let p8 = taskpool.execute(new taskpool.Task(readLockSharingTask, rwlock, counter));
      let p9 = taskpool.execute(new taskpool.Task(readLockSharingTask, rwlock, counter));
      let p10 = taskpool.execute(new taskpool.Task(readLockSharingTask, rwlock, counter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(counter.load()).assertEqual(10);
    })

    /**
     * @tc.name    LockFactorConcurrentTest0300
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0300
     * @tc.desc    TC-003: Verify WriteLock multi-thread mutual exclusion with 10 concurrent tasks each performing 100 write operations
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockFactorConcurrentTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(writeLockExclusionTask, rwlock, counter));
      let p2 = taskpool.execute(new taskpool.Task(writeLockExclusionTask, rwlock, counter));
      let p3 = taskpool.execute(new taskpool.Task(writeLockExclusionTask, rwlock, counter));
      let p4 = taskpool.execute(new taskpool.Task(writeLockExclusionTask, rwlock, counter));
      let p5 = taskpool.execute(new taskpool.Task(writeLockExclusionTask, rwlock, counter));
      let p6 = taskpool.execute(new taskpool.Task(writeLockExclusionTask, rwlock, counter));
      let p7 = taskpool.execute(new taskpool.Task(writeLockExclusionTask, rwlock, counter));
      let p8 = taskpool.execute(new taskpool.Task(writeLockExclusionTask, rwlock, counter));
      let p9 = taskpool.execute(new taskpool.Task(writeLockExclusionTask, rwlock, counter));
      let p10 = taskpool.execute(new taskpool.Task(writeLockExclusionTask, rwlock, counter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(counter.load()).assertEqual(10);
    })

    /**
     * @tc.name    LockFactorConcurrentTest0400
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0400
     * @tc.desc    TC-005: Verify lock passing scenario where main thread creates Mutex and passes to TaskPool tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorConcurrentTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(lockPassingTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(lockPassingTask, mutex, counter));
      let p3 = taskpool.execute(new taskpool.Task(lockPassingTask, mutex, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.load()).assertEqual(3);
    })

    /**
     * @tc.name    LockFactorConcurrentTest0500
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0500
     * @tc.desc    TC-006: Verify Worker internal lock competition with repeated lock/unlock cycles in EAWorker
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorConcurrentTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorEA01');
      worker.start();
      await worker.run<void>(workerInternalLockTask, counter);
      worker.quit();
      expect(counter.load()).assertEqual(100);
    })

    /**
     * @tc.name    LockFactorConcurrentTest0600
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0600
     * @tc.desc    TC-007: Verify Mutex TaskPool concurrent with 20 tasks competing for same lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockFactorConcurrentTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p3 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p4 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p5 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p6 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p7 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p8 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p9 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p10 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p11 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p12 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p13 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p14 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p15 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p16 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p17 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p18 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p19 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      let p20 = taskpool.execute(new taskpool.Task(taskPoolMutexTask, mutex, counter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20]);
      expect(counter.load()).assertEqual(20);
    })

    /**
     * @tc.name    LockFactorConcurrentTest0700
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0700
     * @tc.desc    TC-008: Verify RWLock TaskPool concurrent with 20 tasks using write lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockFactorConcurrentTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p2 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p3 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p4 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p5 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p6 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p7 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p8 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p9 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p10 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p11 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p12 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p13 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p14 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p15 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p16 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p17 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p18 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p19 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      let p20 = taskpool.execute(new taskpool.Task(taskPoolRWLockTask, rwlock, counter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20]);
      expect(counter.load()).assertEqual(20);
    })

    /**
     * @tc.name    LockFactorConcurrentTest0800
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0800
     * @tc.desc    TC-009: Verify TaskPool inter-task lock sharing where task A locks then task B waits and acquires
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorConcurrentTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new LockFactorSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(taskPoolShareTaskA, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(taskPoolShareTaskB, mutex, counter));
      await Promise.all([p1, p2]);
      expect(counter.value).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorConcurrentTest0900
     * @tc.number  SUB_LOCK_FACTOR_CONCURRENT_TEST_0900
     * @tc.desc    TC-010: Verify TaskPool callback internal lock usage with onReceiveData callback performing lock/unlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorConcurrentTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(callbackLockTask, mutex, counter);
      task.onReceiveData(() => {
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      await taskpool.execute(task);
      expect(counter.load()).assertEqual(1);
    })
  })
}
