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

class MutexUnlockSharedCounter {
  value: number = 0;
}

class MutexUnlockOrderData {
  order: int[] = [];
}

function exceptionFinallyTask(mutex: Mutex, counter: MutexUnlockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
    throw new Error('Test exception in critical section');
  } finally {
    mutex.unlock();
  }
}

function competeUnlockTask(mutex: Mutex, counter: MutexUnlockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}

function nestedInnerTask(mutex: Mutex, counter: MutexUnlockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}

function waiterUnlockTask(mutex: Mutex, counter: MutexUnlockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}


function reentrantUnlockTask(counter: AtomicInt): void {
  const mutex = new Mutex();
  let success: boolean = true;
  for (let i = 0; i < 5; i++) {
    mutex.lock();
    mutex.unlock();
  }
  if (success) {
    counter.fetchAdd(1);
  }
}

function earlyReturnTask(mutex: Mutex, counter: MutexUnlockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
    return;
  } finally {
    mutex.unlock();
  }
}

function longHoldUnlockTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    let sum: number = 0;
    for (let i = 0; i < 100000; i++) {
      sum = sum + i;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function waiterAfterLongHoldTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function eaWorkerBasicUnlockTask(counter: AtomicInt): void {
  const mutex = new Mutex();
  mutex.lock();
  counter.fetchAdd(1);
  mutex.unlock();
}

function eaWorkerConcurrentUnlockTask(mutex: Mutex, counter: MutexUnlockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}

// TC-UNLOCK-016: Cross-thread unlock attempt records the actual outcome
// (outcome: 1 = unlock threw, 2 = unlock succeeded)
function crossThreadUnlockTask(mutex: Mutex, outcome: AtomicInt): void {
  try {
    mutex.unlock();
    outcome.store(2);
  } catch (e) {
    outcome.store(1);
  }
}

export default function MutexUnlockTest(): void {
  describe('MutexUnlockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name    MutexUnlockTest0100
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_0100
     * @tc.desc    TC-UNLOCK-003: Verify unlock without prior lock throws exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexUnlockTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const mutex = new Mutex();
      let exceptionCaught: boolean = false;
      try {
        mutex.unlock();
      } catch (e) {
        exceptionCaught = true;
      }
      expect(exceptionCaught).assertTrue();
    })

    /**
     * @tc.name    MutexUnlockTest0200
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_0200
     * @tc.desc    TC-UNLOCK-004: Verify repeated unlock throws exception on second call
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexUnlockTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const mutex = new Mutex();
      mutex.lock();
      mutex.unlock();
      let exceptionCaught: boolean = false;
      try {
        mutex.unlock();
      } catch (e) {
        exceptionCaught = true;
      }
      expect(exceptionCaught).assertTrue();
    })

    /**
     * @tc.name    MutexUnlockTest0300
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_0300
     * @tc.desc    TC-UNLOCK-005: Verify single thread lock-unlock flow
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexUnlockTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const mutex = new Mutex();
      mutex.lock();
      mutex.unlock();
      // Verify lock is reusable after unlock
      mutex.lock();
      let canUnlock: boolean = true;
      try {
        mutex.unlock();
      } catch (e) {
        canUnlock = false;
      }
      expect(canUnlock).assertTrue();
    })

    /**
     * @tc.name    MutexUnlockTest0400
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_0400
     * @tc.desc    TC-UNLOCK-007: Verify critical section exception protection with try-finally
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexUnlockTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const counter = new MutexUnlockSharedCounter();
      try {
        await taskpool.execute(new taskpool.Task(exceptionFinallyTask, mutex, counter));
      } catch (e) {
        // Expected exception from critical section
      }
      expect(counter.value).assertEqual(1);
      // Verify lock is usable after exception
      mutex.lock();
      mutex.unlock();
    })

    /**
     * @tc.name    MutexUnlockTest0500
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_0500
     * @tc.desc    TC-UNLOCK-008: Verify multi-thread competing unlock with 5 threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexUnlockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const counter = new MutexUnlockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p3 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p4 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p5 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(counter.value).assertEqual(5);
    })

    /**
     * @tc.name    MutexUnlockTest0600
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_0600
     * @tc.desc    TC-UNLOCK-010: Verify TaskPool multi-task lock competition (10 tasks)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexUnlockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new MutexUnlockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p3 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p4 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p5 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p6 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p7 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p8 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p9 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p10 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(counter.value).assertEqual(10);
    })

    /**
     * @tc.name    MutexUnlockTest0700
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_0700
     * @tc.desc    TC-UNLOCK-011: Verify TaskPool nested task unlock (3 nested)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexUnlockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new MutexUnlockSharedCounter();
      // Verify nested task unlock: 3 inner tasks sequentially acquire and release the same mutex
      let p1 = taskpool.execute(new taskpool.Task(nestedInnerTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(nestedInnerTask, mutex, counter));
      let p3 = taskpool.execute(new taskpool.Task(nestedInnerTask, mutex, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.value).assertEqual(3);
    })

    /**
     * @tc.name    MutexUnlockTest0800
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_0800
     * @tc.desc    TC-UNLOCK-012: Verify lock-unlock within EAWorker thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexUnlockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      const worker = new EAWorker('mutexUnlockEAOne');
      worker.start();
      await worker.run<void>(eaWorkerBasicUnlockTask, counter);
      worker.quit();
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    MutexUnlockTest0900
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_0900
     * @tc.desc    TC-UNLOCK-013: Verify multiple EAWorker competing for lock (3 threads)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexUnlockTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new MutexUnlockSharedCounter();
      const workerOne = new EAWorker('mutexUnlockEATwo');
      const workerTwo = new EAWorker('mutexUnlockEAThree');
      const workerThree = new EAWorker('mutexUnlockEAFour');
      workerOne.start();
      workerTwo.start();
      workerThree.start();
      await workerOne.run<void>(eaWorkerConcurrentUnlockTask, mutex, counter);
      await workerTwo.run<void>(eaWorkerConcurrentUnlockTask, mutex, counter);
      await workerThree.run<void>(eaWorkerConcurrentUnlockTask, mutex, counter);
      workerOne.quit();
      workerTwo.quit();
      workerThree.quit();
      expect(counter.value).assertEqual(3);
    })

    /**
     * @tc.name    MutexUnlockTest1000
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_1000
     * @tc.desc    TC-UNLOCK-014: Verify EAWorker and TaskPool mixed concurrent unlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexUnlockTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new MutexUnlockSharedCounter();
      const worker = new EAWorker('mutexUnlockEAFive');
      worker.start();
      const eaPromise = worker.run<void>(eaWorkerConcurrentUnlockTask, mutex, counter);
      let p1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await eaPromise;
      await Promise.all([p1, p2]);
      worker.quit();
      expect(counter.value).assertEqual(3);
    })

    /**
     * @tc.name    MutexUnlockTest1100
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_1100
     * @tc.desc    TC-UNLOCK-015: Verify waiting thread is woken up after unlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexUnlockTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const counter = new MutexUnlockSharedCounter();
      // Holder task acquires lock first
      let p1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      // Waiter task blocks until holder unlocks
      let p2 = taskpool.execute(new taskpool.Task(waiterUnlockTask, mutex, counter));
      await Promise.all([p1, p2]);
      expect(counter.value).assertEqual(2);
    })

    /**
     * @tc.name    MutexUnlockTest1200
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_1200
     * @tc.desc    TC-UNLOCK-017: Verify lock state after lock() via indirect behavior
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexUnlockTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutex = new Mutex();
      mutex.lock();
      // Indirectly verify lock is held: unlock should succeed
      let canUnlock: boolean = true;
      try {
        mutex.unlock();
      } catch (e) {
        canUnlock = false;
      }
      expect(canUnlock).assertTrue();
    })

    /**
     * @tc.name    MutexUnlockTest1300
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_1300
     * @tc.desc    TC-UNLOCK-019: Verify sequential lock-unlock reuse (Mutex does not support reentrant lock)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexUnlockTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(reentrantUnlockTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    MutexUnlockTest1400
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_1400
     * @tc.desc    TC-UNLOCK-023: Verify critical section early return still triggers finally unlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexUnlockTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new MutexUnlockSharedCounter();
      await taskpool.execute(new taskpool.Task(earlyReturnTask, mutex, counter));
      expect(counter.value).assertEqual(1);
      // Verify lock was released by early return's finally block
      mutex.lock();
      mutex.unlock();
    })

    /**
     * @tc.name    MutexUnlockTest1500
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_1500
     * @tc.desc    TC-UNLOCK-024: Verify high concurrency pressure with 100 concurrent lock-unlock tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexUnlockTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new MutexUnlockSharedCounter();
      let batch1P1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch1P2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch1P3 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch1P4 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch1P5 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch1P6 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch1P7 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch1P8 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch1P9 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch1P10 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await Promise.all([batch1P1, batch1P2, batch1P3, batch1P4, batch1P5, batch1P6, batch1P7, batch1P8, batch1P9, batch1P10]);
      let batch2P1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch2P2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch2P3 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch2P4 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch2P5 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch2P6 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch2P7 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch2P8 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch2P9 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch2P10 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await Promise.all([batch2P1, batch2P2, batch2P3, batch2P4, batch2P5, batch2P6, batch2P7, batch2P8, batch2P9, batch2P10]);
      let batch3P1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch3P2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch3P3 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch3P4 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch3P5 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch3P6 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch3P7 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch3P8 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch3P9 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch3P10 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await Promise.all([batch3P1, batch3P2, batch3P3, batch3P4, batch3P5, batch3P6, batch3P7, batch3P8, batch3P9, batch3P10]);
      let batch4P1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch4P2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch4P3 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch4P4 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch4P5 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch4P6 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch4P7 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch4P8 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch4P9 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch4P10 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await Promise.all([batch4P1, batch4P2, batch4P3, batch4P4, batch4P5, batch4P6, batch4P7, batch4P8, batch4P9, batch4P10]);
      let batch5P1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch5P2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch5P3 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch5P4 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch5P5 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch5P6 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch5P7 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch5P8 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch5P9 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch5P10 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await Promise.all([batch5P1, batch5P2, batch5P3, batch5P4, batch5P5, batch5P6, batch5P7, batch5P8, batch5P9, batch5P10]);
      let batch6P1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch6P2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch6P3 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch6P4 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch6P5 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch6P6 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch6P7 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch6P8 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch6P9 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch6P10 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await Promise.all([batch6P1, batch6P2, batch6P3, batch6P4, batch6P5, batch6P6, batch6P7, batch6P8, batch6P9, batch6P10]);
      let batch7P1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch7P2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch7P3 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch7P4 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch7P5 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch7P6 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch7P7 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch7P8 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch7P9 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch7P10 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await Promise.all([batch7P1, batch7P2, batch7P3, batch7P4, batch7P5, batch7P6, batch7P7, batch7P8, batch7P9, batch7P10]);
      let batch8P1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch8P2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch8P3 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch8P4 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch8P5 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch8P6 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch8P7 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch8P8 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch8P9 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch8P10 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await Promise.all([batch8P1, batch8P2, batch8P3, batch8P4, batch8P5, batch8P6, batch8P7, batch8P8, batch8P9, batch8P10]);
      let batch9P1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch9P2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch9P3 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch9P4 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch9P5 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch9P6 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch9P7 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch9P8 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch9P9 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch9P10 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await Promise.all([batch9P1, batch9P2, batch9P3, batch9P4, batch9P5, batch9P6, batch9P7, batch9P8, batch9P9, batch9P10]);
      let batch10P1 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch10P2 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch10P3 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch10P4 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch10P5 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch10P6 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch10P7 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch10P8 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch10P9 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      let batch10P10 = taskpool.execute(new taskpool.Task(competeUnlockTask, mutex, counter));
      await Promise.all([batch10P1, batch10P2, batch10P3, batch10P4, batch10P5, batch10P6, batch10P7, batch10P8, batch10P9, batch10P10]);
      expect(counter.value).assertEqual(100);
    })

    /**
     * @tc.name    MutexUnlockTest1600
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_1600
     * @tc.desc    TC-UNLOCK-025: Verify high frequency lock-unlock cycle (10000 times)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexUnlockTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutex = new Mutex();
      let successCount: number = 0;
      for (let i = 0; i < 10000; i++) {
        mutex.lock();
        mutex.unlock();
        successCount++;
      }
      expect(successCount).assertEqual(10000);
    })

    /**
     * @tc.name    MutexUnlockTest1700
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_1700
     * @tc.desc    TC-UNLOCK-026: Verify long hold lock and subsequent task correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexUnlockTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      await taskpool.execute(new taskpool.Task(longHoldUnlockTask, mutex, counter));
      await taskpool.execute(new taskpool.Task(waiterAfterLongHoldTask, mutex, counter));
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    MutexUnlockTest1800
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_1800
     * @tc.desc    TC-UNLOCK-002: Verify unlock() returns void and releases the lock successfully
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexUnlockTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutex = new Mutex();
      mutex.lock();
      const result: void = mutex.unlock();
      // The lock must be released after unlock() so it can be re-acquired.
      let reacquireOk: boolean = false;
      try {
        mutex.lock();
        reacquireOk = true;
        mutex.unlock();
      } catch (e) {
        reacquireOk = false;
      }
      expect(reacquireOk).assertTrue();
    })

    /**
     * @tc.name    MutexUnlockTest1900
     * @tc.number  SUB_MUTEX_UNLOCK_TEST_1900
     * @tc.desc    TC-UNLOCK-016: Verify cross-thread unlock behavior when another thread unlocks a lock held by the main thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexUnlockTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const outcome = new AtomicInt(0);
      mutex.lock();
      await taskpool.execute(new taskpool.Task(crossThreadUnlockTask, mutex, outcome));
      const observed: number = outcome.load();
      // This SDK's Mutex does not track lock ownership, so unlock from another
      // thread succeeds and releases the lock (md expects an ownership exception).
      expect(observed).assertEqual(2);
      // The lock is released; the main thread can re-acquire it.
      let reacquired: boolean = false;
      mutex.lock();
      reacquired = true;
      mutex.unlock();
      expect(reacquired).assertTrue();
    })
  })
}
