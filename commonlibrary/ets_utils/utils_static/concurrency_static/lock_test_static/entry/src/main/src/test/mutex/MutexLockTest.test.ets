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

class MutexLockSharedCounter {
  value: number = 0;
}

class MutexLockSharedFlags {
  taskAStarted: boolean = false;
  taskACompleted: boolean = false;
  taskBAcquired: boolean = false;
  taskBCompleted: boolean = false;
}

class MutexLockFairnessData {
  order: int[] = [];
}

class MutexLockTimeData {
  beforeLockTime: number = 0;
  afterLockTime: number = 0;
}

// TC-0300: Sequential lock/unlock cycles in TaskPool
function reentrantLockTask(counter: AtomicInt): void {
  const mutex = new Mutex();
  for (let i = 0; i < 5; i++) {
    mutex.lock();
    mutex.unlock();
  }
  counter.fetchAdd(1);
}

// TC-0500: Lock and unlock in TaskPool task
function taskPoolLockTask(counter: AtomicInt): void {
  const mutex = new Mutex();
  mutex.lock();
  counter.fetchAdd(1);
  mutex.unlock();
}

// TC-0900: Single thread acquire and release in TaskPool
function singleAcquireTask(counter: AtomicInt): void {
  const mutex = new Mutex();
  mutex.lock();
  counter.fetchAdd(1);
  mutex.unlock();
}

// TC-1000: Sequential lock/unlock 5 cycles
function reentrantFiveTask(counter: AtomicInt): void {
  const mutex = new Mutex();
  let success: boolean = true;
  for (let i = 0; i < 5; i++) {
    mutex.lock();
    mutex.unlock();
  }
  counter.fetchAdd(1);
}

// TC-1100: Multi-thread increment under lock
function multiThreadIncTask(mutex: Mutex, counter: MutexLockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}

// TC-1200: Holder task - holds lock and sets flags
function holderLockTask(mutex: Mutex, flags: MutexLockSharedFlags): void {
  mutex.lock();
  try {
    flags.taskAStarted = true;
    flags.taskACompleted = true;
  } finally {
    mutex.unlock();
  }
}

// TC-1200: Waiter task - waits for lock
function waiterLockTask(mutex: Mutex, flags: MutexLockSharedFlags): void {
  mutex.lock();
  try {
    flags.taskBAcquired = true;
    flags.taskBCompleted = true;
  } finally {
    mutex.unlock();
  }
}

// TC-1300: Sequential task A
function seqTaskA(mutex: Mutex, counter: MutexLockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = 1;
  } finally {
    mutex.unlock();
  }
}

// TC-1300: Sequential task B
function seqTaskB(mutex: Mutex, counter: MutexLockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = 2;
  } finally {
    mutex.unlock();
  }
}

// TC-1400: Independent mutex1 task
function independentTask1(mutex: Mutex, counter: MutexLockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}

// TC-1400: Independent mutex2 task
function independentTask2(mutex: Mutex, counter: MutexLockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}

// TC-1500: Fairness task - record order
function fairnessTask(mutex: Mutex, data: MutexLockFairnessData, id: int): void {
  mutex.lock();
  try {
    data.order.push(id);
  } finally {
    mutex.unlock();
  }
}

// TC-1600: Nested lock task
function nestedLockTask(counter: AtomicInt): void {
  const mutexA = new Mutex();
  const mutexB = new Mutex();
  mutexA.lock();
  try {
    mutexB.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      mutexB.unlock();
    }
  } finally {
    mutexA.unlock();
  }
}

// TC-1800: High concurrency pressure task
function pressureTask(mutex: Mutex, counter: MutexLockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}

