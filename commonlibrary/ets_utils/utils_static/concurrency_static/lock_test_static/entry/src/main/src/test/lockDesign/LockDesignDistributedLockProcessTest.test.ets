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

// ==================== DistributedLockProcess classes ====================
class SharedLockData {
  value: number = 0;
}

class ContentionData {
  counter: number = 0;
  maxSeen: number = 0;
}

class ProcessRetryData {
  attempts: number = 0;
  success: number = 0;
}

// ==================== DistributedLockTimeout classes ====================
class TimeoutLockData {
  completed: number = 0;
}

class RetryLockData {
  attempts: number = 0;
  success: number = 0;
}

class DynamicTimeoutData {
  timeout: number = 100;
  completed: number = 0;
}

class RetryLimitData {
  retries: number = 0;
  maxRetries: number = 3;
  completed: number = 0;
  aborted: number = 0;
}

// ==================== DistributedLockPriority classes ====================
class LockPriorityData {
  readCount: number = 0;
  writeCount: number = 0;
}

class HighPriorityData {
  completed: number = 0;
  priority: number = 10;
}

class LowPriorityData {
  completed: number = 0;
  priority: number = 1;
}

class DynamicPriorityData {
  priority: number = 5;
  completed: number = 0;
}

// ==================== DistributedLockProcess task functions ====================
function sharedLockTask(mutex: Mutex, data: SharedLockData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.value = data.value + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function lockContentionTask(mutex: Mutex, data: ContentionData, counter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    mutex.lock();
    try {
      data.counter = data.counter + 1;
      if (data.counter > data.maxSeen) {
        data.maxSeen = data.counter;
      }
      data.counter = data.counter - 1;
    } finally {
      mutex.unlock();
    }
  }
  counter.fetchAdd(1);
}

