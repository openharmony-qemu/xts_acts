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

// TC-036: Holder for the nested EAWorker execution created inside the callback
class CallbackNestedWorkerHolder {
  worker: EAWorker | null = null;
  job: Job<void> | null = null;
}

// TC-032: onReceiveData callback with Mutex
function callbackMutexTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
  taskpool.Task.sendData('callback_result');
}

// TC-033: onReceiveData callback with RWLock
function callbackRWLockTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
  taskpool.Task.sendData('rwlock_result');
}

// TC-034: onExecutionSucceeded callback with lock
function succeededTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
}

// TC-035: onExecutionFailed callback with lock
function failedTask(): void {
  throw new Error('Task execution failed');
}

// TC-036: Callback nested task creation
function callbackNestedOuterTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
  taskpool.Task.sendData('outer_data');
}

// TC-036: Inner task for callback nesting
function callbackNestedInnerTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
}

// TC-037: Multi-callback concurrent lock contention task
function multiCallbackTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
  taskpool.Task.sendData('multi_callback');
}

// TC-038: sendData + Mutex protection task
function sendDataMutexTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
    taskpool.Task.sendData('protected_data');
  } finally {
    mutex.unlock();
  }
}

// TC-039: sendData + RWLock protection task
function sendDataRWLockTask(rwlock: RWLock, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    counter.fetchAdd(1);
    taskpool.Task.sendData('read_protected');
  } finally {
    readLock.unlock();
  }
}

// TC-041: sendData trigger callback lock task
function sendDataTriggerTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
  taskpool.Task.sendData('trigger_data');
}

// TC-042: sendData concurrent contention task
function sendDataConcurrentTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
    taskpool.Task.sendData('concurrent_data');
  } finally {
    mutex.unlock();
  }
}

// TC-043: sendData lock reuse task
function sendDataLockReuseTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
    taskpool.Task.sendData('lock_reuse_data');
  } finally {
    mutex.unlock();
  }
}

// Worker Mutex-protected task shared by TC-044, TC-047, and TC-049
function workerLockTask(mutex: Mutex): number {
  mutex.lock();
  try {
    return 1;
  } finally {
    mutex.unlock();
  }
}

// TC-045: Worker counter increment task
function workerMessageHandlerTask(): number {
  return 1;
}

// TC-046: Worker exception lock task - throws while holding the Mutex
function workerExceptionTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
    throw new Error('Worker exception');
  } finally {
    mutex.unlock();
  }
}

// TC-051: MessageHandler multi-message concurrent task
function multiMessageTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC-052: Worker exception task - increments then throws
function exceptionMessageTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
  throw new Error('Worker exception message');
}