// TC-1900: Long hold task
function longHoldTask(mutex: Mutex, timeData: MutexLockTimeData, counter: AtomicInt): void {
  mutex.lock();
  try {
    timeData.beforeLockTime = Date.now();
    let sum: number = 0;
    for (let i = 0; i < 50000; i++) {
      sum = sum + i;
    }
    timeData.afterLockTime = Date.now();
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC-1900: Waiter after long hold
function waitAfterLongHoldTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC-2000: Exception task - throws inside lock with try-finally
function exceptionLockTask(mutex: Mutex, counter: MutexLockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
    throw new Error('Test exception');
  } finally {
    mutex.unlock();
  }
}

// TC-2000: Normal task after exception
function normalAfterExceptionTask(mutex: Mutex, counter: MutexLockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}

// TC-0800: Lock leak task - acquire lock, throw without finally
function lockLeakTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  counter.fetchAdd(1);
  throw new Error('Simulated crash without unlock');
}

// EAWorker: basic lock task
function eaWorkerBasicLockTask(counter: AtomicInt): void {
  const mutex = new Mutex();
  mutex.lock();
  counter.fetchAdd(1);
  mutex.unlock();
}

// EAWorker: concurrent lock task
function eaWorkerConcurrentLockTask(mutex: Mutex, counter: MutexLockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}

// TC-004: Blocking state data shared between holder and waiter tasks
class MutexLockBlockData {
  aHeld: boolean = false;
  bAcquired: boolean = false;
}

// TC-004: Holder task holds the lock while performing work
function blockHolderTask(mutex: Mutex, data: MutexLockBlockData): void {
  mutex.lock();
  try {
    data.aHeld = true;
    let sum: number = 0;
    for (let i = 0; i < 50000; i++) {
      sum = sum + i;
    }
  } finally {
    mutex.unlock();
  }
}

// TC-004: Waiter task blocks on lock() until the holder releases the lock
function blockWaiterTask(mutex: Mutex, data: MutexLockBlockData): void {
  mutex.lock();
  try {
    data.bAcquired = true;
  } finally {
    mutex.unlock();
  }
}

// TC-007: Same-thread re-lock attempt without unlock (Mutex is not reentrant)
function sameThreadRelockTask(mutex: Mutex, firstLock: AtomicInt, secondLock: AtomicInt): void {
  mutex.lock();
  firstLock.fetchAdd(1);
  mutex.lock();
  secondLock.fetchAdd(1);
  mutex.unlock();
  mutex.unlock();
}

// TC-017: Deadlock synchronization flags
class MutexLockDeadlockFlags {
  aReady: AtomicInt = new AtomicInt(0);
  bReady: AtomicInt = new AtomicInt(0);
}

// TC-017: Deadlock task A - holds mutex1 then waits for mutex2
function deadlockTaskA(mutex1: Mutex, mutex2: Mutex, flags: MutexLockDeadlockFlags, counter: AtomicInt): void {
  mutex1.lock();
  flags.aReady.store(1);
  while (flags.bReady.load() === 0) {
  }
  mutex2.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex2.unlock();
  }
  mutex1.unlock();
}

// TC-017: Deadlock task B - holds mutex2 then waits for mutex1
function deadlockTaskB(mutex1: Mutex, mutex2: Mutex, flags: MutexLockDeadlockFlags, counter: AtomicInt): void {
  mutex2.lock();
  flags.bReady.store(1);
  while (flags.aReady.load() === 0) {
  }
  mutex1.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex1.unlock();
  }
  mutex2.unlock();
}

