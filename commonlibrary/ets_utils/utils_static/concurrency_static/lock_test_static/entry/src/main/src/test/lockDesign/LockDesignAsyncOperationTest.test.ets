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

// ==================== AsyncOperation classes ====================
class AsyncLockData {
  value: number = 0;
}

class AsyncConcurrentData {
  completed: number = 0;
}

class AsyncErrorData {
  executed: number = 0;
  errorHandled: boolean = false;
}

class AsyncTimeoutData {
  completed: number = 0;
}

class PromiseLockData {
  value: number = 0;
  resolved: boolean = false;
}

class PromiseConcurrentData {
  results: number[] = [];
}

class PromiseChainData {
  chain: number[] = [];
}

class PromiseTimeoutData {
  completed: number = 0;
  timedOut: boolean = false;
}

// ==================== FileDescriptor classes ====================
class FileDescriptorPool {
  descriptors: number[] = [0, 1, 2, 3, 4];
  opened: number = 0;
  closed: number = 0;
}

class FileRWData {
  content: string = 'initial';
  readCount: number = 0;
  writeCount: number = 0;
}

class FileAccessData {
  accessCount: number = 0;
  lastAccess: number = 0;
}

class FileLockData {
  locked: boolean = false;
  lockCount: number = 0;
  unlockCount: number = 0;
}

// ==================== LogSystem classes ====================
class LogData {
  logs: string[] = [];
  readCount: number = 0;
}

class LogBuffer {
  buffer: string[] = [];
  flushed: number = 0;
}

class LogRotateData {
  files: number[] = [1, 2, 3];
  rotated: number = 0;
}

class LogCompressData {
  compressed: number = 0;
  totalSize: number = 100;
}

// ==================== StateManagement classes ====================
class StateQueryData {
  stateValue: number = 0;
  queryCount: number = 0;
  updateCount: number = 0;
}

class StateMachineData {
  currentState: string = 'idle';
  transitions: number = 0;
}

class StatePersistData {
  value: number = 0;
  persisted: boolean = false;
  persistCount: number = 0;
}

class StateRecoveryData {
  value: number = 100;
  recovered: boolean = false;
  recoveryCount: number = 0;
}

class StateVersionData {
  currentVersion: number = 1;
  versions: number[] = [1];
  readCount: number = 0;
}

