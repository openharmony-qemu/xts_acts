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

class NestingSharedCounter {
  value: number = 0;
}

class NestingTimeData {
  outerLockTime: number = 0;
  innerLockTime: number = 0;
  innerUnlockTime: number = 0;
  outerUnlockTime: number = 0;
}

// TC-014: Mutex outer + ReadLock inner task
function mutexNestReadLockTask(mutex: Mutex, rwlock: RWLock, counter: AtomicInt): void {
  mutex.lock();
  try {
    const readLock = rwlock.readLock();
    readLock.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      readLock.unlock();
    }
  } finally {
    mutex.unlock();
  }
}

// TC-015: Mutex outer + WriteLock inner task
function mutexNestWriteLockTask(mutex: Mutex, rwlock: RWLock, counter: AtomicInt): void {
  mutex.lock();
  try {
    const writeLock = rwlock.writeLock();
    writeLock.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      writeLock.unlock();
    }
  } finally {
    mutex.unlock();
  }
}

// TC-016: ReadLock outer + Mutex inner task
function readLockNestMutexTask(rwlock: RWLock, mutex: Mutex, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    mutex.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      mutex.unlock();
    }
  } finally {
    readLock.unlock();
  }
}

// TC-017: WriteLock outer + Mutex inner task
function writeLockNestMutexTask(rwlock: RWLock, mutex: Mutex, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    mutex.lock();
    try {
      counter.fetchAdd(1);
    } finally {
      mutex.unlock();
    }
  } finally {
    writeLock.unlock();
  }
}

// TC-018: Cross-thread nesting - waiter task acquires the Mutex after the main thread releases it
function crossThreadWaiterTask(mutex: Mutex): number {
  mutex.lock();
  try {
    return 1;
  } finally {
    mutex.unlock();
  }
}

// TC-019: Worker nesting main thread lock task
function workerNestMainTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC-020: Multi-worker nesting same lock - worker1
function multiWorkerNestTask1(mutex: Mutex): number {
  mutex.lock();
  try {
    return 1;
  } finally {
    mutex.unlock();
  }
}

// TC-020: Multi-worker nesting same lock - worker2
function multiWorkerNestTask2(mutex: Mutex): number {
  mutex.lock();
  try {
    return 1;
  } finally {
    mutex.unlock();
  }
}

// TC-021: Nested lock exception propagation task
function nestedExceptionTask(mutexA: Mutex, mutexB: Mutex, counter: AtomicInt): void {
  mutexA.lock();
  try {
    mutexB.lock();
    try {
      counter.fetchAdd(1);
      throw new Error('Inner exception');
    } finally {
      mutexB.unlock();
    }
  } finally {
    mutexA.unlock();
  }
}

