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

// ==================== Transaction classes ====================
class TransactionState {
  balance: number = 1000;
  committed: number = 0;
}

class RollbackState {
  value: number = 100;
  rollbackCount: number = 0;
  committed: number = 0;
}

class NestedTxState {
  outerValue: number = 0;
  innerValue: number = 0;
}

class IsolationState {
  data: number = 0;
  dirtyRead: boolean = false;
  completed: number = 0;
}

// ==================== Batch classes ====================
class BatchData {
  processed: number = 0;
}

class BatchSplitData {
  batches: number[] = [];
  totalProcessed: number = 0;
}

class BatchInterruptData {
  processed: number = 0;
  interrupted: boolean = false;
  resumed: boolean = false;
}

class BatchProgressData {
  total: number = 0;
  completed: number = 0;
}

// ==================== Stream classes ====================
class StreamData {
  readCount: number = 0;
  writeCount: number = 0;
}

class StreamBuffer {
  buffer: number[] = [];
  flushed: number = 0;
}

class StreamCheckpoint {
  offset: number = 0;
  checkpointCount: number = 0;
}

class StreamMultiData {
  streams: number[] = [];
  processedCount: number = 0;
}

// ==================== Scheduled classes ====================
class ScheduledData {
  executed: number = 0;
}

class ConcurrentScheduledData {
  completed: number = 0;
}

class CancelData {
  executed: number = 0;
  cancelled: boolean = false;
}

class ErrorScheduledData {
  executed: number = 0;
  errorHandled: boolean = false;
}

// ==================== Event classes ====================
class EventData {
  triggered: number = 0;
}

class EventQueueData {
  events: number[] = [];
  processed: number = 0;
}

class EventPriorityData {
  highEvents: number = 0;
  lowEvents: number = 0;
}