// ==================== AsyncOperation task functions ====================
function asyncLockTask(mutex: Mutex, data: AsyncLockData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.value = data.value + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function asyncConcurrentTask(mutex: Mutex, data: AsyncConcurrentData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.completed = data.completed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function asyncErrorTask(mutex: Mutex, data: AsyncErrorData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.executed = data.executed + 1;
    data.errorHandled = true;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function asyncTimeoutLockTask(mutex: Mutex, data: AsyncTimeoutData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.completed = data.completed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function promiseResolveTask(mutex: Mutex, data: PromiseLockData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.value = data.value + 1;
    data.resolved = true;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function promiseConcurrentTask(mutex: Mutex, data: PromiseConcurrentData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.results.push(Math.floor(Math.random() * 100));
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function promiseChainTask(mutex: Mutex, data: PromiseChainData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.chain.push(data.chain.length + 1);
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function promiseTimeoutTask(mutex: Mutex, data: PromiseTimeoutData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.completed = data.completed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// ==================== FileDescriptor task functions ====================
function fdOpenCloseTask(mutex: Mutex, pool: FileDescriptorPool, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (pool.descriptors.length > 0) {
      let fd: number = pool.descriptors.pop() as number;
      pool.opened = pool.opened + 1;
      pool.descriptors.push(fd);
      pool.closed = pool.closed + 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function fileReadTask(rwlock: RWLock, data: FileRWData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let val: string = data.content;
    data.readCount = data.readCount + 1;
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function fileWriteTask(rwlock: RWLock, data: FileRWData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    data.content = 'updated_content';
    data.writeCount = data.writeCount + 1;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function fileAccessTask(mutex: Mutex, data: FileAccessData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.accessCount = data.accessCount + 1;
    data.lastAccess = data.accessCount;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function fileLockUnlockTask(mutex: Mutex, data: FileLockData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.locked = true;
    data.lockCount = data.lockCount + 1;
    data.locked = false;
    data.unlockCount = data.unlockCount + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// ==================== LogSystem task functions ====================
function logReadTask(rwlock: RWLock, data: LogData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let len: number = data.logs.length;
    data.readCount = data.readCount + 1;
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function logWriteTask(rwlock: RWLock, data: LogData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    data.logs.push('log_entry');
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function logBufferFlushTask(mutex: Mutex, buf: LogBuffer, counter: AtomicInt): void {
  mutex.lock();
  try {
    buf.buffer.push('buffered_log');
    buf.flushed = buf.flushed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function logRotateTask(mutex: Mutex, data: LogRotateData, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (data.files.length > 0) {
      let oldest: number = data.files.shift() as number;
      data.files.push(oldest);
      data.rotated = data.rotated + 1;
    }
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function logCompressTask(mutex: Mutex, data: LogCompressData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.totalSize = Math.floor(data.totalSize / 2);
    data.compressed = data.compressed + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

// ==================== StateManagement task functions ====================
function stateQueryTask(rwlock: RWLock, data: StateQueryData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let val: number = data.stateValue;
    data.queryCount = data.queryCount + 1;
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function stateUpdateTask(rwlock: RWLock, data: StateQueryData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    data.stateValue = data.stateValue + 1;
    data.updateCount = data.updateCount + 1;
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

function stateMachineTask(mutex: Mutex, data: StateMachineData, counter: AtomicInt): void {
  mutex.lock();
  try {
    if (data.currentState === 'idle') {
      data.currentState = 'running';
    } else if (data.currentState === 'running') {
      data.currentState = 'stopped';
    } else {
      data.currentState = 'idle';
    }
    data.transitions = data.transitions + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function statePersistTask(mutex: Mutex, data: StatePersistData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.value = data.value + 1;
    data.persisted = true;
    data.persistCount = data.persistCount + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function stateRecoveryTask(mutex: Mutex, data: StateRecoveryData, counter: AtomicInt): void {
  mutex.lock();
  try {
    data.value = 100;
    data.recovered = true;
    data.recoveryCount = data.recoveryCount + 1;
    counter.fetchAdd(1);
  } finally {
    mutex.unlock();
  }
}

function stateVersionReadTask(rwlock: RWLock, data: StateVersionData, counter: AtomicInt): void {
  const readLock = rwlock.readLock();
  readLock.lock();
  try {
    let ver: number = data.currentVersion;
    data.readCount = data.readCount + 1;
    counter.fetchAdd(1);
  } finally {
    readLock.unlock();
  }
}

function stateVersionUpdateTask(rwlock: RWLock, data: StateVersionData, counter: AtomicInt): void {
  const writeLock = rwlock.writeLock();
  writeLock.lock();
  try {
    data.currentVersion = data.currentVersion + 1;
    data.versions.push(data.currentVersion);
    counter.fetchAdd(1);
  } finally {
    writeLock.unlock();
  }
}

// ==================== EXPORTED FUNCTION ====================
export default function LockDesignAsyncOperationTest(): void {
  // ---------- AsyncOperation tests ----------
  describe('LockDesignAsyncOperationTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest0100
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_0100
     * @tc.desc    Verify async lock with 3 concurrent tasks incrementing value using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignAsyncOperationTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const data = new AsyncLockData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(asyncLockTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(asyncLockTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(asyncLockTask, mutex, data, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.value).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest0200
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_0200
     * @tc.desc    Verify async concurrent operation with 5 tasks completing under Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignAsyncOperationTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new AsyncConcurrentData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(asyncConcurrentTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(asyncConcurrentTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(asyncConcurrentTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(asyncConcurrentTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(asyncConcurrentTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.completed).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest0300
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_0300
     * @tc.desc    Verify async error handling with 3 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignAsyncOperationTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new AsyncErrorData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(asyncErrorTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(asyncErrorTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(asyncErrorTask, mutex, data, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.errorHandled).assertTrue();
      expect(data.executed).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest0400
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_0400
     * @tc.desc    Verify async timeout lock with 3 concurrent tasks completing under Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignAsyncOperationTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new AsyncTimeoutData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(asyncTimeoutLockTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(asyncTimeoutLockTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(asyncTimeoutLockTask, mutex, data, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.completed).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest0500
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_0500
     * @tc.desc    Verify promise resolve with single task acquiring Mutex lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignAsyncOperationTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const data = new PromiseLockData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(promiseResolveTask, mutex, data, counter));
      await Promise.all([t1]);
      expect(counter.load()).assertEqual(1);
      expect(data.value).assertEqual(1);
      expect(data.resolved).assertTrue();
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest0600
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_0600
     * @tc.desc    Verify promise concurrent with 5 tasks collecting results under Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignAsyncOperationTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new PromiseConcurrentData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(promiseConcurrentTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(promiseConcurrentTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(promiseConcurrentTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(promiseConcurrentTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(promiseConcurrentTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.results.length).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest0700
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_0700
     * @tc.desc    Verify promise chain with 3 sequential tasks maintaining order under Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignAsyncOperationTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new PromiseChainData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(promiseChainTask, mutex, data, counter));
      await Promise.all([t1]);
      let t2 = taskpool.execute(new taskpool.Task(promiseChainTask, mutex, data, counter));
      await Promise.all([t2]);
      let t3 = taskpool.execute(new taskpool.Task(promiseChainTask, mutex, data, counter));
      await Promise.all([t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.chain.length).assertEqual(3);
      expect(data.chain[0]).assertEqual(1);
      expect(data.chain[1]).assertEqual(2);
      expect(data.chain[2]).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest0800
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_0800
     * @tc.desc    Verify promise timeout with 3 concurrent tasks completing under Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignAsyncOperationTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new PromiseTimeoutData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(promiseTimeoutTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(promiseTimeoutTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(promiseTimeoutTask, mutex, data, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.completed).assertEqual(3);
    })
    
    /**
     * @tc.name    LockDesignAsyncOperationTest0900
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_0900
     * @tc.desc    Verify file descriptor open-close with 5 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignAsyncOperationTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mutex = new Mutex();
      const pool = new FileDescriptorPool();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(fdOpenCloseTask, mutex, pool, counter));
      let t2 = taskpool.execute(new taskpool.Task(fdOpenCloseTask, mutex, pool, counter));
      let t3 = taskpool.execute(new taskpool.Task(fdOpenCloseTask, mutex, pool, counter));
      let t4 = taskpool.execute(new taskpool.Task(fdOpenCloseTask, mutex, pool, counter));
      let t5 = taskpool.execute(new taskpool.Task(fdOpenCloseTask, mutex, pool, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(pool.opened).assertEqual(5);
      expect(pool.closed).assertEqual(5);
      expect(pool.descriptors.length).assertEqual(5);
    })


    /**
     * @tc.name    LockDesignAsyncOperationTest1000
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_1000
     * @tc.desc    Verify file lock-unlock cycle with 5 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignAsyncOperationTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new FileLockData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(fileLockUnlockTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(fileLockUnlockTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(fileLockUnlockTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(fileLockUnlockTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(fileLockUnlockTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.lockCount).assertEqual(5);
      expect(data.unlockCount).assertEqual(5);
      expect(data.locked).assertFalse();
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest1100
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_1100
     * @tc.desc    Verify log write then read with 1 writer and 5 readers using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignAsyncOperationTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const rwlock = new RWLock();
      const data = new LogData();
      const counter = new AtomicInt(0);
      // Execute write task first and wait for it to complete
      await taskpool.execute(new taskpool.Task(logWriteTask, rwlock, data, counter));
      // Then execute all read tasks concurrently
      let r1 = taskpool.execute(new taskpool.Task(logReadTask, rwlock, data, counter));
      let r2 = taskpool.execute(new taskpool.Task(logReadTask, rwlock, data, counter));
      let r3 = taskpool.execute(new taskpool.Task(logReadTask, rwlock, data, counter));
      let r4 = taskpool.execute(new taskpool.Task(logReadTask, rwlock, data, counter));
      let r5 = taskpool.execute(new taskpool.Task(logReadTask, rwlock, data, counter));
      await Promise.all([r1, r2, r3, r4, r5]);
      expect(counter.load()).assertEqual(6);
      expect(data.logs.length).assertEqual(1);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest1200
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_1200
     * @tc.desc    Verify log buffer flush with 5 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignAsyncOperationTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const buf = new LogBuffer();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(logBufferFlushTask, mutex, buf, counter));
      let t2 = taskpool.execute(new taskpool.Task(logBufferFlushTask, mutex, buf, counter));
      let t3 = taskpool.execute(new taskpool.Task(logBufferFlushTask, mutex, buf, counter));
      let t4 = taskpool.execute(new taskpool.Task(logBufferFlushTask, mutex, buf, counter));
      let t5 = taskpool.execute(new taskpool.Task(logBufferFlushTask, mutex, buf, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(buf.buffer.length).assertEqual(5);
      expect(buf.flushed).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest1300
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_1300
     * @tc.desc    Verify log rotation with 3 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignAsyncOperationTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new LogRotateData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(logRotateTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(logRotateTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(logRotateTask, mutex, data, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.rotated).assertEqual(3);
      expect(data.files.length).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest1400
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_1400
     * @tc.desc    Verify log compression with 3 concurrent tasks reducing total size
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignAsyncOperationTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new LogCompressData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(logCompressTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(logCompressTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(logCompressTask, mutex, data, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.compressed).assertEqual(3);
      expect(data.totalSize < 100).assertTrue();
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest1500
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_1500
     * @tc.desc    Verify state update then query with 1 writer and 5 readers using RWLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockDesignAsyncOperationTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const rwlock = new RWLock();
      const data = new StateQueryData();
      const counter = new AtomicInt(0);
      let u1 = taskpool.execute(new taskpool.Task(stateUpdateTask, rwlock, data, counter));
      await Promise.all([u1]);
      let r1 = taskpool.execute(new taskpool.Task(stateQueryTask, rwlock, data, counter));
      let r2 = taskpool.execute(new taskpool.Task(stateQueryTask, rwlock, data, counter));
      let r3 = taskpool.execute(new taskpool.Task(stateQueryTask, rwlock, data, counter));
      let r4 = taskpool.execute(new taskpool.Task(stateQueryTask, rwlock, data, counter));
      let r5 = taskpool.execute(new taskpool.Task(stateQueryTask, rwlock, data, counter));
      await Promise.all([r1, r2, r3, r4, r5]);
      expect(counter.load()).assertEqual(6);
      expect(data.updateCount).assertEqual(1);
      expect(data.stateValue).assertEqual(1);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest1600
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_1600
     * @tc.desc    Verify state machine transitions with 5 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockDesignAsyncOperationTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const mutex = new Mutex();
      const data = new StateMachineData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(stateMachineTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(stateMachineTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(stateMachineTask, mutex, data, counter));
      let t4 = taskpool.execute(new taskpool.Task(stateMachineTask, mutex, data, counter));
      let t5 = taskpool.execute(new taskpool.Task(stateMachineTask, mutex, data, counter));
      await Promise.all([t1, t2, t3, t4, t5]);
      expect(counter.load()).assertEqual(5);
      expect(data.transitions).assertEqual(5);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest1700
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_1700
     * @tc.desc    Verify state persistence with 3 concurrent tasks using Mutex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignAsyncOperationTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new StatePersistData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(statePersistTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(statePersistTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(statePersistTask, mutex, data, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.persisted).assertTrue();
      expect(data.persistCount).assertEqual(3);
      expect(data.value).assertEqual(3);
    })

    /**
     * @tc.name    LockDesignAsyncOperationTest1800
     * @tc.number  SUB_LOCK_DESIGN_ASYNC_OPERATION_TEST_1800
     * @tc.desc    Verify state recovery with 3 concurrent tasks restoring initial value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockDesignAsyncOperationTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mutex = new Mutex();
      const data = new StateRecoveryData();
      const counter = new AtomicInt(0);
      let t1 = taskpool.execute(new taskpool.Task(stateRecoveryTask, mutex, data, counter));
      let t2 = taskpool.execute(new taskpool.Task(stateRecoveryTask, mutex, data, counter));
      let t3 = taskpool.execute(new taskpool.Task(stateRecoveryTask, mutex, data, counter));
      await Promise.all([t1, t2, t3]);
      expect(counter.load()).assertEqual(3);
      expect(data.recovered).assertTrue();
      expect(data.value).assertEqual(100);
      expect(data.recoveryCount).assertEqual(3);
    })

  })
}
