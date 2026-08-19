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

class MutexLockSharedCounter {
  value: number = 0;
}

class MutexLockSharedFlags {
  taskBAcquired: boolean = false;
  taskBCompleted: boolean = false;
}

class MutexLockFairnessData {
  order: int[] = [];
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

// TC-1100: Multi-thread increment under lock
function multiThreadIncTask(mutex: Mutex, counter: MutexLockSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
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

// TC-1400: Independent mutex task
function independentTask1(mutex: Mutex, counter: MutexLockSharedCounter): void {
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

// TC-1900: Long hold task
function longHoldTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    let sum: number = 0;
    for (let i = 0; i < 50000; i++) {
      sum = sum + i;
    }
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

// TC-004: Blocking state data shared between main thread and waiter task
class MutexLockBlockData {
  bAcquired: boolean = false;
}

// TC-004: Waiter task blocks on lock() until the lock is released
function blockWaiterTask(mutex: Mutex, data: MutexLockBlockData): void {
  mutex.lock();
  try {
    data.bAcquired = true;
  } finally {
    mutex.unlock();
  }
}

// TC-007: Same-thread re-lock attempt without unlock (Mutex is not reentrant).
// The second lock() blocks until another thread releases the first hold
// (Mutex has no ownership, cross-thread unlock is allowed).
function sameThreadRelockTask(mutex: Mutex, firstLock: AtomicInt, secondLock: AtomicInt): void {
  mutex.lock();
  firstLock.fetchAdd(1);
  mutex.lock();
  secondLock.fetchAdd(1);
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
  // Bounded spin: bail out (releasing the held lock) instead of spinning forever
  // if the handshake partner never appears on a scheduling-constrained device.
  let spins: int = 0;
  while (flags.bReady.load() === 0 && spins < 5000000) {
    spins++;
  }
  if (flags.bReady.load() === 0) {
    mutex1.unlock();
    throw new Error('deadlock handshake timeout');
  }
  mutex2.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex2.unlock();
  }
  mutex1.unlock();
}

// TC-017: Deadlock task B - holds mutex2 then waits for mutex1.
// NOTE: task B does not unlock mutex2 itself; the main thread releases
// mutex2 externally to break the circular wait (Mutex has no ownership).
function deadlockTaskB(mutex1: Mutex, mutex2: Mutex, flags: MutexLockDeadlockFlags, counter: AtomicInt): void {
  mutex2.lock();
  flags.bReady.store(1);
  let spins: int = 0;
  while (flags.aReady.load() === 0 && spins < 5000000) {
    spins++;
  }
  if (flags.aReady.load() === 0) {
    mutex2.unlock();
    throw new Error('deadlock handshake timeout');
  }
  mutex1.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex1.unlock();
  }
}

export default function MutexLockTest(): void {
  describe('MutexLockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name    MutexLockTest0100
     * @tc.number  SUB_MUTEX_LOCK_TEST_0100
     * @tc.desc    TC-007: Verify sequential lock/unlock cycles in TaskPool thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(reentrantLockTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
      } catch (error) {
        console.error(`MutexLockTest0100 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest0200
     * @tc.number  SUB_MUTEX_LOCK_TEST_0200
     * @tc.desc    TC-008: Verify lock behavior after task throws without releasing lock (lock leak test)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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
      await taskpool.execute(new taskpool.Task(multiThreadIncTask, freshMutex, counter2));
      expect(counter2.value).assertEqual(1);
      } catch (error) {
        console.error(`MutexLockTest0200 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest0300
     * @tc.number  SUB_MUTEX_LOCK_TEST_0300
     * @tc.desc    TC-009: Verify single thread lock acquisition in TaskPool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexLockTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(taskPoolLockTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
      } catch (error) {
        console.error(`MutexLockTest0300 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest0400
     * @tc.number  SUB_MUTEX_LOCK_TEST_0400
     * @tc.desc    TC-010: Verify single thread sequential lock/unlock cycles
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.name    MutexLockTest0500
     * @tc.number  SUB_MUTEX_LOCK_TEST_0500
     * @tc.desc    TC-011: Verify multiple threads competing for the same lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexLockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      let promises: Promise<Any>[] = [];
      for (let i: int = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(multiThreadIncTask, mutex, counter)));
      }
      await Promise.all(promises);
      expect(counter.value).assertEqual(5);
      } catch (error) {
        console.error(`MutexLockTest0500 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest0600
     * @tc.number  SUB_MUTEX_LOCK_TEST_0600
     * @tc.desc    TC-012: Verify other threads block when lock is held
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexLockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const flags = new MutexLockSharedFlags();
      mutex.lock(); // main thread holds the lock first
      let p = taskpool.execute(new taskpool.Task(waiterLockTask, mutex, flags));
      try {
        // Bounded window: while the main thread holds the lock, the waiter must stay blocked
        let waited: int = 0;
        while (waited < 5) {
          expect(flags.taskBAcquired).assertFalse();
          await Utils.msSleep(100);
          waited++;
        }
      } finally {
        mutex.unlock();
      }
      await p;
      // The waiter can only acquire the lock after the holder releases it.
      expect(flags.taskBAcquired).assertTrue();
      expect(flags.taskBCompleted).assertTrue();
      } catch (error) {
        console.error(`MutexLockTest0600 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest0700
     * @tc.number  SUB_MUTEX_LOCK_TEST_0700
     * @tc.desc    TC-013: Verify blocked thread wakes up after lock release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexLockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      await taskpool.execute(new taskpool.Task(seqTaskA, mutex, counter)); // value = 1
      mutex.lock(); // main thread holds the lock
      let p = taskpool.execute(new taskpool.Task(seqTaskB, mutex, counter)); // blocked until release
      try {
        // Bounded window: the waiter stays blocked while the lock is held
        let waited: int = 0;
        while (waited < 5) {
          expect(counter.value).assertEqual(1);
          await Utils.msSleep(100);
          waited++;
        }
      } finally {
        mutex.unlock(); // release wakes up the blocked task
      }
      await p;
      // The blocked task proceeded only after the lock was released.
      expect(counter.value).assertEqual(2);
      } catch (error) {
        console.error(`MutexLockTest0700 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest0800
     * @tc.number  SUB_MUTEX_LOCK_TEST_0800
     * @tc.desc    TC-014: Verify multiple Mutex instances work independently
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex1 = new Mutex();
      const mutex2 = new Mutex();
      const counter1 = new MutexLockSharedCounter();
      const counter2 = new MutexLockSharedCounter();
      const mutexes: Mutex[] = [mutex1, mutex2];
      const counters: MutexLockSharedCounter[] = [counter1, counter2];
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 3; i++) {
        for (let j: int = 0; j < mutexes.length; j++) {
          promises.push(taskpool.execute(new taskpool.Task(independentTask1, mutexes[j], counters[j])));
        }
      }
      await Promise.all(promises);
      expect(counter1.value).assertEqual(3);
      expect(counter2.value).assertEqual(3);
      } catch (error) {
        console.error(`MutexLockTest0800 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest0900
     * @tc.number  SUB_MUTEX_LOCK_TEST_0900
     * @tc.desc    TC-015: Verify all competing threads eventually acquire the lock without starvation
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const data = new MutexLockFairnessData();
      let promises: Promise<Any>[] = [];
      for (let i: int = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(fairnessTask, mutex, data, i)));
      }
      await Promise.all(promises);
      expect(data.order.length).assertEqual(5);
      let hasAll: boolean = true;
      for (let i = 0; i < 5; i++) {
        if (data.order.indexOf(i) === -1) {
          hasAll = false;
        }
      }
      expect(hasAll).assertTrue();
      } catch (error) {
        console.error(`MutexLockTest0900 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest1000
     * @tc.number  SUB_MUTEX_LOCK_TEST_1000
     * @tc.desc    TC-016: Verify nested lock acquisition (Mutex A then Mutex B)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(nestedLockTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
      } catch (error) {
        console.error(`MutexLockTest1000 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest1100
     * @tc.number  SUB_MUTEX_LOCK_TEST_1100
     * @tc.desc    TC-016/TC-017: Verify nested lock acquisition (Mutex A then Mutex B) with reverse-order unlock and lock reusability
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexLockTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name    MutexLockTest1200
     * @tc.number  SUB_MUTEX_LOCK_TEST_1200
     * @tc.desc    TC-018: Verify high concurrency pressure with 10 threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(multiThreadIncTask, mutex, counter)));
      }
      await Promise.all(promises);
      expect(counter.value).assertEqual(10);
      } catch (error) {
        console.error(`MutexLockTest1200 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest1300
     * @tc.number  SUB_MUTEX_LOCK_TEST_1300
     * @tc.desc    TC-019: Verify a long-held lock is released so the subsequent task completes correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexLockTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      await taskpool.execute(new taskpool.Task(longHoldTask, mutex, counter));
      await taskpool.execute(new taskpool.Task(waitAfterLongHoldTask, mutex, counter));
      // The waiting task only completes after the long-held lock is released.
      expect(counter.load()).assertEqual(2);
      } catch (error) {
        console.error(`MutexLockTest1300 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest1400
     * @tc.number  SUB_MUTEX_LOCK_TEST_1400
     * @tc.desc    TC-020: Verify lock is correctly released when exception occurs with try-finally
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexLockTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      try {
        await taskpool.execute(new taskpool.Task(exceptionLockTask, mutex, counter));
      } catch (e) {
        // Expected exception
      }
      expect(counter.value).assertEqual(1);
      // Verify lock is usable after exception
      await taskpool.execute(new taskpool.Task(multiThreadIncTask, mutex, counter));
      expect(counter.value).assertEqual(2);
      } catch (error) {
        console.error(`MutexLockTest1400 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest1500
     * @tc.number  SUB_MUTEX_LOCK_TEST_1500
     * @tc.desc    TC-020: Verify lock release after exception in main thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexLockTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.name    MutexLockTest1600
     * @tc.number  SUB_MUTEX_LOCK_TEST_1600
     * @tc.desc    TC-EAWorker: Verify basic lock/unlock in EAWorker thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      const worker = new EAWorker('mutexLockEA1');
      worker.start();
      try {
        await worker.run<void>(eaWorkerBasicLockTask, counter);
        // run<void> may resolve before the worker-side store is visible; bounded-poll it.
        let waits: int = 0;
        while (counter.load() === 0 && waits < 50) {
          await Utils.msSleep(100);
          waits++;
        }
      } finally {
        worker.quit();
      }
      expect(counter.load()).assertEqual(1);
      } catch (error) {
        console.error(`MutexLockTest1600 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest1700
     * @tc.number  SUB_MUTEX_LOCK_TEST_1700
     * @tc.desc    TC-EAWorker: Verify concurrent lock usage across multiple EAWorker threads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      let workerNames: string[] = ['mutexLockEA2', 'mutexLockEA3', 'mutexLockEA4'];
      let workers: EAWorker[] = [];
      for (let i: int = 0; i < workerNames.length; i++) {
        let worker = new EAWorker(workerNames[i], false);
        worker.start();
        workers.push(worker);
      }
      try {
        for (let i: int = 0; i < workers.length; i++) {
          await workers[i].run<void>(eaWorkerConcurrentLockTask, mutex, counter);
        }
        // run<void> may resolve before the worker-side store is visible; bounded-poll it.
        let waits: int = 0;
        while (counter.value !== 3 && waits < 50) {
          await Utils.msSleep(100);
          waits++;
        }
      } finally {
        for (let i: int = 0; i < workers.length; i++) {
          workers[i].quit();
        }
      }
      expect(counter.value).assertEqual(3);
      } catch (error) {
        console.error(`MutexLockTest1700 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest1800
     * @tc.number  SUB_MUTEX_LOCK_TEST_1800
     * @tc.desc    TC-Mixed: Verify TaskPool and EAWorker mixed concurrent lock access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexLockTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new MutexLockSharedCounter();
      const worker = new EAWorker('mutexLockEA5');
      worker.start();
      try {
        const eaPromise = worker.run<void>(eaWorkerConcurrentLockTask, mutex, counter);
        let promises: Promise<Any>[] = [];
        for (let i: number = 0; i < 2; i++) {
          promises.push(taskpool.execute(new taskpool.Task(multiThreadIncTask, mutex, counter)));
        }
        await eaPromise;
        await Promise.all(promises);
        // run<void> may resolve before the worker-side store is visible; bounded-poll it.
        let waits: int = 0;
        while (counter.value !== 3 && waits < 50) {
          await Utils.msSleep(100);
          waits++;
        }
      } finally {
        worker.quit();
      }
      expect(counter.value).assertEqual(3);
      } catch (error) {
        console.error(`MutexLockTest1800 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest1900
     * @tc.number  SUB_MUTEX_LOCK_TEST_1900
     * @tc.desc    TC-003: Verify lock() acquires the lock so unlock() succeeds
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutex = new Mutex();
      mutex.lock();
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
     * @tc.name    MutexLockTest2000
     * @tc.number  SUB_MUTEX_LOCK_TEST_2000
     * @tc.desc    TC-004: Verify a thread calling lock() is blocked while the lock is held by another thread and proceeds after release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const data = new MutexLockBlockData();
      mutex.lock(); // main thread holds the lock first
      let p = taskpool.execute(new taskpool.Task(blockWaiterTask, mutex, data));
      try {
        // Bounded window: while the main thread holds the lock, the waiter must stay blocked
        let waited: int = 0;
        while (waited < 5) {
          expect(data.bAcquired).assertFalse();
          await Utils.msSleep(100);
          waited++;
        }
      } finally {
        mutex.unlock();
      }
      await p;
      // The waiter can only enter the critical section after the lock is released.
      expect(data.bAcquired).assertTrue();
      } catch (error) {
        console.error(`MutexLockTest2000 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest2100
     * @tc.number  SUB_MUTEX_LOCK_TEST_2100
     * @tc.desc    TC-005: Verify calling lock() on an uninitialized Mutex object throws an exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
     * @tc.name    MutexLockTest2200
     * @tc.number  SUB_MUTEX_LOCK_TEST_2200
     * @tc.desc    TC-007: Verify same-thread re-lock without unlock stays blocked and proceeds after external release (Mutex is not reentrant)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexLockTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const firstLock = new AtomicInt(0);
      const secondLock = new AtomicInt(0);
      let p = taskpool.execute(new taskpool.Task(sameThreadRelockTask, mutex, firstLock, secondLock));
      // Wait until the task holds the first lock (bounded)
      let spins: int = 0;
      while (firstLock.load() === 0 && spins < 50) {
        await Utils.msSleep(100);
        spins++;
      }
      expect(firstLock.load()).assertEqual(1);
      try {
        // Bounded window: the reentrant second lock() must stay blocked
        let waited: int = 0;
        while (waited < 5) {
          expect(secondLock.load()).assertEqual(0);
          await Utils.msSleep(100);
          waited++;
        }
      } finally {
        // Mutex has no ownership: release from the main thread to unblock the task
        if (firstLock.load() === 1 && secondLock.load() === 0) {
          mutex.unlock();
        }
      }
      await p;
      expect(secondLock.load()).assertEqual(1);
      } catch (error) {
        console.error(`MutexLockTest2200 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexLockTest2300
     * @tc.number  SUB_MUTEX_LOCK_TEST_2300
     * @tc.desc    TC-017: Verify ABBA circular wait blocks both tasks and the deadlock is broken by external release (negative test)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexLockTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex1 = new Mutex();
      const mutex2 = new Mutex();
      const flags = new MutexLockDeadlockFlags();
      const counter = new AtomicInt(0);
      let pa = taskpool.execute(new taskpool.Task(deadlockTaskA, mutex1, mutex2, flags, counter));
      let pb = taskpool.execute(new taskpool.Task(deadlockTaskB, mutex1, mutex2, flags, counter));
      // Wait until both tasks hold their first lock so the circular wait actually forms (bounded)
      let spins: int = 0;
      while ((flags.aReady.load() === 0 || flags.bReady.load() === 0) && spins < 50) {
        await Utils.msSleep(100);
        spins++;
      }
      expect(flags.aReady.load()).assertEqual(1);
      expect(flags.bReady.load()).assertEqual(1);
      try {
        // Bounded window: neither task can pass the circular wait
        let waited: int = 0;
        while (waited < 5) {
          expect(counter.load()).assertEqual(0);
          await Utils.msSleep(100);
          waited++;
        }
      } finally {
        // Break the deadlock from a third thread (Mutex has no ownership).
        // Guarded so a failure path never leaves permanently blocked tasks:
        // only release when task B actually holds mutex2 and nobody passed.
        if (flags.bReady.load() === 1 && counter.load() === 0) {
          mutex2.unlock();
        }
      }
      await Promise.all([pa, pb]);
      // After the deadlock is broken, both tasks complete their critical sections.
      expect(counter.load()).assertEqual(2);
      } catch (error) {
        console.error(`MutexLockTest2300 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })
  })
}