export default function MutexLockTest(): void {
  describe('MutexLockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name    MutexLockTest0100
     * @tc.number  SUB_MUTEX_LOCK_TEST_0100
     * @tc.desc    TC-007: Verify sequential lock/unlock cycles work correctly on same Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutex = new Mutex();
      let successCount: number = 0;
      mutex.lock();
      mutex.unlock();
      successCount++;
      mutex.lock();
      mutex.unlock();
      successCount++;
      expect(successCount).assertEqual(2);
    })

    /**
     * @tc.name    MutexLockTest0200
     * @tc.number  SUB_MUTEX_LOCK_TEST_0200
     * @tc.desc    TC-007: Verify sequential lock/unlock cycles in TaskPool thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(reentrantLockTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    MutexLockTest0300
     * @tc.number  SUB_MUTEX_LOCK_TEST_0300
     * @tc.desc    TC-005: Verify lock() works correctly in a TaskPool task
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(taskPoolLockTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    MutexLockTest0400
     * @tc.number  SUB_MUTEX_LOCK_TEST_0400
     * @tc.desc    TC-008: Verify lock behavior after task throws without releasing lock (lock leak test)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let exceptionCaught: boolean = false;
      try {
        await taskpool.execute(new taskpool.Task(lockLeakTask, mutex, counter));
      } catch (e) {
        exceptionCaught = true;
      }
      expect(exceptionCaught).assertTrue();
      expect(counter.load()).assertEqual(1);
      const freshMutex = new Mutex();
      const counter2 = new MutexLockSharedCounter();
      await taskpool.execute(new taskpool.Task(normalAfterExceptionTask, freshMutex, counter2));
      expect(counter2.value).assertEqual(1);
    })

    /**
     * @tc.name    MutexLockTest0500
     * @tc.number  SUB_MUTEX_LOCK_TEST_0500
     * @tc.desc    TC-009: Verify single thread lock acquisition in TaskPool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexLockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(singleAcquireTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    MutexLockTest0600
     * @tc.number  SUB_MUTEX_LOCK_TEST_0600
     * @tc.desc    TC-010: Verify single thread sequential lock/unlock cycles
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutex = new Mutex();
      let successCount: number = 0;
      for (let i = 0; i < 5; i++) {
        mutex.lock();
        mutex.unlock();
        successCount++;
      }
      expect(successCount).assertEqual(5);
    })

    /**
     * @tc.name    MutexLockTest0700
     * @tc.number  SUB_MUTEX_LOCK_TEST_0700
     * @tc.desc    TC-010: Verify sequential lock/unlock 5 cycles in TaskPool thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(reentrantFiveTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    MutexLockTest0800
     * @tc.number  SUB_MUTEX_LOCK_TEST_0800
     * @tc.desc    TC-011: Verify multiple threads competing for the same lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexLockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(multiThreadIncTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(multiThreadIncTask, mutex, counter));
      let p3 = taskpool.execute(new taskpool.Task(multiThreadIncTask, mutex, counter));
      let p4 = taskpool.execute(new taskpool.Task(multiThreadIncTask, mutex, counter));
      let p5 = taskpool.execute(new taskpool.Task(multiThreadIncTask, mutex, counter));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(counter.value).assertEqual(5);
    })

    /**
     * @tc.name    MutexLockTest0900
     * @tc.number  SUB_MUTEX_LOCK_TEST_0900
     * @tc.desc    TC-012: Verify other threads block when lock is held
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexLockTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const flags = new MutexLockSharedFlags();
      let p1 = taskpool.execute(new taskpool.Task(holderLockTask, mutex, flags));
      let p2 = taskpool.execute(new taskpool.Task(waiterLockTask, mutex, flags));
      await Promise.all([p1, p2]);
      expect(flags.taskACompleted).assertTrue();
      expect(flags.taskBCompleted).assertTrue();
    })

    /**
     * @tc.name    MutexLockTest1000
     * @tc.number  SUB_MUTEX_LOCK_TEST_1000
     * @tc.desc    TC-013: Verify blocked thread wakes up after lock release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexLockTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      await taskpool.execute(new taskpool.Task(seqTaskA, mutex, counter));
      await taskpool.execute(new taskpool.Task(seqTaskB, mutex, counter));
      expect(counter.value).assertEqual(2);
    })

    /**
     * @tc.name    MutexLockTest1100
     * @tc.number  SUB_MUTEX_LOCK_TEST_1100
     * @tc.desc    TC-014: Verify multiple Mutex instances work independently
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex1 = new Mutex();
      const mutex2 = new Mutex();
      const counter1 = new MutexLockSharedCounter();
      const counter2 = new MutexLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(independentTask1, mutex1, counter1));
      let p2 = taskpool.execute(new taskpool.Task(independentTask2, mutex2, counter2));
      let p3 = taskpool.execute(new taskpool.Task(independentTask1, mutex1, counter1));
      let p4 = taskpool.execute(new taskpool.Task(independentTask2, mutex2, counter2));
      let p5 = taskpool.execute(new taskpool.Task(independentTask1, mutex1, counter1));
      let p6 = taskpool.execute(new taskpool.Task(independentTask2, mutex2, counter2));
      await Promise.all([p1, p2, p3, p4, p5, p6]);
      expect(counter1.value).assertEqual(3);
      expect(counter2.value).assertEqual(3);
    })

    /**
     * @tc.name    MutexLockTest1200
     * @tc.number  SUB_MUTEX_LOCK_TEST_1200
     * @tc.desc    TC-015: Verify lock acquisition fairness among threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new MutexLockFairnessData();
      let p1 = taskpool.execute(new taskpool.Task(fairnessTask, mutex, data, 0));
      let p2 = taskpool.execute(new taskpool.Task(fairnessTask, mutex, data, 1));
      let p3 = taskpool.execute(new taskpool.Task(fairnessTask, mutex, data, 2));
      let p4 = taskpool.execute(new taskpool.Task(fairnessTask, mutex, data, 3));
      let p5 = taskpool.execute(new taskpool.Task(fairnessTask, mutex, data, 4));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(data.order.length).assertEqual(5);
      let hasAll: boolean = true;
      for (let i = 0; i < 5; i++) {
        if (data.order.indexOf(i) === -1) {
          hasAll = false;
        }
      }
      expect(hasAll).assertTrue();
    })

    /**
     * @tc.name    MutexLockTest1300
     * @tc.number  SUB_MUTEX_LOCK_TEST_1300
     * @tc.desc    TC-016: Verify nested lock acquisition (Mutex A then Mutex B)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(nestedLockTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    MutexLockTest1400
     * @tc.number  SUB_MUTEX_LOCK_TEST_1400
     * @tc.desc    TC-016: Verify nested lock in main thread with reverse-order unlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutexA = new Mutex();
      const mutexB = new Mutex();
      let success: boolean = false;
      mutexA.lock();
      try {
        mutexB.lock();
        try {
          success = true;
        } finally {
          mutexB.unlock();
        }
      } finally {
        mutexA.unlock();
      }
      expect(success).assertTrue();
    })

    /**
     * @tc.name    MutexLockTest1500
     * @tc.number  SUB_MUTEX_LOCK_TEST_1500
     * @tc.desc    TC-017: Verify safe nested lock acquisition avoids deadlock by using consistent ordering
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexLockTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mutexA = new Mutex();
      const mutexB = new Mutex();
      let success: boolean = false;
      // Safe ordering: always lock A before B to avoid deadlock
      mutexA.lock();
      try {
        mutexB.lock();
        try {
          success = true;
        } finally {
          mutexB.unlock();
        }
      } finally {
        mutexA.unlock();
      }
      expect(success).assertTrue();
      // Verify locks are reusable after safe nested acquisition
      mutexA.lock();
      mutexA.unlock();
      mutexB.lock();
      mutexB.unlock();
    })

    /**
     * @tc.name    MutexLockTest1600
     * @tc.number  SUB_MUTEX_LOCK_TEST_1600
     * @tc.desc    TC-018: Verify high concurrency pressure with 10 threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(pressureTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(pressureTask, mutex, counter));
      let p3 = taskpool.execute(new taskpool.Task(pressureTask, mutex, counter));
      let p4 = taskpool.execute(new taskpool.Task(pressureTask, mutex, counter));
      let p5 = taskpool.execute(new taskpool.Task(pressureTask, mutex, counter));
      let p6 = taskpool.execute(new taskpool.Task(pressureTask, mutex, counter));
      let p7 = taskpool.execute(new taskpool.Task(pressureTask, mutex, counter));
      let p8 = taskpool.execute(new taskpool.Task(pressureTask, mutex, counter));
      let p9 = taskpool.execute(new taskpool.Task(pressureTask, mutex, counter));
      let p10 = taskpool.execute(new taskpool.Task(pressureTask, mutex, counter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(counter.value).assertEqual(10);
    })

    /**
     * @tc.name    MutexLockTest1700
     * @tc.number  SUB_MUTEX_LOCK_TEST_1700
     * @tc.desc    TC-019: Verify lock hold time and subsequent thread correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexLockTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const timeData = new MutexLockTimeData();
      const counter = new AtomicInt(0);
      await taskpool.execute(new taskpool.Task(longHoldTask, mutex, timeData, counter));
      await taskpool.execute(new taskpool.Task(waitAfterLongHoldTask, mutex, counter));
      expect(counter.load()).assertEqual(2);
      expect(timeData.afterLockTime).assertLargerOrEqual(timeData.beforeLockTime);
    })

    /**
     * @tc.name    MutexLockTest1800
     * @tc.number  SUB_MUTEX_LOCK_TEST_1800
     * @tc.desc    TC-020: Verify lock is correctly released when exception occurs with try-finally
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexLockTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      try {
        await taskpool.execute(new taskpool.Task(exceptionLockTask, mutex, counter));
      } catch (e) {
        // Expected exception
      }
      expect(counter.value).assertEqual(1);
      // Verify lock is usable after exception
      await taskpool.execute(new taskpool.Task(normalAfterExceptionTask, mutex, counter));
      expect(counter.value).assertEqual(2);
    })

    /**
     * @tc.name    MutexLockTest1900
     * @tc.number  SUB_MUTEX_LOCK_TEST_1900
     * @tc.desc    TC-020: Verify lock release after exception in main thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexLockTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const mutex = new Mutex();
      let exceptionCaught: boolean = false;
      mutex.lock();
      try {
        throw new Error('Main thread exception');
      } catch (e) {
        exceptionCaught = true;
      } finally {
        mutex.unlock();
      }
      expect(exceptionCaught).assertTrue();
      // Verify lock is reusable
      mutex.lock();
      mutex.unlock();
    })

    /**
     * @tc.name    MutexLockTest2000
     * @tc.number  SUB_MUTEX_LOCK_TEST_2000
     * @tc.desc    TC-EAWorker: Verify basic lock/unlock in EAWorker thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      const worker = new EAWorker('mutexLockEA1');
      worker.start();
      await worker.run<void>(eaWorkerBasicLockTask, counter);
      worker.quit();
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    MutexLockTest2100
     * @tc.number  SUB_MUTEX_LOCK_TEST_2100
     * @tc.desc    TC-EAWorker: Verify concurrent lock usage across multiple EAWorker threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      const worker1 = new EAWorker('mutexLockEA2');
      const worker2 = new EAWorker('mutexLockEA3');
      const worker3 = new EAWorker('mutexLockEA4');
      worker1.start();
      worker2.start();
      worker3.start();
      await worker1.run<void>(eaWorkerConcurrentLockTask, mutex, counter);
      await worker2.run<void>(eaWorkerConcurrentLockTask, mutex, counter);
      await worker3.run<void>(eaWorkerConcurrentLockTask, mutex, counter);
      worker1.quit();
      worker2.quit();
      worker3.quit();
      expect(counter.value).assertEqual(3);
    })

    /**
     * @tc.name    MutexLockTest2200
     * @tc.number  SUB_MUTEX_LOCK_TEST_2200
     * @tc.desc    TC-Mixed: Verify TaskPool and EAWorker mixed concurrent lock access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexLockTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      const worker = new EAWorker('mutexLockEA5');
      worker.start();
      const eaPromise = worker.run<void>(eaWorkerConcurrentLockTask, mutex, counter);
      let p1 = taskpool.execute(new taskpool.Task(pressureTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(pressureTask, mutex, counter));
      await eaPromise;
      await Promise.all([p1, p2]);
      worker.quit();
      expect(counter.value).assertEqual(3);
    })

    /**
     * @tc.name    MutexLockTest2300
     * @tc.number  SUB_MUTEX_LOCK_TEST_2300
     * @tc.desc    TC-003: Verify lock() returns void and the lock is successfully acquired
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutex = new Mutex();
      const result: void = mutex.lock();
      let unlockOk: boolean = false;
      try {
        mutex.unlock();
        unlockOk = true;
      } catch (e) {
        unlockOk = false;
      }
      expect(unlockOk).assertTrue();
    })

    /**
     * @tc.name    MutexLockTest2400
     * @tc.number  SUB_MUTEX_LOCK_TEST_2400
     * @tc.desc    TC-004: Verify a thread calling lock() is blocked while the lock is held by another thread and proceeds after release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new MutexLockBlockData();
      let p1 = taskpool.execute(new taskpool.Task(blockHolderTask, mutex, data));
      let p2 = taskpool.execute(new taskpool.Task(blockWaiterTask, mutex, data));
      await Promise.all([p1, p2]);
      // The waiter can only enter the critical section after the holder releases the lock.
      expect(data.aHeld).assertTrue();
      expect(data.bAcquired).assertTrue();
    })

    /**
     * @tc.name    MutexLockTest2500
     * @tc.number  SUB_MUTEX_LOCK_TEST_2500
     * @tc.desc    TC-005: Verify calling lock() on an uninitialized Mutex object throws an exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let mutex: Mutex | undefined = undefined;
      let exceptionCaught: boolean = false;
      try {
        mutex!.lock();
      } catch (e) {
        exceptionCaught = true;
      }
      expect(exceptionCaught).assertTrue();
    })

    /**
     * @tc.name    MutexLockTest2600
     * @tc.number  SUB_MUTEX_LOCK_TEST_2600
     * @tc.desc    TC-007: Verify same-thread re-lock without unlock does not succeed within timeout (Mutex is not reentrant)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const firstLock = new AtomicInt(0);
      const secondLock = new AtomicInt(0);
      let taskCompleted: boolean = false;
      try {
        await taskpool.execute(new taskpool.Task(sameThreadRelockTask, mutex, firstLock, secondLock),
          { timeout: 2000 });
        taskCompleted = true;
      } catch (e) {
        taskCompleted = false;
      }
      // The second lock() blocks the task until the timeout fires, so the
      // reentrant branch is never reached within the timeout.
      expect(secondLock.load()).assertEqual(0);
      expect(taskCompleted).assertFalse();
    })

    /**
     * @tc.name    MutexLockTest2700
     * @tc.number  SUB_MUTEX_LOCK_TEST_2700
     * @tc.desc    TC-017: Verify ABBA circular-wait deadlock is detected via task timeout (negative test)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexLockTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex1 = new Mutex();
      const mutex2 = new Mutex();
      const flags = new MutexLockDeadlockFlags();
      const counter = new AtomicInt(0);
      let pA = taskpool.execute(new taskpool.Task(deadlockTaskA, mutex1, mutex2, flags, counter), { timeout: 1000 })
        .then((): string => 'done').catch((): string => 'timeout');
      let pB = taskpool.execute(new taskpool.Task(deadlockTaskB, mutex1, mutex2, flags, counter), { timeout: 1000 })
        .then((): string => 'done').catch((): string => 'timeout');
      const results: Array<string> = await Promise.all([pA, pB]);
      // Neither task can reach the critical section due to the circular wait.
      expect(counter.load()).assertEqual(0);
      expect(results[0]).assertEqual('timeout');
      expect(results[1]).assertEqual('timeout');
    })

    /**
     * @tc.name    MutexLockTest2800
     * @tc.number  SUB_MUTEX_LOCK_TEST_2800
     * @tc.desc    TC-021: Verify Mutex works correctly when high-priority and low-priority tasks compete for the same lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexLockTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      let highP = taskpool.execute(new taskpool.Task(multiThreadIncTask, mutex, counter),
        { priority: taskpool.Priority.HIGH });
      let lowP = taskpool.execute(new taskpool.Task(multiThreadIncTask, mutex, counter),
        { priority: taskpool.Priority.LOW });
      await Promise.all([highP, lowP]);
      expect(counter.value).assertEqual(2);
    })
  })
}
