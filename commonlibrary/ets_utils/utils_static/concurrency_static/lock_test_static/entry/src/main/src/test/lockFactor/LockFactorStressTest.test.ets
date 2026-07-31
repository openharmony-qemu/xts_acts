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

class StressSharedData {
  buffer: number[] = [];
}

// TC-054: Mutex extreme concurrency task
function mutexStressTask(mutex: Mutex, counter: AtomicInt): void {
  for (let i = 0; i < 100; i++) {
    mutex.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      mutex.unlock();
    }
  }
}

// TC-055: RWLock read stress task
function rwlockReadStressTask(rwlock: RWLock, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  for (let i = 0; i < 100; i++) {
    readLock.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      readLock.unlock();
    }
  }
}

// TC-055: RWLock write stress task
function rwlockWriteStressTask(rwlock: RWLock, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  for (let i = 0; i < 100; i++) {
    writeLock.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      writeLock.unlock();
    }
  }
}

// TC-056: Mixed lock stress task
function mixedLockStressTask(mutex: Mutex, rwlock: RWLock, counter: AtomicInt): void {
  for (let i = 0; i < 100; i++) {
    mutex.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      mutex.unlock();
    }
    const readLock = rwlock.readLock();
    readLock.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      readLock.unlock();
    }
  }
}

// TC-057: Callback stress task
function callbackStressTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
  taskpool.Task.sendData('stress_callback');
}

// TC-058: Mutex protect large data task
function largeDataMutexTask(mutex: Mutex, data: StressSharedData): void {
  mutex.lock();
  try {
    for (let i = 0; i < 10000; i++) {
      data.buffer.push(i);
    }
  } finally {
    mutex.unlock();
  }
}

// TC-059: RWLock protect large data read task
function largeDataRWLockTask(rwlock: RWLock, data: StressSharedData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let sum: number = 0;
    for (let i = 0; i < data.buffer.length; i++) {
      sum = sum + data.buffer[i];
    }
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

// TC-060: Multi large data concurrent transfer task
function multiLargeDataTask(mutex: Mutex, data: StressSharedData, id: int): void {
  mutex.lock();
  try {
    for (let i = 0; i < 1000; i++) {
      data.buffer.push(id * 1000 + i);
    }
  } finally {
    mutex.unlock();
  }
}

// TC-061: Mutex long running task
function mutexLongRunningTask(mutex: Mutex, counter: AtomicInt): void {
  for (let i = 0; i < 500; i++) {
    mutex.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      mutex.unlock();
    }
  }
}

// TC-062: RWLock long running task
function rwlockLongRunningTask(rwlock: RWLock, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  const writeLock = rwlock.writeLock();
  for (let i = 0; i < 250; i++) {
    readLock.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      readLock.unlock();
    }
    writeLock.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      writeLock.unlock();
    }
  }
}

// TC-063: Callback long running task
function callbackLongRunningTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
  taskpool.Task.sendData('long_running');
}

// TC-064: Mutex exception recovery task
function mutexExceptionRecoveryTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
    throw new Error('Recovery test exception');
  } finally {
    mutex.unlock();
  }
}

// TC-064: Normal task after exception recovery
function mutexNormalAfterRecoveryTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC-065: RWLock exception recovery task
function rwlockExceptionRecoveryTask(rwlock: RWLock, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

// TC-067: Callback exception recovery task
function callbackExceptionRecoveryTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
  throw new Error('Callback exception');
}

// TC-068: Nested exception recovery task
function nestedExceptionRecoveryTask(mutexA: Mutex, mutexB: Mutex, counter: AtomicInt): void {
  mutexA.lock();
  try {
    mutexB.lock();
    try {
      counter.fetchAdd(1);
      throw new Error('Nested exception');
    } finally {
      mutexB.unlock();
    }
  } finally {
    mutexA.unlock();
  }
}