function lockTimeoutTask(mutex: Mutex, counter: AtomicInt): void {
  mutex.lock();
  try {
    for (let i: number = 0; i < 5; i++) {
      let val: number = i * 2;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function lockRetryTask(mutex: Mutex, data: ProcessRetryData, counter: AtomicInt): void {
  let acquired: boolean = false;
  for (let attempt: number = 0; attempt < 3; attempt++) {
    data.attempts = data.attempts + 1;
    mutex.lock();
    try {
      data.success = data.success + 1;
      acquired = true;
    } finally {
      mutex.unlock();
    }
    if (acquired) {
      break;
    }
  }
  counter.fetchAdd(1);
}

// ==================== DistributedLockTimeout task functions ====================
function lockTimeoutSimpleTask(mutex: Mutex, data: TimeoutLockData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.completed = data.completed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function lockRetryBackoffTask(mutex: Mutex, data: RetryLockData, counter: AtomicInt): void {
  data.attempts = data.attempts + 1;
  mutex.lock();
  try {
    data.success = data.success + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function dynamicTimeoutTask(mutex: Mutex, data: DynamicTimeoutData, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (data.completed > 2) {
      data.timeout = data.timeout * 2;
    }
    data.completed = data.completed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function retryLimitTask(mutex: Mutex, data: RetryLimitData, counter: AtomicInt): void {
  if (data.retries < data.maxRetries) {
    data.retries = data.retries + 1;
    mutex.lock();
    try {
      data.completed = data.completed + 1;
      counter.fetchAdd(1);
    } finally {
      mutex.unlock();
    }
  } else {
    data.aborted = data.aborted + 1;
    counter.fetchAdd(1);
  }
}

// ==================== DistributedLockPriority task functions ====================
function readPriorityTask(rwlock: RWLock, data: LockPriorityData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    data.readCount = data.readCount + 1;
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function writePriorityTask(rwlock: RWLock, data: LockPriorityData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    data.writeCount = data.writeCount + 1;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function highPriorityTask(mutex: Mutex, data: HighPriorityData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.completed = data.completed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function lowPriorityTask(mutex: Mutex, data: LowPriorityData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.completed = data.completed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function dynamicPriorityTask(mutex: Mutex, data: DynamicPriorityData, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (data.completed > 2) {
      data.priority = data.priority + 1;
    }
    data.completed = data.completed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// ==================== EXPORTED FUNCTION ====================
export default function LockDesignDistributedLockProcessTest(): void {
  // ---------- DistributedLockProcess tests ----------
  describe('LockDesignDistributedLockProcessTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name    LockDesignDistributedLockProcessTest0100
     * @tc.number  SUB_LOCK_DESIGN_DISTRIBUTED_LOCK_PROCESS_TEST_0100
     * @tc.desc    Verify shared lock with 5 concurrent tasks incrementing counter using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignDistributedLockProcessTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const data = new SharedLockData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(sharedLockTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(sharedLockTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(sharedLockTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(sharedLockTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(sharedLockTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.value).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignDistributedLockProcessTest0200
     * @tc.number  SUB_LOCK_DESIGN_DISTRIBUTED_LOCK_PROCESS_TEST_0200
     * @tc.desc    Verify lock contention with 5 tasks each performing 10 lock-unlock cycles
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignDistributedLockProcessTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new ContentionData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(lockContentionTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(lockContentionTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(lockContentionTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(lockContentionTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(lockContentionTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.counter).assertEqual(0);
    })

    /**
     * @tc.name    LockDesignDistributedLockProcessTest0300
     * @tc.number  SUB_LOCK_DESIGN_DISTRIBUTED_LOCK_PROCESS_TEST_0300
     * @tc.desc    Verify lock timeout handling with 5 concurrent tasks performing loop operations
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignDistributedLockProcessTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(lockTimeoutTask, mutex, counter));
      let t2 = taskpool.execute(new taskpool.Task(lockTimeoutTask, mutex, counter));
      let t3 = taskpool.execute(new taskpool.Task(lockTimeoutTask, mutex, counter));
      let t4 = taskpool.execute(new taskpool.Task(lockTimeoutTask, mutex, counter));
      let t5 = taskpool.execute(new taskpool.Task(lockTimeoutTask, mutex, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignDistributedLockProcessTest0400
     * @tc.number  SUB_LOCK_DESIGN_DISTRIBUTED_LOCK_PROCESS_TEST_0400
     * @tc.desc    Verify lock retry mechanism with 3 tasks each attempting up to 3 retries
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignDistributedLockProcessTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new ProcessRetryData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(lockRetryTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(lockRetryTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(lockRetryTask, mutex, data, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.success).assertEqual(3);
    })
    /**
     * @tc.name    LockDesignDistributedLockProcessTest0500
     * @tc.number  SUB_LOCK_DESIGN_DISTRIBUTED_LOCK_PROCESS_TEST_0500
     * @tc.desc    Verify simple lock timeout with 5 concurrent tasks completing under Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignDistributedLockProcessTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new TimeoutLockData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(lockTimeoutSimpleTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(lockTimeoutSimpleTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(lockTimeoutSimpleTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(lockTimeoutSimpleTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(lockTimeoutSimpleTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.completed).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignDistributedLockProcessTest0600
     * @tc.number  SUB_LOCK_DESIGN_DISTRIBUTED_LOCK_PROCESS_TEST_0600
     * @tc.desc    Verify lock retry backoff with 5 tasks each acquiring lock once
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignDistributedLockProcessTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new RetryLockData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(lockRetryBackoffTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(lockRetryBackoffTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(lockRetryBackoffTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(lockRetryBackoffTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(lockRetryBackoffTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.success).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignDistributedLockProcessTest0700
     * @tc.number  SUB_LOCK_DESIGN_DISTRIBUTED_LOCK_PROCESS_TEST_0700
     * @tc.desc    Verify dynamic timeout adjustment with 5 concurrent tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignDistributedLockProcessTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new DynamicTimeoutData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(dynamicTimeoutTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(dynamicTimeoutTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(dynamicTimeoutTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(dynamicTimeoutTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(dynamicTimeoutTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.completed).assertEqual(5);
      expect(data.timeout >= 100).assertTrue();
    })

    /**
     * @tc.name    LockDesignDistributedLockProcessTest0800
     * @tc.number  SUB_LOCK_DESIGN_DISTRIBUTED_LOCK_PROCESS_TEST_0800
     * @tc.desc    Verify retry limit with 5 tasks respecting max retries threshold
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignDistributedLockProcessTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new RetryLimitData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(retryLimitTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(retryLimitTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(retryLimitTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(retryLimitTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(retryLimitTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignDistributedLockProcessTest0900
     * @tc.number  SUB_LOCK_DESIGN_DISTRIBUTED_LOCK_PROCESS_TEST_0900
     * @tc.desc    Verify RWLock read-write priority with 5 readers and 2 writers concurrent
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignDistributedLockProcessTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rwlock = new RWLock();
      const data = new LockPriorityData();
      const counter = new AtomicInt(0);
      let r1 = taskpool.execute(new taskpool.Task(readPriorityTask, rwlock, data, counter));
      let r2 = taskpool.execute(new taskpool.Task(readPriorityTask, rwlock, data, counter));
      let r3 = taskpool.execute(new taskpool.Task(readPriorityTask, rwlock, data, counter));
      let r4 = taskpool.execute(new taskpool.Task(readPriorityTask, rwlock, data, counter));
      let r5 = taskpool.execute(new taskpool.Task(readPriorityTask, rwlock, data, counter));
      let w1 = taskpool.execute(new taskpool.Task(writePriorityTask, rwlock, data, counter));
      let w2 = taskpool.execute(new taskpool.Task(writePriorityTask, rwlock, data, counter));
      await Promise.all([r1, r2, r3, r4, r5, w1, w2]);
      expect(counter.load()).assertEqual(7);
      expect(data.writeCount).assertEqual(2);
    })

    /**
     * @tc.name    LockDesignDistributedLockProcessTest1000
     * @tc.number  SUB_LOCK_DESIGN_DISTRIBUTED_LOCK_PROCESS_TEST_1000
     * @tc.desc    Verify high priority tasks complete with 5 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignDistributedLockProcessTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new HighPriorityData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(highPriorityTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(highPriorityTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(highPriorityTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(highPriorityTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(highPriorityTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.completed).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignDistributedLockProcessTest1100
     * @tc.number  SUB_LOCK_DESIGN_DISTRIBUTED_LOCK_PROCESS_TEST_1100
     * @tc.desc    Verify low priority tasks complete with 5 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignDistributedLockProcessTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new LowPriorityData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(lowPriorityTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(lowPriorityTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(lowPriorityTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(lowPriorityTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(lowPriorityTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.completed).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignDistributedLockProcessTest1200
     * @tc.number  SUB_LOCK_DESIGN_DISTRIBUTED_LOCK_PROCESS_TEST_1200
     * @tc.desc    Verify dynamic priority adjustment with 5 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignDistributedLockProcessTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new DynamicPriorityData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(dynamicPriorityTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(dynamicPriorityTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(dynamicPriorityTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(dynamicPriorityTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(dynamicPriorityTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.completed).assertEqual(5);
      expect(data.priority >= 5).assertTrue();
    })
  })
}
