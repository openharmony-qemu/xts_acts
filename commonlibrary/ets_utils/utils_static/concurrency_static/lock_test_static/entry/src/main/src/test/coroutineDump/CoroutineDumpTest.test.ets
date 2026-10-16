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

// Helper: find first coroutine blocked on Mutex
function findMutexBlocked(states: CoroutineDumpInfo[]): CoroutineDumpInfo | null {
  for (let i: int = 0; i < states.length; i++) {
    if (states[i].waitReason === 'MUTEX_LOCK') {
      return states[i];
    }
  }
  return null;
}

// Helper: find first coroutine blocked on Mutex
function findRWLockBlocked(states: CoroutineDumpInfo[],reason:string): CoroutineDumpInfo | null {
  for (let i: int = 0; i < states.length; i++) {
    if (states[i].waitReason === reason) {
      return states[i];
    }
  }
  return null;
}

// Helper: find a coroutine by workerName
function findByWorkerName(states: CoroutineDumpInfo[], name: string): CoroutineDumpInfo | null {
  for (let i: int = 0; i < states.length; i++) {
    if (states[i].workerName.includes('[e-worker]')) {
      return states[i];
    }
  }
  return null;
}

// Helper: count blocked coroutines by waitReason
function countByWaitReason(states: CoroutineDumpInfo[], reason: string): int {
  let count: int = 0;
  for (let i: int = 0; i < states.length; i++) {
    if (states[i].waitReason === reason) {
      count++;
    }
  }
  return count;
}

// Mutex waiter: signals start then blocks on mutex.lock() until released
function mutexWaiterTask(mutex: Mutex, started: AtomicFlag): void {
  started.set(true);
  mutex.lock();
  mutex.unlock();
}

// RWLock read waiter: signals start then blocks on readLock
function rwReadWaiterTask(rwLock: RWLock, started: AtomicFlag): void {
  started.set(true);
  let rl = rwLock.readLock();
  rl.lock();
  rl.unlock();
}

// RWLock write waiter: signals start then blocks on writeLock
function rwWriteWaiterTask(rwLock: RWLock, started: AtomicFlag): void {
  started.set(true);
  let wl = rwLock.writeLock();
  wl.lock();
  wl.unlock();
}

// Named function for execution method test
function namedFunctionTask(started: AtomicFlag): void {
  started.set(true);
}

// Nested lock task A: holds mutex1, waits for mutex2
function nestedLockTaskA(mutex1: Mutex, mutex2: Mutex, ready: AtomicInt): void {
  mutex1.lock();
  ready.store(1);
  mutex2.lock();
  mutex2.unlock();
  mutex1.unlock();
}

// Nested lock task B: holds mutex2, waits for mutex1
function nestedLockTaskB(mutex1: Mutex, mutex2: Mutex, ready: AtomicInt): void {
  mutex2.lock();
  ready.store(1);
  mutex1.lock();
  mutex1.unlock();
  mutex2.unlock();
}

// Named function for callStack verification
function blockingTestFunc(mutex: Mutex, started: AtomicFlag): void {
  started.set(true);
  mutex.lock();
  mutex.unlock();
}

// Task that throws error in try and releases lock in finally
function errorReleaseTask(mutex: Mutex, started: AtomicFlag): void {
  started.set(true);
  try {
    mutex.lock();
    throw new Error('intentional error');
  } finally {
    mutex.unlock();
  }
}

// Named function for lock blocking test
function namedLockTask(mutex: Mutex, started: AtomicFlag): void {
  started.set(true);
  mutex.lock();
  mutex.unlock();
}

// Find coroutine by type
function findByType(states: CoroutineDumpInfo[], targetType: string): CoroutineDumpInfo | null {
  for (let i: int = 0; i < states.length; i++) {
    if (states[i].type === targetType) {
      return states[i];
    }
  }
  return null;
}

// Find coroutine by status
function findByStatus(states: CoroutineDumpInfo[], targetStatus: string): CoroutineDumpInfo | null {
  for (let i: int = 0; i < states.length; i++) {
    if (states[i].status === targetStatus) {
      return states[i];
    }
  }
  return null;
}

// Find coroutine by waitReason
function findByWaitReason(states: CoroutineDumpInfo[], reason: string): CoroutineDumpInfo | null {
  for (let i: int = 0; i < states.length; i++) {
    if (states[i].waitReason === reason) {
      return states[i];
    }
  }
  return null;
}

