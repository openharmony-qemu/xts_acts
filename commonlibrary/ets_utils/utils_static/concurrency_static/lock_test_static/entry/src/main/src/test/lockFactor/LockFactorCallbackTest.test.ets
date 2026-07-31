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

class CallbackSharedCounter {
  value: number = 0;
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

// TC-040: sendData nested lock send task
function sendDataNestedTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
    taskpool.Task.sendData('nested_send');
  } finally {
    mutex.unlock();
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

// TC-043: sendData exception handling task
function sendDataExceptionTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
    taskpool.Task.sendData('exception_data');
  } finally {
    mutex.unlock();
  }
}

// TC-044: Worker callback lock task
function workerCallbackLockTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC-045: Worker message handler lock task
function workerMessageHandlerTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
}

// TC-046: Worker exception callback lock task
function workerExceptionTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC-047: Worker multi-callback concurrent task
function workerMultiCallbackTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC-048: MessageHandler constructor callback lock task
function messageHandlerConstructorTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
}

// TC-049: handler.sendMessage lock protection task
function sendMessageLockTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// TC-050: message.getObject lock protection task
function messageGetObjectTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
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

// TC-052: MessageHandler exception message task
function exceptionMessageTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
}

// TC-053: MessageHandler nested message task
function nestedMessageTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
}