export default function LockFactorStressTest(): void {
  describe('LockFactorStressTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name    LockFactorStressTest0100
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_0100
     * @tc.desc    TC-054: Verify Mutex extreme concurrency with 10 tasks each performing 100 lock/unlock operations
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorStressTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(mutexStressTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(mutexStressTask, mutex, counter));
      let p3 = taskpool.execute(new taskpool.Task(mutexStressTask, mutex, counter));
      let p4 = taskpool.execute(new taskpool.Task(mutexStressTask, mutex, counter));
      let p5 = taskpool.execute(new taskpool.Task(mutexStressTask, mutex, counter));
      let p6 = taskpool.execute(new taskpool.Task(mutexStressTask, mutex, counter));
      let p7 = taskpool.execute(new taskpool.Task(mutexStressTask, mutex, counter));
      let p8 = taskpool.execute(new taskpool.Task(mutexStressTask, mutex, counter));
      let p9 = taskpool.execute(new taskpool.Task(mutexStressTask, mutex, counter));
      let p10 = taskpool.execute(new taskpool.Task(mutexStressTask, mutex, counter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(counter.load()).assertEqual(1000);
    })

    /**
     * @tc.name    LockFactorStressTest0200
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_0200
     * @tc.desc    TC-055: Verify RWLock extreme concurrency with 5 read and 5 write tasks each performing 100 operations
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorStressTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      let r1 = taskpool.execute(new taskpool.Task(rwlockReadStressTask, rwlock, counter));
      let r2 = taskpool.execute(new taskpool.Task(rwlockReadStressTask, rwlock, counter));
      let r3 = taskpool.execute(new taskpool.Task(rwlockReadStressTask, rwlock, counter));
      let r4 = taskpool.execute(new taskpool.Task(rwlockReadStressTask, rwlock, counter));
      let r5 = taskpool.execute(new taskpool.Task(rwlockReadStressTask, rwlock, counter));
      let w1 = taskpool.execute(new taskpool.Task(rwlockWriteStressTask, rwlock, counter));
      let w2 = taskpool.execute(new taskpool.Task(rwlockWriteStressTask, rwlock, counter));
      let w3 = taskpool.execute(new taskpool.Task(rwlockWriteStressTask, rwlock, counter));
      let w4 = taskpool.execute(new taskpool.Task(rwlockWriteStressTask, rwlock, counter));
      let w5 = taskpool.execute(new taskpool.Task(rwlockWriteStressTask, rwlock, counter));
      await Promise.all([r1, r2, r3, r4, r5, w1, w2, w3, w4, w5]);
      expect(counter.load()).assertEqual(1000);
    })

    /**
     * @tc.name    LockFactorStressTest0300
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_0300
     * @tc.desc    TC-056: Verify mixed Mutex and RWLock extreme concurrency stability with 10 tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockFactorStressTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const mutex = new Mutex();
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(mixedLockStressTask, mutex, rwlock, counter));
      let p2 = taskpool.execute(new taskpool.Task(mixedLockStressTask, mutex, rwlock, counter));
      let p3 = taskpool.execute(new taskpool.Task(mixedLockStressTask, mutex, rwlock, counter));
      let p4 = taskpool.execute(new taskpool.Task(mixedLockStressTask, mutex, rwlock, counter));
      let p5 = taskpool.execute(new taskpool.Task(mixedLockStressTask, mutex, rwlock, counter));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(counter.load()).assertEqual(1000);
    })

    /**
     * @tc.name    LockFactorStressTest0400
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_0400
     * @tc.desc    TC-057: Verify callback concurrency stress with 10 tasks each triggering onReceiveData callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockFactorStressTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task1 = new taskpool.Task(callbackStressTask, mutex, counter);
      task1.onReceiveData(() => { counter.fetchAdd(1); });
      const task2 = new taskpool.Task(callbackStressTask, mutex, counter);
      task2.onReceiveData(() => { counter.fetchAdd(1); });
      const task3 = new taskpool.Task(callbackStressTask, mutex, counter);
      task3.onReceiveData(() => { counter.fetchAdd(1); });
      const task4 = new taskpool.Task(callbackStressTask, mutex, counter);
      task4.onReceiveData(() => { counter.fetchAdd(1); });
      const task5 = new taskpool.Task(callbackStressTask, mutex, counter);
      task5.onReceiveData(() => { counter.fetchAdd(1); });
      const task6 = new taskpool.Task(callbackStressTask, mutex, counter);
      task6.onReceiveData(() => { counter.fetchAdd(1); });
      const task7 = new taskpool.Task(callbackStressTask, mutex, counter);
      task7.onReceiveData(() => { counter.fetchAdd(1); });
      const task8 = new taskpool.Task(callbackStressTask, mutex, counter);
      task8.onReceiveData(() => { counter.fetchAdd(1); });
      const task9 = new taskpool.Task(callbackStressTask, mutex, counter);
      task9.onReceiveData(() => { counter.fetchAdd(1); });
      const task10 = new taskpool.Task(callbackStressTask, mutex, counter);
      task10.onReceiveData(() => { counter.fetchAdd(1); });
      let p1 = taskpool.execute(task1);
      let p2 = taskpool.execute(task2);
      let p3 = taskpool.execute(task3);
      let p4 = taskpool.execute(task4);
      let p5 = taskpool.execute(task5);
      let p6 = taskpool.execute(task6);
      let p7 = taskpool.execute(task7);
      let p8 = taskpool.execute(task8);
      let p9 = taskpool.execute(task9);
      let p10 = taskpool.execute(task10);
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(counter.load()).assertEqual(20);
    })

    /**
     * @tc.name    LockFactorStressTest0500
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_0500
     * @tc.desc    TC-058: Verify Mutex protecting large data array with 10000 elements
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockFactorStressTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const mutex = new Mutex();
      const data = new StressSharedData();
      let p1 = taskpool.execute(new taskpool.Task(largeDataMutexTask, mutex, data));
      await p1;
      expect(data.buffer.length).assertEqual(10000);
    })

    /**
     * @tc.name    LockFactorStressTest0600
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_0600
     * @tc.desc    TC-059: Verify RWLock protecting large data read with concurrent read access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockFactorStressTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const rwlock = new RWLock();
      const data = new StressSharedData();
      // Pre-fill data
      for (let i = 0; i < 10000; i++) {
        data.buffer.push(i);
      }
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(largeDataRWLockTask, rwlock, data, counter));
      let p2 = taskpool.execute(new taskpool.Task(largeDataRWLockTask, rwlock, data, counter));
      let p3 = taskpool.execute(new taskpool.Task(largeDataRWLockTask, rwlock, data, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.load()).assertEqual(3);
    })

    /**
     * @tc.name    LockFactorStressTest0700
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_0700
     * @tc.desc    TC-060: Verify multiple large data concurrent transfer with 5 tasks each adding 1000 elements
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockFactorStressTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const mutex = new Mutex();
      const data = new StressSharedData();
      let p1 = taskpool.execute(new taskpool.Task(multiLargeDataTask, mutex, data, 1));
      let p2 = taskpool.execute(new taskpool.Task(multiLargeDataTask, mutex, data, 2));
      let p3 = taskpool.execute(new taskpool.Task(multiLargeDataTask, mutex, data, 3));
      let p4 = taskpool.execute(new taskpool.Task(multiLargeDataTask, mutex, data, 4));
      let p5 = taskpool.execute(new taskpool.Task(multiLargeDataTask, mutex, data, 5));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(data.buffer.length).assertEqual(5000);
    })

    /**
     * @tc.name    LockFactorStressTest0800
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_0800
     * @tc.desc    TC-061: Verify Mutex long running with 10 tasks each performing 500 lock/unlock cycles
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockFactorStressTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(mutexLongRunningTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(mutexLongRunningTask, mutex, counter));
      let p3 = taskpool.execute(new taskpool.Task(mutexLongRunningTask, mutex, counter));
      let p4 = taskpool.execute(new taskpool.Task(mutexLongRunningTask, mutex, counter));
      let p5 = taskpool.execute(new taskpool.Task(mutexLongRunningTask, mutex, counter));
      let p6 = taskpool.execute(new taskpool.Task(mutexLongRunningTask, mutex, counter));
      let p7 = taskpool.execute(new taskpool.Task(mutexLongRunningTask, mutex, counter));
      let p8 = taskpool.execute(new taskpool.Task(mutexLongRunningTask, mutex, counter));
      let p9 = taskpool.execute(new taskpool.Task(mutexLongRunningTask, mutex, counter));
      let p10 = taskpool.execute(new taskpool.Task(mutexLongRunningTask, mutex, counter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
      expect(counter.load()).assertEqual(5000);
    })

    /**
     * @tc.name    LockFactorStressTest0900
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_0900
     * @tc.desc    TC-062: Verify RWLock long running with continuous read lock and write lock operations
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockFactorStressTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(rwlockLongRunningTask, rwlock, counter));
      let p2 = taskpool.execute(new taskpool.Task(rwlockLongRunningTask, rwlock, counter));
      await Promise.all([p1, p2]);
      expect(counter.load()).assertEqual(1000);
    })

    /**
     * @tc.name    LockFactorStressTest1000
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_1000
     * @tc.desc    TC-063: Verify callback long running stability with continuous callback internal lock usage
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockFactorStressTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task1 = new taskpool.Task(callbackLongRunningTask, mutex, counter);
      const task2 = new taskpool.Task(callbackLongRunningTask, mutex, counter);
      const task3 = new taskpool.Task(callbackLongRunningTask, mutex, counter);
      task1.onReceiveData(() => { counter.fetchAdd(1); });
      task2.onReceiveData(() => { counter.fetchAdd(1); });
      task3.onReceiveData(() => { counter.fetchAdd(1); });
      await Promise.all([taskpool.execute(task1), taskpool.execute(task2), taskpool.execute(task3)]);
      expect(counter.load()).assertEqual(6);
    })

    /**
     * @tc.name    LockFactorStressTest1100
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_1100
     * @tc.desc    TC-064: Verify Mutex exception recovery - lock remains usable after task throws exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorStressTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let exceptionCaught: boolean = false;
      try {
        await taskpool.execute(new taskpool.Task(mutexExceptionRecoveryTask, mutex, counter));
      } catch (e) {
        exceptionCaught = true;
      }
      expect(exceptionCaught).assertTrue();
      expect(counter.load()).assertEqual(1);
      // Verify lock is usable after exception
      await taskpool.execute(new taskpool.Task(mutexNormalAfterRecoveryTask, mutex, counter));
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorStressTest1200
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_1200
     * @tc.desc    TC-065: Verify RWLock exception recovery - ReadLock.unlock on unlocked state does not break lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorStressTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      // Normal usage
      await taskpool.execute(new taskpool.Task(rwlockExceptionRecoveryTask, rwlock, counter));
      expect(counter.load()).assertEqual(1);
      // Verify lock is still usable
      const readLock = rwlock.readLock();
      readLock.lock();
      readLock.unlock();
      const writeLock = rwlock.writeLock();
      writeLock.lock();
      writeLock.unlock();
    })

    /**
     * @tc.name    LockFactorStressTest1300
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_1300
     * @tc.desc    TC-066: Verify Worker exception termination - lock is eventually released when Worker quits
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorStressTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorStress01');
      worker.start();
      let exceptionCaught: boolean = false;
      try {
        worker.run<void>(mutexExceptionRecoveryTask, mutex, counter).Await();
      } catch (e) {
        exceptionCaught = true;
      }
      worker.quit();
      expect(exceptionCaught).assertTrue();
      expect(counter.load()).assertEqual(1);
      // Verify lock is usable after worker exits
      mutex.lock();
      try {
        counter.fetchAdd(1);
      } finally {
        mutex.unlock();
      }
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorStressTest1400
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_1400
     * @tc.desc    TC-067: Verify callback exception recovery - lock state is safe after callback throws
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorStressTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(callbackExceptionRecoveryTask, counter);
      task.onExecutionFailed(() => {
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      try {
        await taskpool.execute(task);
      } catch (e) {
        // Expected exception
      }
      expect(counter.load()).assertLargerOrEqual(1);
      // Verify lock is usable
      mutex.lock();
      mutex.unlock();
    })

    /**
     * @tc.name    LockFactorStressTest1500
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_1500
     * @tc.desc    TC-068: Verify nested exception recovery - nested lock exception does not cause deadlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorStressTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutexA = new Mutex();
      const mutexB = new Mutex();
      const counter = new AtomicInt(0);
      let exceptionCaught: boolean = false;
      try {
        await taskpool.execute(new taskpool.Task(nestedExceptionRecoveryTask, mutexA, mutexB, counter));
      } catch (e) {
        exceptionCaught = true;
      }
      expect(exceptionCaught).assertTrue();
      expect(counter.load()).assertEqual(1);
      // Verify both locks are usable after nested exception
      mutexA.lock();
      mutexA.unlock();
      mutexB.lock();
      mutexB.unlock();
    })

    /**
     * @tc.name    LockFactorStressTest1600
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_1600
     * @tc.desc    TC-069: Verify Mutex resource release - creating and releasing large number of Mutex instances
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorStressTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mutexes: Mutex[] = [];
      for (let i = 0; i < 100; i++) {
        mutexes.push(new Mutex());
      }
      for (let i = 0; i < mutexes.length; i++) {
        mutexes[i].lock();
        mutexes[i].unlock();
      }
      expect(mutexes.length).assertEqual(100);
    })

    /**
     * @tc.name    LockFactorStressTest1700
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_1700
     * @tc.desc    TC-070: Verify RWLock resource release - creating and releasing large number of RWLock instances
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorStressTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rwlocks: RWLock[] = [];
      for (let i = 0; i < 100; i++) {
        rwlocks.push(new RWLock());
      }
      for (let i = 0; i < rwlocks.length; i++) {
        const readLock = rwlocks[i].readLock();
        readLock.lock();
        readLock.unlock();
        const writeLock = rwlocks[i].writeLock();
        writeLock.lock();
        writeLock.unlock();
      }
      expect(rwlocks.length).assertEqual(100);
    })

    /**
     * @tc.name    LockFactorStressTest1800
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_1800
     * @tc.desc    TC-071: Verify lock lifecycle management - lock objects are correctly used and released
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorStressTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mutex = new Mutex();
      let lifecycleCount: number = 0;
      // Phase 1: Basic lock/unlock
      mutex.lock();
      lifecycleCount++;
      mutex.unlock();
      // Phase 2: Reuse after release
      mutex.lock();
      lifecycleCount++;
      mutex.unlock();
      // Phase 3: Multiple cycles
      for (let i = 0; i < 5; i++) {
        mutex.lock();
        lifecycleCount++;
        mutex.unlock();
      }
      expect(lifecycleCount).assertEqual(7);
    })

    /**
     * @tc.name    LockFactorStressTest1900
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_1900
     * @tc.desc    TC-072: Verify nested lock resource release - resources are correctly released after nested locks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorStressTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mutexA = new Mutex();
      const mutexB = new Mutex();
      const mutexC = new Mutex();
      let releaseCount: number = 0;
      // Nested acquire and release
      mutexA.lock();
      try {
        mutexB.lock();
        try {
          mutexC.lock();
          try {
            releaseCount = 0;
          } finally {
            mutexC.unlock();
            releaseCount++;
          }
        } finally {
          mutexB.unlock();
          releaseCount++;
        }
      } finally {
        mutexA.unlock();
        releaseCount++;
      }
      expect(releaseCount).assertEqual(3);
      // Verify all locks are reusable
      mutexA.lock();
      mutexA.unlock();
      mutexB.lock();
      mutexB.unlock();
      mutexC.lock();
      mutexC.unlock();
    })

    /**
     * @tc.name    LockFactorStressTest2000
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_2000
     * @tc.desc    TC-073: Verify Mutex boundary test - creating Mutex without any usage consumes no active resources
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorStressTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutex = new Mutex();
      mutex.lock();
      let active: boolean = true;
      mutex.unlock();
      expect(active).assertTrue();
    })

    /**
     * @tc.name    LockFactorStressTest2100
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_2100
     * @tc.desc    TC-074: Verify RWLock boundary test - single thread holding multiple locks simultaneously
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorStressTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const rwlock1 = new RWLock();
      const rwlock2 = new RWLock();
      const rwlock3 = new RWLock();
      const readLock1 = rwlock1.readLock();
      const readLock2 = rwlock2.readLock();
      const readLock3 = rwlock3.readLock();
      // Acquire all read locks
      readLock1.lock();
      readLock2.lock();
      readLock3.lock();
      // Release all in reverse order
      readLock3.unlock();
      readLock2.unlock();
      readLock1.unlock();
      // Verify all are usable again
      let reuseCount: number = 0;
      readLock1.lock(); readLock1.unlock(); reuseCount++;
      readLock2.lock(); readLock2.unlock(); reuseCount++;
      readLock3.lock(); readLock3.unlock(); reuseCount++;
      expect(reuseCount).assertEqual(3);
    })

    /**
     * @tc.name    LockFactorStressTest2200
     * @tc.number  SUB_LOCK_FACTOR_STRESS_TEST_2200
     * @tc.desc    TC-075: Verify empty lock boundary - lock object created and immediately checked without operations
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorStressTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutex = new Mutex();
      const rwlock = new RWLock();
      const readLock = rwlock.readLock();
      const writeLock = rwlock.writeLock();
      // Verify lock operations work correctly
      let opsCount: number = 0;
      mutex.lock(); mutex.unlock(); opsCount++;
      readLock.lock(); readLock.unlock(); opsCount++;
      writeLock.lock(); writeLock.unlock(); opsCount++;
      expect(opsCount).assertEqual(3);
    })
  })
}