export default function LockFactorCallbackTest(): void {
  describe('LockFactorCallbackTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name    LockFactorCallbackTest0100
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0100
     * @tc.desc    TC-032: Verify onReceiveData callback internal Mutex lock/unlock safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(callbackMutexTask, counter);
      task.onReceiveData((data: string): void => {
        console.info('received data:', data);
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      await taskpool.execute(task);
      expect(counter.load()).assertEqual(2);
      } catch (error) {
        console.error(`LockFactorCallbackTest0100 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest0200
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0200
     * @tc.desc    TC-033: Verify onReceiveData callback internal ReadLock lock/unlock correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(callbackRWLockTask, counter);
      task.onReceiveData((data: string): void => {
        console.info('received data:', data);
        const readLock = rwlock.readLock();
        readLock.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          readLock.unlock();
        }
      });
      await taskpool.execute(task);
      expect(counter.load()).assertEqual(2);
      } catch (error) {
        console.error(`LockFactorCallbackTest0200 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest0300
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0300
     * @tc.desc    TC-034: Verify onExecutionSucceeded callback internal lock usage
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(succeededTask, counter);
      task.onExecutionSucceeded(() => {
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      await taskpool.execute(task);
      expect(counter.load()).assertEqual(2);
      } catch (error) {
        console.error(`LockFactorCallbackTest0300 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest0400
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0400
     * @tc.desc    TC-035: Verify onExecutionFailed callback internal lock usage
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(failedTask);
      task.onExecutionFailed((error: Error): void => {
        console.error(`execution failed: ${error.message}`);
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      let executeFailed: boolean = false;
      try {
        await taskpool.execute(task);
      } catch (e) {
        // Expected exception from failed task
        executeFailed = true;
      }
      expect(executeFailed).assertTrue();
      expect(counter.load()).assertEqual(1);
      } catch (error) {
        console.error(`LockFactorCallbackTest0400 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest0500
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0500
     * @tc.desc    TC-036: Verify callback internal nested task creation with lock protection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const holder = new CallbackNestedWorkerHolder();
      const task = new taskpool.Task(callbackNestedOuterTask, counter);
      task.onReceiveData((data: string): void => {
        console.info('received data:', data);
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
        // Nested execution created inside the callback
        const nestedWorker = new EAWorker('lockFactorCBNested');
        nestedWorker.start();
        holder.worker = nestedWorker;
        holder.job = nestedWorker.run<void>(callbackNestedInnerTask, counter);
      });
      await taskpool.execute(task);
      try {
        let job = holder.job;
        if (job != null) {
          job.Await();
        }
      } finally {
        let worker = holder.worker;
        if (worker != null) {
          worker.quit();
        }
      }
      expect(counter.load()).assertEqual(3);
      } catch (error) {
        console.error(`LockFactorCallbackTest0500 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest0600
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0600
     * @tc.desc    TC-037: Verify multi-callback concurrent lock contention safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task1 = new taskpool.Task(multiCallbackTask, mutex, counter);
      const task2 = new taskpool.Task(multiCallbackTask, mutex, counter);
      const task3 = new taskpool.Task(multiCallbackTask, mutex, counter);
      task1.onReceiveData((data: string): void => {
        console.info('received data:', data);
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      task2.onReceiveData((data: string): void => {
        console.info('received data:', data);
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      task3.onReceiveData((data: string): void => {
        console.info('received data:', data);
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      await Promise.all([taskpool.execute(task1), taskpool.execute(task2), taskpool.execute(task3)]);
      expect(counter.load()).assertEqual(6);
      } catch (error) {
        console.error(`LockFactorCallbackTest0600 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest0700
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0700
     * @tc.desc    TC-038: Verify sendData with Mutex protection - task acquires lock before sending data
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(sendDataMutexTask, mutex, counter);
      task.onReceiveData((data: string): void => {
        console.info('received data:', data);
        counter.fetchAdd(1);
      });
      await taskpool.execute(task);
      expect(counter.load()).assertEqual(2);
      } catch (error) {
        console.error(`LockFactorCallbackTest0700 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest0800
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0800
     * @tc.desc    TC-039: Verify sendData with RWLock protection for multi-task concurrent sending
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      const task1 = new taskpool.Task(sendDataRWLockTask, rwlock, counter);
      const task2 = new taskpool.Task(sendDataRWLockTask, rwlock, counter);
      task1.onReceiveData((data: string): void => {
        console.info('received data:', data);
        counter.fetchAdd(1);
      });
      task2.onReceiveData((data: string): void => {
        console.info('received data:', data);
        counter.fetchAdd(1);
      });
      await Promise.all([taskpool.execute(task1), taskpool.execute(task2)]);
      expect(counter.load()).assertEqual(4);
      } catch (error) {
        console.error(`LockFactorCallbackTest0800 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest0900
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0900
     * @tc.desc    TC-041: Verify sendData triggers onReceiveData callback with lock safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(sendDataTriggerTask, counter);
      task.onReceiveData((data: string): void => {
        console.info('received data:', data);
        const readLock = rwlock.readLock();
        readLock.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          readLock.unlock();
        }
      });
      await taskpool.execute(task);
      expect(counter.load()).assertEqual(2);
      } catch (error) {
        console.error(`LockFactorCallbackTest0900 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest1000
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1000
     * @tc.desc    TC-042: Verify sendData concurrent contention with multiple tasks competing for lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task1 = new taskpool.Task(sendDataConcurrentTask, mutex, counter);
      const task2 = new taskpool.Task(sendDataConcurrentTask, mutex, counter);
      const task3 = new taskpool.Task(sendDataConcurrentTask, mutex, counter);
      const task4 = new taskpool.Task(sendDataConcurrentTask, mutex, counter);
      const task5 = new taskpool.Task(sendDataConcurrentTask, mutex, counter);
      task1.onReceiveData((data: string): void => { counter.fetchAdd(1); console.info('received data:', data); });
      task2.onReceiveData((data: string): void => { counter.fetchAdd(1); console.info('received data:', data); });
      task3.onReceiveData((data: string): void => { counter.fetchAdd(1); console.info('received data:', data); });
      task4.onReceiveData((data: string): void => { counter.fetchAdd(1); console.info('received data:', data); });
      task5.onReceiveData((data: string): void => { counter.fetchAdd(1); console.info('received data:', data); });
      await Promise.all([
        taskpool.execute(task1), taskpool.execute(task2), taskpool.execute(task3),
        taskpool.execute(task4), taskpool.execute(task5)
      ]);
      expect(counter.load()).assertEqual(10);
      } catch (error) {
        console.error(`LockFactorCallbackTest1000 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest1100
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1100
     * @tc.desc    TC-043: Verify Mutex remains usable after sendData callback completes
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(sendDataLockReuseTask, mutex, counter);
      task.onReceiveData((data: string): void => {
        console.info('received data:', data);
        counter.fetchAdd(1);
      });
      await taskpool.execute(task);
      // Verify the Mutex is still usable after the sendData callback completes:
      // reuse the same lock on the main thread and make the operation observable.
      mutex.lock();
      try {
        counter.fetchAdd(1);
      } finally {
        mutex.unlock();
      }
      expect(counter.load()).assertEqual(3);
      } catch (error) {
        console.error(`LockFactorCallbackTest1100 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest1200
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1200
     * @tc.desc    TC-044: Verify EAWorker run task internal Mutex lock/unlock safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const worker = new EAWorker('lockFactorCB01');
      worker.start();
      try {
        const workerResult: number = worker.run<number>(workerLockTask, mutex).Await();
        expect(workerResult).assertEqual(1);
      } finally {
        worker.quit();
      }
      } catch (error) {
        console.error(`LockFactorCallbackTest1200 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest1300
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1300
     * @tc.desc    TC-045: Verify EAWorker run task with main thread Mutex-protected counter access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorCB02');
      worker.start();
      try {
        const workerResult: number = worker.run<number>(workerMessageHandlerTask).Await();
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
        expect(workerResult).assertEqual(1);
        expect(counter.load()).assertEqual(1);
      } finally {
        worker.quit();
      }
      } catch (error) {
        console.error(`LockFactorCallbackTest1300 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest1400
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1400
     * @tc.desc    TC-046: Verify EAWorker task exception lock safety - Mutex released and reusable after task throws
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorCB03');
      worker.start();
      try {
        let exceptionCaught: boolean = false;
        try {
          worker.run<void>(workerExceptionTask, mutex, counter).Await();
        } catch (e) {
          // Expected exception from worker task
          exceptionCaught = true;
        }
        expect(exceptionCaught).assertTrue();
        // Verify lock is usable after worker task exception
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
        expect(counter.load()).assertEqual(2);
      } finally {
        worker.quit();
      }
      } catch (error) {
        console.error(`LockFactorCallbackTest1400 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest1500
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1500
     * @tc.desc    TC-047: Verify two EAWorkers each complete a Mutex-protected operation
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const worker1 = new EAWorker('lockFactorCB04');
      const worker2 = new EAWorker('lockFactorCB05');
      worker1.start();
      worker2.start();
      try {
        const job1 = worker1.run<number>(workerLockTask, mutex);
        const job2 = worker2.run<number>(workerLockTask, mutex);
        expect(job1.Await()).assertEqual(1);
        expect(job2.Await()).assertEqual(1);
      } finally {
        worker1.quit();
        worker2.quit();
      }
      } catch (error) {
        console.error(`LockFactorCallbackTest1500 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest1600
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1600
     * @tc.desc    TC-049: Verify EAWorker Mutex-protected run task and lock reuse on main thread after execution
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorCB07');
      worker.start();
      try {
        const workerResult: number = worker.run<number>(workerLockTask, mutex).Await();
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
        expect(workerResult).assertEqual(1);
        expect(counter.load()).assertEqual(1);
      } finally {
        worker.quit();
      }
      } catch (error) {
        console.error(`LockFactorCallbackTest1600 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest1700
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1700
     * @tc.desc    TC-051: Verify taskpool multi-task concurrent lock contention
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(multiMessageTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(multiMessageTask, mutex, counter));
      let p3 = taskpool.execute(new taskpool.Task(multiMessageTask, mutex, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.load()).assertEqual(3);
      } catch (error) {
        console.error(`LockFactorCallbackTest1700 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    LockFactorCallbackTest1800
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1800
     * @tc.desc    TC-052: Verify EAWorker exception flow lock state handling
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorCB09');
      worker.start();
      try {
        let exceptionCaught: boolean = false;
        try {
          worker.run<void>(exceptionMessageTask, counter).Await();
        } catch (e) {
          // Expected exception from worker task
          exceptionCaught = true;
        }
        expect(exceptionCaught).assertTrue();
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
        expect(counter.load()).assertEqual(2);
      } finally {
        worker.quit();
      }
      } catch (error) {
        console.error(`LockFactorCallbackTest1800 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })
  })
}