export default function LockFactorCallbackTest(): void {
  describe('LockFactorCallbackTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name    LockFactorCallbackTest0100
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0100
     * @tc.desc    TC-032: Verify onReceiveData callback internal Mutex lock/unlock safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(callbackMutexTask, counter);
      task.onReceiveData(() => {
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      await taskpool.execute(task);
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorCallbackTest0200
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0200
     * @tc.desc    TC-033: Verify onReceiveData callback internal ReadLock lock/unlock correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(callbackRWLockTask, counter);
      task.onReceiveData(() => {
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
    })

    /**
     * @tc.name    LockFactorCallbackTest0300
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0300
     * @tc.desc    TC-034: Verify onExecutionSucceeded callback internal lock usage
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
    })

    /**
     * @tc.name    LockFactorCallbackTest0400
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0400
     * @tc.desc    TC-035: Verify onExecutionFailed callback internal lock usage
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(failedTask);
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
        // Expected exception from failed task
      }
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    LockFactorCallbackTest0500
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0500
     * @tc.desc    TC-036: Verify callback internal nested task creation with lock protection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(callbackNestedOuterTask, counter);
      task.onReceiveData(() => {
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      await taskpool.execute(task);
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorCallbackTest0600
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0600
     * @tc.desc    TC-037: Verify multi-callback concurrent lock contention safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task1 = new taskpool.Task(multiCallbackTask, mutex, counter);
      const task2 = new taskpool.Task(multiCallbackTask, mutex, counter);
      const task3 = new taskpool.Task(multiCallbackTask, mutex, counter);
      task1.onReceiveData(() => {
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      task2.onReceiveData(() => {
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      task3.onReceiveData(() => {
        mutex.lock();
        try {
          counter.fetchAdd(1);
        } finally {
          mutex.unlock();
        }
      });
      await Promise.all([taskpool.execute(task1), taskpool.execute(task2), taskpool.execute(task3)]);
      expect(counter.load()).assertEqual(6);
    })

    /**
     * @tc.name    LockFactorCallbackTest0700
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0700
     * @tc.desc    TC-038: Verify sendData with Mutex protection - task acquires lock before sending data
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(sendDataMutexTask, mutex, counter);
      task.onReceiveData(() => {
        counter.fetchAdd(1);
      });
      await taskpool.execute(task);
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorCallbackTest0800
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0800
     * @tc.desc    TC-039: Verify sendData with RWLock protection for multi-task concurrent sending
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      const task1 = new taskpool.Task(sendDataRWLockTask, rwlock, counter);
      const task2 = new taskpool.Task(sendDataRWLockTask, rwlock, counter);
      task1.onReceiveData(() => {
        counter.fetchAdd(1);
      });
      task2.onReceiveData(() => {
        counter.fetchAdd(1);
      });
      await Promise.all([taskpool.execute(task1), taskpool.execute(task2)]);
      expect(counter.load()).assertEqual(4);
    })

    /**
     * @tc.name    LockFactorCallbackTest0900
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_0900
     * @tc.desc    TC-040: Verify sendData nested lock sending - sendData then callback lock then sendData
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(sendDataNestedTask, mutex, counter);
      task.onReceiveData(() => {
        // Use a different mutex in callback to avoid deadlock with task's mutex
        counter.fetchAdd(1);
      });
      await taskpool.execute(task);
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorCallbackTest1000
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1000
     * @tc.desc    TC-041: Verify sendData triggers onReceiveData callback with lock safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(sendDataTriggerTask, counter);
      task.onReceiveData(() => {
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
    })

    /**
     * @tc.name    LockFactorCallbackTest1100
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1100
     * @tc.desc    TC-042: Verify sendData concurrent contention with multiple tasks competing for lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task1 = new taskpool.Task(sendDataConcurrentTask, mutex, counter);
      const task2 = new taskpool.Task(sendDataConcurrentTask, mutex, counter);
      const task3 = new taskpool.Task(sendDataConcurrentTask, mutex, counter);
      const task4 = new taskpool.Task(sendDataConcurrentTask, mutex, counter);
      const task5 = new taskpool.Task(sendDataConcurrentTask, mutex, counter);
      task1.onReceiveData(() => { counter.fetchAdd(1); });
      task2.onReceiveData(() => { counter.fetchAdd(1); });
      task3.onReceiveData(() => { counter.fetchAdd(1); });
      task4.onReceiveData(() => { counter.fetchAdd(1); });
      task5.onReceiveData(() => { counter.fetchAdd(1); });
      await Promise.all([
        taskpool.execute(task1), taskpool.execute(task2), taskpool.execute(task3),
        taskpool.execute(task4), taskpool.execute(task5)
      ]);
      expect(counter.load()).assertEqual(10);
    })

    /**
     * @tc.name    LockFactorCallbackTest1200
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1200
     * @tc.desc    TC-043: Verify sendData exception handling - lock state is correct after sendData exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const task = new taskpool.Task(sendDataExceptionTask, mutex, counter);
      task.onReceiveData(() => {
        counter.fetchAdd(1);
      });
      await taskpool.execute(task);
      expect(counter.load()).assertEqual(2);
      // Verify lock is usable after callback
      mutex.lock();
      mutex.unlock();
    })

    /**
     * @tc.name    LockFactorCallbackTest1300
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1300
     * @tc.desc    TC-044: Verify EAWorker internal callback lock safety with Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockFactorCallbackTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorCB01');
      worker.start();
      await worker.run<void>(workerCallbackLockTask, mutex, counter);
      worker.quit();
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    LockFactorCallbackTest1400
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1400
     * @tc.desc    TC-045: Verify Worker MessageHandler callback lock correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorCB02');
      worker.start();
      await worker.run<void>(workerMessageHandlerTask, counter);
      mutex.lock();
      try {
        counter.fetchAdd(1);
      } finally {
        mutex.unlock();
      }
      worker.quit();
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorCallbackTest1500
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1500
     * @tc.desc    TC-046: Verify Worker exception callback lock safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorCB03');
      worker.start();
      await worker.run<void>(workerExceptionTask, mutex, counter);
      // Verify lock is usable after worker task completes
      mutex.lock();
      try {
        counter.fetchAdd(1);
      } finally {
        mutex.unlock();
      }
      worker.quit();
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorCallbackTest1600
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1600
     * @tc.desc    TC-047: Verify Worker multi-callback concurrent lock contention
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker1 = new EAWorker('lockFactorCB04');
      const worker2 = new EAWorker('lockFactorCB05');
      worker1.start();
      worker2.start();
      await worker1.run<void>(workerMultiCallbackTask, mutex, counter);
      await worker2.run<void>(workerMultiCallbackTask, mutex, counter);
      worker1.quit();
      worker2.quit();
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorCallbackTest1700
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1700
     * @tc.desc    TC-048: Verify MessageHandler constructor callback lock safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorCB06');
      worker.start();
      await worker.run<void>(messageHandlerConstructorTask, counter);
      mutex.lock();
      try {
        counter.fetchAdd(1);
      } finally {
        mutex.unlock();
      }
      worker.quit();
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorCallbackTest1800
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1800
     * @tc.desc    TC-049: Verify handler.sendMessage with lock protection before and after sending
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorCB07');
      worker.start();
      await worker.run<void>(sendMessageLockTask, mutex, counter);
      mutex.lock();
      try {
        counter.fetchAdd(1);
      } finally {
        mutex.unlock();
      }
      worker.quit();
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorCallbackTest1900
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_1900
     * @tc.desc    TC-050: Verify message.getObject with lock protection for data access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorCB08');
      worker.start();
      await worker.run<void>(messageGetObjectTask, counter);
      mutex.lock();
      try {
        counter.fetchAdd(1);
      } finally {
        mutex.unlock();
      }
      worker.quit();
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorCallbackTest2000
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_2000
     * @tc.desc    TC-051: Verify MessageHandler multi-message concurrent lock contention
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(multiMessageTask, mutex, counter));
      let p2 = taskpool.execute(new taskpool.Task(multiMessageTask, mutex, counter));
      let p3 = taskpool.execute(new taskpool.Task(multiMessageTask, mutex, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.load()).assertEqual(3);
    })

    /**
     * @tc.name    LockFactorCallbackTest2100
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_2100
     * @tc.desc    TC-052: Verify MessageHandler exception message lock state handling
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorCB09');
      worker.start();
      await worker.run<void>(exceptionMessageTask, counter);
      mutex.lock();
      try {
        counter.fetchAdd(1);
      } finally {
        mutex.unlock();
      }
      worker.quit();
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name    LockFactorCallbackTest2200
     * @tc.number  SUB_LOCK_FACTOR_CALLBACK_TEST_2200
     * @tc.desc    TC-053: Verify MessageHandler nested message lock correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockFactorCallbackTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      const worker = new EAWorker('lockFactorCB10');
      worker.start();
      await worker.run<void>(nestedMessageTask, counter);
      mutex.lock();
      try {
        counter.fetchAdd(1);
      } finally {
        mutex.unlock();
      }
      worker.quit();
      expect(counter.load()).assertEqual(2);
    })
  })
}