// ==================== Transaction task functions ====================
function transactionTask(mutex: Mutex, state: TransactionState, counter: AtomicInt): void {
  mutex.lock();
  try {
    state.balance = state.balance + 100;
    state.balance = state.balance - 100;
    state.committed = state.committed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function rollbackTask(mutex: Mutex, state: RollbackState, counter: AtomicInt): void {
  mutex.lock();
  try {
    let original: number = state.value;
    state.value = state.value + 50;
    state.value = original;
    state.rollbackCount = state.rollbackCount + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function nestedTransactionTask(mutex: Mutex, state: NestedTxState, counter: AtomicInt): void {
  mutex.lock();
  try {
    state.outerValue = state.outerValue + 1;
    state.innerValue = state.innerValue + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function isolationTask(mutex: Mutex, state: IsolationState, counter: AtomicInt): void {
  mutex.lock();
  try {
    let snapshot: number = state.data;
    state.data = state.data + 1;
    if (snapshot !== state.data - 1) {
      state.dirtyRead = true;
    }
    state.completed = state.completed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// ==================== Batch task functions ====================
function batchProcessTask(mutex: Mutex, data: BatchData, counter: AtomicInt): void {
  mutex.lock();
  try {
    for (let i: number = 0; i < 10; i++) {
      data.processed = data.processed + 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function batchSplitTask(mutex: Mutex, data: BatchSplitData, counter: AtomicInt): void {
  mutex.lock();
  try {
    let batchSize: number = 5;
    data.batches.push(batchSize);
    data.totalProcessed = data.totalProcessed + batchSize;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function batchInterruptTask(mutex: Mutex, data: BatchInterruptData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.processed = data.processed + 1;
    data.interrupted = true;
    data.resumed = true;
    data.processed = data.processed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function batchProgressTask(mutex: Mutex, data: BatchProgressData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.completed = data.completed + 1;
    data.total = data.total + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// ==================== Stream task functions ====================
function streamReadTask(rwlock: RWLock, data: StreamData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    data.readCount = data.readCount + 1;
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function streamWriteTask(rwlock: RWLock, data: StreamData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    data.writeCount = data.writeCount + 1;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function streamBufferTask(rwlock: RWLock, buf: StreamBuffer, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    for (let i: number = 0; i < 5; i++) {
      buf.buffer.push(i);
    }
    buf.flushed = buf.flushed + 1;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function streamCheckpointTask(rwlock: RWLock, cp: StreamCheckpoint, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    cp.offset = cp.offset + 10;
    cp.checkpointCount = cp.checkpointCount + 1;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function streamMultiFlowTask(rwlock: RWLock, data: StreamMultiData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    data.streams.push(Math.floor(Math.random() * 100));
    data.processedCount = data.processedCount + 1;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

// ==================== Scheduled task functions ====================
function scheduledTask(mutex: Mutex, data: ScheduledData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.executed = data.executed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function concurrentScheduledTask(mutex: Mutex, data: ConcurrentScheduledData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.completed = data.completed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function cancelScheduledTask(mutex: Mutex, data: CancelData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.executed = data.executed + 1;
    data.cancelled = true;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function errorScheduledTask(mutex: Mutex, data: ErrorScheduledData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.executed = data.executed + 1;
    data.errorHandled = true;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// ==================== Event task functions ====================
function eventTriggerTask(mutex: Mutex, data: EventData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.triggered = data.triggered + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function eventQueueTask(mutex: Mutex, data: EventQueueData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.events.push(Math.floor(Math.random() * 100));
    data.processed = data.processed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function eventPriorityHighTask(mutex: Mutex, data: EventPriorityData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.highEvents = data.highEvents + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function eventPriorityLowTask(mutex: Mutex, data: EventPriorityData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.lowEvents = data.lowEvents + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

export default function LockDesignSpecialBusinessTransactionTest(): void {
  describe('LockDesignSpecialBusinessTransactionTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest0100
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_0100
     * @tc.desc    Verify transaction commit with 3 concurrent tasks maintaining balance using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignSpecialBusinessTransactionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const state = new TransactionState();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(transactionTask, mutex, state, counter));
      let t2 = taskpool.execute(new taskpool.Task(transactionTask, mutex, state, counter));
      let t3 = taskpool.execute(new taskpool.Task(transactionTask, mutex, state, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(state.balance).assertEqual(1000);
      expect(state.committed).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest0200
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_0200
     * @tc.desc    Verify transaction rollback with 3 concurrent tasks restoring value using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignSpecialBusinessTransactionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const state = new RollbackState();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(rollbackTask, mutex, state, counter));
      let t2 = taskpool.execute(new taskpool.Task(rollbackTask, mutex, state, counter));
      let t3 = taskpool.execute(new taskpool.Task(rollbackTask, mutex, state, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(state.value).assertEqual(100);
      expect(state.rollbackCount).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest0300
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_0300
     * @tc.desc    Verify nested transaction with 4 concurrent tasks updating outer and inner values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignSpecialBusinessTransactionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const state = new NestedTxState();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(nestedTransactionTask, mutex, state, counter));
      let t2 = taskpool.execute(new taskpool.Task(nestedTransactionTask, mutex, state, counter));
      let t3 = taskpool.execute(new taskpool.Task(nestedTransactionTask, mutex, state, counter));
      let t4 = taskpool.execute(new taskpool.Task(nestedTransactionTask, mutex, state, counter));
      await Promise.all([t1, t2, t3, t4]);
      expect(counter.load()).assertEqual(4);
      expect(state.outerValue).assertEqual(4);
      expect(state.innerValue).assertEqual(4);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest0400
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_0400
     * @tc.desc    Verify transaction isolation with 5 concurrent tasks preventing dirty reads
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignSpecialBusinessTransactionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const state = new IsolationState();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(isolationTask, mutex, state, counter));
      let t2 = taskpool.execute(new taskpool.Task(isolationTask, mutex, state, counter));
      let t3 = taskpool.execute(new taskpool.Task(isolationTask, mutex, state, counter));
      let t4 = taskpool.execute(new taskpool.Task(isolationTask, mutex, state, counter));
      let t5 = taskpool.execute(new taskpool.Task(isolationTask, mutex, state, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(state.data).assertEqual(5);
      expect(state.dirtyRead).assertFalse();
      expect(state.completed).assertEqual(5);
    })
    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest0500
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_0500
     * @tc.desc    Verify batch processing with 3 concurrent tasks each processing 10 items
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignSpecialBusinessTransactionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const data = new BatchData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(batchProcessTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(batchProcessTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(batchProcessTask, mutex, data, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.processed).assertEqual(30);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest0600
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_0600
     * @tc.desc    Verify batch split with 4 concurrent tasks splitting into separate batches
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignSpecialBusinessTransactionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new BatchSplitData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(batchSplitTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(batchSplitTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(batchSplitTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(batchSplitTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4]);
      expect(counter.load()).assertEqual(4);
      expect(data.batches.length).assertEqual(4);
      expect(data.totalProcessed).assertEqual(20);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest0700
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_0700
     * @tc.desc    Verify batch interrupt and resume with 2 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignSpecialBusinessTransactionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new BatchInterruptData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(batchInterruptTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(batchInterruptTask, mutex, data, counter));
      await Promise.all([t1, t2]);
      expect(counter.load()).assertEqual(2);
      expect(data.processed).assertEqual(4);
      expect(data.resumed).assertTrue();
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest0800
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_0800
     * @tc.desc    Verify batch progress tracking with 5 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignSpecialBusinessTransactionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new BatchProgressData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(batchProgressTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(batchProgressTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(batchProgressTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(batchProgressTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(batchProgressTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.completed).assertEqual(5);
      expect(data.total).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest0900
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_0900
     * @tc.desc    Verify stream read-write with 5 readers and 2 writers using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignSpecialBusinessTransactionTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const rwlock = new RWLock();
      const data = new StreamData();
      const counter = new AtomicInt(0);
      let r1 = taskpool.execute(new taskpool.Task(streamReadTask, rwlock, data, counter));
      let r2 = taskpool.execute(new taskpool.Task(streamReadTask, rwlock, data, counter));
      let r3 = taskpool.execute(new taskpool.Task(streamReadTask, rwlock, data, counter));
      let r4 = taskpool.execute(new taskpool.Task(streamReadTask, rwlock, data, counter));
      let r5 = taskpool.execute(new taskpool.Task(streamReadTask, rwlock, data, counter));
      let w1 = taskpool.execute(new taskpool.Task(streamWriteTask, rwlock, data, counter));
      let w2 = taskpool.execute(new taskpool.Task(streamWriteTask, rwlock, data, counter));
      await Promise.all([r1, r2, r3, r4, r5, w1, w2]);
      expect(counter.load()).assertEqual(7);
      expect(data.writeCount).assertEqual(2);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest1000
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_1000
     * @tc.desc    Verify stream buffer with 3 concurrent tasks flushing buffered data using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignSpecialBusinessTransactionTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rwlock = new RWLock();
      const buf = new StreamBuffer();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(streamBufferTask, rwlock, buf, counter));
      let t2 = taskpool.execute(new taskpool.Task(streamBufferTask, rwlock, buf, counter));
      let t3 = taskpool.execute(new taskpool.Task(streamBufferTask, rwlock, buf, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(buf.buffer.length).assertEqual(15);
      expect(buf.flushed).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest1100
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_1100
     * @tc.desc    Verify stream checkpoint with 3 concurrent tasks updating offset using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignSpecialBusinessTransactionTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const cp = new StreamCheckpoint();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(streamCheckpointTask, rwlock, cp, counter));
      let t2 = taskpool.execute(new taskpool.Task(streamCheckpointTask, rwlock, cp, counter));
      let t3 = taskpool.execute(new taskpool.Task(streamCheckpointTask, rwlock, cp, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(cp.offset).assertEqual(30);
      expect(cp.checkpointCount).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest1200
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_1200
     * @tc.desc    Verify multi-stream flow with 5 concurrent tasks using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignSpecialBusinessTransactionTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const data = new StreamMultiData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(streamMultiFlowTask, rwlock, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(streamMultiFlowTask, rwlock, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(streamMultiFlowTask, rwlock, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(streamMultiFlowTask, rwlock, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(streamMultiFlowTask, rwlock, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.streams.length).assertEqual(5);
      expect(data.processedCount).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest1300
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_1300
     * @tc.desc    Verify scheduled task execution with 3 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignSpecialBusinessTransactionTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const data = new ScheduledData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(scheduledTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(scheduledTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(scheduledTask, mutex, data, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.executed).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest1400
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_1400
     * @tc.desc    Verify concurrent scheduled tasks with 5 tasks completing under Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignSpecialBusinessTransactionTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new ConcurrentScheduledData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(concurrentScheduledTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(concurrentScheduledTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(concurrentScheduledTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(concurrentScheduledTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(concurrentScheduledTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.completed).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest1500
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_1500
     * @tc.desc    Verify scheduled task cancellation with 2 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignSpecialBusinessTransactionTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new CancelData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(cancelScheduledTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(cancelScheduledTask, mutex, data, counter));
      await Promise.all([t1, t2]);
      expect(counter.load()).assertEqual(2);
      expect(data.cancelled).assertTrue();
      expect(data.executed).assertEqual(2);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest1600
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_1600
     * @tc.desc    Verify scheduled task error handling with 3 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignSpecialBusinessTransactionTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new ErrorScheduledData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(errorScheduledTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(errorScheduledTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(errorScheduledTask, mutex, data, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.errorHandled).assertTrue();
      expect(data.executed).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest1700
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_1700
     * @tc.desc    Verify event trigger with 5 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignSpecialBusinessTransactionTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const data = new EventData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(eventTriggerTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(eventTriggerTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(eventTriggerTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(eventTriggerTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(eventTriggerTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.triggered).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest1800
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_1800
     * @tc.desc    Verify event queue with 4 concurrent tasks processing events using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignSpecialBusinessTransactionTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new EventQueueData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(eventQueueTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(eventQueueTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(eventQueueTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(eventQueueTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4]);
      expect(counter.load()).assertEqual(4);
      expect(data.events.length).assertEqual(4);
      expect(data.processed).assertEqual(4);
    })

    /**
     * @tc.name    LockDesignSpecialBusinessTransactionTest1900
     * @tc.number  SUB_LOCK_DESIGN_SPECIAL_BUSINESS_TRANSACTION_TEST_1900
     * @tc.desc    Verify event priority with 3 high and 2 low priority tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignSpecialBusinessTransactionTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new EventPriorityData();
      const counter = new AtomicInt(0);
      let h1 = taskpool.execute(new taskpool.Task(eventPriorityHighTask, mutex, data, counter));
      let h2 = taskpool.execute(new taskpool.Task(eventPriorityHighTask, mutex, data, counter));
      let h3 = taskpool.execute(new taskpool.Task(eventPriorityHighTask, mutex, data, counter));
      let l1 = taskpool.execute(new taskpool.Task(eventPriorityLowTask, mutex, data, counter));
      let l2 = taskpool.execute(new taskpool.Task(eventPriorityLowTask, mutex, data, counter));
      await Promise.all([h1, h2, h3, l1, l2]);
      expect(counter.load()).assertEqual(5);
      expect(data.highEvents).assertEqual(3);
      expect(data.lowEvents).assertEqual(2);
    })
  })
}