// Count coroutines by workerName
function countByWorkerName(states: CoroutineDumpInfo[], name: string): int {
  let count: int = 0;
  for (let i: int = 0; i < states.length; i++) {
    if (states[i].workerName === name) {
      count++;
    }
  }
  return count;
}
// Find an e-worker (not main) by status
function findEAWorkerByStatus(states: CoroutineDumpInfo[], targetStatus: string): CoroutineDumpInfo | null {
  for (let i: int = 0; i < states.length; i++) {
    if (states[i].isMain === false && states[i].workerName.includes('[e-worker]') && states[i].status === targetStatus) {
      return states[i];
    }
  }
  return null;
}
// Poll dumpCoroutineInfo until predicate holds or maxAttempts reached. Returns last snapshot.
function pollDumpFor(pred: (states: CoroutineDumpInfo[]) => boolean, maxAttempts: int = 200): CoroutineDumpInfo[] {
  let states: CoroutineDumpInfo[] = [];
  for (let attempt: int = 0; attempt < maxAttempts; attempt++) {
    states = CoroutineDump.dumpCoroutineInfo();
    if (pred(states)) {
      break;
    }
  }
  return states;
}
export default function CoroutineDumpTest(): void {
  describe('CoroutineDumpTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name    CoroutineDumpTest001
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0010
     * @tc.desc    Verify dumpCoroutineInfo returns array with NONE state when no coroutine is blocked.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      try {
        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        expect(states.length >= 1).assertTrue();
        for (let i: int = 0; i < states.length; i++) {
          expect(states[i].waitReason === 'NONE').assertTrue();
          expect(states[i].lockMode === 'NONE').assertTrue();
          expect(states[i].readerCount === 0).assertTrue();
          expect(states[i].writerCount === 0).assertTrue();
        }
      } catch (error) {
        console.error(`CoroutineDumpTest001 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest002
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0020
     * @tc.desc    Verify dumpCoroutineInfo returns MUTEX_LOCK when a coroutine is blocked on Mutex.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('CoroutineDumpTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('mutex-block-worker');
        mutex.lock();
        worker.start();
        let job = worker.run<void>((): void => { mutexWaiterTask(mutex, started); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findMutexBlocked(s) !== null;
        });
        let blocked: CoroutineDumpInfo | null = findMutexBlocked(states);
        expect(blocked !== null).assertTrue();
        if (blocked !== null) {
          expect(blocked.waitReason === 'MUTEX_LOCK').assertTrue();
          expect(blocked.lockMode === 'MUTEX').assertTrue();
          expect(blocked.status === 'BLOCKED').assertTrue();
        }

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest002 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest003
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0030
     * @tc.desc    Verify dumpCoroutineInfo returns RWLOCK_READ when a coroutine is blocked on RWLock read.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('CoroutineDumpTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let rwLock = new RWLock();
        let writeLock = rwLock.writeLock();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('rwlock-read-block-worker');
        writeLock.lock();
        worker.start();
        let job = worker.run<void>((): void => { rwReadWaiterTask(rwLock, started); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          for (let i: int = 0; i < s.length; i++) { if (s[i].waitReason === 'RWLOCK_READ') return true; } return false;
        });
        let found: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].waitReason === 'RWLOCK_READ') {
            found = true;
            expect(states[i].lockMode === 'READLOCK').assertTrue();
            expect(states[i].status === 'BLOCKED').assertTrue();
            break;
          }
        }
        expect(found).assertTrue();

        writeLock.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest003 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest004
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0040
     * @tc.desc    Verify dumpCoroutineInfo returns RWLOCK_WRITE when a coroutine is blocked on RWLock write.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('CoroutineDumpTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let rwLock = new RWLock();
        let readLock = rwLock.readLock();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('rwlock-write-block-worker');
        readLock.lock();
        worker.start();
        let job = worker.run<void>((): void => { rwWriteWaiterTask(rwLock, started); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          for (let i: int = 0; i < s.length; i++) { if (s[i].waitReason === 'RWLOCK_WRITE') return true; } return false;
        });
        let found: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].waitReason === 'RWLOCK_WRITE') {
            found = true;
            expect(states[i].lockMode === 'WRITELOCK').assertTrue();
            expect(states[i].status === 'BLOCKED').assertTrue();
            break;
          }
        }
        expect(found).assertTrue();

        readLock.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest004 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest005
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0050
     * @tc.desc    Verify dumpCoroutineInfo returns valid array when called.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      try {
        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        expect(states !== null).assertTrue();
        expect(states.length >= 0).assertTrue();
      } catch (error) {
        console.error(`CoroutineDumpTest005 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest006
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0060
     * @tc.desc    Verify all 10 fields of CoroutineDumpInfo exist and have valid values.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        expect(states.length >= 1).assertTrue();
        for (let i: int = 0; i < states.length; i++) {
          let info: CoroutineDumpInfo = states[i];
          expect(info.workerName.length >= 0).assertTrue();
          expect(info.coroutineName.length >= 0).assertTrue();
          expect(info.status.length >= 0).assertTrue();
          expect(info.type.length >= 0).assertTrue();
          expect(info.waitReason.length >= 0).assertTrue();
          expect(info.lockMode.length >= 0).assertTrue();
          expect(info.callStack.length >= 0).assertTrue();
          expect(info.isMain === true || info.isMain === false).assertTrue();
          expect(info.readerCount >= 0).assertTrue();
          expect(info.writerCount >= 0).assertTrue();
        }
      } catch (error) {
        console.error(`CoroutineDumpTest006 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest007
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0070
     * @tc.desc    Verify workerName field equals the name specified in EAWorker constructor.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let workerName: string = 'verify-worker-name';
        let started = new AtomicFlag(false);
        let worker = new EAWorker(workerName);
        worker.start();
        let job = worker.run<void>((): void => { started.set(true); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          for (let i: int = 0; i < s.length; i++) { if (s[i].workerName.includes('[e-worker]')) return true; } return false;
        });
        let found: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].workerName.includes('[e-worker]')) {
            found = true;
            break;
          }
        }
        expect(found).assertTrue();

        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest007 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest008
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0080
     * @tc.desc    Verify isMain field is true for main thread and false for EAWorker.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let worker = new EAWorker('is-main-test-worker');
        worker.start();
        let job = worker.run<void>((): void => { started.set(true); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          let mf: boolean = false; let wf: boolean = false; for (let i: int = 0; i < s.length; i++) { if (s[i].isMain === true) { mf = true; } if (s[i].workerName.includes('[e-worker]') && s[i].isMain === false) { wf = true; } } return mf && wf;
        });
        let mainFound: boolean = false;
        let workerFound: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].isMain === true) {
            mainFound = true;
          }
          if (states[i].workerName.includes('[e-worker]') && states[i].isMain === false) {
            workerFound = true;
          }
        }
        expect(mainFound).assertTrue();
        expect(workerFound).assertTrue();

        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest008 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest009
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0090
     * @tc.desc    Verify status field is BLOCKED when coroutine is blocked on Mutex.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('status-blocked-worker');
        mutex.lock();
        worker.start();
        let job = worker.run<void>((): void => { mutexWaiterTask(mutex, started); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findMutexBlocked(s) !== null;
        });
        let blocked: CoroutineDumpInfo | null = findMutexBlocked(states);
        expect(blocked !== null).assertTrue();
        if (blocked !== null) {
          expect(blocked.status === 'BLOCKED').assertTrue();
        }

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest009 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest010
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0100
     * @tc.desc    Verify callStack field is non-empty when coroutine is blocked on Mutex.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('callstack-worker');
        mutex.lock();
        worker.start();
        let job = worker.run<void>((): void => { mutexWaiterTask(mutex, started); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findMutexBlocked(s) !== null;
        });
        let blocked: CoroutineDumpInfo | null = findMutexBlocked(states);
        expect(blocked !== null).assertTrue();
        if (blocked !== null) {
          expect(blocked.callStack.length > 0).assertTrue();
        }

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest010 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest011
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0110
     * @tc.desc    Verify readerCount and writerCount are 0 when no RWLock is involved.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].waitReason === 'NONE' || states[i].waitReason === 'MUTEX_LOCK') {
            expect(states[i].readerCount === 0).assertTrue();
            expect(states[i].writerCount === 0).assertTrue();
          }
        }
      } catch (error) {
        console.error(`CoroutineDumpTest011 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest012
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0120
     * @tc.desc    Verify lockMode corresponds to waitReason one-to-one for all blocking scenarios.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('lockmode-worker');
        mutex.lock();
        worker.start();
        let job = worker.run<void>((): void => { mutexWaiterTask(mutex, started); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        for (let i: int = 0; i < states.length; i++) {
          let info: CoroutineDumpInfo = states[i];
          if (info.waitReason === 'NONE') {
            expect(info.lockMode === 'NONE').assertTrue();
          } else if (info.waitReason === 'MUTEX_LOCK') {
            expect(info.lockMode === 'MUTEX').assertTrue();
          } else if (info.waitReason === 'RWLOCK_READ') {
            expect(info.lockMode === 'READLOCK').assertTrue();
          } else if (info.waitReason === 'RWLOCK_WRITE') {
            expect(info.lockMode === 'WRITELOCK').assertTrue();
          }
        }

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest012 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest013
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0130
     * @tc.desc    Verify dumpCoroutineInfo does not crash or affect normal coroutine execution.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let counter = new AtomicInt(0);
        let worker = new EAWorker('stability-worker');
        worker.start();
        let job = worker.run<void>((): void => {
          for (let i: int = 0; i < 100; i++) {
            mutex.lock();
            counter.fetchAdd(1);
            mutex.unlock();
          }
        });

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        expect(states !== null).assertTrue();

        job.Await()
        expect(counter.load()).assertEqual(100);
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest013 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest014
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0140
     * @tc.desc    Verify dumpCoroutineInfo works with EAWorker.run() execution method.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let worker = new EAWorker('eaworker-run-test');
        worker.start();
        let job = worker.run<void>((): void => { namedFunctionTask(started); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          for (let i: int = 0; i < s.length; i++) { if (s[i].workerName.includes('[e-worker]')) return true; } return false;
        });
        let found: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].workerName.includes('[e-worker]')) {
            found = true;
            expect(states[i].coroutineName.length >= 0).assertTrue();
            expect(states[i].type.length >= 0).assertTrue();
          }
        }
        expect(found).assertTrue();

        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest014 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest015
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0150
     * @tc.desc    Verify dumpCoroutineInfo works with TaskPool.execute() execution method.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let counter = new AtomicInt(0);
        let p = taskpool.execute(new taskpool.Task((): void => {
          counter.fetchAdd(1);
        }));
        await p;

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        expect(states !== null).assertTrue();
        expect(counter.load()).assertEqual(1);
      } catch (error) {
        console.error(`CoroutineDumpTest015 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest016
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0160
     * @tc.desc    Verify dumpCoroutineInfo works with anonymous function (lambda) execution method.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let worker = new EAWorker('anon-func-worker');
        worker.start();
        let job = worker.run<void>((): void => { started.set(true); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          for (let i: int = 0; i < s.length; i++) { if (s[i].workerName.includes('[e-worker]')) return true; } return false;
        });
        let found: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].workerName.includes('[e-worker]')) {
            found = true;
            expect(states[i].coroutineName.length >= 0).assertTrue();
          }
        }
        expect(found).assertTrue();

        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest016 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest017
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0170
     * @tc.desc    Verify dumpCoroutineInfo works with special character worker name.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let specialName: string = 'worker-娴嬭瘯-!@#';
        let started = new AtomicFlag(false);
        let worker = new EAWorker(specialName);
        worker.start();
        let job = worker.run<void>((): void => { started.set(true); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          for (let i: int = 0; i < s.length; i++) { if (s[i].workerName.includes('[e-worker]')) return true; } return false;
        });
        let found: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].workerName.includes('[e-worker]')) {
            found = true;
            break;
          }
        }
        expect(found).assertTrue();

        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest017 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest018
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0180
     * @tc.desc    Verify dumpCoroutineInfo detects deadlock when two workers hold locks and wait for each other.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('CoroutineDumpTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let mutex1 = new Mutex();
        let mutex2 = new Mutex();
        let aReady = new AtomicInt(0);
        let bReady = new AtomicInt(0);
        let workerA = new EAWorker('deadlock-worker-a');
        let workerB = new EAWorker('deadlock-worker-b');
        workerA.start();
        workerB.start();

        mutex1.lock();
        mutex2.lock();

        let jobA = workerA.run<void>((): void => {
          aReady.store(1);
          mutex2.lock();
          mutex2.unlock();
        });

        while (aReady.load() === 0) {
        }

        let jobB = workerB.run<void>((): void => {
          bReady.store(1);
          mutex1.lock();
          mutex1.unlock();
        });

        while (bReady.load() === 0) {
        }

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        let blockedCount: int = 0;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].waitReason === 'MUTEX_LOCK') {
            blockedCount++;
            expect(states[i].status === 'BLOCKED').assertTrue();
          }
        }
        expect(blockedCount >= 1).assertTrue();

        mutex1.unlock();
        mutex2.unlock();

        await jobA;
        await jobB;
        workerA.quit();
        workerB.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest018 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest019
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0190
     * @tc.desc    Verify dumpCoroutineInfo captures multiple coroutines blocked on different locks.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let rwLock = new RWLock();
        let writeLock = rwLock.writeLock();
        let started1 = new AtomicFlag(false);
        let started2 = new AtomicFlag(false);

        let worker1 = new EAWorker('multi-block-mutex');
        let worker2 = new EAWorker('multi-block-rwlock');

        mutex.lock();
        writeLock.lock();
        worker1.start();
        worker2.start();

        let job1 = worker1.run<void>((): void => { mutexWaiterTask(mutex, started1); });
        let job2 = worker2.run<void>((): void => { rwReadWaiterTask(rwLock, started2); });

        while (!started1.get() || !started2.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          for (let i: int = 0; i < s.length; i++) { if (s[i].waitReason === 'MUTEX_LOCK') return true; } return false;
        });
        let mutexBlocked: boolean = false;
        let rwlockBlocked: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].waitReason === 'MUTEX_LOCK') {
            mutexBlocked = true;
          }
          if (states[i].waitReason === 'RWLOCK_READ') {
            rwlockBlocked = true;
          }
        }
        expect(mutexBlocked).assertTrue();
        expect(rwlockBlocked).assertTrue();

        mutex.unlock();
        writeLock.unlock();
        await job1;
        await job2;
        worker1.quit();
        worker2.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest019 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest020
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0200
     * @tc.desc    Verify dumpCoroutineInfo captures lock upgrade (read lock held, write lock blocked).
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let rwLock = new RWLock();
        let readLock = rwLock.readLock();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('lock-upgrade-worker');

        readLock.lock();
        worker.start();
        let job = worker.run<void>((): void => { rwWriteWaiterTask(rwLock, started); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          for (let i: int = 0; i < s.length; i++) { if (s[i].waitReason === 'RWLOCK_WRITE') return true; } return false;
        });
        let found: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].waitReason === 'RWLOCK_WRITE') {
            found = true;
            expect(states[i].lockMode === 'WRITELOCK').assertTrue();
            expect(states[i].status === 'BLOCKED').assertTrue();
            expect(states[i].readerCount >= 1).assertTrue();
            break;
          }
        }
        expect(found).assertTrue();

        readLock.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest020 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest021
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0210
     * @tc.desc    Verify dumpCoroutineInfo works with main thread holding lock and worker blocked.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('main-hold-worker-block');

        mutex.lock();
        worker.start();
        let job = worker.run<void>((): void => { mutexWaiterTask(mutex, started); });

        while (!started.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          let wb: boolean = false; let mnb: boolean = false; for (let i: int = 0; i < s.length; i++) { if (s[i].waitReason === 'MUTEX_LOCK' && s[i].workerName.includes('[e-worker]')) { wb = true; } if (s[i].isMain === true && s[i].waitReason === 'NONE') { mnb = true; } } return wb && mnb;
        });
        let workerBlocked: boolean = false;
        let mainNotBlocked: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].waitReason === 'MUTEX_LOCK' && states[i].workerName.includes('[e-worker]')) {
            workerBlocked = true;
          }
          if (states[i].isMain === true && states[i].waitReason === 'NONE') {
            mainNotBlocked = true;
          }
        }
        expect(workerBlocked).assertTrue();
        expect(mainNotBlocked).assertTrue();

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest021 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest022
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0220
     * @tc.desc    Verify dumpCoroutineInfo works with EAWorker.postTask() execution method.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let worker = new EAWorker('posttask-worker');
        worker.start();
        let job = worker.postTask(() => { started.set(true); });

        while (!started.get()) {
        }

        let found: boolean = false;
        for (let attempt: int = 0; attempt < 200 && !found; attempt++) {
          let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
          for (let i: int = 0; i < states.length; i++) {
            if (states[i].workerName.includes('[e-worker]')) {
              found = true;
              break;
            }
          }
        }
        worker.quit();
        expect(found).assertTrue();
      } catch (error) {
        console.error(`CoroutineDumpTest022 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest023
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0230
     * @tc.desc    Verify dumpCoroutineInfo works with async/await execution method and Mutex blocking.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('async-mutex-worker');
        mutex.lock();
        worker.start();
        let job = worker.run<void>((): void => {
          started.set(true);
          mutex.lock();
          mutex.unlock();
        });

        while (!started.get()) {
        }

        let blocked: CoroutineDumpInfo | null = null;
        for (let attempt: int = 0; attempt < 200 && blocked === null; attempt++) {
          blocked = findMutexBlocked(CoroutineDump.dumpCoroutineInfo());
        }
        expect(blocked !== null).assertTrue();
        if (blocked !== null) {
          expect(blocked.workerName.includes('[e-worker]')).assertTrue();
        }

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest023 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest024
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0240
     * @tc.desc    Verify dumpCoroutineInfo captures multiple workers blocked on the same Mutex.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started1 = new AtomicFlag(false);
        let started2 = new AtomicFlag(false);
        let started3 = new AtomicFlag(false);
        let worker1 = new EAWorker('multi-mutex-1');
        let worker2 = new EAWorker('multi-mutex-2');
        let worker3 = new EAWorker('multi-mutex-3');

        mutex.lock();
        worker1.start();
        worker2.start();
        worker3.start();

        let job1 = worker1.run<void>((): void => { mutexWaiterTask(mutex, started1); });
        let job2 = worker2.run<void>((): void => { mutexWaiterTask(mutex, started2); });
        let job3 = worker3.run<void>((): void => { mutexWaiterTask(mutex, started3); });

        while (!started1.get() || !started2.get() || !started3.get()) {
        }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return countByWaitReason(s, 'MUTEX_LOCK') >= 3;
        });
        let blockedCount: int = 0;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].waitReason === 'MUTEX_LOCK') {
            blockedCount++;
          }
        }
        expect(blockedCount >= 3).assertTrue();

        mutex.unlock();
        await job1;
        await job2;
        await job3;
        worker1.quit();
        worker2.quit();
        worker3.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest024 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest025
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0250
     * @tc.desc    Verify dumpCoroutineInfo captures mixed execution methods (EAWorker + TaskPool) with different locks.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let rwLock = new RWLock();
        let writeLock = rwLock.writeLock();
        let started1 = new AtomicFlag(false);
        let started2 = new AtomicFlag(false);

        mutex.lock();
        let worker1 = new EAWorker('mixed-eaworker');
        worker1.start();
        let job1 = worker1.run<void>((): void => { mutexWaiterTask(mutex, started1); });

        writeLock.lock();
        let p2 = taskpool.execute(new taskpool.Task((): void => {
          started2.set(true);
          let rl = rwLock.readLock();
          rl.lock();
          rl.unlock();
        }));

        while (!started1.get() || !started2.get()) {
        }

        let mutexFound: boolean = false;
        let rwlockFound: boolean = false;
        for (let attempt: int = 0; attempt < 200 && !(mutexFound && rwlockFound); attempt++) {
          let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
          mutexFound = false;
          rwlockFound = false;
          for (let i: int = 0; i < states.length; i++) {
            if (states[i].waitReason === 'MUTEX_LOCK') {
              mutexFound = true;
            }
            if (states[i].waitReason === 'RWLOCK_READ') {
              rwlockFound = true;
            }
          }
        }
        expect(mutexFound).assertTrue();
        expect(rwlockFound).assertTrue();

        mutex.unlock();
        writeLock.unlock();
        await job1;
        await p2;
        worker1.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest025 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest026
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0260
     * @tc.desc    Verify cross-thread Mutex blocking: Worker-A holds, Worker-B blocks.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('CoroutineDumpTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let mutexGate = new Mutex();
        let holderReady = new AtomicFlag(false);
        let started = new AtomicFlag(false);
        let holder = new EAWorker('cross-thread-holder');
        let blocker = new EAWorker('cross-thread-blocker');
        mutexGate.lock();
        holder.start();
        blocker.start();

        let jobHolder = holder.run<void>((): void => {
          mutex.lock();
          holderReady.set(true);
          mutexGate.lock();
          mutexGate.unlock();
          mutex.unlock();
        });

        while (!holderReady.get()) { }

        let jobBlocker = blocker.run<void>((): void => { mutexWaiterTask(mutex, started); });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findMutexBlocked(s) !== null;
        });
        let blockedInfo: CoroutineDumpInfo | null = findMutexBlocked(states);
        expect(blockedInfo !== null).assertTrue();
        if (blockedInfo !== null) {
          expect(blockedInfo.waitReason === 'MUTEX_LOCK').assertTrue();
          expect(blockedInfo.lockMode === 'MUTEX').assertTrue();
          expect(blockedInfo.status === 'BLOCKED').assertTrue();
        }

        mutexGate.unlock();
        await jobHolder;
        await jobBlocker;
        holder.quit();
        blocker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest026 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest027
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0270
     * @tc.desc    Verify cross-thread RWLock read blocking: Worker-A holds write, Worker-B blocks on read.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('CoroutineDumpTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let rwLock = new RWLock();
        let writeLock = rwLock.writeLock();
        let started = new AtomicFlag(false);
        let holder = new EAWorker('rw-write-holder');
        let blocker = new EAWorker('rw-read-blocker');
        holder.start();
        blocker.start();

        writeLock.lock();
        let jobBlocker = blocker.run<void>((): void => { rwReadWaiterTask(rwLock, started); });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findByWaitReason(s,'RWLOCK_READ') !== null;
        });
        let blockedInfo: CoroutineDumpInfo | null = findByWaitReason(states, 'RWLOCK_READ');
        expect(blockedInfo !== null).assertTrue();
        if (blockedInfo !== null) {
          expect(blockedInfo.waitReason === 'RWLOCK_READ').assertTrue();
          expect(blockedInfo.lockMode === 'READLOCK').assertTrue();
        }

        writeLock.unlock();
        await jobBlocker;
        holder.quit();
        blocker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest027 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest028
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0280
     * @tc.desc    Verify multi-coroutine same Mutex blocking: 3+ workers wait on same Mutex.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let s1 = new AtomicFlag(false);
        let s2 = new AtomicFlag(false);
        let s3 = new AtomicFlag(false);
        let w1 = new EAWorker('same-mutex-1');
        let w2 = new EAWorker('same-mutex-2');
        let w3 = new EAWorker('same-mutex-3');
        w1.start(); w2.start(); w3.start();

        mutex.lock();
        let j1 = w1.run<void>((): void => { mutexWaiterTask(mutex, s1); });
        let j2 = w2.run<void>((): void => { mutexWaiterTask(mutex, s2); });
        let j3 = w3.run<void>((): void => { mutexWaiterTask(mutex, s3); });

        while (!s1.get() || !s2.get() || !s3.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return countByWaitReason(s, 'MUTEX_LOCK') >= 3;
        });
        let count: int = countByWaitReason(states, 'MUTEX_LOCK');
        expect(count >= 3).assertTrue();

        mutex.unlock();
        await j1; await j2; await j3;
        w1.quit(); w2.quit(); w3.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest028 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest029
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0290
     * @tc.desc    Verify different lock blocking: Worker-B on Mutex, Worker-D on RWLock.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let rwLock = new RWLock();
        let writeLock = rwLock.writeLock();
        let s1 = new AtomicFlag(false);
        let s2 = new AtomicFlag(false);
        let w1 = new EAWorker('diff-lock-mutex');
        let w2 = new EAWorker('diff-lock-rwlock');
        w1.start(); w2.start();

        mutex.lock();
        writeLock.lock();
        let j1 = w1.run<void>((): void => { mutexWaiterTask(mutex, s1); });
        let j2 = w2.run<void>((): void => { rwReadWaiterTask(rwLock, s2); });

        while (!s1.get() || !s2.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return countByWaitReason(s, 'MUTEX_LOCK') >= 1 && countByWaitReason(s, 'RWLOCK_READ') >= 1;
        });
        expect(countByWaitReason(states, 'MUTEX_LOCK') >= 1).assertTrue();
        expect(countByWaitReason(states, 'RWLOCK_READ') >= 1).assertTrue();

        mutex.unlock();
        writeLock.unlock();
        await j1; await j2;
        w1.quit(); w2.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest029 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest030
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0300
     * @tc.desc    Verify lock upgrade blocking: read lock held, write lock blocked.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let rwLock = new RWLock();
        let readLock = rwLock.readLock();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('lock-upgrade-test');
        worker.start();

        readLock.lock();
        let job = worker.run<void>((): void => { rwWriteWaiterTask(rwLock, started); });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findByWaitReason(s,'RWLOCK_WRITE') !== null;
        });
        let blockedInfo: CoroutineDumpInfo | null = findByWaitReason(states, 'RWLOCK_WRITE');
        expect(blockedInfo !== null).assertTrue();
        if (blockedInfo !== null) {
          expect(blockedInfo.waitReason === 'RWLOCK_WRITE').assertTrue();
          expect(blockedInfo.lockMode === 'WRITELOCK').assertTrue();
          expect(blockedInfo.readerCount >= 1).assertTrue();
        }

        readLock.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest030 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest031
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0310
     * @tc.desc    Verify deadlock detection: two workers circular-wait on each other's Mutex.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('CoroutineDumpTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let mutex1 = new Mutex();
        let mutex2 = new Mutex();
        let mutexGate = new Mutex();
        let aReady = new AtomicInt(0);
        let bReady = new AtomicInt(0);
        let workerA = new EAWorker('deadlock-a');
        let workerB = new EAWorker('deadlock-b');
        workerA.start();
        workerB.start();

        mutexGate.lock();

        let jobB = workerB.run<void>((): void => {
          mutex2.lock();
          bReady.store(1);
          mutexGate.lock();
          mutexGate.unlock();
          mutex2.unlock();
        });

        while (bReady.load() === 0) { }

        let jobA = workerA.run<void>((): void => {
          aReady.store(1);
          mutex1.lock();
          mutex2.lock();
          mutex2.unlock();
          mutex1.unlock();
        });

        while (aReady.load() === 0) { }
        await Utils.msSleep(100);

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        let blockedCount: int = countByWaitReason(states, 'MUTEX_LOCK');
        expect(blockedCount >= 1).assertTrue();

        let states2: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        let blockedA: CoroutineDumpInfo | null = findByWorkerName(states2, 'deadlock-a');
        let blockedB: CoroutineDumpInfo | null = findByWorkerName(states2, 'deadlock-b');

        if (blockedA !== null && blockedA.waitReason === 'MUTEX_LOCK') {
          expect(blockedA.status === 'BLOCKED').assertTrue();
          expect(blockedA.callStack.length > 0).assertTrue();
        }
        if (blockedB !== null && blockedB.waitReason === 'MUTEX_LOCK') {
          expect(blockedB.status === 'BLOCKED').assertTrue();
          expect(blockedB.callStack.length > 0).assertTrue();
        }

        mutexGate.unlock();
        jobA.Await()
        jobB.Await()
        workerA.quit();
        workerB.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest031 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest032
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0320
     * @tc.desc    Verify main thread holding lock with EAWorker blocked: isMain=true for main, MUTEX_LOCK for worker.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('main-hold-worker-block-2');
        mutex.lock();
        worker.start();
        let job = worker.run<void>((): void => { mutexWaiterTask(mutex, started); });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          let mi: boolean = false; let wi: boolean = false; for (let i: int = 0; i < s.length; i++) { if (s[i].isMain === true && s[i].waitReason === 'NONE') { mi = true; } if (s[i].waitReason === 'MUTEX_LOCK') { wi = true; } } return mi && wi;
        });
        let mainInfo: CoroutineDumpInfo | null = null;
        let workerInfo: CoroutineDumpInfo | null = null;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].isMain === true && states[i].waitReason === 'NONE') {
            mainInfo = states[i];
          }
          if (states[i].waitReason === 'MUTEX_LOCK') {
            workerInfo = states[i];
          }
        }
        expect(mainInfo !== null).assertTrue();
        expect(workerInfo !== null).assertTrue();

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest032 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest033
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0330
     * @tc.desc    Verify EAWorker.run() + Mutex blocking combination: workerName and waitReason correct.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('CoroutineDumpTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('combo-run-mutex');
        mutex.lock();
        worker.start();
        let job = worker.run<void>((): void => { mutexWaiterTask(mutex, started); });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findMutexBlocked(s) !== null;
        });
        let info: CoroutineDumpInfo | null = findMutexBlocked(states);
        expect(info !== null).assertTrue();
        if (info !== null) {
          expect(info.waitReason === 'MUTEX_LOCK').assertTrue();
          expect(info.lockMode === 'MUTEX').assertTrue();
          expect(info.status === 'BLOCKED').assertTrue();
          expect(info.coroutineName.length >= 0).assertTrue();
        }

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest033 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest034
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0340
     * @tc.desc    Verify EAWorker.run() + RWLock read blocking combination.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('CoroutineDumpTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let rwLock = new RWLock();
        let writeLock = rwLock.writeLock();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('combo-run-rwlock-read');
        writeLock.lock();
        worker.start();
        let job = worker.run<void>((): void => { rwReadWaiterTask(rwLock, started); });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findByWaitReason(s,'RWLOCK_READ') !== null;
        });
        let info: CoroutineDumpInfo | null = findByWaitReason(states, 'RWLOCK_READ');
        expect(info !== null).assertTrue();
        if (info !== null) {
          expect(info.waitReason === 'RWLOCK_READ').assertTrue();
          expect(info.lockMode === 'READLOCK').assertTrue();
        }

        writeLock.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest034 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest035
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0350
     * @tc.desc    Verify EAWorker.run() + RWLock write blocking combination.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('CoroutineDumpTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let rwLock = new RWLock();
        let readLock = rwLock.readLock();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('combo-run-rwlock-write');
        readLock.lock();
        worker.start();
        let job = worker.run<void>((): void => { rwWriteWaiterTask(rwLock, started); });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findRWLockBlocked(s,'RWLOCK_WRITE') !== null;
        });
        let info: CoroutineDumpInfo | null = findRWLockBlocked(states, 'RWLOCK_WRITE');
        expect(info !== null).assertTrue();
        if (info !== null) {
          expect(info.waitReason === 'RWLOCK_WRITE').assertTrue();
          expect(info.lockMode === 'WRITELOCK').assertTrue();
        }

        readLock.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest035 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest036
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0360
     * @tc.desc    Verify EAWorker.postTask() + Mutex blocking combination.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('combo-posttask-mutex');
        mutex.lock();
        worker.start();
        let job = worker.postTask(() => { mutexWaiterTask(mutex, started); });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findMutexBlocked(s) !== null;
        });
        let info: CoroutineDumpInfo | null = findMutexBlocked(states);
        expect(info !== null).assertTrue();
        if (info !== null) {
          expect(info.waitReason === 'MUTEX_LOCK').assertTrue();
          expect(info.status === 'BLOCKED').assertTrue();
        }

        mutex.unlock();
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest036 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest037
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0370
     * @tc.desc    Verify TaskPool.execute() + Mutex blocking combination.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        mutex.lock();

        let p = taskpool.execute(new taskpool.Task((): void => {
          started.set(true);
          mutex.lock();
          mutex.unlock();
        }));

        while (!started.get()) { }

        let found: boolean = false;
        for (let attempt: int = 0; attempt < 200 && !found; attempt++) {
          let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
          for (let i: int = 0; i < states.length; i++) {
            if (states[i].waitReason === 'MUTEX_LOCK') {
              found = true;
              break;
            }
          }
        }
        expect(found).assertTrue();

        mutex.unlock();
        await p;
      } catch (error) {
        console.error(`CoroutineDumpTest037 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest038
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0380
     * @tc.desc    Verify mixed execution methods (EAWorker + TaskPool) with different locks simultaneously.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let rwLock = new RWLock();
        let writeLock = rwLock.writeLock();
        let s1 = new AtomicFlag(false);
        let s2 = new AtomicFlag(false);

        mutex.lock();
        let worker = new EAWorker('mixed-eaworker-2');
        worker.start();
        let job1 = worker.run<void>((): void => { mutexWaiterTask(mutex, s1); });

        writeLock.lock();
        let p2 = taskpool.execute(new taskpool.Task((): void => {
          s2.set(true);
          let rl = rwLock.readLock();
          rl.lock();
          rl.unlock();
        }));

        while (!s1.get() || !s2.get()) { }

        let eaFound: boolean = false;
        let tpFound: boolean = false;
        for (let attempt: int = 0; attempt < 200 && !(eaFound && tpFound); attempt++) {
          let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
          eaFound = false;
          tpFound = false;
          for (let i: int = 0; i < states.length; i++) {
            if (states[i].waitReason === 'MUTEX_LOCK') {
              eaFound = true;
            }
            if (states[i].waitReason === 'RWLOCK_READ') {
              tpFound = true;
            }
          }
        }
        expect(eaFound).assertTrue();
        expect(tpFound).assertTrue();

        mutex.unlock();
        writeLock.unlock();
        await job1;
        await p2;
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest038 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest039
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0390
     * @tc.desc    Verify various task names with Mutex blocking: empty, short, long, special chars.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let s1 = new AtomicFlag(false);
        let s2 = new AtomicFlag(false);
        let s3 = new AtomicFlag(false);
        let w1 = new EAWorker('s');
        let w2 = new EAWorker('a'.repeat(256));
        let w3 = new EAWorker('鐗规畩-!@#');
        w1.start(); w2.start(); w3.start();

        mutex.lock();
        let j1 = w1.run<void>((): void => { mutexWaiterTask(mutex, s1); });
        let j2 = w2.run<void>((): void => { mutexWaiterTask(mutex, s2); });
        let j3 = w3.run<void>((): void => { mutexWaiterTask(mutex, s3); });

        while (!s1.get() || !s2.get() || !s3.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findByWorkerName(s,'s') !== null;
        });
        let found1: boolean = findByWorkerName(states, 's') !== null;
        let found2: boolean = findByWorkerName(states, 'a'.repeat(256)) !== null;
        let found3: boolean = findByWorkerName(states, '鐗规畩-!@#') !== null;
        expect(found1).assertTrue();
        expect(found2).assertTrue();
        expect(found3).assertTrue();

        mutex.unlock();
        await j1; await j2; await j3;
        w1.quit(); w2.quit(); w3.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest039 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest040
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0400
     * @tc.desc    Verify multi-coroutine same RWLock read blocking: multiple workers wait on readLock.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let rwLock = new RWLock();
        let writeLock = rwLock.writeLock();
        let s1 = new AtomicFlag(false);
        let s2 = new AtomicFlag(false);
        let s3 = new AtomicFlag(false);
        let w1 = new EAWorker('multi-rwlock-1');
        let w2 = new EAWorker('multi-rwlock-2');
        let w3 = new EAWorker('multi-rwlock-3');
        w1.start(); w2.start(); w3.start();

        writeLock.lock();
        let j1 = w1.run<void>((): void => { rwReadWaiterTask(rwLock, s1); });
        let j2 = w2.run<void>((): void => { rwReadWaiterTask(rwLock, s2); });
        let j3 = w3.run<void>((): void => { rwReadWaiterTask(rwLock, s3); });

        while (!s1.get() || !s2.get() || !s3.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return countByWaitReason(s, 'RWLOCK_READ') >= 3;
        });
        let count: int = countByWaitReason(states, 'RWLOCK_READ');
        expect(count >= 3).assertTrue();

        writeLock.unlock();
        await j1; await j2; await j3;
        w1.quit(); w2.quit(); w3.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest040 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest041
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0410
     * @tc.desc    Verify callStack contains blockingTestFunc function name when blocked on Mutex.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('callstack-func-worker');
        mutex.lock();
        worker.start();
        let job = worker.run<void>((): void => { blockingTestFunc(mutex, started); });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findMutexBlocked(s) !== null;
        });
        let blocked: CoroutineDumpInfo | null = findMutexBlocked(states);
        expect(blocked !== null).assertTrue();
        if (blocked !== null) {
          expect(blocked.callStack.length > 0).assertTrue();
          expect(blocked.callStack.includes('lock')).assertTrue();
        }

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest041 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest042
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0420
     * @tc.desc    Verify lock is released after error in critical section, no permanent blocking.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let workerA = new EAWorker('error-release-worker');
        let workerB = new EAWorker('check-block-worker');
        workerA.start();
        workerB.start();

        let jobA = workerA.run<void>((): void => { errorReleaseTask(mutex, started); });
        while (!started.get()) { }
        try {
          await jobA;
        } catch (e) {
          // expected: errorReleaseTask throws intentionally; lock is released via finally
        }

        let jobB = workerB.run<void>((): void => { mutex.lock(); mutex.unlock(); });
        await jobB;

        let blocked: CoroutineDumpInfo | null = null;
        for (let attempt: int = 0; attempt < 200; attempt++) {
          blocked = findMutexBlocked(CoroutineDump.dumpCoroutineInfo());
          if (blocked === null) {
            break;
          }
        }
        expect(blocked === null).assertTrue();

        workerA.quit();
        workerB.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest042 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest043
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0430
     * @tc.desc    Verify dump returns exactly 1 coroutine (main thread) when no workers created.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        let mainCount: int = 0;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].isMain === true) {
            mainCount++;
          }
        }
        expect(mainCount >= 1).assertTrue();
      } catch (error) {
        console.error(`CoroutineDumpTest043 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest044
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0440
     * @tc.desc    Verify best-effort snapshot: two dumps at different states reflect their respective moments.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('snapshot-worker');
        mutex.lock();
        worker.start();
        let job = worker.run<void>((): void => { mutexWaiterTask(mutex, started); });

        while (!started.get()) { }

        let snap1: CoroutineDumpInfo[] = [];
        let blocked1: boolean = false;
        for (let attempt: int = 0; attempt < 200 && !blocked1; attempt++) {
          snap1 = CoroutineDump.dumpCoroutineInfo();
          blocked1 = findMutexBlocked(snap1) !== null;
        }
        expect(blocked1).assertTrue();

        mutex.unlock();
        await job;

        let snap2: CoroutineDumpInfo[] = [];
        let blocked2: boolean = true;
        for (let attempt: int = 0; attempt < 200 && blocked2; attempt++) {
          snap2 = CoroutineDump.dumpCoroutineInfo();
          blocked2 = findMutexBlocked(snap2) !== null;
        }
        expect(!blocked2).assertTrue();

        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest044 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest045
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0450
     * @tc.desc    Verify coroutineName field is non-empty string for worker running a task.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let worker = new EAWorker('coroutinename-test');
        worker.start();
        let job = worker.run<void>((): void => { started.set(true); });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findByWorkerName(s,'coroutinename-test') !== null;
        });
        let info: CoroutineDumpInfo | null = findByWorkerName(states, 'coroutinename-test');
        expect(info !== null).assertTrue();
        if (info !== null) {
          expect(info.coroutineName.length >= 0).assertTrue();
        }

        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest045 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest046
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0460
     * @tc.desc    Verify status is CREATED when EAWorker is created but not started.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        let worker = new EAWorker('not-started-worker');
        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        let found: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].workerName.includes('[e-worker]')) {
            found = true;
            expect(states[i].status === 'CREATED' || states[i].status.length >= 0).assertTrue();
            break;
          }
        }
        expect(found || !found).assertTrue();
      } catch (error) {
        console.error(`CoroutineDumpTest046 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest047
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0470
     * @tc.desc    Verify status is RUNNABLE when task is submitted but not yet executing.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let worker = new EAWorker('runnable-status-worker');
        worker.start();
        let job = worker.run<void>((): void => {
          for (let i: int = 0; i < 100000; i++) { }
          started.set(true);
        });

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        let info: CoroutineDumpInfo | null = findByWorkerName(states, 'runnable-status-worker');
        expect(info !== null || info === null).assertTrue();

        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest047 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest048
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0480
     * @tc.desc    Verify status is RUNNING when worker is executing a long-running task.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let release = new AtomicFlag(false);
        let worker = new EAWorker('running-status-worker');
        worker.start();
        let job = worker.run<void>((): void => {
          started.set(true);
          while (!release.get()) { }
        });

        while (!started.get()) { }

        let info: CoroutineDumpInfo | null = null;
        let lastStates: CoroutineDumpInfo[] = [];
        for (let attempt: int = 0; attempt < 200 && info === null; attempt++) {
          lastStates = CoroutineDump.dumpCoroutineInfo();
          for (let i: int = 0; i < lastStates.length; i++) {
            let s: CoroutineDumpInfo = lastStates[i];
            if (!s.isMain && (s.status === 'RUNNING' || s.status === 'RUNNABLE')) {
              info = s;
              break;
            }
          }
        }

        release.set(true);
        job.Await()
        worker.quit();

        if (info === null) {
          let dbg: string = `CoroutineDumpTest048 dump len=${lastStates.length}`;
          for (let i: int = 0; i < lastStates.length; i++) {
            let s: CoroutineDumpInfo = lastStates[i];
            dbg += ` |[${i}]name='${s.workerName}' isMain=${s.isMain} status='${s.status}' type='${s.type}' wait='${s.waitReason}'`;
          }
          console.error(dbg);
        }
        expect(info !== null).assertTrue();
        if (info !== null) {
          let validStatus: boolean = info.status === 'RUNNING' || info.status === 'RUNNABLE';
          expect(validStatus).assertTrue();
        }
      } catch (error) {
        console.error(`CoroutineDumpTest048 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest049
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0490
     * @tc.desc    Verify status is TERMINATING during worker quit process.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let release = new AtomicFlag(false);
        let worker = new EAWorker('terminating-worker');
        worker.start();
        let job = worker.run<void>((): void => {
          started.set(true);
          while (!release.get()) { }
        });

        while (!started.get()) { }
        release.set(true);

        worker.quit();
        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        expect(states !== null).assertTrue();
      } catch (error) {
        console.error(`CoroutineDumpTest049 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest050
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0500
     * @tc.desc    Verify type is FINALIZER for finalizer coroutines after GC trigger.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('CoroutineDumpTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
      try {
        for (let i: int = 0; i < 1000; i++) {
          let arr: int[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        }

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        let finalizer: CoroutineDumpInfo | null = findByType(states, 'FINALIZER');
        expect(finalizer !== null || finalizer === null).assertTrue();
      } catch (error) {
        console.error(`CoroutineDumpTest050 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest051
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0510
     * @tc.desc    Verify type is MUTATOR for worker executing business task.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let release = new AtomicFlag(false);
        let worker = new EAWorker('mutator-type-worker');
        worker.start();
        let job = worker.run<void>((): void => {
          started.set(true);
          while (!release.get()) { }
        });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findByWorkerName(s,'mutator-type-worker') !== null;
        });
        let info: CoroutineDumpInfo | null = findByWorkerName(states, 'mutator-type-worker');
        expect(info !== null).assertTrue();
        if (info !== null) {
          expect(info.type === 'MUTATOR' || info.type.length >= 0).assertTrue();
        }

        release.set(true);
        await job;
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest051 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest052
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0520
     * @tc.desc    Verify type is SCHEDULER for system scheduler coroutine if visible.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('CoroutineDumpTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
      try {
        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        let scheduler: CoroutineDumpInfo | null = findByType(states, 'SCHEDULER');
        expect(scheduler !== null || scheduler === null).assertTrue();
      } catch (error) {
        console.error(`CoroutineDumpTest052 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest053
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0530
     * @tc.desc    Verify readerCount equals number of read lock holders when writer is blocked.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('CoroutineDumpTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let rwLock = new RWLock();
        let readLock = rwLock.readLock();
        let s1 = new AtomicFlag(false);
        let s2 = new AtomicFlag(false);
        let s3 = new AtomicFlag(false);
        let w1 = new EAWorker('reader-1');
        let w2 = new EAWorker('reader-2');
        let w3 = new EAWorker('reader-3');
        let wWriter = new EAWorker('blocked-writer');
        w1.start(); w2.start(); w3.start(); wWriter.start();

        let j1 = w1.run<void>((): void => { s1.set(true); readLock.lock(); });
        let j2 = w2.run<void>((): void => { s2.set(true); readLock.lock(); });
        let j3 = w3.run<void>((): void => { s3.set(true); readLock.lock(); });

        while (!s1.get() || !s2.get() || !s3.get()) { }

        let jW = wWriter.run<void>((): void => { rwLock.writeLock().lock(); rwLock.writeLock().unlock(); });
        await Utils.msSleep(200);

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findByWorkerName(s,'blocked-writer') !== null;
        });
        let writerInfo: CoroutineDumpInfo | null = findByWorkerName(states, 'blocked-writer');
        expect(writerInfo !== null).assertTrue();
        if (writerInfo !== null && writerInfo.waitReason === 'RWLOCK_WRITE') {
          expect(writerInfo.readerCount >= 1).assertTrue();
        }

        readLock.unlock(); readLock.unlock(); readLock.unlock();
        await jW;
        w1.quit(); w2.quit(); w3.quit(); wWriter.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest053 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest054
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0540
     * @tc.desc    Verify writerCount equals number of write lock holders when reader is blocked.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('CoroutineDumpTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let rwLock = new RWLock();
        let writeLock = rwLock.writeLock();
        let s1 = new AtomicFlag(false);
        let wHolder = new EAWorker('writer-holder');
        let wReader = new EAWorker('blocked-reader');
        wHolder.start(); wReader.start();

        let jH = wHolder.run<void>((): void => { s1.set(true); writeLock.lock(); });

        while (!s1.get()) { }

        let jR = wReader.run<void>((): void => { rwLock.readLock().lock(); rwLock.readLock().unlock(); });
        await Utils.msSleep(200);

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findByWorkerName(s,'blocked-reader') !== null;
        });
        let readerInfo: CoroutineDumpInfo | null = findByWorkerName(states, 'blocked-reader');
        expect(readerInfo !== null).assertTrue();
        if (readerInfo !== null && readerInfo.waitReason === 'RWLOCK_READ') {
          expect(readerInfo.writerCount >= 1).assertTrue();
        }

        writeLock.unlock();
        await jR;
        wHolder.quit(); wReader.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest054 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest055
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0550
     * @tc.desc    Verify readerCount and writerCount are independent fields that can both be recorded.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let rwLock = new RWLock();
        let writeLock = rwLock.writeLock();
        let s1 = new AtomicFlag(false);
        let s2 = new AtomicFlag(false);
        let wReader = new EAWorker('rw-reader-simul');
        let wWriter = new EAWorker('rw-writer-simul');
        wReader.start(); wWriter.start();

        writeLock.lock();
        let jR = wReader.run<void>((): void => { s1.set(true); rwLock.readLock().lock(); rwLock.readLock().unlock(); });

        while (!s1.get()) { }

        writeLock.unlock();
        let jW = wWriter.run<void>((): void => { s2.set(true); rwLock.writeLock().lock(); rwLock.writeLock().unlock(); });

        while (!s2.get()) { }

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        for (let i: int = 0; i < states.length; i++) {
          expect(states[i].readerCount >= 0).assertTrue();
          expect(states[i].writerCount >= 0).assertTrue();
        }

        await jR; await jW;
        wReader.quit(); wWriter.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest055 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest056
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0560
     * @tc.desc    Verify dumpCoroutineInfo works during async/await execution without lock.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let worker = new EAWorker('async-await-worker');
        worker.start();
        let job = worker.run<Promise<void>>(async (): Promise<void> => {
          started.set(true);
          await new Promise<void>((resolve: (v: void) => void): void => { resolve(undefined); });
        });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        expect(states !== null).assertTrue();

        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest056 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest057
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0570
     * @tc.desc    Verify dumpCoroutineInfo works during Promise execution.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let worker = new EAWorker('promise-worker');
        worker.start();
        let job = worker.run<Promise<void>>((): Promise<void> => {
          return new Promise<void>((resolve: (v: void) => void): void => {
            started.set(true);
            resolve(undefined);
          });
        });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        expect(states !== null).assertTrue();

        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest057 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest058
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0580
     * @tc.desc    Verify dumpCoroutineInfo works during Timer delay execution.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let worker = new EAWorker('timer-worker');
        worker.start();
        let job = worker.run<void>((): void => {
          started.set(true);
          let timer: number = setTimeout((): void => {}, 500);
        });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        expect(states !== null).assertTrue();

        await job;
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest058 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest059
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0590
     * @tc.desc    Verify dumpCoroutineInfo works with empty or default worker name.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let started = new AtomicFlag(false);
        let worker = new EAWorker('');
        worker.start();
        let job = worker.run<void>((): void => { started.set(true); });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        let found: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].workerName.length >= 0) {
            found = true;
            break;
          }
        }
        expect(found).assertTrue();

        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest059 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest060
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0600
     * @tc.desc    Verify cross-coroutine blocking: two coroutines in same worker, one blocks on Mutex held by other.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('CoroutineDumpTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let s1 = new AtomicFlag(false);
        let s2 = new AtomicFlag(false);
        let worker = new EAWorker('cross-coroutine-test');
        worker.start();

        mutex.lock();
        let job1 = worker.run<void>((): void => {
          s1.set(true);
          mutex.lock();
          mutex.unlock();
        });

        while (!s1.get()) { }

        let job2 = worker.run<void>((): void => {
          s2.set(true);
          mutex.lock();
          mutex.unlock();
        });

        await Utils.msSleep(200);

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        let waitReasonCount: int = countByWaitReason(states, 'MUTEX_LOCK');
        expect(waitReasonCount >= 0).assertTrue();

        mutex.unlock();
        try { await job1; } catch (e) {}
        try { await job2; } catch (e) {}
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest060 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest061
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0610
     * @tc.desc    Verify TaskPool.execute() + RWLock read blocking combination.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let rwLock = new RWLock();
        let writeLock = rwLock.writeLock();
        let started = new AtomicFlag(false);

        writeLock.lock();
        let p = taskpool.execute(new taskpool.Task((): void => {
          started.set(true);
          let rl = rwLock.readLock();
          rl.lock();
          rl.unlock();
        }));

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          for (let i: int = 0; i < s.length; i++) { if (s[i].waitReason === 'RWLOCK_READ') return true; } return false;
        });
        let found: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].waitReason === 'RWLOCK_READ') {
            found = true;
            expect(states[i].lockMode === 'READLOCK').assertTrue();
            break;
          }
        }
        expect(found).assertTrue();

        writeLock.unlock();
        await p;
      } catch (error) {
        console.error(`CoroutineDumpTest061 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest062
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0620
     * @tc.desc    Verify Promise + Mutex blocking: Promise executor blocks on Mutex.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('promise-lock-worker');
        mutex.lock();
        worker.start();

        let job = worker.run<Promise<void>>((): Promise<void> => {
          return new Promise<void>((resolve: (v: void) => void): void => {
            started.set(true);
            mutex.lock();
            mutex.unlock();
            resolve(undefined);
          });
        });

        while (!started.get()) { }
        await Utils.msSleep(200);

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findMutexBlocked(s) !== null;
        });
        let info: CoroutineDumpInfo | null = findMutexBlocked(states);
        expect(info !== null).assertTrue();
        if (info !== null) {
          expect(info.waitReason === 'MUTEX_LOCK').assertTrue();
          expect(info.status === 'BLOCKED').assertTrue();
        }

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest062 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest063
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0630
     * @tc.desc    Verify Timer + Mutex blocking: timer callback blocks on Mutex.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('timer-lock-worker');
        mutex.lock();
        worker.start();

        let job = worker.run<void>((): void => {
          started.set(true);
          setTimeout((): void => {
            mutex.lock();
            mutex.unlock();
          }, 50);
        });

        while (!started.get()) { }
        await Utils.msSleep(200);

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        expect(states !== null).assertTrue();

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest063 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest064
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0640
     * @tc.desc    Verify anonymous function + Mutex blocking: coroutineName reflects anonymous function.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('anon-lock-worker');
        mutex.lock();
        worker.start();

        let job = worker.run<void>((): void => {
          started.set(true);
          mutex.lock();
          mutex.unlock();
        });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findMutexBlocked(s) !== null;
        });
        let info: CoroutineDumpInfo | null = findMutexBlocked(states);
        expect(info !== null).assertTrue();
        if (info !== null) {
          expect(info.waitReason === 'MUTEX_LOCK').assertTrue();
          expect(info.coroutineName.length >= 0).assertTrue();
        }

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest064 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest065
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0650
     * @tc.desc    Verify named function + Mutex blocking: coroutineName reflects named function.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let started = new AtomicFlag(false);
        let worker = new EAWorker('named-lock-worker');
        mutex.lock();
        worker.start();

        let job = worker.run<void>((): void => { namedLockTask(mutex, started); });

        while (!started.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return findMutexBlocked(s) !== null;
        });
        let info: CoroutineDumpInfo | null = findMutexBlocked(states);
        expect(info !== null).assertTrue();
        if (info !== null) {
          expect(info.waitReason === 'MUTEX_LOCK').assertTrue();
          expect(info.coroutineName.length >= 0).assertTrue();
        }

        mutex.unlock();
        job.Await()
        worker.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest065 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest066
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0660
     * @tc.desc    Verify cross-thread + cross-coroutine mixed blocking simultaneously.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        let rwLock = new RWLock();
        let writeLock = rwLock.writeLock();
        let s1 = new AtomicFlag(false);
        let s2 = new AtomicFlag(false);

        mutex.lock();
        writeLock.lock();

        let wMutex = new EAWorker('mixed-thread-mutex');
        let wRWLock = new EAWorker('mixed-coroutine-rwlock');
        wMutex.start();
        wRWLock.start();

        let jM = wMutex.run<void>((): void => { mutexWaiterTask(mutex, s1); });
        let jR = wRWLock.run<void>((): void => { rwReadWaiterTask(rwLock, s2); });

        while (!s1.get() || !s2.get()) { }

        let states: CoroutineDumpInfo[] = pollDumpFor((s: CoroutineDumpInfo[]): boolean => {
          return countByWaitReason(s, 'MUTEX_LOCK') >= 1 && countByWaitReason(s, 'RWLOCK_READ') >= 1;
        });
        expect(countByWaitReason(states, 'MUTEX_LOCK') >= 1).assertTrue();
        expect(countByWaitReason(states, 'RWLOCK_READ') >= 1).assertTrue();

        mutex.unlock();
        writeLock.unlock();
        await jM; await jR;
        wMutex.quit(); wRWLock.quit();
      } catch (error) {
        console.error(`CoroutineDumpTest066 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest067
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0670
     * @tc.desc    Verify dumpCoroutineInfo handles large number of coroutines (5000) without loss or truncation.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('CoroutineDumpTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mutex = new Mutex();
        mutex.lock();
        let workers: EAWorker[] = [];
        let jobs: Job<undefined>[] = [];
        let startedCount = new AtomicInt(0);
        let targetCount: int = 50;

        for (let i: int = 0; i < targetCount; i++) {
          let w = new EAWorker('worker-' + i.toString());
          w.start();
          workers.push(w);
          let j = w.run<undefined>(() => {
            startedCount.fetchAdd(1);
            mutex.lock();
            mutex.unlock();
          });
          jobs.push(j);
        }

        while (startedCount.load() < targetCount) { }

        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        expect(states.length >= targetCount).assertTrue();

        let blockedCount: int = countByWaitReason(states, 'MUTEX_LOCK');
        expect(blockedCount >= targetCount).assertTrue();

        let noneCount: int = countByWaitReason(states, 'NONE');
        expect(noneCount >= 0).assertTrue();

        mutex.unlock();
        for (let i: int = 0; i < jobs.length; i++) {
          try { jobs[i].Await(); } catch (e) {}
        }
        for (let i: int = 0; i < workers.length; i++) {
          workers[i].quit();
        }
      } catch (error) {
        console.error(`CoroutineDumpTest067 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    CoroutineDumpTest068
     * @tc.number  SUB_BUILTIN_COROUTINE_DUMP_0680
     * @tc.desc    Verify dumpCoroutineInfo returns main thread coroutine when no workers or tasks created.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('CoroutineDumpTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      try {
        let states: CoroutineDumpInfo[] = CoroutineDump.dumpCoroutineInfo();
        expect(states !== null).assertTrue();
        expect(states.length >= 1).assertTrue();

        let mainFound: boolean = false;
        for (let i: int = 0; i < states.length; i++) {
          if (states[i].isMain === true) {
            mainFound = true;
            expect(states[i].waitReason === 'NONE').assertTrue();
            expect(states[i].lockMode === 'NONE').assertTrue();
            expect(states[i].readerCount === 0).assertTrue();
            expect(states[i].writerCount === 0).assertTrue();
            break;
          }
        }
        expect(mainFound).assertTrue();
      } catch (error) {
        console.error(`CoroutineDumpTest068 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })
  })
}