// TC-023: Nested lock counting task
function nestedCountingTask(counter: AtomicInt): void {
  const mutexA = new Mutex();
  const mutexB = new Mutex();
  mutexA.lock();
  try {
    counter.fetchAdd(1);
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

// TC-025: Nested lock hold time task
function nestedHoldTimeTask(mutexA: Mutex, mutexB: Mutex, timeData: NestingTimeData, counter: AtomicInt): void {
  mutexA.lock();
  timeData.outerLockTime = Date.now();
  try {
    mutexB.lock();
    timeData.innerLockTime = Date.now();
    try {
      let sum: number = 0;
      for (let i = 0; i < 10000; i++) {
        sum = sum + i;
      }
      timeData.innerUnlockTime = Date.now();
      counter.fetchAdd(1);
    } finally {
      mutexB.unlock();
    }
    timeData.outerUnlockTime = Date.now();
  } finally {
    mutexA.unlock();
  }
}

// TC-026: 3-layer Mutex nesting task
function threeLayerMutexTask(counter: AtomicInt): void {
  const mutexA = new Mutex();
  const mutexB = new Mutex();
  const mutexC = new Mutex();
  mutexA.lock();
  try {
    mutexB.lock();
    try {
      mutexC.lock();
      try {
        counter.fetchAdd(1);
      } finally {
        mutexC.unlock();
      }
    } finally {
      mutexB.unlock();
    }
  } finally {
    mutexA.unlock();
  }
}

// TC-028: Mixed type 3-layer nesting task
function mixedThreeLayerTask(mutex: Mutex, rwlock: RWLock, counter: AtomicInt): void {
  mutex.lock();
  try {
    const readLock = rwlock.readLock();
    readLock.lock();
    try {
      const rwlock2 = new RWLock();
      const writeLock = rwlock2.writeLock();
      writeLock.lock();
      try {
        counter.fetchAdd(1);
      } finally {
        writeLock.unlock();
      }
    } finally {
      readLock.unlock();
    }
  } finally {
    mutex.unlock();
  }
}

// TC-029: Dynamic nesting depth task
function dynamicNestingTask(counter: AtomicInt, depth: int): void {
  const mutexes: Mutex[] = [];
  for (let i = 0; i < depth; i++) {
    const m = new Mutex();
    mutexes.push(m);
  }
  for (let i = 0; i < depth; i++) {
    mutexes[i].lock();
  }
  counter.fetchAdd(1);
  for (let i = depth - 1; i >= 0; i--) {
    mutexes[i].unlock();
  }
}

// TC-030: Nested lock performance task
function nestedPerformanceTask(counter: AtomicInt): void {
  const mutexA = new Mutex();
  const mutexB = new Mutex();
  for (let i = 0; i < 100; i++) {
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
}

// TC-031: Nested lock memory consumption task
function nestedMemoryTask(counter: AtomicInt): void {
  for (let i = 0; i < 50; i++) {
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
}

// TC-022: Nested lock timeout - outer holds lock, inner waits
function nestedTimeoutHolderTask(mutex: Mutex, counter: NestingSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
    let sum: number = 0;
    for (let i = 0; i < 50000; i++) {
      sum = sum + i;
    }
  } finally {
    mutex.unlock();
  }
}

// TC-022: Nested lock timeout - waiter acquires after holder releases
function nestedTimeoutWaiterTask(mutex: Mutex, counter: NestingSharedCounter): void {
  mutex.lock();
  try {
    counter.value = counter.value + 1;
  } finally {
    mutex.unlock();
  }
}

export default function LockFactorNestingTest(): void {
  describe('LockFactorNestingTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name    LockFactorNestingTest0100
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_0100
     * @tc.desc    TC-011: Verify Mutex nested Mutex - two different mutexes can be acquired in nested order
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockFactorNestingTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.name    LockFactorNestingTest0200
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_0200
     * @tc.desc    TC-012: Verify ReadLock nested ReadLock reentrant behavior - same RWLock read lock can be acquired multiple times
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockFactorNestingTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const rwlock = new RWLock();
      const readLock = rwlock.readLock();
      let success: boolean = false;
      readLock.lock();
      try {
        readLock.lock();
        try {
          success = true;
        } finally {
          readLock.unlock();
        }
      } finally {
        readLock.unlock();
      }
      expect(success).assertTrue();
    })

    /**
     * @tc.name    LockFactorNestingTest0300
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_0300
     * @tc.desc    TC-013: Verify WriteLock nested WriteLock with different RWLock instances
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorNestingTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const rwlock1 = new RWLock();
      const rwlock2 = new RWLock();
      const writeLock1 = rwlock1.writeLock();
      const writeLock2 = rwlock2.writeLock();
      let success: boolean = false;
      writeLock1.lock();
      try {
        writeLock2.lock();
        try {
          success = true;
        } finally {
          writeLock2.unlock();
        }
      } finally {
        writeLock1.unlock();
      }
      expect(success).assertTrue();
    })

    /**
     * @tc.name    LockFactorNestingTest0400
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_0400
     * @tc.desc    TC-014: Verify Mutex nested ReadLock cross-type nesting with Mutex.lock then ReadLock.lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorNestingTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutex = new Mutex();
      const rwlock = new RWLock();
      const readLock = rwlock.readLock();
      let success: boolean = false;
      mutex.lock();
      try {
        readLock.lock();
        try {
          success = true;
        } finally {
          readLock.unlock();
        }
      } finally {
        mutex.unlock();
      }
      expect(success).assertTrue();
    })

    /**
     * @tc.name    LockFactorNestingTest0500
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_0500
     * @tc.desc    TC-015: Verify Mutex nested WriteLock cross-type nesting with Mutex.lock then WriteLock.lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorNestingTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutex = new Mutex();
      const rwlock = new RWLock();
      const writeLock = rwlock.writeLock();
      let success: boolean = false;
      mutex.lock();
      try {
        writeLock.lock();
        try {
          success = true;
        } finally {
          writeLock.unlock();
        }
      } finally {
        mutex.unlock();
      }
      expect(success).assertTrue();
    })

    /**
     * @tc.name    LockFactorNestingTest0600
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_0600
     * @tc.desc    TC-016: Verify ReadLock nested Mutex - ReadLock.lock then Mutex.lock then Mutex.unlock then ReadLock.unlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorNestingTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const rwlock = new RWLock();
      const readLock = rwlock.readLock();
      const mutex = new Mutex();
      let success: boolean = false;
      readLock.lock();
      try {
        mutex.lock();
        try {
          success = true;
        } finally {
          mutex.unlock();
        }
      } finally {
        readLock.unlock();
      }
      expect(success).assertTrue();
    })

    /**
     * @tc.name    LockFactorNestingTest0700
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_0700
     * @tc.desc    TC-017: Verify WriteLock nested Mutex - WriteLock.lock then Mutex.lock then Mutex.unlock then WriteLock.unlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorNestingTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const rwlock = new RWLock();
      const writeLock = rwlock.writeLock();
      const mutex = new Mutex();
      let success: boolean = false;
      writeLock.lock();
      try {
        mutex.lock();
        try {
          success = true;
        } finally {
          mutex.unlock();
        }
      } finally {
        writeLock.unlock();
      }
      expect(success).assertTrue();
    })

    /**
     * @tc.name    LockFactorNestingTest0800
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_0800
     * @tc.desc    TC-018: Verify cross-thread lock nesting - main thread holds Mutex then EAWorker task waits then main unlocks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorNestingTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const worker = new EAWorker('lockFactorNestCT1');
      worker.start();
      try {
        mutex.lock();
        const workerJob = worker.run<number>(crossThreadWaiterTask, mutex);
        try {
          // Main thread keeps holding the lock while the worker task waits
          let sum: number = 0;
          for (let i = 0; i < 50000; i++) {
            sum = sum + i;
          }
        } finally {
          mutex.unlock();
        }
        expect(workerJob.Await()).assertEqual(1);
      } finally {
        worker.quit();
      }
      } catch (error) {
        console.error(`LockFactorNestingTest0800 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorNestingTest0900
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_0900
     * @tc.desc    TC-019: Verify Worker nesting main thread lock - Worker.lock then main thread acquires after Worker.unlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorNestingTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorNest01');
      worker.start();
      try {
        await worker.run<void>(workerNestMainTask, mutex, counter);
      } finally {
        worker.quit();
      }
      mutex.lock();
      try {
        counter.fetchAdd(1);
      } finally {
        mutex.unlock();
      }
      expect(counter.load()).assertEqual(2);
      } catch (error) {
        console.error(`LockFactorNestingTest0900 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorNestingTest1000
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_1000
     * @tc.desc    TC-020: Verify multi-Worker nesting same lock - two EAWorkers sequentially acquire same mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorNestingTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const worker1 = new EAWorker('lockFactorNest02');
      const worker2 = new EAWorker('lockFactorNest03');
      worker1.start();
      worker2.start();
      try {
        const job1 = worker1.run<number>(multiWorkerNestTask1, mutex);
        const job2 = worker2.run<number>(multiWorkerNestTask2, mutex);
        expect(job1.Await()).assertEqual(1);
        expect(job2.Await()).assertEqual(1);
      } finally {
        worker1.quit();
        worker2.quit();
      }
      } catch (error) {
        console.error(`LockFactorNestingTest1000 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorNestingTest1100
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_1100
     * @tc.desc    TC-021: Verify nested lock exception propagation - inner lock exception does not cause deadlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorNestingTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutexA = new Mutex();
      const mutexB = new Mutex();
      let exceptionCaught: boolean = false;
      let counterValue: number = 0;
      mutexA.lock();
      try {
        mutexB.lock();
        try {
          counterValue = 1;
          throw new Error('Inner exception');
        } finally {
          mutexB.unlock();
        }
      } catch (e) {
        exceptionCaught = true;
      } finally {
        mutexA.unlock();
      }
      expect(exceptionCaught).assertTrue();
      expect(counterValue).assertEqual(1);
      // Verify locks are usable after exception
      mutexA.lock();
      mutexA.unlock();
      mutexB.lock();
      mutexB.unlock();
    })

    /**
     * @tc.name    LockFactorNestingTest1200
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_1200
     * @tc.desc    TC-023: Verify nested lock counting - same thread multi lock/unlock counting correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorNestingTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(nestedCountingTask, counter));
      await p1;
      expect(counter.load()).assertEqual(2);
      } catch (error) {
        console.error(`LockFactorNestingTest1200 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorNestingTest1300
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_1300
     * @tc.desc    TC-024: Verify nested lock release order - locks must be released in reverse order
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorNestingTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutexA = new Mutex();
      const mutexB = new Mutex();
      const mutexC = new Mutex();
      let success: boolean = false;
      mutexA.lock();
      try {
        mutexB.lock();
        try {
          mutexC.lock();
          try {
            success = true;
          } finally {
            mutexC.unlock();
          }
        } finally {
          mutexB.unlock();
        }
      } finally {
        mutexA.unlock();
      }
      expect(success).assertTrue();
      // Verify all locks are reusable after proper release order
      mutexA.lock();
      mutexA.unlock();
      mutexB.lock();
      mutexB.unlock();
      mutexC.lock();
      mutexC.unlock();
    })

    /**
     * @tc.name    LockFactorNestingTest1400
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_1400
     * @tc.desc    TC-025: Verify nested lock hold time recording - inner lock timestamps are ordered within nested execution
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorNestingTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutexA = new Mutex();
      const mutexB = new Mutex();
      const timeData = new NestingTimeData();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(nestedHoldTimeTask, mutexA, mutexB, timeData, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
      expect(timeData.innerLockTime).assertLargerOrEqual(timeData.outerLockTime);
      expect(timeData.innerUnlockTime).assertLargerOrEqual(timeData.innerLockTime);
      expect(timeData.outerUnlockTime).assertLargerOrEqual(timeData.innerUnlockTime);
      } catch (error) {
        console.error(`LockFactorNestingTest1400 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorNestingTest1500
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_1500
     * @tc.desc    TC-026: Verify 3-layer Mutex nesting - Mutex1.lock then Mutex2.lock then Mutex3.lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorNestingTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(threeLayerMutexTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
      } catch (error) {
        console.error(`LockFactorNestingTest1500 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorNestingTest1600
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_1600
     * @tc.desc    TC-027: Verify 3-layer RWLock nesting - ReadLock1 then ReadLock2 then ReadLock3
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorNestingTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const rwlock1 = new RWLock();
      const rwlock2 = new RWLock();
      const rwlock3 = new RWLock();
      const readLock1 = rwlock1.readLock();
      const readLock2 = rwlock2.readLock();
      const readLock3 = rwlock3.readLock();
      let success: boolean = false;
      readLock1.lock();
      try {
        readLock2.lock();
        try {
          readLock3.lock();
          try {
            success = true;
          } finally {
            readLock3.unlock();
          }
        } finally {
          readLock2.unlock();
        }
      } finally {
        readLock1.unlock();
      }
      expect(success).assertTrue();
    })

    /**
     * @tc.name    LockFactorNestingTest1700
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_1700
     * @tc.desc    TC-028: Verify mixed type 3-layer nesting - Mutex then ReadLock then WriteLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorNestingTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(mixedThreeLayerTask, mutex, rwlock, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
      } catch (error) {
        console.error(`LockFactorNestingTest1700 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorNestingTest1800
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_1800
     * @tc.desc    TC-029: Verify dynamic nesting depth - conditionally determine nesting depth at runtime
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorNestingTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let depths: int[] = [3, 5];
      let promises: Promise<Any>[] = [];
      for (let i: int = 0; i < depths.length; i++) {
        promises.push(taskpool.execute(new taskpool.Task(dynamicNestingTask, counter, depths[i])));
      }
      await Promise.all(promises);
      expect(counter.load()).assertEqual(2);
      } catch (error) {
        console.error(`LockFactorNestingTest1800 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorNestingTest1900
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_1900
     * @tc.desc    TC-030: Verify nested lock stability - 100 nested lock/unlock cycles complete correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockFactorNestingTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(nestedPerformanceTask, counter));
      await p1;
      expect(counter.load()).assertEqual(100);
      } catch (error) {
        console.error(`LockFactorNestingTest1900 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorNestingTest2000
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_2000
     * @tc.desc    TC-031: Verify nested lock stability - creating and releasing nested locks 50 times completes correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockFactorNestingTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(nestedMemoryTask, counter));
      await p1;
      expect(counter.load()).assertEqual(50);
      } catch (error) {
        console.error(`LockFactorNestingTest2000 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })
    /**
     * @tc.name    LockFactorNestingTest2100
     * @tc.number  SUB_LOCK_FACTOR_NESTING_TEST_2100
     * @tc.desc    TC-022: Verify nested lock timeout - waiter task acquires the lock after the holder releases it without affecting lock correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorNestingTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new NestingSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(nestedTimeoutHolderTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(nestedTimeoutWaiterTask, mutex, counter));
      await Promise.all([p1, p2]);
      expect(counter.value).assertEqual(2);
      // Verify outer lock is still usable after timeout scenario
      mutex.lock();
      try {
        counter.value = counter.value + 1;
      } finally {
        mutex.unlock();
      }
      expect(counter.value).assertEqual(3);
      } catch (error) {
        console.error(`LockFactorNestingTest2100 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })
  })
}
